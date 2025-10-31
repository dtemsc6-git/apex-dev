prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'SGT_ZONAS'
,p_alias=>'SGT-ZONAS'
,p_step_title=>'Lista de zonas'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202695219900998202492)
,p_plug_name=>'SGT_ZONAS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    A.ID,',
'    A.NOMBRE,',
'    B.NOMBRE AS DEPENDE_DE,',
'    A.DESCRIPCION',
'FROM ',
'    SGT_ZONAS A',
'left JOIN ',
'    SGT_ZONAS B',
'ON ',
'    A.PARENT_ID = B.ID',
'order by a.id;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'SGT_ZONAS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(202695220002993202492)
,p_name=>'SGT_ZONAS'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_search_button_label=>'Buscar'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,:P3_ID,P3_TITULO:\#ID#\,Editar zona'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MARCELO6297@GMAIL.COM'
,p_internal_uid=>81350286384235282201
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202695220792475202494)
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
 p_id=>wwv_flow_imp.id(202816057078789564102)
,p_db_column_name=>'NOMBRE'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202695222003006202495)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Descripcion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200746702200964948341)
,p_db_column_name=>'DEPENDE_DE'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Depende De'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(202695238783452204206)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'813503052'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:DESCRIPCION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202695224122600202497)
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
 p_id=>wwv_flow_imp.id(202695222612166202496)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(202695219900998202492)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:P3_TITULO:Agregar zona'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202695222897739202496)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(202695219900998202492)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202695223321410202496)
,p_event_id=>wwv_flow_imp.id(202695222897739202496)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(202695219900998202492)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
