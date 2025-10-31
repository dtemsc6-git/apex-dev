prompt --application/pages/page_00054
begin
--   Manifest
--     PAGE: 00054
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
 p_id=>54
,p_name=>'Step 5'
,p_alias=>'STEP-5'
,p_page_mode=>'MODAL'
,p_step_title=>'Verificar los datos'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(57024536698229459190)
,p_javascript_file_urls=>'https://unpkg.com/vis-network/standalone/umd/vis-network.min.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process(',
'    ''DATOS_GRAFO'', { pageItems: ''#P54_NIVEL_TEXTO'' },',
'    {',
'        success: function (data) {',
'            console.log(data); // Acceder a los datos',
'',
'',
'            var nodes = new vis.DataSet(data.nodes);',
'            var edges = new vis.DataSet(data.edges);',
'',
'            var data = { nodes: nodes, edges: edges };',
'            ',
'            var container = document.getElementById("network");',
'            var network = new vis.Network(container, data, {',
'                layout: { hierarchical: { enabled: true, direction: "RL" }, },',
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
'',
'',
'',
'',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.summary-label {',
'    font-weight: bold;',
'    color: #1a5276;',
'    display: inline-block;',
'    ',
'}',
'.summary-list {',
'    list-style-type: none;',
'    padding: 0;',
'}',
'.summary-list li {',
'    padding: 8px 0;',
'    border-bottom: 1px solid #f0f0f0;',
'}',
'',
'.ocultable {',
'   display: none;',
'}',
'',
'.capitalize {',
'    text-transform: capitalize;',
'    font-weight: bold;',
'    color: #6624bd;',
'}'))
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(67812707636275518424)
,p_plug_name=>'Wizard Progress'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_imp.id(67812692495749518409)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2010149141494510257
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(67812707774765518424)
,p_plug_name=>'Step 4'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="summary-container">',
'    ',
'    <h3> <span class="summary-label">Servicios: </span></h3>',
'       <ul class="summary-list">',
'           <li > Nombre: <span class="capitalize">&P50_NOMBRE.</span>, ',
'           Nivel de Prioridad: <span class="capitalize">&P50_NIVEL_DE_PRIORIDAD.:&P54_NIVEL_TEXTO.</span>,',
unistr('           Observaci\00F3n: <span class="capitalize">&P50_DESCRIPCION.</span></li>'),
'       </ul>',
'',
' <!--   ',
'    <ul class="summary-list">',
'           <li><span class="summary-label">Lado A:</span> <span class="">&P54_SITIO_A.::&P54_EQUIPO_A.::&P54_INTERFAZ_A.</span></li>',
'       </ul>',
'     <ul class="summary-list">',
'           <li><span class="summary-label">Lado B:</span> <span class="">&P54_SITIO_B.::&P54_EQUIPO_B.::&P54_INTERFAZ_B.</span></li>',
'       </ul>',
'       -->',
'',
'',
'',
'    ',
'',
'</div>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(68028420772429161411)
,p_name=>'Conexiones'
,p_parent_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_template=>2072724515482255512
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    t.id as title,',
unistr('    t.equipo_a || '':''|| t.interfaz_a ||''\25BA''|| t.equipo_b || '':''|| t.interfaz_b description,'),
'    ''fa-check-circle'' as icon,',
'    t.id as card_id',
'FROM ',
'    V_TRAMOS_NOMBRES t',
'WHERE ',
'    t.id IN (',
'        SELECT column_value ',
'        FROM apex_string.split_numbers(:P52_CIRCUITOS_FISICOS, '','')',
'    )'))
,p_header=>unistr('<h3><span class="summary-label">Conexiones f\00EDsicas</span></h3>')
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68028421028394161414)
,p_query_column_id=>1
,p_column_alias=>'TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Title'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68028421101465161415)
,p_query_column_id=>2
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>30
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68028421276481161416)
,p_query_column_id=>3
,p_column_alias=>'ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Icon'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68028421368812161417)
,p_query_column_id=>4
,p_column_alias=>'CARD_ID'
,p_column_display_sequence=>50
,p_column_heading=>'Card Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(68028423381033161437)
,p_name=>'Enlaces WAN'
,p_parent_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_template=>2072724515482255512
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select wan.nombre',
'',
'from sgt_enlaces_wan wan',
'',
'where ',
'wan.id in (',
'SELECT column_value ',
'        FROM apex_string.split_numbers(:P53_ENLACES_WAN, '','') ',
'        ',
')',
'',
'',
'',
''))
,p_header=>'<h3><span class="summary-label">Enlace WAN: </span></h3>'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(85693683633721747643)
,p_query_column_id=>1
,p_column_alias=>'NOMBRE'
,p_column_display_sequence=>10
,p_column_heading=>'Nombre'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(78443845780960367137)
,p_plug_name=>'Nodos_Origen_Trazado'
,p_title=>'Vista Origen a destino'
,p_parent_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="network">',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(67812707818255518424)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(67812709381181518426)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(67812707818255518424)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88034739401241770437)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(67812707818255518424)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_BORRAR!RAW.'
,p_button_position=>'DELETE'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_button_condition=>'P50_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(67812709412413518426)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(67812707818255518424)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finish'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(67812709584798518426)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(67812707818255518424)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(67812711268788518427)
,p_branch_action=>'f?p=&APP_ID.:52:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(67812709584798518426)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68028421603352161420)
,p_name=>'P54_EQUIPO_A'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68028421818726161422)
,p_name=>'P54_INTERFAZ_A'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68028422113916161425)
,p_name=>'P54_SITIO_A'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68028422236329161426)
,p_name=>'P54_SITIO_B'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68028422322246161427)
,p_name=>'P54_EQUIPO_B'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68028422465368161428)
,p_name=>'P54_INTERFAZ_B'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78443844830718367128)
,p_name=>'P54_NIVEL_TEXTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(67812707774765518424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(67812709757777518426)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(67812709381181518426)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(67812710563538518427)
,p_event_id=>wwv_flow_imp.id(67812709757777518426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88034739792624770440)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BORRAR_SERVICIO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--BORRAR LOS DATOS DE SITIOS_SERVICIOS',
'   DELETE FROM SGT_SITIOS_SERVICIO',
'   WHERE SERVICIO_ID = :P50_ID;',
'   --BORRAR LOS DATOS DE ENLACE_WAN_SERVICIOS',
'   DELETE FROM SGT_ENLACES_WAN_SERVICIO',
'   WHERE SERVICIO_ID = :P50_ID;',
'  --BORRAR LOS DATOS DE CONEXIONES_SERVICIOS',
'   DELETE FROM SGT_CONEXIONES_SERVICIO',
'   WHERE SERVICIO_ID = :P50_ID;',
'   --BORRAR LOS DATOS DEL SERVICIO',
'   DELETE FROM SGT_SERVICIOS',
'   WHERE ID = :P50_ID;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error al intentar borrar el servicio'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(88034739401241770437)
,p_process_success_message=>'Se ha borrado el servicio'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_internal_uid=>88034739792624770440
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(85693683733012747644)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROCESAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'seq NUMBER;',
'BEGIN',
'  seq:=10;',
'  ',
'  IF :P50_ID IS NULL THEN',
'    --INSERTAR LOS DATOS Y GUARDAR EL ID EN EL CAMPO ID',
'    INSERT INTO sgt_servicios (nombre, nivel_de_prioridad, DESCRIPCION)',
'    VALUES (:P50_NOMBRE, :P50_NIVEL_DE_PRIORIDAD, :P50_DESCRIPCION)',
'    RETURNING id INTO :P50_ID;',
'    ',
'  ELSE ',
'    --=================',
'    --Actualizar los datos de la tabla servicios',
'    --==================',
'    UPDATE sgt_servicios ',
'    set nombre = :P50_NOMBRE, ',
'    nivel_de_prioridad = :P50_NIVEL_DE_PRIORIDAD, ',
'    DESCRIPCION = :P50_DESCRIPCION',
'    where id = :P50_ID ;',
'    ',
'    --BORRAR LOS DATOS DE SITIOS_SERVICIOS',
'   DELETE FROM SGT_SITIOS_SERVICIO',
'   WHERE SERVICIO_ID = :P50_ID;',
'   --BORRAR LOS DATOS DE ENLACE_WAN_SERVICIOS',
'   DELETE FROM SGT_ENLACES_WAN_SERVICIO',
'   WHERE SERVICIO_ID = :P50_ID;',
'  --BORRAR LOS DATOS DE CONEXIONES_SERVICIOS',
'   DELETE FROM SGT_CONEXIONES_SERVICIO',
'   WHERE SERVICIO_ID = :P50_ID;',
'  -- INSERTAR LOS DATOS DE LOS SITIOS',
'    SEQ:=10;',
'  --INSERTAR LOS DATOS DE LAS WAN',
'  --INSERTAR LAS CONEXIONES  ',
'  END IF;',
'',
'   ',
'    ',
'  --=====================',
'  --INSERTAR LOS DATOS DE LOS SITIOS',
'  --======================',
'  ',
'  FOR rec IN (',
'        SELECT column_value AS sitio_id',
'        FROM TABLE(apex_string.split_numbers(:P51_SITIOS_TRANSITO, '',''))',
'        ORDER BY ROWNUM',
'    )',
'    LOOP',
'        INSERT INTO sgt_sitios_servicio (',
'            sitio_id,',
'            servicio_id,',
'            seq',
'        ) VALUES (',
'            rec.sitio_id,',
'            :P50_ID,',
'            seq',
'        );',
'        seq := seq + 10;',
'    END LOOP;',
'    seq := 10;',
'    ---=================',
'    ---INSERTAR DATOS DE ENLACES WAN SERVICIO',
'    ---=======================================',
'    FOR rec IN (',
'        SELECT column_value AS ENLACE_ID',
'        FROM TABLE(apex_string.split_numbers(:P53_ENLACES_WAN, '',''))',
'        ORDER BY ROWNUM',
'    )',
'    LOOP',
'        INSERT INTO sgt_enlaces_wan_servicio (',
'            ',
'            servicio_id,',
'            enlace_id,',
'            seq',
'        ) VALUES (',
'            :P50_ID,',
'            rec.ENLACE_ID,',
'            seq',
'        );',
'        seq := seq + 10;',
'    END LOOP;',
'',
'    ---====================================',
'    ---INSERTAR LOS DATOS DE LAS CONEXIONES SELECCIONADAS ',
'    ---====================================',
'    seq :=10;',
'    FOR rec IN (',
'        SELECT column_value AS ENLACE_TRAMO_ID',
'        FROM TABLE (apex_string.split_numbers(:P52_CIRCUITOS_FISICOS, '',''))',
'        ORDER BY ROWNUM',
'    )',
'    LOOP',
'        INSERT INTO sgt_conexiones_servicio (',
'            ',
'            servicio_id,',
'            enlace_tramo_id,',
'            seq',
'        ) VALUES (',
'            :P50_ID,',
'            rec.ENLACE_TRAMO_ID,',
'            seq',
'        );',
'        seq := seq + 10;',
'    END LOOP;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'No se pudo crear el Servicio'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(67812709412413518426)
,p_process_success_message=>'Se ha creado el enlace Servicio'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_internal_uid=>85693683733012747644
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(85693683811872747645)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CLEAR_SESSION'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'50,51,52,53,54'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>85693683811872747645
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(67812712072660518428)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>67812712072660518428
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(68028422015193161424)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CONSULTAR_NIVEL_PRIORIDAD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'        v_resultado VARCHAR2(200);',
'        V_NIVEL_TEXTO VARCHAR2(255);',
'    BEGIN',
'        -- Ejemplo: Consulta a base de datos',
'        --select siglas into :P54_SITIO_A from sgt_sitios where id = :P51_LADO_A;',
'        --select NVL(NOMBRE, ''S/D'') into :P54_EQUIPO_A from sgt_EQUIPOS where id = :P51_EQUIPO_A;',
'        --select NVL(NOMBRE, ''S/D'') into :P54_INTERFAZ_A from sgt_interfaces where id = :P51_INTERFAZ_A;',
'        --select siglas into :P54_SITIO_B from sgt_sitios where id = :P51_LADO_B;',
'        ',
'        /*if (:P51_EQUIPO_B is not null ) then',
'           select NVL(NOMBRE, ''S/D'') into :P54_EQUIPO_B from sgt_EQUIPOS where id = :P51_EQUIPO_B;',
'        end if;',
'        if :P51_INTERFAZ_B is NOT NULL then',
'           select NOMBRE into :P54_INTERFAZ_B from sgt_interfaces where id = :P51_INTERFAZ_B;',
'        end if;*/',
'',
'        SELECT display_value INTO :P54_NIVEL_TEXTO',
'           FROM   apex_application_lov_entries',
'           WHERE  application_id = :APP_ID',
'           AND    list_of_values_name = ''NIVEL_PRIORIDAD''',
'           AND    return_value = :P50_NIVEL_DE_PRIORIDAD;',
'    END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>68028422015193161424
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78443845881263367138)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DATOS_GRAFO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_nodes CLOB;',
'    l_edges CLOB;',
'BEGIN',
unistr('    -- NODOS: lista \00FAnica de sitios (solo los de los enlaces seleccionados)'),
'    SELECT JSON_ARRAYAGG(',
'             JSON_OBJECT(''id'' VALUE id, ''label'' VALUE label, ''shape'' VALUE ''box'', ''color'' VALUE ''#00AAFF'')',
'           RETURNING CLOB)',
'    INTO l_nodes',
'    FROM (',
'      SELECT ',
'        S.ID, S.SIGLAS LABEL FROM SGT_SITIOS S',
'      WHERE S.ID IN (',
'        SELECT column_value FROM TABLE(apex_string.split_numbers(:P51_SITIOS_TRANSITO, '',''))',
'      )',
'    );',
'',
'    IF l_nodes IS NULL THEN',
'      l_nodes := ''[]'';',
'    END IF;',
'    ',
unistr('    -- EDGES: calculo de LEAD() en una CTE/consulta intermedia y luego agregaci\00F3n JSON'),
'    WITH ordered AS (',
'      SELECT',
'        s.id   AS origen_id,',
'        ',
'        LEAD(s.id) OVER (PARTITION BY wan.id ORDER BY sw.seq)       AS destino_id,',
'        wan.id AS edge_id,',
'        wan.nombre AS edge_label',
'      FROM sgt_sitios_enlace_wan sw',
'      JOIN sgt_enlaces_wan wan ON wan.id = sw.enlace_wan_id',
'      JOIN sgt_sitios s ON s.id = sw.sitio_id',
'      WHERE sw.enlace_wan_id IN (',
'        SELECT column_value FROM TABLE(apex_string.split_numbers(:P53_ENLACES_WAN, '',''))',
'      )',
'    )',
'    SELECT JSON_ARRAYAGG(',
'             JSON_OBJECT(',
'               ''from'' VALUE origen_id,',
'               ''to''   VALUE destino_id,',
'               ''label'' VALUE edge_label,',
'               ''edge_id'' VALUE edge_id',
'             ) RETURNING CLOB)',
'    INTO l_edges',
'    FROM ordered',
unistr('    WHERE destino_id IS NOT NULL; -- ahora es v\00E1lido porque destino_id fue calculado en la CTE'),
'',
'    IF l_edges IS NULL THEN',
'      l_edges := ''[]'';',
'    END IF;',
'',
unistr('    -- Devolvemos JSON final (anidando los JSON ya generados; FORMAT JSON no es necesario aqu\00ED'),
'    -- porque pasamos l_nodes/l_edges como literales JSON y usamos RETURNING CLOB en JSON_OBJECT).',
'    htp.p(',
'      JSON_OBJECT(',
'        ''nodes'' VALUE l_nodes FORMAT JSON,',
'        ''edges'' VALUE l_edges FORMAT JSON',
'      ) ',
'    );',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>78443845881263367138
);
wwv_flow_imp.component_end;
end;
/
