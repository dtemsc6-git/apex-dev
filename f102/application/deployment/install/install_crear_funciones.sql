prompt --application/deployment/install/install_crear_funciones
begin
--   Manifest
--     INSTALL: INSTALL-CREAR_FUNCIONES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2449329884471903)
,p_install_id=>wwv_flow_imp.id(519733554265288)
,p_name=>'CREAR_FUNCIONES'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace function "CREAR_RUTA_SRV" (P_SERVICIO_ID IN INTEGER)',
'RETURN SDO_GEOMETRY',
'AS',
'l_coords SDO_ORDINATE_ARRAY := SDO_ORDINATE_ARRAY(); ',
'i PLS_INTEGER := 1; ',
' ',
'begin ',
'    --buscar todos los sitios de la wan ',
'    apex_debug.message(''dmf: Funcion CREAR_RUTA_SERVICIOS:'' ); ',
' ',
'     ',
'    apex_debug.message(''dmf: Funcion CREAR_RUTA_SERVICIOS SRV_ID: $S'',P_SERVICIO_ID ); ',
'    FOR r IN ( ',
'        SELECT s.lat, s.lon, seq   ',
'        FROM v_sitios_gps s ',
'        inner join sgt_sitios_servicio on s.id =  sitio_id ',
'             ',
'        WHERE servicio_id = P_SERVICIO_ID  -- Use the parameter here ',
'        order by seq ',
'             ',
'        ) ',
'    LOOP ',
'        l_coords.EXTEND(2); ',
'        apex_debug.message(''dmf: Funcion CREAR_RUTA_SRV LOOP: $S'',i ); ',
'        l_coords(i)   := r.lon; ',
'        l_coords(i+1) := r.lat; ',
'        i := i + 2; ',
'    END LOOP; ',
' ',
'    RETURN SDO_GEOMETRY( ',
'        2002, 4326, NULL, ',
'        SDO_ELEM_INFO_ARRAY(1,2,1), ',
'        l_coords ',
'    ); ',
'end "CREAR_RUTA_SRV";',
'/',
'create or replace function "CREAR_RUTA_WAN" (P_WAN_ID in integer) ',
'return SDO_GEOMETRY ',
'as ',
' ',
' l_coords SDO_ORDINATE_ARRAY := SDO_ORDINATE_ARRAY(); ',
' i PLS_INTEGER := 1; ',
' ',
'begin ',
'    --buscar todos los sitios de la wan ',
'    apex_debug.message(''dmf: Funcion CREAR_RUTA_WAN:'' ); ',
' ',
'     ',
'    apex_debug.message(''dmf: Funcion CREAR_RUTA_WAN WAN_ID: $S'',P_WAN_ID ); ',
'    FOR r IN ( ',
'        SELECT s.lat, s.lon, seq   ',
'        FROM v_sitios_gps s ',
'        inner join sgt_sitios_enlace_wan on s.id =  sitio_id ',
'             ',
'        WHERE enlace_wan_id = P_WAN_ID  -- Use the parameter here ',
'        order by seq ',
'             ',
'        ) ',
'    LOOP ',
'        l_coords.EXTEND(2); ',
'        apex_debug.message(''dmf: Funcion CREAR_RUTA_WAN LOOP: $S'',i ); ',
'        l_coords(i)   := r.lon; ',
'        l_coords(i+1) := r.lat; ',
'        i := i + 2; ',
'    END LOOP; ',
' ',
'    RETURN SDO_GEOMETRY( ',
'        2002, 4326, NULL, ',
'        SDO_ELEM_INFO_ARRAY(1,2,1), ',
'        l_coords ',
'    ); ',
' ',
'end "CREAR_RUTA_WAN";',
'/',
'create or replace function "GET_EDGES_EQUIPOS" (P_SERVICIO_ID IN NUMBER) ',
'return CLOB ',
'as ',
'L_EDGES CLOB; ',
'begin ',
'    SELECT JSON_ARRAYAGG( ',
'             JSON_OBJECT( ',
'               ''from'' VALUE origen_id, ',
'               ''to''   VALUE destino_id, ',
'               ''label'' VALUE edge_label, ',
'               ''edge_id'' VALUE edge_id ',
'             ) RETURNING CLOB) ',
'    INTO l_edges ',
'    from ( ',
'        select  ',
'        eq_id as origen_id, ',
'        eq_b_id as destino_id, ',
'        fo_nombre as edge_label, ',
'        conn_id as edge_id ',
'        from v_conexiones_general_v2 ',
'        where serv_id = P_SERVICIO_ID ',
'        order by eq_id ',
' ',
'    ); ',
'    RETURN L_EDGES; ',
'end "GET_EDGES_EQUIPOS";',
'/',
'create or replace function "GET_EDGES_IFACE" (P_SERVICIO_ID IN NUMBER) ',
'return CLOB ',
'as ',
'L_EDGES CLOB; ',
'begin ',
'     ',
'    ---======================== ',
'    ---Crear los edge ',
'    ---======================= ',
'    SELECT JSON_ARRAYAGG( ',
'             JSON_OBJECT( ',
'               ''from'' VALUE origen_id, ',
'               ''to''   VALUE destino_id, ',
'               ''label'' VALUE edge_label, ',
'               ''id'' VALUE edge_id ',
'             ) RETURNING CLOB) ',
'    INTO l_edges ',
'    from ( ',
'        select  ',
'        iface_id as origen_id, ',
'        iface_b_id as destino_id, ',
'        fo_nombre as edge_label, ',
'        conn_id as edge_id ',
'        from v_conexiones_general_v2 ',
'        where serv_id = P_SERVICIO_ID ',
'        order by eq_id ',
' ',
'    ); ',
' ',
'    RETURN L_EDGES; ',
' ',
' ',
' ',
' ',
'end "GET_EDGES_IFACE";',
'/',
'create or replace function "GET_EDGES_WAN" (P_WANS_ID IN TABLA_IDS) ',
'return clob ',
'as ',
'L_EDGES CLOB; ',
'begin ',
'    ',
'   apex_debug.message(''dmf: Funcion GET_EDGES_WAN:'' ); ',
' ',
'   --for i IN 1 .. P_WANS_ID.count loop ',
'     --       apex_debug.message(''dmf: Sitios id : %s'', P_WANS_ID(i)); ',
'       -- end loop;  ',
'    ',
'   WITH ordered AS ( ',
'      SELECT ',
'        s.id   AS origen_id, ',
'         ',
'        LEAD(s.id) OVER (PARTITION BY wan.id ORDER BY sw.seq)       AS destino_id, ',
'        wan.id AS edge_id, ',
'        wan.nombre AS edge_label ',
'      FROM sgt_sitios_enlace_wan sw ',
'      JOIN sgt_enlaces_wan wan ON wan.id = sw.enlace_wan_id ',
'      JOIN sgt_sitios s ON s.id = sw.sitio_id ',
'      WHERE sw.enlace_wan_id IN ( ',
'        SELECT column_value FROM TABLE(P_WANS_ID) ',
'      ) ',
'      order by origen_id ',
'    ) ',
'    SELECT JSON_ARRAYAGG( ',
'             JSON_OBJECT( ',
'               ''from'' VALUE origen_id, ',
'               ''to''   VALUE destino_id, ',
'               ''label'' VALUE edge_label, ',
'               ''edge_id'' VALUE edge_id ',
'             ) RETURNING CLOB) ',
'    INTO l_edges ',
'    FROM ordered ',
unistr('    WHERE destino_id IS NOT NULL; -- ahora es v\00E1lido porque destino_id fue calculado en la CTE '),
' ',
'     RETURN l_edges; ',
' ',
' ',
'end "GET_EDGES_WAN";',
'/',
'create or replace function "GET_NODOS_EQUIPOS" (P_SERVICIO_ID IN NUMBER) ',
'return CLOB ',
'as ',
'L_NODES CLOB; ',
'begin ',
'    SELECT JSON_ARRAYAGG( ',
'             JSON_OBJECT(''id'' VALUE id, ''eq_id'' value eq_id, ''label'' VALUE label,  ',
'             ''shape'' VALUE ''box'', ''color'' VALUE ''#00AAFF'', ''level'' VALUE seq) ',
'           RETURNING CLOB) ',
'    INTO l_nodes ',
' ',
'    FROM ( ',
'       SELECT C.eq_ID as id, C.eq_ID as,C.EQ as label, (c.seq)/10 seq  ',
'       FROM V_CONEXIONES_GENERAL_V2 C WHERE C.SERV_ID = P_SERVICIO_ID ',
'       UNION ',
'       SELECT C.eq_B_ID as id, C.eq_b_ID as, C.EQ_B as label, (c.seq + 10) / 10  ',
'       FROM V_CONEXIONES_GENERAL_V2 C WHERE C.SERV_ID = P_SERVICIO_ID ',
'       order by seq ',
'    ); ',
'    return L_NODES; ',
'end "GET_NODOS_EQUIPOS";',
'/',
'create or replace function "GET_NODOS_IFACE" (P_SERVICIO_ID IN NUMBER) ',
'return CLOB ',
'as ',
'L_NODES CLOB; ',
'begin ',
'    ',
' ',
'    SELECT JSON_ARRAYAGG( ',
'             JSON_OBJECT(''eq_id'' value eq_id,''id'' value  id, ''label'' VALUE "label",  ',
'             ''shape'' VALUE ''box'', ''color'' VALUE ''#00AAFF'',  ',
'             ''level'' value seq ',
'             ) ',
'           RETURNING CLOB) ',
'    INTO l_nodes ',
' ',
'    FROM ( ',
' ',
'        SELECT  ',
'        c.eq_id, ',
'    C.IFACE_ID AS id,             ',
'    C.EQ || CHR(10) || C.IFACE "label", ',
'    (c.seq / 10) seq ',
'FROM V_CONEXIONES_GENERAL_V2 C ',
'WHERE C.SERV_ID = P_SERVICIO_ID  ',
' ',
'union    ',
'SELECT    ',
'    c.eq_b_id, ',
'    C.iface_b_id ,        ',
'    C.EQ_B || CHR(10) || C.IFACE_B AS label_b,                ',
'    (c.seq +10 ) / 10 ',
'FROM V_CONEXIONES_GENERAL_V2 C ',
'WHERE C.SERV_ID = P_SERVICIO_ID  ',
' ',
'ORDER BY seq ',
'         ',
'    ); ',
' ',
'    return L_NODES; ',
'end "GET_NODOS_IFACE";',
'/',
'create or replace function "GET_NODOS_SITIOS" (SITIOS_IDS IN TABLA_IDS) ',
'return CLOB ',
'as ',
'    l_nodes CLOB; ',
'begin ',
' ',
unistr('    -- NODOS: lista \00FAnica de sitios (solo los de los enlaces seleccionados) '),
'    apex_debug.message(''Inicia get_nodos_sitios''); ',
'    DBMS_OUTPUT.PUT_LINE(''Inicia el get_nodos_sitios:''); ',
'    FOR i IN 1 .. sitios_ids.COUNT LOOP ',
'        apex_debug.message(''IDS pasados: p_id=%s'', sitios_ids(i)); ',
'    END LOOP; ',
'    SELECT JSON_ARRAYAGG( ',
'             JSON_OBJECT(''id'' VALUE id, ''label'' VALUE label, ''shape'' VALUE ''box'', ''color'' VALUE ''#00AAFF'') ',
'           RETURNING CLOB) ',
'    INTO l_nodes ',
'    FROM ( ',
'      SELECT  ',
'        S.ID, S.SIGLAS LABEL FROM SGT_SITIOS S ',
'        where S.ID IN (SELECT COLUMN_VALUE FROM TABLE(SITIOS_IDS)) ',
'    ); ',
' ',
'    IF l_nodes IS NULL THEN ',
'      l_nodes := ''[]''; ',
'    END IF; ',
' ',
'    return l_nodes; ',
'end "GET_NODOS_SITIOS";',
'/',
'create or replace function "SEXAGESIMAL_TO_DECIMAL" (p_coord IN VARCHAR2) ',
'return number ',
'as ',
' ',
'l_grados   NUMBER; ',
'    l_minutos  NUMBER := 0; ',
'    l_segundos NUMBER := 0; ',
'    l_signo    NUMBER := 1; ',
'    l_decimal  NUMBER; ',
'BEGIN ',
unistr('    -- Signo seg\00FAn hemisferio '),
'    IF p_coord LIKE ''%S%'' OR p_coord LIKE ''%O%'' THEN ',
'        l_signo := -1; ',
'    END IF; ',
' ',
'    -- Extraer grados, minutos y segundos usando REGEXP ',
'    BEGIN ',
'        SELECT TO_NUMBER(REGEXP_SUBSTR(p_coord, ''(\d+)'', 1, 1)) INTO l_grados FROM dual; ',
'        SELECT NVL(TO_NUMBER(REGEXP_SUBSTR(p_coord, ''(\d+)'', 1, 2)), 0) INTO l_minutos FROM dual; ',
'        SELECT NVL(TO_NUMBER(REGEXP_SUBSTR(p_coord, ''(\d+)'', 1, 3)), 0) INTO l_segundos FROM dual; ',
'    EXCEPTION ',
'        WHEN NO_DATA_FOUND THEN ',
'            RETURN NULL; ',
'    END; ',
' ',
unistr('    -- Conversi\00F3n a decimal '),
'    l_decimal := l_signo * (l_grados + (l_minutos/60) + (l_segundos/3600)); ',
' ',
'    RETURN ROUND(l_decimal,7); ',
'END;',
'/',
'create or replace function "URL_TO_LAT" (p_coord IN VARCHAR2) ',
'return coord_obj ',
'as ',
' l_match    VARCHAR2(4000); ',
' l_lat number; ',
' l_long number; ',
'begin ',
'    -- Caso 1: URL de Google Maps con formato decimal ',
'    IF p_coord LIKE ''http%'' THEN ',
unistr('        -- Buscar patr\00F3n de coordenadas decimales (-##.####, -##.####) '),
'        l_match := REGEXP_SUBSTR(p_coord, ''[-]?\d+(\.\d+)?[, ]+[-]?\d+(\.\d+)?''); ',
' ',
'        IF l_match IS NOT NULL THEN ',
'            -- Si queremos la primera parte (latitud): ',
'            l_lat := TO_NUMBER(REGEXP_SUBSTR(l_match, ''[-]?\d+(\.\d+)?'', 1, 1)); ',
'            l_long := TO_NUMBER(REGEXP_SUBSTR(l_match, ''[-]?\d+(\.\d+)?'', 1, 2)); ',
'            RETURN coord_obj(l_lat, l_long); ',
'        ELSE ',
'            RETURN coord_obj(NULL, NULL); ',
'        END IF; ',
'    ELSE ',
'        RETURN coord_obj(NULL, NULL); ',
'    END IF; ',
'end "URL_TO_LAT";',
'/ '))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2449371406471903)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'CREAR_RUTA_SRV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2449600683471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'CREAR_RUTA_WAN'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2449746809471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'GET_EDGES_EQUIPOS'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2449998571471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'GET_EDGES_IFACE'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2450241460471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'GET_EDGES_WAN'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2450414656471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'GET_NODOS_EQUIPOS'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2450563173471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'GET_NODOS_IFACE'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2450837043471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'GET_NODOS_SITIOS'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2451020404471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'SEXAGESIMAL_TO_DECIMAL'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2451207369471904)
,p_script_id=>wwv_flow_imp.id(2449329884471903)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'URL_TO_LAT'
);
wwv_flow_imp.component_end;
end;
/
