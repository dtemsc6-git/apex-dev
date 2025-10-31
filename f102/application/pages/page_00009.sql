prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'TEST_LST_SITIOS'
,p_alias=>'TEST-LST-SITIOS'
,p_step_title=>'Sitios '
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200703024599635282553)
,p_plug_name=>'SGT_LST_SITIO'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SGT_SITIOS.ID,',
'       SIGLAS,',
'       SGT_SITIOS.NOMBRE,',
'       TIPO_DE_SITIO,',
'       PROPIETARIO,',
'       SGT_ZONAS.NOMBRE AS ZONA,',
'       CIUDAD,',
'       DEPARTAMENTO,',
'       LATITUD,',
'       LONGITUD,',
unistr('       "UBICACI\00D3N"'),
'  from SGT_SITIOS ',
'  inner join SGT_ZONAS',
'  on SGT_SITIOS.zona_id = SGT_ZONAS.ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_required_role=>'!'||wwv_flow_imp.id(56800656436350124103)
,p_prn_page_header=>'SGT_LST_SITIO_2'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(200703024709424282553)
,p_name=>'SGT_LST_SITIO_2'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:RP:P10_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>'!'||wwv_flow_imp.id(56800656436350124103)
,p_owner=>'MARCELO6297@GMAIL.COM'
,p_internal_uid=>79358091090666362262
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703025418703282555)
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
 p_id=>wwv_flow_imp.id(200703026920586282556)
,p_db_column_name=>'PROPIETARIO'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_security_scheme=>'!'||wwv_flow_imp.id(56800656436350124103)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202805178375477474192)
,p_db_column_name=>'ZONA'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>'Zona'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703025796646282555)
,p_db_column_name=>'SIGLAS'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Siglas'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202816057280074564104)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'N'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703026577297282556)
,p_db_column_name=>'TIPO_DE_SITIO'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Tipo De Sitio'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703027785136282556)
,p_db_column_name=>'CIUDAD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Ciudad'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703028129717282557)
,p_db_column_name=>'DEPARTAMENTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703028521399282557)
,p_db_column_name=>'LATITUD'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Latitud'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703028919412282557)
,p_db_column_name=>'LONGITUD'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Longitud'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200703029412619282558)
,p_db_column_name=>unistr('UBICACI\00D3N')
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Ubicaci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(200703039013293284524)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'793581054'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('ID:SIGLAS:TIPO_DE_SITIO:PROPIETARIO:CIUDAD:DEPARTAMENTO:LATITUD:LONGITUD:UBICACI\00D3N')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200703031444959282559)
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
 p_id=>wwv_flow_imp.id(200703029869715282558)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(200703024599635282553)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:10::'
,p_security_scheme=>wwv_flow_imp.id(197180567855224446399)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(200703030145379282558)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(200703024599635282553)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(200703030689543282559)
,p_event_id=>wwv_flow_imp.id(200703030145379282558)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(200703024599635282553)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
