create or replace function "CREAR_RUTA_SRV" (P_SERVICIO_ID IN INTEGER)
RETURN SDO_GEOMETRY
AS
l_coords SDO_ORDINATE_ARRAY := SDO_ORDINATE_ARRAY(); 
i PLS_INTEGER := 1; 
 
begin 
    --buscar todos los sitios de la wan 
    apex_debug.message('dmf: Funcion CREAR_RUTA_SERVICIOS:' ); 
 
     
    apex_debug.message('dmf: Funcion CREAR_RUTA_SERVICIOS SRV_ID: $S',P_SERVICIO_ID ); 
    FOR r IN ( 
        SELECT s.lat, s.lon, seq   
        FROM v_sitios_gps s 
        inner join sgt_sitios_servicio on s.id =  sitio_id 
             
        WHERE servicio_id = P_SERVICIO_ID  -- Use the parameter here 
        order by seq 
             
        ) 
    LOOP 
        l_coords.EXTEND(2); 
        apex_debug.message('dmf: Funcion CREAR_RUTA_SRV LOOP: $S',i ); 
        l_coords(i)   := r.lon; 
        l_coords(i+1) := r.lat; 
        i := i + 2; 
    END LOOP; 
 
    RETURN SDO_GEOMETRY( 
        2002, 4326, NULL, 
        SDO_ELEM_INFO_ARRAY(1,2,1), 
        l_coords 
    ); 
end "CREAR_RUTA_SRV";
/
create or replace function "CREAR_RUTA_WAN" (P_WAN_ID in integer) 
return SDO_GEOMETRY 
as 
 
 l_coords SDO_ORDINATE_ARRAY := SDO_ORDINATE_ARRAY(); 
 i PLS_INTEGER := 1; 
 
begin 
    --buscar todos los sitios de la wan 
    apex_debug.message('dmf: Funcion CREAR_RUTA_WAN:' ); 
 
     
    apex_debug.message('dmf: Funcion CREAR_RUTA_WAN WAN_ID: $S',P_WAN_ID ); 
    FOR r IN ( 
        SELECT s.lat, s.lon   
        FROM v_sitios_gps s 
        --inner join sgt_sitios_enlace_wan on s.id =  sitio_id     
        --WHERE enlace_wan_id = P_WAN_ID  -- Use the parameter here 
         INNER JOIN  (
             SELECT SITIO_ID, SEQ
FROM (
    SELECT VSE.SITIO_ID, SEW.SEQ,
           ROW_NUMBER() OVER (PARTITION BY VSE.SITIO_ID ORDER BY SEW.SEQ) AS rn
    FROM V_SITIOS_EQUIPOS VSE
    JOIN SGT_EQUIPOS_WAN SEW ON VSE.EQUIPO_ID = SEW.EQUIPO_A_ID
    WHERE SEW.WAN_ID = P_WAN_ID
) t
WHERE rn = 1
ORDER BY SEQ
          ) TMP ON S.ID = TMP.SITIO_ID
        
        --order by seq 
             
        ) 
    LOOP 
        l_coords.EXTEND(2); 
        apex_debug.message('dmf: Funcion CREAR_RUTA_WAN LOOP: $S',i ); 
        l_coords(i)   := r.lon; 
        l_coords(i+1) := r.lat; 
        i := i + 2; 
    END LOOP; 
 
    RETURN SDO_GEOMETRY( 
        2002, 4326, NULL, 
        SDO_ELEM_INFO_ARRAY(1,2,1), 
        l_coords 
    ); 
 
