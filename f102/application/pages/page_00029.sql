prompt --application/pages/page_00029
begin
--   Manifest
--     PAGE: 00029
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
 p_id=>29
,p_name=>'equipos_interface_dl'
,p_alias=>'EQUIPOS-INTERFACE-DL'
,p_page_mode=>'MODAL'
,p_step_title=>'Interfaces En Uso / Libres'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#racks#MIN#.css'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(56843702980053272617)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2362165470276205)
,p_plug_name=>'New'
,p_region_css_classes=>'racks'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>25
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2361763298276201)
,p_name=>'INTERFACES_LIBRES'
,p_title=>'Interfaces libres'
,p_parent_plug_id=>wwv_flow_imp.id(2362165470276205)
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_sub_css_classes=>'tabla-front'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT nombre AS interfaz, etiqueta, ''<span class="u-libre">LIBRE</span>'' AS estado  ',
'FROM sgt_interfaces',
'WHERE equipo_id = :P29_EQUIPO',
'AND id NOT IN (',
'    SELECT interfaz_a_id FROM sgt_enlaces_tramos WHERE equipo_a_id = :P29_EQUIPO',
'    UNION',
'    SELECT interfaz_b_id FROM sgt_enlaces_tramos WHERE equipo_b_id = :P29_EQUIPO',
')',
'',
'ORDER BY interfaz;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>30
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2361930635276202)
,p_query_column_id=>1
,p_column_alias=>'INTERFAZ'
,p_column_display_sequence=>10
,p_column_heading=>'Interfaz'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2362012456276203)
,p_query_column_id=>2
,p_column_alias=>'ETIQUETA'
,p_column_display_sequence=>20
,p_column_heading=>'Etiqueta'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2362103977276204)
,p_query_column_id=>3
,p_column_alias=>'ESTADO'
,p_column_display_sequence=>30
,p_column_heading=>'Estado'
,p_heading_alignment=>'LEFT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(47902966756636091030)
,p_name=>'INTERFACES_USADAS'
,p_title=>'Interfaces en uso'
,p_parent_plug_id=>wwv_flow_imp.id(2362165470276205)
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'table-front'
,p_region_sub_css_classes=>'tabla-front'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT nombre interfaz, etiqueta, ''<a><span class="u-ocupada">''||''EN USO''||''</span></a>'' estado',
'FROM sgt_interfaces i',
'WHERE i.id IN (',
'    SELECT interfaz_a_id FROM sgt_enlaces_tramos WHERE equipo_a_id = :P29_EQUIPO',
'    UNION ',
'    SELECT interfaz_b_id FROM sgt_enlaces_tramos WHERE equipo_b_id = :P29_EQUIPO',
')',
'',
'/*',
'UNION ALL',
'',
'SELECT nombre AS interfaz, etiqueta, ''<span class="u-libre> LIBRE </span>'' AS estado  ',
'FROM sgt_interfaces',
'WHERE equipo_id = :P29_EQUIPO',
'AND id NOT IN (',
'    SELECT interfaz_a_id FROM sgt_enlaces_tramos WHERE equipo_a_id = :P29_EQUIPO',
'    UNION',
'    SELECT interfaz_b_id FROM sgt_enlaces_tramos WHERE equipo_b_id = :P29_EQUIPO',
')',
'*/',
'ORDER BY interfaz;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>30
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(47902967175091091034)
,p_query_column_id=>1
,p_column_alias=>'INTERFAZ'
,p_column_display_sequence=>10
,p_column_heading=>'Interfaz'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2361724664276200)
,p_query_column_id=>2
,p_column_alias=>'ETIQUETA'
,p_column_display_sequence=>20
,p_column_heading=>'Etiqueta'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(47902967570337091038)
,p_query_column_id=>3
,p_column_alias=>'ESTADO'
,p_column_display_sequence=>30
,p_column_heading=>'Estado'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47902966692630091029)
,p_plug_name=>'TABBS'
,p_title=>'OPCIONES'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47902967355520091036)
,p_plug_name=>'CARGAR_DATOS'
,p_title=>'Cargar datos'
,p_parent_plug_id=>wwv_flow_imp.id(47902966692630091029)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32677704196844831939)
,p_plug_name=>'DATA_SOURCE'
,p_parent_plug_id=>wwv_flow_imp.id(47902967355520091036)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32677704298710831940)
,p_plug_name=>'UPLOAD_FILE'
,p_parent_plug_id=>wwv_flow_imp.id(32677704196844831939)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P29_FILE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32677704882678831946)
,p_plug_name=>'LOADED_FILE'
,p_parent_plug_id=>wwv_flow_imp.id(32677704196844831939)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P29_FILE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(32677704377819831941)
,p_name=>'Preview'
,p_parent_plug_id=>wwv_flow_imp.id(47902967355520091036)
,p_template=>4072358936313175081
,p_display_sequence=>25
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.line_number,',
'       p.col001, p.col002, p.col003, p.col004, p.col005, p.col006, p.col007, p.col008, p.col009, p.col010',
'       -- add more columns (col011 to col300) here.',
'  from apex_application_temp_files f, ',
'       table( apex_data_parser.parse(',
'                  p_content           => f.blob_content,',
'                  p_file_name         => f.filename,',
'                  p_xlsx_sheet_name   => case when :P29_XLSX_WORKSHEET is not null then :P29_XLSX_WORKSHEET end,',
'                  p_file_profile      => apex_data_loading.get_file_profile( p_static_id => ''dl_interfaces'' ),',
'                  p_max_rows          => 100 ) ) p',
' where f.name = :P29_FILE'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570196518809112)
,p_query_column_id=>1
,p_column_alias=>'LINE_NUMBER'
,p_column_display_sequence=>10
,p_column_heading=>'Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570240108809113)
,p_query_column_id=>2
,p_column_alias=>'COL001'
,p_column_display_sequence=>20
,p_column_heading=>'Col001'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570350053809114)
,p_query_column_id=>3
,p_column_alias=>'COL002'
,p_column_display_sequence=>30
,p_column_heading=>'Col002'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570402828809115)
,p_query_column_id=>4
,p_column_alias=>'COL003'
,p_column_display_sequence=>40
,p_column_heading=>'Col003'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570518041809116)
,p_query_column_id=>5
,p_column_alias=>'COL004'
,p_column_display_sequence=>50
,p_column_heading=>'Col004'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570604241809117)
,p_query_column_id=>6
,p_column_alias=>'COL005'
,p_column_display_sequence=>60
,p_column_heading=>'Col005'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570731303809118)
,p_query_column_id=>7
,p_column_alias=>'COL006'
,p_column_display_sequence=>70
,p_column_heading=>'Col006'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570873442809119)
,p_query_column_id=>8
,p_column_alias=>'COL007'
,p_column_display_sequence=>80
,p_column_heading=>'Col007'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618570938046809120)
,p_query_column_id=>9
,p_column_alias=>'COL008'
,p_column_display_sequence=>90
,p_column_heading=>'Col008'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618571030951809121)
,p_query_column_id=>10
,p_column_alias=>'COL009'
,p_column_display_sequence=>100
,p_column_heading=>'Col009'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(40618571113594809122)
,p_query_column_id=>11
,p_column_alias=>'COL010'
,p_column_display_sequence=>110
,p_column_heading=>'Col010'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(40618571311050809124)
,p_plug_name=>'BOTONES'
,p_parent_plug_id=>wwv_flow_imp.id(47902967355520091036)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P29_FILE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32677704092178831938)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(40618571311050809124)
,p_button_name=>'LIMPIAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Limpiar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32677703943795831937)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(40618571311050809124)
,p_button_name=>'CARGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42101939169215121403)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(40618571311050809124)
,p_button_name=>'Debug'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Debug'
,p_grid_new_row=>'Y'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(42101939237229121404)
,p_branch_name=>'VOLVER_EQUIPOS'
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32677703799508831935)
,p_name=>'P29_EQUIPO'
,p_item_sequence=>20
,p_prompt=>'Equipo'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'EQUIPOS.NOMBRE-COMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       SS.SIGLAS ||''.''|| S.SIGLAS ||''.''|| R.NOMBRE || ''.''|| E.NOMBRE MOSTRAR,',
'       E.ID VALOR        ',
'  from SGT_EQUIPOS E',
'  LEFT JOIN SGT_RACKS R ON E.RACK_ID = R.ID',
'  LEFT JOIN SGT_SALAS S ON R.SALA_ID = S.ID',
'  LEFT JOIN SGT_SITIOS SS ON S.SITIO_ID = SS.ID'))
,p_lov_display_null=>'YES'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(32677703872781831936)
,p_name=>'P29_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32677704298710831940)
,p_prompt=>'File'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'DROPZONE_BLOCK',
  'dropzone_description', 'Formatos admitidos [XLSX]',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32677704946649831947)
