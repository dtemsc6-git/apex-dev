prompt --application/pages/page_00400
begin
--   Manifest
--     PAGE: 00400
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_page.create_page(
 p_id=>400
,p_name=>'PruebaTopologia'
,p_alias=>'PRUEBATOPOLOGIA'
,p_step_title=>unistr('Visualizar Topolog\00EDa')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://unpkg.com/vis-network/standalone/umd/vis-network.min.js',
'#APP_FILES#p400_vista_conexiones#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'generarGrafo = function () {',
'',
'    apex.server.process(',
'        ''CONEXIONES_V2'', { pageItems: [''P400_SERVICIO_ID'', ''P400_SELECCIONAR_VISTA''] },',
'        {',
'            success: function (data) {',
'                console.log(data); // Acceder a los datos',
'                console.log("modovista: " + $("#P400_MODO_VISTA").val());',
'',
'                data.nodes.sort((a, b) => a.level - b.level);',
'',
'',
'                if ($("#P400_SELECCIONAR_VISTA").val() === "IFACE" || $("#P400_SELECCIONAR_VISTA").val() === "EQUIPOS") {',
'                    console.log("filtrar nodos");',
'                    var mapNodos = new Map();',
'                    var nodosFiltrados = [];',
'                    var level = 0;',
'                    var prev_eq = 0;',
'                    data.nodes.forEach(nodo => {',
'                        if (!mapNodos.has(nodo.id)) {',
'                            console.log(nodo);',
'                            if (prev_eq !== nodo.eq_id) {',
'                                 level++;  ',
'                                 prev_eq = nodo.eq_id; ',
'                                 console.log("subiendo un nivel");',
'                            }',
'                            mapNodos.set(nodo.id, true);',
'                            nodosFiltrados.push({',
'                                id: nodo.id,',
'                                label: nodo.label,',
'                                shape: nodo.shape, // Forma para interfaces',
'                                color: nodo.color,',
'                                level: level',
'                            });',
'                        }',
'',
'                        /*if (!mapNodos.has(nodo.destino_id)) {',
'                            mapNodos.set(nodo.destino_id, true);',
'                            nodosFiltrados.push({',
'                                id: nodo.destino_id,',
'                                label: nodo.destino,',
'                                shape: nodo.shape, // Forma para interfaces',
'                                color: nodo.color,',
'                                level: nodo.level_b',
'                            });',
'                        }*/',
'',
'                        /*edges.push({',
'                            from: nodo.origen_id,',
'                            to: nodo.destino_id,',
unistr('                            arrows: "to", // Flecha indica direcci\00F3n'),
unistr('                            label: "", // Etiqueta del tipo de conexi\00F3n'),
unistr('                            color: "#848484" // Color de la l\00EDnea'),
'                        });*/',
'',
'',
'                    });',
'                    data.nodes = nodosFiltrados;',
'                    //data.edges = edges;',
'',
'                }',
'',
'                var nodes = new vis.DataSet(data.nodes);',
'                var edges = new vis.DataSet(data.edges);',
'',
'                var data = { nodes: nodes, edges: edges };',
'',
'                var container = document.getElementById("network");',
'                var network = new vis.Network(container, data, {',
'                    layout: {',
'                        improvedLayout: true,',
'                        hierarchical: {',
'                            enabled: true,',
'                          //  nodeSpacing: 200,',
'                            levelSeparation: 75,',
'                            direction: $("#P400_MODO_VISTA").val()',
'                        }',
'                    }',
'                    ,physics: { enabled: false, solver: "forceAtlas2Based" }',
'                });',
'            }',
'',
'',
'            ,',
'            error: function (pError) {',
'                console.error(''Error:'', pError);',
'            }',
'        }',
'    );',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#network {',
'    width: auto;',
'    height: 800px;',
'    border: 1px solid lightgray;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(78443843321989367113)
,p_plug_name=>'Network'
,p_region_css_classes=>'miNetwork'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_location=>null
,p_plug_source=>'<div class="miNetwork" id="network"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(79639294021794205027)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(197180072443235446203)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78443843546750367115)
,p_name=>'P400_SERVICIO_ID'
,p_item_sequence=>20
,p_prompt=>'Servicio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SGT_SERVICIOS.NOMBRE'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>8
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78443843843863367118)
,p_name=>'P400_SELECCIONAR_VISTA'
,p_item_sequence=>30
,p_prompt=>'Seleccionar Vista'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Equipos;EQUIPOS,Interfaces;IFACE,Wan;WAN'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78443843923638367119)
,p_name=>'P400_MODO_VISTA'
,p_item_sequence=>40
,p_prompt=>'Modo Vista'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Arriba para Abajo;UD,Izquierda a Derecha;LR,Derecha a Izquierda;RL'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(78443843620092367116)
,p_name=>'CambiarServicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_SERVICIO_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(78443843762790367117)
,p_event_id=>wwv_flow_imp.id(78443843620092367116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'apex.server.process(',
'    ''GET_CONEXIONES'', { pageItems: [''P400_SERVICIO_ID'', ''P400_SELECCIONAR_VISTA''] },',
'    {',
'        success: function (apiData) {',
'            visualizar_conexiones(apiData, $("#P400_MODO_VISTA").val());',
'        }',
'    });',
'*/',
'',
'/*',
'apex.server.process(',
'    ''CONEXIONES_V2'', { pageItems: [''P400_SERVICIO_ID'', ''P400_SELECCIONAR_VISTA''] },',
'    {',
'        success: function (data) {',
'            console.log(data); // Acceder a los datos',
'            console.log("modovista: "+$("#P400_MODO_VISTA").val()); ',
'                ',
'            var nodes = new vis.DataSet(data.nodes);',
'            var edges = new vis.DataSet(data.edges);',
'',
'            var data = { nodes: nodes, edges: edges };',
'            ',
'            var container = document.getElementById("network");',
'            var network = new vis.Network(container, data, {',
'                layout: { hierarchical: { enabled: true, direction: $("#P400_MODO_VISTA").val() }},',
'                physics: { enabled: false, solver: "forceAtlas2Based" }',
'            });',
'        }',
'',
'',
'        ,',
'        error: function (pError) {',
'            console.error(''Error:'', pError);',
'        }',
'    }',
');',
'*/',
'generarGrafo();',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88034738380251770426)
,p_name=>'Change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_MODO_VISTA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88034738413072770427)
,p_event_id=>wwv_flow_imp.id(88034738380251770426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'generarGrafo();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88034738504564770428)
,p_name=>'Seleccionar_Vista_Change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_SELECCIONAR_VISTA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88034738692325770429)
,p_event_id=>wwv_flow_imp.id(88034738504564770428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'generarGrafo();'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78443843459088367114)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_CONEXIONES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'Obtener todos los equipos que participan en un servicio, tambien todas las ',
'interfaces que participan del servicio.',
unistr('Estos ser\00E1n los nodos. '),
'',
'las conexiones se quitan de los enlaces logicos y enlaces tramos.',
'',
unistr('la librer\00EDa se deber\00EDa de encargar de renderizar todo.'),
'',
'*/',
'declare',
'l_cursor SYS_REFCURSOR;',
'begin',
'--Consulta para traer los nodos:',
'/*select e.id, e.nombre label from sgt_equipos e where',
'',
'e.id in ( ',
'    SELECT id FROM (',
'    SELECT equipo_a_id id FROM sgt_enlaces_tramos et',
'    LEFT JOIN sgt_servicios_tramos st ON st.tramo_id = et.id ',
'    WHERE st.servicio_id = 1',
'    UNION',
'    SELECT equipo_b_id id FROM sgt_enlaces_tramos et',
'    LEFT JOIN sgt_servicios_tramos st ON st.tramo_id = et.id ',
'    WHERE st.servicio_id = 1',
'    ) t     ',
'    )    ',
'',
'--consulta para traer las aristas "Edges"',
'--falta obtener los nombres de los enlaces',
'select equipo_a_id ORI, equipo_b_id DEST, interfaz_a_id ||''>''||interfaz_b_id NOMBRE from sgt_enlaces_logicos ',
'left join',
'sgt_servicios_enlaces_logicos',
'on sgt_servicios_enlaces_logicos.enlace_id = sgt_enlaces_logicos.id',
'where sgt_servicios_enlaces_logicos.servicio_id = 1',
'',
'union all',
'',
'select equipo_a_id ORI, equipo_b_id DEST, interfaz_a_id ||''>''||interfaz_b_id NOMBRE from sgt_enlaces_tramos ',
'left join',
'sgt_servicios_tramos',
'on sgt_servicios_tramos.tramo_id = sgt_enlaces_tramos.id',
'where sgt_servicios_tramos.servicio_id = 1',
'',
'SELECT * FROM V_CONEXIONES_GENERALES con',
'',
'WHERE con.servicio_id = :P400_SERVICIO_ID;',
'',
'',
'*/',
'BEGIN',
'    IF UPPER(:P400_SELECCIONAR_VISTA)= ''EQUIPOS'' THEN',
'        OPEN l_cursor FOR',
'            SELECT equipo_a origen, equipo_a_id origen_id,  equipo_b destino, equipo_b_id destino_id  ',
'            FROM V_CONEXIONES_GENERAL ',
'            WHERE servicio_id = :P400_SERVICIO_ID',
'            ORDER BY sitio_a_id;',
'            ',
'    ELSIF UPPER(:P400_SELECCIONAR_VISTA) = ''SITIOS'' THEN',
'        OPEN l_cursor FOR',
'            SELECT sitio_a origen, sitio_a_id origen_id, sitio_b destino, sitio_b_id destino_id ',
'            FROM V_CONEXIONES_GENERAL ',
'            WHERE servicio_id = :P400_SERVICIO_ID',
'            ORDER BY sitio_a_id;',
'            ',
'    ELSIF UPPER(:P400_SELECCIONAR_VISTA)  = ''INTERFACES'' THEN',
'        OPEN l_cursor FOR',
'            SELECT interfaz_a origen, interfaz_a_id origen_id, interfaz_b destino, interfaz_b_id destino_id ',
'            FROM V_CONEXIONES_GENERAL ',
'            WHERE servicio_id = :P400_SERVICIO_ID',
'            ORDER BY sitio_a_id;',
'            ',
'    ELSE',
'        OPEN l_cursor FOR',
'            SELECT *  ',
'            FROM V_CONEXIONES_GENERAL ',
'            WHERE servicio_id = :P400_SERVICIO_ID',
'            ORDER BY sitio_a_id;',
'    END IF;',
'    ',
'    APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''data'', l_cursor); -- Convierte el cursor a JSON array',
'    APEX_JSON.CLOSE_OBJECT;',
'END;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_internal_uid=>78443843459088367114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88034738227850770425)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CONEXIONES_V2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_cursor SYS_REFCURSOR;',
'l_nodes CLOB;',
'l_edges CLOB;',
'l_ids TABLA_IDS;',
'begin',
'   ',
'   IF (UPPER(:P400_SELECCIONAR_VISTA) = ''IFACE'') THEN',
'      l_nodes := GET_NODOS_IFACE(:P400_SERVICIO_ID);',
'      L_EDGES := GET_EDGES_IFACE(:P400_SERVICIO_ID);',
'',
'   END IF;',
'',
'',
'',
'   IF (UPPER(:P400_SELECCIONAR_VISTA) = ''WAN'') THEN',
'         apex_debug.message(''dmf: Buscando Serivicio_id: %s'', :P400_SERVICIO_ID); ',
'         select s.id bulk collect into L_IDS from sgt_sitios s',
'            join sgt_sitios_servicio ss on ss.sitio_id =  s.id',
'            where ss.SERVICIO_ID = :P400_SERVICIO_ID;',
'        for i IN 1 .. L_IDS.count loop',
'            apex_debug.message(''dmf: Sitios id : %s'', L_IDS(i));',
'        end loop; ',
'        l_nodes := GET_NODOS_SITIOS(l_ids);',
'',
'        apex_debug.message(''dmf: Buscando WANs con Serivicio_id: %s'', :P400_SERVICIO_ID); ',
'        select w.id bulk collect into L_IDS from sgt_enlaces_wan w',
'            join sgt_enlaces_wan_servicio ws on ws.enlace_id =  w.id',
'            where ws.SERVICIO_ID = :P400_SERVICIO_ID;',
'',
'        l_edges := GET_EDGES_WAN(L_IDS); ',
'',
'',
'   END IF ;',
'   ',
'   if (UPPER(:P400_SELECCIONAR_VISTA) = ''EQUIPOS'') THEN',
' ',
'',
'   /** SELECT JSON_ARRAYAGG(',
'             JSON_OBJECT(''id'' VALUE id, ''eq_id'' value eq_id, ''label'' VALUE label, ''shape'' VALUE ''box'', ''color'' VALUE ''#00AAFF'', ''level'' VALUE seq)',
'           RETURNING CLOB)',
'    INTO l_nodes',
'',
'    FROM (',
'       SELECT C.eq_ID as id, C.eq_ID as,C.EQ as label, (c.seq)/10 seq FROM V_CONEXIONES_GENERAL_V2 C WHERE C.SERV_ID = :P400_SERVICIO_ID',
'        ',
'        UNION',
'        SELECT C.eq_B_ID as id, C.eq_b_ID as, C.EQ_B as label, (c.seq + 10) / 10 FROM V_CONEXIONES_GENERAL_V2 C WHERE C.SERV_ID =:P400_SERVICIO_ID',
'',
'        order by seq',
'        ',
'    );',
'    **/',
'',
'      l_nodes := GET_NODOS_EQUIPOS(:P400_SERVICIO_ID);',
'      L_EDGES := GET_EDGES_EQUIPOS(:P400_SERVICIO_ID);',
'',
'    IF l_nodes IS NULL THEN',
'      l_nodes := ''[]'';',
'    END IF;',
'',
'    ---========================',
'    ---Crear los edge',
'    ---=======================',
'    /**SELECT JSON_ARRAYAGG(',
'             JSON_OBJECT(',
'               ''from'' VALUE origen_id,',
'               ''to''   VALUE destino_id,',
'               ''label'' VALUE edge_label,',
'               ''edge_id'' VALUE edge_id',
'             ) RETURNING CLOB)',
'    INTO l_edges',
'    from (',
'        select ',
'        eq_id as origen_id,',
'        eq_b_id as destino_id,',
'        fo_nombre as edge_label,',
'        conn_id as edge_id',
'        from v_conexiones_general_v2',
'        where serv_id = :P400_SERVICIO_ID',
'        order by eq_id',
'',
'    );**/',
'',
'    if l_edges is null then ',
'        l_edges := ''[]'';',
'    end if;    ',
'    END IF;',
'',
'    htp.p(',
'      JSON_OBJECT(',
'        ''nodes'' VALUE l_nodes FORMAT JSON,',
'        ''edges'' VALUE l_edges FORMAT JSON',
'      ) ',
'    );',
'',
'',
'',
'',
'',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>88034738227850770425
);
wwv_flow_imp.component_end;
end;
/