end "CREAR_RUTA_WAN";
/
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
    
    --retorna el id en base al concatenado de sitio.sala.rack.equipo.interfaz
    elsif p_id_lov = 6 then 
         SELECT I.ID   
        INTO L_ID_RETURN
        FROM SGT_INTERFACES I
        left join SGT_EQUIPOS E  ON I.EQUIPO_ID = E.ID
        LEFT JOIN SGT_RACKS R ON E.RACK_ID = R.ID  
        LEFT JOIN SGT_SALAS S ON R.SALA_ID = S.ID  
        LEFT JOIN SGT_SITIOS SS ON S.SITIO_ID = SS.ID  
        WHERE UPPER(SS.SIGLAS ||'.'|| S.SIGLAS ||'.'|| R.NOMBRE || '.'|| E.NOMBRE||'.'||I.NOMBRE) = UPPER(p_mostrar);  
        RETURN L_ID_RETURN;  

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
create or replace function "GET_EDGES_EQUIPOS" (P_SERVICIO_ID IN NUMBER) 
/*
Autor: dmf
Función: Obtener todos las lineas que conectan los equipos entre si para un servicio en particular
Se necesita para el ID del servicio, la funcion recolectara todos las conexiones entre equipos
de la vista: v_conexiones_general_v2.
Utilizado para la librería de dibujo de las interfaces.
*/

return CLOB 
as 
L_EDGES CLOB; 
begin 
    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT( 
               'from' VALUE origen_id, 
               'to'   VALUE destino_id, 
               'label' VALUE edge_label, 
               'edge_id' VALUE edge_id 
             ) RETURNING CLOB) 
    INTO l_edges 
    from ( 
        select  
        eq_id as origen_id, 
        eq_b_id as destino_id, 
        fo_nombre as edge_label, 
        conn_id as edge_id 
        from v_conexiones_general_v2 
        where serv_id = P_SERVICIO_ID 
        order by eq_id 
 
    ); 
    RETURN L_EDGES; 
end "GET_EDGES_EQUIPOS";
/
create or replace function "GET_EDGES_IFACE" (P_SERVICIO_ID IN NUMBER) 
return CLOB 
as 
L_EDGES CLOB; 
begin 
     
    ---======================== 
    ---Crear los edge 
    ---======================= 
    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT( 
               'from' VALUE origen_id, 
               'to'   VALUE destino_id, 
               'label' VALUE edge_label, 
               'id' VALUE edge_id 
             ) RETURNING CLOB) 
    INTO l_edges 
    from ( 
        select  
        iface_id as origen_id, 
        iface_b_id as destino_id, 
        fo_nombre as edge_label, 
        conn_id as edge_id 
        from v_conexiones_general_v2 
        where serv_id = P_SERVICIO_ID 
        order by eq_id 
 
    ); 
 
    RETURN L_EDGES; 
 
 
 
 
end "GET_EDGES_IFACE";
/
create or replace function "GET_EDGES_WAN" (P_WANS_ID IN TABLA_IDS) 
return clob 
as 
L_EDGES CLOB; 
begin 
    
   apex_debug.message('dmf: Funcion GET_EDGES_WAN:' ); 
 
   --for i IN 1 .. P_WANS_ID.count loop 
     --       apex_debug.message('dmf: Sitios id : %s', P_WANS_ID(i)); 
       -- end loop;  
    
   WITH ordered AS ( 
      SELECT 
        s.id   AS origen_id, 
         
        LEAD(s.id) OVER (PARTITION BY wan.id ORDER BY sw.seq)       AS destino_id, 
        wan.id AS edge_id, 
        wan.nombre AS edge_label 
      FROM sgt_sitios_enlace_wan sw 
      JOIN sgt_enlaces_wan wan ON wan.id = sw.enlace_wan_id 
      JOIN sgt_sitios s ON s.id = sw.sitio_id 
      WHERE sw.enlace_wan_id IN ( 
        SELECT column_value FROM TABLE(P_WANS_ID) 
      ) 
      order by origen_id 
    ) 
    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT( 
               'from' VALUE origen_id, 
               'to'   VALUE destino_id, 
               'label' VALUE edge_label, 
               'edge_id' VALUE edge_id 
             ) RETURNING CLOB) 
    INTO l_edges 
    FROM ordered 
    WHERE destino_id IS NOT NULL; -- ahora es válido porque destino_id fue calculado en la CTE 
 
     RETURN l_edges; 
 
 
