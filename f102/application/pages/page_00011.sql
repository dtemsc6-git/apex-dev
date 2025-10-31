prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'SGT_LST_RACKS'
,p_alias=>'SGT-LST-RACKS'
,p_step_title=>'Lista de racks'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200718425156760803898)
,p_plug_name=>'SGT_LST_RACKS'
,p_title=>'Lista Racks'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SGT_RACKS.ID,',
'        ',
'  ''<a class="fa fa-search" title="Ver rack">Ver</a>''  ACCIONES , ',
'',
'',
'       sitios.siglas ||''-''|| salas.siglas SALA, ',
'       SGT_RACKS.NOMBRE NOMBRE,',
'       DETALLE,',
'       UNIDAD_ENCARGADA,',
'       MARCA,',
'       MODELO,',
'       DIMENSIONES,',
'       ALTURA_U',
'  from SGT_RACKS',
'inner join SGT_SALAS salas',
'on SGT_RACKS.SALA_ID = salas.ID',
'inner join SGT_SITIOS sitios',
'on sitios.ID = salas.SITIO_ID',
'',
'ORDER BY SGT_RACKS.ID DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'SGT_LST_RACKS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(200718425310079803898)
,p_name=>'SGT_LST_RACKS'
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
,p_detail_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:CR,12:P12_ID,P12_TITULO:\#ID#\,Editar rack'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_owner=>'MARCELO6297@GMAIL.COM'
,p_internal_uid=>79373491691321883607
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200718425923184803899)
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
 p_id=>wwv_flow_imp.id(524352746364937)
,p_db_column_name=>'ACCIONES'
,p_display_order=>10
,p_column_identifier=>'Y'
,p_column_label=>'Acciones'
,p_column_link=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.::P37_RACK_ID:#ID#'
,p_column_linktext=>'<img src="#APEX_FILES#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_link_attr=>'#ID#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202816056521467564097)
,p_db_column_name=>'NOMBRE'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Nombre'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42592132913308121695)
,p_db_column_name=>'DETALLE'
,p_display_order=>30
,p_column_identifier=>'V'
,p_column_label=>'Detalle'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42592133953183121706)
,p_db_column_name=>'MODELO'
,p_display_order=>40
,p_column_identifier=>'R'
,p_column_label=>'Modelo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42592133896964121705)
,p_db_column_name=>'MARCA'
,p_display_order=>50
,p_column_identifier=>'S'
,p_column_label=>'Marca'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42592133750258121704)
,p_db_column_name=>'DIMENSIONES'
,p_display_order=>60
,p_column_identifier=>'T'
,p_column_label=>'Dimensiones'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42592133683631121703)
,p_db_column_name=>'ALTURA_U'
,p_display_order=>70
,p_column_identifier=>'U'
,p_column_label=>'Altura U'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42592132796531121694)
,p_db_column_name=>'SALA'
,p_display_order=>80
,p_column_identifier=>'W'
,p_column_label=>'Sala'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29962991712991667711)
,p_db_column_name=>'UNIDAD_ENCARGADA'
,p_display_order=>90
,p_column_identifier=>'X'
,p_column_label=>'Unidad Encargada'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(200718435566294805001)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'793735020'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ACCIONES:UNIDAD_ENCARGADA:SALA:NOMBRE:ALTURA_U:MARCA:DETALLE:MODELO:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200718430501477803903)
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
 p_id=>wwv_flow_imp.id(200718428897839803902)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(200718425156760803898)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_TITULO:Agregar rack'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(200718429163784803902)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(200718425156760803898)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(200718429676247803902)
,p_event_id=>wwv_flow_imp.id(200718429163784803902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(200718425156760803898)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
