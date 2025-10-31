prompt --application/pages/page_00404
begin
--   Manifest
--     PAGE: 00404
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
 p_id=>404
,p_name=>'Verificar las instrucciones'
,p_alias=>'VERIFICAR-LAS-INSTRUCCIONES'
,p_page_mode=>'MODAL'
,p_step_title=>'Verificar las instrucciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'https://unpkg.com/vis-network/standalone/umd/vis-network.min.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'Para crear el grafo en esta ventana siempre sera una union del primero con el siguiente. si la cantidad de ',
'nodos es mayor a dos ver si vale la pena crear un enlace entre el primero y el ultimo',
' */',
'',
'apex.server.process(',
'    ''DATOS_GRAFO'', { pageItems: '''' },',
'    {',
'        success: function (apiData) {',
'            console.log(apiData.data); // Acceder a los datos',
'',
'            const nodes = [];',
'            const edges = [];',
'            var destino = null;',
'',
'            apiData.data.forEach(connection => {',
'',
'                console.log(connection);',
'                nodes.push({',
'                    id: connection.ORIGEN_ID,',
'                    label: connection.ORIGEN,',
'                    group: "sitios",',
'                    shape: "box", //',
'                    color: "#FF9900"',
'                });',
'',
'                if (destino != null) {',
'                    edges.push({',
'                        from: destino.ORIGEN_ID,',
'                        to: connection.ORIGEN_ID ,',
unistr('                        arrows: "to", // Flecha indica direcci\00F3n'),
unistr('                        color: "#848484" // Color de la l\00EDnea'),
'                    });',
'                }',
'                destino = connection;',
'',
'            });',
'            ',
'            nodes.reverse();',
'',
'            var data = { nodes: nodes, edges: edges };',
'            ',
'',
'            var container = document.getElementById("network");',
'            var network = new vis.Network(container, data, {',
'                layout: { hierarchical: { enabled: true, direction: "LR" }, },',
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
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85027405264778935793)
,p_plug_name=>'Wizard Progress'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_imp.id(85027390009745935778)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2010149141494510257
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85027405378790935793)
,p_plug_name=>'Verificar las instrucciones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85693681447078747621)
,p_plug_name=>'ENLACE_WAN'
,p_parent_plug_id=>wwv_flow_imp.id(85027405378790935793)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="summary-container">',
'    ',
'    <h3> <span class="summary-label">Enlace WAN: </span></h3>',
'       <ul class="summary-list">',
'           <li >Nombre: <span class="capitalize">&P401_NOMBRE.</span></li> ',
'           <li>Grupo de Red: <span class="capitalize">&P401_GRUPO_RED.</span></li>',
'       </ul>',
'</div>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85693681519527747622)
,p_plug_name=>'SITIOS'
,p_parent_plug_id=>wwv_flow_imp.id(85027405378790935793)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_imp.id(85693681667589747623)
,p_plug_name=>'CONEXIONES'
,p_parent_plug_id=>wwv_flow_imp.id(85027405378790935793)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85693681719678747624)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(85693681667589747623)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    t.id as Elemento,',
unistr('    t.equipo_a || '':''|| t.interfaz_a ||''\25BA''|| t.equipo_b || '':''|| t.interfaz_b Conexi\00F3n'),
'    ',
'FROM ',
'    V_TRAMOS_NOMBRES t',
'WHERE ',
'    t.id IN (',
'        SELECT column_value ',
'        FROM apex_string.split_numbers(:P403_CONEXIONES, '','')',
'    )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(85693681809874747625)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'DTEMSC6'
,p_internal_uid=>85693681809874747625
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85693682287122747629)
,p_db_column_name=>'ELEMENTO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Elemento'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85693682340240747630)
,p_db_column_name=>unistr('CONEXI\00D3N')
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>unistr('Conexi\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(85733839266163652302)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'857338393'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('ELEMENTO:CONEXI\00D3N:')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85027405443039935793)
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
 p_id=>wwv_flow_imp.id(85027406975700935795)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(85027405443039935793)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88034739535313770438)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(85027405443039935793)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_BORRAR!RAW.'
,p_button_position=>'DELETE'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_button_condition=>'P401_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(85027407059183935795)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(85027405443039935793)
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
 p_id=>wwv_flow_imp.id(85027407127601935795)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(85027405443039935793)
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
 p_id=>wwv_flow_imp.id(85027408890995935797)
,p_branch_action=>'f?p=&APP_ID.:403:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(85027407127601935795)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(85027407349265935795)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(85027406975700935795)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85027408186156935796)
,p_event_id=>wwv_flow_imp.id(85027407349265935795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88034739652343770439)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BORRAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    -- ===========================================',
'    -- 1. BORRAR datos relacionados existentes',
'    -- ===========================================',
'    DELETE FROM sgt_sitios_enlace_wan',
'    WHERE enlace_wan_id = :P401_ID;',
'',
'    DELETE FROM sgt_conexiones_enlace_wan',
'    WHERE enlace_wan_id = :P401_ID;',
'',
'    ---Borrar el servicio',
'    DELETE FROM SGT_ENLACES_WAN',
'    WHERE ID = :P401_ID;',
'',
' END;  '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error al intentar borrar el enlace WAN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(88034739535313770438)
,p_process_success_message=>'Se ha borrado el enlace WAN'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_internal_uid=>88034739652343770439
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(85693683290250747639)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROCESAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_seq NUMBER := 10;',
'BEGIN',
'    -- ===========================================',
'    -- 1. BORRAR datos relacionados existentes',
'    -- ===========================================',
'    DELETE FROM sgt_sitios_enlace_wan',
'    WHERE enlace_wan_id = :P401_ID;',
'',
'    DELETE FROM sgt_conexiones_enlace_wan',
'    WHERE enlace_wan_id = :P401_ID;',
'',
'    -- ===========================================',
'    -- 2. INSERTAR o ACTUALIZAR datos del ENLACE_WAN',
'    -- ===========================================',
'    IF :P401_ID IS NULL THEN',
'    -- Nuevo registro',
'    INSERT INTO sgt_enlaces_wan (nombre, grupo_red)',
'    VALUES (:P401_NOMBRE, :P401_GRUPO_RED)',
'    RETURNING id INTO :P401_ID;',
'ELSE',
'    -- Actualizar existente',
'    UPDATE sgt_enlaces_wan',
'    SET nombre    = :P401_NOMBRE,',
'        grupo_red = :P401_GRUPO_RED',
'    WHERE id = :P401_ID;',
'END IF;',
'',
'',
'    -- ===========================================',
'    -- 3. INSERTAR datos en SITIOS_ENLACE_WAN',
'    -- ===========================================',
'    l_seq := 10;',
'    FOR rec IN (',
'        SELECT column_value AS sitio_id',
'        FROM TABLE(apex_string.split_numbers(:P402_SITIOS, '',''))',
'        ORDER BY ROWNUM',
'    )',
'    LOOP',
'        INSERT INTO sgt_sitios_enlace_wan (',
'            sitio_id,',
'            enlace_wan_id,',
'            seq',
'        ) VALUES (',
'            rec.sitio_id,',
'            :P401_ID,',
'            l_seq',
'        );',
'        l_seq := l_seq + 10;',
'    END LOOP;',
'',
'    -- ===========================================',
'    -- 4. INSERTAR datos en CONEXIONES_ENLACE_WAN',
'    -- ===========================================',
'    l_seq := 10;',
'    FOR rec IN (',
'        SELECT column_value AS tramo_id',
'        FROM TABLE(apex_string.split_numbers(:P403_CONEXIONES, '',''))',
'        ORDER BY ROWNUM',
'    )',
'    LOOP',
'        INSERT INTO sgt_conexiones_enlace_wan (',
'            enlace_tramo_id,',
'            enlace_wan_id,',
'            secuencia',
'        ) VALUES (',
'            rec.tramo_id,',
'            :P401_ID,',
'            l_seq',
'        );',
'        l_seq := l_seq + 10;',
'    END LOOP;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'No se pudo crear el enlace WAN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(85027407059183935795)
,p_process_success_message=>'Se ha creado el enlace WAN'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_internal_uid=>85693683290250747639
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(85693683597011747642)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CLEAR_CACHE'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'401,402,403'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>85693683597011747642
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(85027409694589935797)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>85027409694589935797
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(85693682171725747628)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DATOS_GRAFO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_cursor SYS_REFCURSOR;',
'begin',
'',
'open l_cursor for',
'',
'select s.id ORIGEN_ID, s.siglas ORIGEN',
'from sgt_sitios s ',
'where s.id in (SELECT column_value ',
'        FROM apex_string.split_numbers(:P402_SITIOS, '','')',
');',
'',
'APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''data'', l_cursor); -- Convierte el cursor a JSON array',
'    APEX_JSON.CLOSE_OBJECT;',
'',
'    end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>85693682171725747628
);
wwv_flow_imp.component_end;
end;
/
