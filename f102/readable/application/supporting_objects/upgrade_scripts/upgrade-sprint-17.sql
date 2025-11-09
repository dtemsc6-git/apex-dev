--1️ Eliminar el constraint actual
ALTER TABLE sgt_interfaces 
DROP CONSTRAINT SGT_INTERFACES_ESTADO_CK;

--Crear nuevamente el constraint con el nuevo conjunto de valores permitidos
ALTER TABLE sgt_interfaces 
ADD CONSTRAINT SGT_INTERFACES_ESTADO_CK 
CHECK (estado IN ('NA', 'UP', 'DOWN')) ENABLE;

--2 Eliminar el SGT_INTERFACES_MODO_CK
ALTER TABLE SGT_INTERFACES
drop CONSTRAINT "SGT_INTERFACES_MODO_CK" ;

--Crear SGT_INTERFACES_MODO_CK
ALTER TABLE sgt_interfaces 
ADD CONSTRAINT "SGT_INTERFACES_MODO_CK"
CHECK (modo in ('NA','ACCESS','TRUNK','TAGGED','TAGGED-ALL','HYBRID','Q-IN-Q')) ENABLE; 


--3 Eliminar SGT_INTERFACES_DUPLEX_CK
alter table SGT_INTERFACES
DROP CONSTRAINT "SGT_INTERFACES_DUPLEX_CK";

--Agregar SGT_INTERFACES_DUPLEX_CK
ALTER TABLE sgt_interfaces 
ADD CONSTRAINT "SGT_INTERFACES_DUPLEX_CK"
CHECK (duplex in ('NA','AUTO','HALF','FULL')) ENABLE;

alter table SGT_INTERFACES
DROP CONSTRAINT "SGT_INTERFACES_EQUIPO_UNIQUE";
alter table "SGT_INTERFACES" add constraint
"SGT_INTERFACES_EQUIPO_UNIQUE" unique ( "EQUIPO_ID", "NOMBRE" );


/*
dmf: funcion para buscar una LOV de acuerdo a la convencion establecida en el software
1 para buscar equipos
2 para buscar tipo de interfaces
3 para buscar un rack

*/
create or replace FUNCTION F_GET_LOVS ( 
    p_id_lov NUMBER,  
    p_mostrar VARCHAR2 
) RETURN NUMBER 
AS 
    L_ID_RETURN NUMBER := NULL; 
BEGIN 
 
 
    --Buscar EQUIPOS por nombres concatenados. 
    IF p_id_lov = 1 THEN 
        SELECT E.ID  
        INTO L_ID_RETURN 
        FROM SGT_EQUIPOS E 
        LEFT JOIN SGT_RACKS R ON E.RACK_ID = R.ID 
        LEFT JOIN SGT_SALAS S ON R.SALA_ID = S.ID 
        LEFT JOIN SGT_SITIOS SS ON S.SITIO_ID = SS.ID 
        WHERE UPPER(SS.SIGLAS ||'.'|| S.SIGLAS ||'.'|| R.NOMBRE || '.'|| E.NOMBRE) = UPPER(p_mostrar); 
        RETURN L_ID_RETURN; 
     
    --Buscar Tipo de Interfaces for nombres     
    elsif p_id_lov = 2 then 
        select TI.id into L_ID_return 
        from sgt_tipo_interfaz TI 
        where UPPER(TI.NOMBRE) = UPPER(p_mostrar); 
        return L_ID_RETURN; 
      
    --Buscar Rack ID por nombre de rack concatenado     
     
    elsIF P_ID_LOV = 3 THEN 
       SELECT  
       R.ID into L_ID_return         
       from SGT_RACKS R 
	   LEFT JOIN SGT_SALAS S ON R.SALA_ID = S.ID 
	   LEFT JOIN SGT_SITIOS SS ON S.SITIO_ID = SS.ID 
       WHERE UPPER(SS.SIGLAS ||'.'|| S.SIGLAS ||'.'|| R.NOMBRE ) = UPPER(p_mostrar); 
       return L_ID_RETURN;   

    --Buscar Sitio por nombre de rack
    elsif P_ID_LOV = 4 THEN
       SELECT  
       SS.ID into L_ID_return         
       from SGT_RACKS R 
	   LEFT JOIN SGT_SALAS S ON R.SALA_ID = S.ID 
	   LEFT JOIN SGT_SITIOS SS ON S.SITIO_ID = SS.ID 
       WHERE UPPER(SS.SIGLAS ||'.'|| S.SIGLAS ||'.'|| R.NOMBRE ) = UPPER(p_mostrar); 
       return L_ID_RETURN;  

    --Retornar el id del tipo de equipo
    elsif p_id_lov = 5 then 
        select TE.id into L_ID_return 
        from sgt_tipo_equipos TE 
        where UPPER(TE.NOMBRE) = UPPER(p_mostrar); 
        return L_ID_RETURN;    

    end if ; 
    RETURN NULL; 
     
     
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        RETURN NULL; 
    WHEN TOO_MANY_ROWS THEN 
        -- Manejar múltiples resultados según tu lógica de negocio 
        RETURN NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END F_GET_LOVS;
/


--Funcion para utilizar distintos formatos de fechas en el data loader
CREATE OR REPLACE FUNCTION parse_flexible_date(p_date IN VARCHAR2)
RETURN DATE
IS
    v_date DATE;
BEGIN
    BEGIN
        v_date := TO_DATE(p_date, 'YYYY-MM-DD');
    EXCEPTION WHEN OTHERS THEN
        BEGIN
            v_date := TO_DATE(p_date, 'DD-MM-YYYY');
        EXCEPTION WHEN OTHERS THEN
            BEGIN
                v_date := TO_DATE(p_date, 'YY-MM-DD');
            EXCEPTION WHEN OTHERS THEN
                v_date := NULL;
            END;
        END;
    END;
    RETURN v_date;
END;