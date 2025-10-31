prompt --application/pages/page_00046
begin
--   Manifest
--     PAGE: 00046
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
 p_id=>46
,p_name=>unistr('Auditor\00EDa General del Sistema')
,p_alias=>unistr('AUDITOR\00CDA-GENERAL')
,p_step_title=>unistr('Auditor\00EDa General del Sistema')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59777350365839233351)
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
 p_id=>wwv_flow_imp.id(59777350912163233353)
,p_plug_name=>unistr('Auditor\00EDa General del Sistema')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    USUARIO,',
'    TIPO_OPERACION,',
'    FECHA,',
'    HORA,',
'    MODULO as SISTEMA,',
'    TABLA as ORIGEN, ',
'    CAMPO,',
'    CATEGORIA_CAMPO AS CATEGORIA,',
'    VALOR_ANTERIOR,',
'    VALOR_NUEVO,',
'    ID_REGISTRO,',
'    IP_ADDRESS,',
'    CASE ',
'        WHEN HORA BETWEEN ''00:00:00'' AND ''07:59:59'' THEN ''Nocturno''',
'        WHEN HORA BETWEEN ''08:00:00'' AND ''17:59:59'' THEN ''Laboral''',
'        ELSE ''Vespertino''',
'    END as TURNO,',
'    CASE ',
unistr('        WHEN TABLA IN (''USUARIOS'', ''ROLES'', ''PERMISOS'', ''SGT_USUARIOS'') THEN ''Cr\00EDtico'''),
'        WHEN TABLA LIKE ''%CONFIG%'' OR TABLA LIKE ''%PARAM%'' OR TABLA LIKE ''%CONFIGURACION%'' THEN ''Alto''',
unistr('        WHEN TIPO_OPERACION = ''DELETE'' OR TIPO_OPERACION = ''Eliminaci\00F3n'' THEN ''Alto'''),
'        ELSE ''Normal''',
'    END as NIVEL_CRITICIDAD,',
'    CASE ',
'        WHEN TRUNC(FECHA_HORA) = TRUNC(SYSDATE) THEN ''Hoy''',
'        WHEN TRUNC(FECHA_HORA) = TRUNC(SYSDATE - 1) THEN ''Ayer''',
'        WHEN TRUNC(FECHA_HORA) >= TRUNC(SYSDATE - 7) THEN ''Esta Semana''',
'        ELSE ''Anterior''',
'    END as PERIODO',
'FROM V_AUDIT_GENERAL',
'WHERE 1=1',
'    AND (:P46_FECHA_DESDE IS NULL OR ',
'         LENGTH(TRIM(:P46_FECHA_DESDE)) = 0 OR',
'         TRUNC(FECHA_HORA) >= TO_DATE(:P46_FECHA_DESDE, ''DD/MM/YYYY''))',
'    AND (:P46_FECHA_HASTA IS NULL OR ',
'         LENGTH(TRIM(:P46_FECHA_HASTA)) = 0 OR',
'         TRUNC(FECHA_HORA) <= TO_DATE(:P46_FECHA_HASTA, ''DD/MM/YYYY''))',
'    ',
'AND (:P46_USUARIO IS NULL OR ',
'     :P46_USUARIO = ''%'' OR ',
'     TRIM(:P46_USUARIO) = '''' OR',
'     UPPER(TRIM(USUARIO)) = UPPER(TRIM(:P46_USUARIO)))',
'    AND (:P46_TIPO_OPERACION IS NULL OR ',
'         :P46_TIPO_OPERACION = ''%'' OR ',
'         TIPO_OPERACION = :P46_TIPO_OPERACION)',
'    AND (:P46_MODULO IS NULL OR ',
'         :P46_MODULO = ''%'' OR ',
'         MODULO = :P46_MODULO)',
'         ',
'ORDER BY FECHA_HORA DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P46_FECHA_DESDE,P46_FECHA_HASTA,P46_USUARIO,P46_TIPO_OPERACION'
,p_prn_page_header=>unistr('Auditor\00EDa de Sitios')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(59777351057680233353)
,p_name=>unistr('Auditor\00EDa de Sitios')
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'PABLONUNEZ81'
,p_internal_uid=>59777351057680233353
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59781394261954353024)
,p_db_column_name=>'SISTEMA'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'V'
,p_column_label=>'Sistema'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59781394321113353025)
,p_db_column_name=>'ORIGEN'
,p_display_order=>20
,p_is_primary_key=>'Y'
,p_column_identifier=>'W'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59777353003906233356)
,p_db_column_name=>'FECHA'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59777353438990233357)
,p_db_column_name=>'HORA'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Hora'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59777352287590233355)
,p_db_column_name=>'USUARIO'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59777352687091233356)
,p_db_column_name=>'TIPO_OPERACION'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Tipo Operacion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59777353865646233357)
,p_db_column_name=>'CAMPO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Campo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(65484005105656582205)
,p_db_column_name=>'CATEGORIA'
,p_display_order=>80
,p_column_identifier=>'AA'
,p_column_label=>'Categoria'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59777354294456233357)
,p_db_column_name=>'VALOR_ANTERIOR'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Valor Anterior'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59777354625971233358)
,p_db_column_name=>'VALOR_NUEVO'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Valor Nuevo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59781393332916353015)
,p_db_column_name=>'IP_ADDRESS'
,p_display_order=>110
,p_column_identifier=>'O'
,p_column_label=>'Ip Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59781394126231353023)
,p_db_column_name=>'ID_REGISTRO'
,p_display_order=>120
,p_column_identifier=>'U'
,p_column_label=>'Id Registro'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(65484004831026582202)
,p_db_column_name=>'TURNO'
,p_display_order=>130
,p_column_identifier=>'X'
,p_column_label=>'Turno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(65484004944073582203)
,p_db_column_name=>'NIVEL_CRITICIDAD'
,p_display_order=>140
,p_column_identifier=>'Y'
,p_column_label=>'Nivel Criticidad'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(65484005010883582204)
,p_db_column_name=>'PERIODO'
,p_display_order=>150
,p_column_identifier=>'Z'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(59786800032218492269)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'597868001'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ORIGEN:SISTEMA:USUARIO:TIPO_OPERACION:FECHA:HORA:CAMPO:CATEGORIA:VALOR_ANTERIOR:VALOR_NUEVO:IP_ADDRESS:ID_REGISTRO:NIVEL_CRITICIDAD:PERIODO:TURNO:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59781391984076353001)
,p_plug_name=>'Filtros'
,p_title=>unistr('Filtros de b\00FAsquedas')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(59781392582636353007)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(59781391984076353001)
,p_button_name=>'BUSCAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59781392022898353002)
,p_name=>'P46_FECHA_DESDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(59781391984076353001)
,p_prompt=>'Fecha Desde'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59781392118414353003)
,p_name=>'P46_FECHA_HASTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(59781391984076353001)
,p_prompt=>'Fecha Hasta'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59781392237661353004)
,p_name=>'P46_USUARIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(59781391984076353001)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    USUARIO as display_value,',
'    USUARIO as return_value',
'FROM V_AUDIT_GENERAL',
'WHERE USUARIO IS NOT NULL',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'TODOS'
,p_lov_null_value=>'%'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59781392317117353005)
,p_name=>'P46_TIPO_OPERACION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(59781391984076353001)
,p_prompt=>'Tipo de Operacion'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    CASE TIPO_OPERACION',
unistr('        WHEN ''INSERT'' THEN ''Inserci\00F3n'''),
unistr('        WHEN ''UPDATE'' THEN ''Modificaci\00F3n''  '),
unistr('        WHEN ''DELETE'' THEN ''Eliminaci\00F3n'''),
unistr('        WHEN ''Creaci\00F3n'' THEN ''Creaci\00F3n'''),
unistr('        WHEN ''Modificaci\00F3n'' THEN ''Modificaci\00F3n'''),
unistr('        WHEN ''Eliminaci\00F3n'' THEN ''Eliminaci\00F3n'''),
'        ELSE TIPO_OPERACION',
'    END as display_value,',
'    TIPO_OPERACION as return_value',
'FROM V_AUDIT_GENERAL',
'WHERE TIPO_OPERACION IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'TODOS'
,p_lov_null_value=>'%'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59781393009019353012)
,p_name=>'P46_MODULO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(59781391984076353001)
,p_prompt=>unistr('M\00F3dulo del Sistema')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    MODULO as display_value,',
'    MODULO as return_value',
'FROM V_AUDIT_GENERAL',
'WHERE MODULO IS NOT NULL',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'TODOS'
,p_lov_null_value=>'%'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