,p_name=>'P29_FILE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32677704882678831946)
,p_prompt=>'File Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32677705029181831948)
,p_name=>'P29_XLSX_WORKSHEET'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(32677704882678831946)
,p_prompt=>'Hoja XLSX'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.sheet_display_name,',
'       p.sheet_file_name',
'  from apex_application_temp_files f,',
'       table( apex_data_parser.get_xlsx_worksheets( p_content => f.blob_content ) ) p',
' where f.name = :P29_FILE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_sheet_count number;',
'begin',
'    select count(*)',
'      into l_sheet_count',
'      from apex_application_temp_files f,',
'           table( apex_data_parser.get_xlsx_worksheets( p_content => f.blob_content ) ) p',
'     where f.name = :P28_FILE;',
'    ',
'     -- display if the XSLX file contains multiple worksheets',
'    return ( l_sheet_count > 1 );',
'exception',
'    when others then ',
'        return false;',
'end;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(40618571517398809126)
,p_name=>'P29_TOTALES_FILAS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(47902967355520091036)
,p_prompt=>'Totales Filas'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42101939087200121402)
,p_name=>'P29_DEBUG_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(32677704882678831946)
,p_prompt=>'Debug Info'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(32677705126064831949)
,p_computation_sequence=>10
,p_computation_item=>'P29_FILE_NAME'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select filename',
'  from apex_application_temp_files ',
' where name = :P29_FILE'))
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(32677704524567831943)
,p_validation_name=>'isValidFile'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if apex_data_parser.assert_file_type(',
'       p_file_name => :P29_FILE_NAME,',
'       p_file_type => apex_data_parser.c_file_type_xlsx )',
'then',
'    return true;',
'else',
'    :P29_FILE := null;',
'    return false;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El Archivo no es valido!'
,p_associated_item=>wwv_flow_imp.id(32677703872781831936)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(32677704647760831944)
,p_name=>'UPLOAD_FILE'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P29_FILE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32677704768642831945)
,p_event_id=>wwv_flow_imp.id(32677704647760831944)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(40618571433463809125)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(32677704092178831938)
,p_internal_uid=>40618571433463809125
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42101938983257121401)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VerArchivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--DECLARE',
'--    v_file_exists NUMBER;',
'--    v_sheet_exists NUMBER;',
'--    v_row_count NUMBER;',
'--BEGIN',
'    -- 1. Verificar si el archivo existe',
'--    SELECT COUNT(*) INTO v_file_exists',
'--    FROM apex_application_temp_files',
'--    WHERE name = :P29_FILE;',
'    ',
'--    APEX_DEBUG.INFO(''Archivo encontrado: '' ||:29_FILE || v_file_exists);',
'    ',
'    -- 2. Verificar estructura del archivo',
'--    FOR c IN (',
'--        SELECT p.col_name, p.col_type, p.col_max_length',
'--        FROM apex_application_temp_files f, ',
'--             TABLE(apex_data_parser.get_columns(',
'--               p_content => f.blob_content,',
'--               p_file_name => f.filename,',
'--               p_xlsx_sheet_name => :P29_XLSX_WORKSHEET',
'--             )) p',
'--        WHERE f.name = :P29_FILE',
'--    ) LOOP',
'--        APEX_DEBUG.INFO(''Columna: '' || c.col_name || '' - Tipo: '' || c.col_type);',
'--    END LOOP;',
'    ',
'    -- 3. Contar filas reales',
'--    SELECT COUNT(*) INTO v_row_count',
'--    FROM apex_application_temp_files f, ',
'--         TABLE(apex_data_parser.parse(',
'--           p_content => f.blob_content,',
'--           p_file_name => f.filename,',
'--           p_xlsx_sheet_name => :P29_XLSX_WORKSHEET',
'--         )) p',
'--    WHERE f.name = :P29_FILE;',
'    ',
'--    APEX_DEBUG.INFO(''Filas encontradas: '' || v_row_count);',
'    ',
unistr('    -- Mostrar resultados en p\00E1gina'),
'--    :P29_DEBUG_INFO := ''Archivo: '' || v_file_exists || ''Nombre: '' || :P29_FILE ||',
'--                      '' | Filas: '' || v_row_count;',
'    ',
'--EXCEPTION',
'--    WHEN OTHERS THEN',
unistr('--        APEX_DEBUG.ERROR(''Error en diagn\00F3stico: '' || SQLERRM);'),
'--        :P29_DEBUG_INFO := ''Error: '' || SQLERRM;',
'--END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(42101939169215121403)
,p_internal_uid=>42101938983257121401
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(40618571239773809123)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarInterfaces'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'       ',
'    l_Masterqry CLOB;',
'    TYPE r_interface IS RECORD (',
'        NOMBRE VARCHAR2(4000),',
'        ETIQUETA VARCHAR2(4000),',
'        ESTADO VARCHAR2(4000),',
'        MODO VARCHAR2(4000),',
'        DUPLEX VARCHAR2(4000),',
'        SGT_TIPO_INTERFACE_ID VARCHAR2(4000),',
'        TX_EN_DBM VARCHAR2(4000),',
'        RX_EN_DBM VARCHAR2(4000),',
'        MAC_ADDRESS VARCHAR2(4000),',
'        HW_VERSION VARCHAR2(4000),',
'        SW_VERSION VARCHAR2(4000)',
'    );',
'    TYPE t_interfaces IS TABLE OF r_interface;',
'    TabOut t_interfaces;',
'    Refcursor SYS_REFCURSOR;',
'BEGIN',
'    -- Construir la consulta correctamente formada',
'    l_Masterqry := ',
'    ''with Parseo_Datos as (',
'       SELECT p.col001 AS NOMBRE,',
'              p.col002 AS ETIQUETA,',
'              p.col003 AS ESTADO, ',
'              p.col004 AS MODO, ',
'              p.col005 AS DUPLEX, ',
'              p.col006 AS SGT_TIPO_INTERFACE_ID, ',
'              p.col007 AS TX_EN_DBM, ',
'              p.col008 AS RX_EN_DBM,  ',
'              p.col009 AS MAC_ADDRESS, ',
'              p.col010 AS HW_VERSION, ',
'              p.col011 AS SW_VERSION  ',
'       FROM apex_application_temp_files f, ',
'            table(apex_data_parser.parse(',
'              p_content => f.blob_content, ',
'              p_file_name => f.filename,',
'              p_skip_rows => 1,',
'              p_xlsx_sheet_name => '''''' || :P29_XLSX_WORKSHEET ||''''''',
'            )) p ',
'       WHERE f.name = '''''' || :P29_FILE || '''''') select * from Parseo_Datos',
'      '';',
'    ',
unistr('    -- Depuraci\00F3n: ver la consulta generada'),
'    apex_debug.info(''Consulta ejecutada: '' || SUBSTR(l_Masterqry, 1, 4000));    ',
'    ',
'    -- Abrir cursor y cargar datos',
'    OPEN Refcursor FOR l_Masterqry;',
'    FETCH Refcursor BULK COLLECT INTO TabOut;',
'    CLOSE Refcursor;',
'',
'    apex_debug.info(''Consulta TabOut: '' || TabOut.COUNT);',
'    ',
'    -- Procesar los resultados',
'     forall indx in indices of TabOut',
'        insert into SGT_INTERFACES (SGT_EQUIPOS_ID, ',
'        NOMBRE, ',
'        ETIQUETA, ',
'        ESTADO, ',
'        MODO,',
'        DUPLEX, ',
'        SGT_TIPO_INTERFACE_ID ,',
'        TX_EN_DBM, ',
'        RX_EN_DBM,',
'        MAC_ADDRESS,',
'        HW_VERSION,',
'        SW_VERSION)',
'                values ',
'                (:P29_EQUIPO, ',
'                TabOut(indx).NOMBRE, ',
'                TabOut(indx).ETIQUETA, ',
'                TabOut(indx).ESTADO, ',
'                TabOut(indx).MODO, ',
'                TabOut(indx).DUPLEX, ',
'                TabOut(indx).SGT_TIPO_INTERFACE_ID, ',
'                TabOut(indx).TX_EN_DBM, ',
'				TabOut(indx).RX_EN_DBM, ',
'                TabOut(indx).MAC_ADDRESS, ',
'                TabOut(indx).HW_VERSION, ',
'                TabOut(indx).SW_VERSION);',
'',
'    --:P29_TOTALES_FILAS := TabOut.COUNT;',
'    ',
unistr('    --APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE(p_message => TabOut.COUNT || '' registros cargados correctamente asociados al \00EDtem '' || v_item_id);'),
'     :P29_FILE := NULL;',
'     :P29_FILE_NAME := NULL;',
'    ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        IF Refcursor%ISOPEN THEN',
'            apex_debug.error(''Se detecto un error: '' );',
'            CLOSE Refcursor;',
'        END IF;',
'          apex_debug.error(''Se detecto un error: '' || SQLERRM );',
'        --APEX_APPLICATION.G_PRINT_ERROR_MESSAGE(p_message => ''Error al procesar archivo: '' || SQLERRM);',
'        RAISE;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Se produjeron errores al procesar los datos'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(32677703943795831937)
,p_process_success_message=>'Proceso de cargar ejecutado, registros: &P29_TOTALES_FILAS.'
,p_internal_uid=>40618571239773809123
);
wwv_flow_imp.component_end;
end;
/
