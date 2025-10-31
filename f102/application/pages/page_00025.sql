prompt --application/pages/page_00025
begin
--   Manifest
--     PAGE: 00025
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
 p_id=>25
,p_name=>'SGT_LST_SITIOS'
,p_alias=>'SGT-LST-SITIOS'
,p_step_title=>'Lista de sitios'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(117115182778530411768)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(117115189733631411774)
,p_plug_name=>'SGT_SITIOS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID,',
'       SIGLAS,',
'       NOMBRE,',
'       TIPO_DE_SITIO,',
'       PROPIETARIO,',
'       ZONA_ID,',
'       CIUDAD_ID,',
'       LATITUD,',
'       LONGITUD,',
unistr('       "UBICACI\00D3N",'),
'       OBSERVACION,',
unistr('       "UBICACI\00D3N" AS LinkColumn'),
'FROM SGT_SITIOS',
'',
'ORDER BY ID DESC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'SGT_SITIOS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(117115189613560411774)
,p_name=>'SGT_SITIOS'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_search_button_label=>'Buscar'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_control_break=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_show_help=>'N'
,p_download_auth_scheme=>'!'||wwv_flow_imp.id(56800656436350124103)
,p_download_formats=>'CSV:XLSX'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:26:P26_ID,P26_TITULO:\#ID#\,Editar sitio'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_owner=>'MATIASLQ013'
,p_internal_uid=>6937190126632263843
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115188923475411772)
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
 p_id=>wwv_flow_imp.id(117115188506511411772)
,p_db_column_name=>'SIGLAS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Siglas'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115188076387411772)
,p_db_column_name=>'NOMBRE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115187704903411771)
,p_db_column_name=>'TIPO_DE_SITIO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Tipo De Sitio'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115187300817411771)
,p_db_column_name=>'PROPIETARIO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115186060932411770)
,p_db_column_name=>'LATITUD'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Latitud'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115185739415411770)
,p_db_column_name=>'LONGITUD'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Longitud'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115185285238411770)
,p_db_column_name=>unistr('UBICACI\00D3N')
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('Ubicaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117115184886436411769)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Observacion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117089389198614048114)
,p_db_column_name=>'ZONA_ID'
,p_display_order=>31
,p_column_identifier=>'L'
,p_column_label=>'Zona'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(16829957726745633025)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117089389114757048113)
,p_db_column_name=>'CIUDAD_ID'
,p_display_order=>41
,p_column_identifier=>'M'
,p_column_label=>'Ciudad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(117115199952560411783)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(117089388284175048105)
,p_db_column_name=>'LINKCOLUMN'
,p_display_order=>51
,p_column_identifier=>'O'
,p_column_label=>unistr('Ubicaci\00F3n')
,p_column_link=>unistr('#UBICACI\00D3N#')
,p_column_linktext=>'<span class="t-Icon fa fa-map-marker" style="display: block; text-align: center;"></span>'
,p_column_link_attr=>'target="_blank"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(117114554882370701082)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69378249'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ZONA_ID:CIUDAD_ID:TIPO_DE_SITIO:SIGLAS:NOMBRE:LINKCOLUMN:OBSERVACION:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(117115184376791411769)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(117115189733631411774)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:26:P26_TITULO:Agregar sitio'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(117115184116693411769)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(117115189733631411774)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(117115183562099411768)
,p_event_id=>wwv_flow_imp.id(117115184116693411769)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(117115189733631411774)
);
wwv_flow_imp.component_end;
end;
/