end "GET_EDGES_WAN";
/
create or replace function "GET_NODOS_EQUIPOS" (P_SERVICIO_ID IN NUMBER) 
return CLOB 
as 
L_NODES CLOB; 
begin 
    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT('id' VALUE id, 'eq_id' value eq_id, 'label' VALUE label,  
             'shape' VALUE 'box', 'color' VALUE '#00AAFF', 'level' VALUE seq) 
           RETURNING CLOB) 
    INTO l_nodes 
 
    FROM ( 
       SELECT C.eq_ID as id, C.eq_ID as,C.EQ as label, (c.seq)/10 seq  
       FROM V_CONEXIONES_GENERAL_V2 C WHERE C.SERV_ID = P_SERVICIO_ID 
       UNION 
       SELECT C.eq_B_ID as id, C.eq_b_ID as, C.EQ_B as label, (c.seq + 10) / 10  
       FROM V_CONEXIONES_GENERAL_V2 C WHERE C.SERV_ID = P_SERVICIO_ID 
       order by seq 
    ); 
    return L_NODES; 
end "GET_NODOS_EQUIPOS";
/
create or replace function "GET_NODOS_IFACE" (P_SERVICIO_ID IN NUMBER) 
/*
Autor: dmf
Función: Recolectar todas las interfaces utilizadas en un servicio, se realizan dos consulta la primera trae las interfaces del lado a
la segunda las del lado b, se realiza la union de ambas consultas y finalmente se retorna un
JSON con los datos.
*/
return CLOB 
as 
L_NODES CLOB; 
begin 
    
 
    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT('eq_id' value eq_id,'id' value  id, 'label' VALUE "label",  
             'shape' VALUE 'box', 'color' VALUE '#00AAFF',  
             'level' value seq 
             ) 
           RETURNING CLOB) 
    INTO l_nodes 
 
    FROM ( 
 
        SELECT  
        c.eq_id, 
    C.IFACE_ID AS id,             
    C.EQ || CHR(10) || C.IFACE "label", 
    (c.seq / 10) seq 
FROM V_CONEXIONES_GENERAL_V2 C 
WHERE C.SERV_ID = P_SERVICIO_ID  
 
union    
SELECT    
    c.eq_b_id, 
    C.iface_b_id ,        
    C.EQ_B || CHR(10) || C.IFACE_B AS label_b,                
    (c.seq +10 ) / 10 
FROM V_CONEXIONES_GENERAL_V2 C 
WHERE C.SERV_ID = P_SERVICIO_ID  
 
ORDER BY seq 
         
    ); 
 
    return L_NODES; 
end "GET_NODOS_IFACE";
/
create or replace function "GET_NODOS_SITIOS" (SITIOS_IDS IN TABLA_IDS) 
return CLOB 
as 
    l_nodes CLOB; 
begin 
 
    -- NODOS: lista única de sitios (solo los de los enlaces seleccionados) 
    apex_debug.message('Inicia get_nodos_sitios'); 
    DBMS_OUTPUT.PUT_LINE('Inicia el get_nodos_sitios:'); 
    FOR i IN 1 .. sitios_ids.COUNT LOOP 
        apex_debug.message('IDS pasados: p_id=%s', sitios_ids(i)); 
    END LOOP; 
    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT('id' VALUE id, 'label' VALUE label, 'shape' VALUE 'box', 'color' VALUE '#00AAFF') 
           RETURNING CLOB) 
    INTO l_nodes 
    FROM ( 
      SELECT  
        S.ID, S.SIGLAS LABEL FROM SGT_SITIOS S 
        where S.ID IN (SELECT COLUMN_VALUE FROM TABLE(SITIOS_IDS)) 
    ); 
 
    IF l_nodes IS NULL THEN 
      l_nodes := '[]'; 
    END IF; 
 
    return l_nodes; 
end "GET_NODOS_SITIOS";
/
create or replace FUNCTION parse_flexible_date(p_date IN VARCHAR2) 
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
/
create or replace function "SEXAGESIMAL_TO_DECIMAL" (p_coord IN VARCHAR2) 
return number 
as 
 
