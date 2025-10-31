prompt --application/pages/page_00039
begin
--   Manifest
--     PAGE: 00039
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
 p_id=>39
,p_name=>'SGT_LST_ENLACE_TRAMOS_FO'
,p_alias=>'SGT-LST-ENLACE-TRAMOS-FO'
,p_step_title=>'Conexiones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("dialogclose", function(event, ui) {',
unistr('    // Refrescar el Interactive Grid espec\00EDfico'),
'    //apex.region("SGT_LST_ENLACE_TRAMOS_FO").refresh();',
'    console.log("dialog log: " +ui);',
'    ',
'    // Alternativa si necesitas refrescar todos los IGs',
'    // apex.region.findByType("interactiveGrid").forEach(function(region){region.refresh();});',
'});'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44132896179006381953)
,p_plug_name=>'SGT_LST_ENLACE_TRAMOS_FO'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_query_type=>'TABLE'
,p_query_table=>'SGT_ENLACES_TRAMOS'
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'ID desc'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P39_FILTRO_FO'
,p_prn_page_header=>'SGT_LST_ENLACE_TRAMOS_FO'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(44132896267898381953)
,p_name=>'SGT_LST_ENLACE_TRAMOS_FO'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:40:&APP_SESSION.::&DEBUG.:RP:P40_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_owner=>'DTEMSC6'
,p_internal_uid=>44132896267898381953
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44132896935995381955)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44132897355922381955)
,p_db_column_name=>'NOMBRE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44132904230078381961)
,p_db_column_name=>'CREADO_POR'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Creado Por'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44132904673747381961)
,p_db_column_name=>'CREADO_EL'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Creado El'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44132905022422381961)
,p_db_column_name=>'ACTUALIZADO_POR'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Actualizado Por'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44132905498968381962)
,p_db_column_name=>'ACTUALIZADO_EL'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Actualizado El'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43996538505123508716)
,p_db_column_name=>'EQUIPO_A_ID'
,p_display_order=>62
,p_column_identifier=>'Z'
,p_column_label=>'Equipo A'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(99183333741246371784)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43996538624280508717)
,p_db_column_name=>'INTERFAZ_A_ID'
,p_display_order=>72
,p_column_identifier=>'AA'
,p_column_label=>'Interfaz A'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(43769671252068608862)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43996538886946508719)
,p_db_column_name=>'EQUIPO_B_ID'
,p_display_order=>92
,p_column_identifier=>'AC'
,p_column_label=>'Equipo B'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(99183333741246371784)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43996539099627508721)
,p_db_column_name=>'INTERFAZ_B_ID'
,p_display_order=>112
,p_column_identifier=>'AE'
,p_column_label=>'Interfaz B'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(43769671252068608862)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43996540596380508736)
,p_db_column_name=>'LADO_ID'
,p_display_order=>122
,p_column_identifier=>'AF'
,p_column_label=>'Lado'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(202814172118838557260)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026641341947173723)
,p_db_column_name=>'TIPO_CONEXION'
,p_display_order=>132
,p_column_identifier=>'AG'
,p_column_label=>'Tipo Conexion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026641469315173724)
,p_db_column_name=>'ENLACE_ID'
,p_display_order=>142
,p_column_identifier=>'AH'
,p_column_label=>'Enlace Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(44133070855555657934)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'441330709'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EQUIPO_A_ID:INTERFAZ_A_ID:EQUIPO_B_ID:INTERFAZ_B_ID:TIPO_CONEXION:ACTUALIZADO_EL:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44132907561958381963)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44132905930012381962)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(44132896179006381953)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&APP_SESSION.::&DEBUG.:40::'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(43996539188683508722)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(44132896179006381953)
,p_button_name=>'IMPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Importar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:::'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45026639103240173701)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(44132896179006381953)
,p_button_name=>'IG_Form'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR_VARIOS!RAW.'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45026640960269173719)
,p_name=>'P39_FILTRO_FO'
,p_item_sequence=>10
,p_prompt=>'Filtro Fo'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SGT_ENLACES_FO.NOMBRE'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
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
 p_id=>wwv_flow_imp.id(45026641005635173720)
,p_name=>'P39_FILTRO_SERVICIO'
,p_item_sequence=>20
,p_prompt=>'Filtro Servicio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SGT_SERVICIOS.NOMBRE'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44132906257220381962)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(44132896179006381953)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44132906783392381963)
,p_event_id=>wwv_flow_imp.id(44132906257220381962)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(44132896179006381953)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45026641174836173721)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_FILTRO_FO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45026641205532173722)
,p_event_id=>wwv_flow_imp.id(45026641174836173721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(44132896179006381953)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
