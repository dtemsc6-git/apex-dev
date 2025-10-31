prompt --application/pages/page_00043
begin
--   Manifest
--     PAGE: 00043
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
 p_id=>43
,p_name=>'SGT_SERVICIOS_VIEW'
,p_alias=>'SGT-SERVICIOS-VIEW'
,p_step_title=>'Vista de conexiones'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47197333908589019193)
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
 p_id=>wwv_flow_imp.id(47197334666193019195)
,p_plug_name=>'SGT_SERVICIOS_VIEW'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'  et.id tramo, ',
'  et.equipo_a_id equipo, ',
'  et.interfaz_a_id interfaz, ',
'  et.interfaz_b_id interfaz_b,',
'  et.equipo_b_id equipo_b,  ',
'  cs.servicio_id servicio,',
'  elt.enlace_logico_id enlace_logico, ',
'  et.enlace_id enlace_fo,',
'',
'  -- Extraer los dos IDs',
'  ',
'  SUBSTR(et.enlace_id, INSTR(et.enlace_id, '':'') + 1) AS enlace_1,',
'  SUBSTR(et.enlace_id ,1 , INSTR(et.enlace_id, '':'') -1 ) AS enlace_2,',
'  el.grupo_red Grupo_de_Red',
'',
'',
'FROM ',
'  sgt_enlaces_tramos et',
'left JOIN ',
'  sgt_conexiones_servicio cs ON cs.enlace_tramo_id = et.id',
'LEFT JOIN ',
'  sgt_enlace_logico_tramo elt ON elt.tramo_id = et.id',
'left join ',
'   sgt_enlaces_logicos el on el.id = elt.enlace_logico_id',
'ORDER BY tramo;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'SGT_SERVICIOS_VIEW'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(47197334745626019195)
,p_name=>'SGT_SERVICIOS_VIEW'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
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
,p_owner=>'DTEMSC6'
,p_internal_uid=>47197334745626019195
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026641633807173726)
,p_db_column_name=>'EQUIPO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Equipo A'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(16838483136411509974)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026641786394173727)
,p_db_column_name=>'INTERFAZ'
,p_display_order=>20
,p_column_identifier=>'D'
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
 p_id=>wwv_flow_imp.id(45026641857917173728)
,p_db_column_name=>'SERVICIO'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Servicio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(44132876898299381933)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026641914211173729)
,p_db_column_name=>'ENLACE_LOGICO'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Enlace Logico'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(47255876122802445010)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026642074284173730)
,p_db_column_name=>'TRAMO'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Tramo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026642486837173734)
,p_db_column_name=>'ENLACE_FO'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Enlace Fo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026642393809173733)
,p_db_column_name=>'ENLACE_2'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Enlace 2'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(43769668587515608859)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026642506101173735)
,p_db_column_name=>'ENLACE_1'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Enlace 1'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(43769668587515608859)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026642696464173736)
,p_db_column_name=>'GRUPO_DE_RED'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Grupo De Red'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026642793435173737)
,p_db_column_name=>'INTERFAZ_B'
,p_display_order=>110
,p_column_identifier=>'N'
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
 p_id=>wwv_flow_imp.id(45026642887965173738)
,p_db_column_name=>'EQUIPO_B'
,p_display_order=>120
,p_column_identifier=>'O'
,p_column_label=>'Equipo B'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(16838483136411509974)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(47197346531379019961)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'471973466'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERVICIO:EQUIPO:INTERFAZ:INTERFAZ_B:EQUIPO_B:ENLACE_LOGICO:GRUPO_DE_RED:ENLACE_1:ENLACE_2:'
);
wwv_flow_imp.component_end;
end;
/