l_grados   NUMBER; 
    l_minutos  NUMBER := 0; 
    l_segundos NUMBER := 0; 
    l_signo    NUMBER := 1; 
    l_decimal  NUMBER; 
BEGIN 
    -- Signo según hemisferio 
    IF p_coord LIKE '%S%' OR p_coord LIKE '%O%' THEN 
        l_signo := -1; 
    END IF; 
 
    -- Extraer grados, minutos y segundos usando REGEXP 
    BEGIN 
        SELECT TO_NUMBER(REGEXP_SUBSTR(p_coord, '(\d+)', 1, 1)) INTO l_grados FROM dual; 
        SELECT NVL(TO_NUMBER(REGEXP_SUBSTR(p_coord, '(\d+)', 1, 2)), 0) INTO l_minutos FROM dual; 
        SELECT NVL(TO_NUMBER(REGEXP_SUBSTR(p_coord, '(\d+)', 1, 3)), 0) INTO l_segundos FROM dual; 
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            RETURN NULL; 
    END; 
 
    -- Conversión a decimal 
    l_decimal := l_signo * (l_grados + (l_minutos/60) + (l_segundos/3600)); 
 
    RETURN ROUND(l_decimal,7); 
END;
/
create or replace function "URL_TO_LAT" (p_coord IN VARCHAR2) 
return coord_obj 
as 
 l_match    VARCHAR2(4000); 
 l_lat number; 
 l_long number; 
begin 
    -- Caso 1: URL de Google Maps con formato decimal 
    IF p_coord LIKE 'http%' THEN 
        -- Buscar patrón de coordenadas decimales (-##.####, -##.####) 
        l_match := REGEXP_SUBSTR(p_coord, '[-]?\d+(\.\d+)?[, ]+[-]?\d+(\.\d+)?'); 
 
        IF l_match IS NOT NULL THEN 
            -- Si queremos la primera parte (latitud): 
            l_lat := TO_NUMBER(REGEXP_SUBSTR(l_match, '[-]?\d+(\.\d+)?', 1, 1)); 
            l_long := TO_NUMBER(REGEXP_SUBSTR(l_match, '[-]?\d+(\.\d+)?', 1, 2)); 
            RETURN coord_obj(l_lat, l_long); 
        ELSE 
            RETURN coord_obj(NULL, NULL); 
        END IF; 
    ELSE 
        RETURN coord_obj(NULL, NULL); 
    END IF; 
end "URL_TO_LAT";
/
create or replace function "GET_WAN_EDGES_IFACE" (P_WAN_ID IN NUMBER) 
return CLOB 
as 
L_EDGES CLOB; 
begin 
     
    ---======================== 
    ---Crear los edge 
    ---======================= 
    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT( 
               'from' VALUE origen_id, 
               'to'   VALUE destino_id, 
               'label' VALUE edge_label, 
               'id' VALUE edge_id 
             ) RETURNING CLOB) 
    INTO l_edges 
    from ( 
        select  
        iface_id as origen_id, 
        iface_b_id as destino_id, 
        fo_nombre as edge_label, 
        conn_id as edge_id 
        from v_conexiones_general_v2 
        where WAN_id = P_WAN_ID 
        order by eq_id 
 
    ); 
 
    RETURN L_EDGES;  
end "GET_WAN_EDGES_IFACE";
/
create or replace function "GET_WAN_NODOS_IFACE" (P_WAN_ID IN NUMBER)
/*
@Author: DMF
@Objetivo: Una funcion que retorna la lista de equipos e interfaces que participan en el enlace WAN
Como el enlace WAN puede o no estar creado se le pasan como parametros los IDS de las conexiones intervinientes

*/
return CLOB
as
L_NODES CLOB;
begin

    apex_debug.message('dmf: GET_NODOS_IFACE_WAN: %s', P_WAN_ID ); 


    SELECT JSON_ARRAYAGG( 
             JSON_OBJECT('eq_id' value eq_id,'id' value  id, 'label' VALUE "label",  
             'shape' VALUE 'box', 'color' VALUE '#00AAFF',  
             'level' value seq 
             ) 
           RETURNING CLOB) 
    INTO L_NODES 
    
    FROM ( 
 
        SELECT  
            c.eq_id, 
            C.IFACE_ID AS id,             
            C.EQ || CHR(10) || C.IFACE "label", 
            (c.SEQ_WAN / 10) seq 
        FROM V_CONEXIONES_GENERAL_V2 C 
        WHERE c.WAN_ID = P_WAN_ID 
        union    
        SELECT    
             c.eq_b_id, 
                C.iface_b_id ,        
                C.EQ_B || CHR(10) || C.IFACE_B AS label_b,                
                (c.SEQ_WAN + 10 ) / 10 
        FROM V_CONEXIONES_GENERAL_V2 C 
        WHERE c.WAN_ID = P_WAN_ID 
        ORDER BY SEQ  
    ); 

    RETURN L_NODES;


end "GET_WAN_NODOS_IFACE";
/
create or replace FUNCTION VERIFICAR_DISPONIBILIDAD_U (
    p_equipo_id in NUMBER,
    p_rack_id   IN NUMBER,
    p_u_inicio  IN NUMBER,
    p_u_fin     IN NUMBER,
    p_posicion  IN char
) RETURN VARCHAR2 AS
    r_valor VARCHAR2(2);
    v_total_registros NUMBER;
    v_espacios_libres NUMBER;
BEGIN
    -- Validación básica de parámetros
           
       apex_debug.log_long_message('VERIFICAR_DISPONIBILIDAD_U: SELECT VERIFICAR_DISPONIBILIDAD_U('
       ||p_equipo_id ||','|| p_rack_id ||', '
       ||p_u_inicio  ||','|| p_u_fin      ||','
       ||p_posicion 
       ||') FROM DUAL ');
    


    IF p_u_fin < p_u_inicio THEN
        apex_debug.log_long_message('VERIFICAR_DISPONIBILIDAD_U check rango invalido: inicio: '||p_u_inicio ||', fin: '||p_u_fin);
        RETURN 'NA'; -- Rango inválido
        
    END IF;

   

    WITH Pisos(posicion_u) AS (
        SELECT 1 FROM DUAL
        UNION ALL
        SELECT posicion_u + 1 FROM Pisos
        WHERE posicion_u + 1 <= (
            SELECT altura_u FROM sgt_Racks WHERE id = p_rack_id
        )
    ),
    RackU AS (
        SELECT 
            p.posicion_u AS "U", 
            CASE 
                WHEN EXISTS (
                    SELECT 1 FROM sgt_Equipos e
                    WHERE e.rack_id = p_rack_id
                        AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)
                        AND (e.posicion) = (p_posicion) 
                        AND (p_equipo_id IS NULL OR e.id != p_equipo_id)
                ) THEN 
                    (SELECT e.id FROM sgt_Equipos e
                     WHERE e.rack_id = p_rack_id
                       AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)
                       AND e.posicion = (p_posicion)
                       AND (p_equipo_id IS NULL OR e.id != p_equipo_id)
                       AND ROWNUM = 1)
                ELSE NULL END
             Equipo
        FROM Pisos p
    )   
      SELECT 
  CASE 
    WHEN COUNT(*) = SUM(CASE WHEN Equipo IS NULL THEN 1 ELSE 0 END)
    THEN 'OK'
    ELSE 'NA'
  END INTO r_valor
  
  
FROM RackU
WHERE "U" BETWEEN p_u_inicio AND p_u_fin;
    apex_debug.log_long_message('VERIFICAR_DISPONIBILIDAD_U resultado consulta: '||r_valor);
    RETURN r_valor;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Si no hay datos en el rango especificado
        RETURN 'OK';
    WHEN OTHERS THEN
        -- Manejo de errores
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        apex_debug.log_long_message('Error en la consulta: '|| SQLERRM);
        RETURN 'NA';
END VERIFICAR_DISPONIBILIDAD_U;
/ 