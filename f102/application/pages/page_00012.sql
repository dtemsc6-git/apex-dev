prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'SGT_FORM_RACKS'
,p_alias=>'SGT-FORM-RACKS'
,p_step_title=>'Formulario Racks'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(57024536698229459190)
,p_css_file_urls=>'#APP_FILES#racks.css'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200718415171211803890)
,p_plug_name=>'SGT_RACKS_FORM'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_query_type=>'TABLE'
,p_query_table=>'SGT_RACKS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29962991380543667707)
,p_plug_name=>'Tabs'
,p_title=>'Seleccione'
,p_parent_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'Y',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29962991573714667709)
,p_plug_name=>'Datos'
,p_parent_plug_id=>wwv_flow_imp.id(29962991380543667707)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29962991639128667710)
,p_plug_name=>'Equipos'
,p_parent_plug_id=>wwv_flow_imp.id(29962991380543667707)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_css_classes=>'racks'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(29962990744487667701)
,p_name=>'VISTA_FRONT'
,p_title=>'Vista Frontal Rack'
,p_parent_plug_id=>wwv_flow_imp.id(29962991639128667710)
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Pisos(posicion_u) AS (',
'  SELECT 1 FROM dual',
'  UNION ALL',
'  SELECT posicion_u + 1 FROM Pisos',
'  WHERE posicion_u + 1 <= (',
'    SELECT altura_u FROM sgt_Racks WHERE id=:P12_ID',
'  )',
')',
'',
'SELECT ',
'  ''U''||p.posicion_u as "U", ',
'  CASE ',
'    WHEN EXISTS (',
'      SELECT 1 FROM sgt_Equipos e',
'      WHERE e.rack_id = :P12_ID',
'        AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'        AND e.posicion = ''Front''',
'    ) THEN ',
'      ''<span class="u-ocupada u-clickable">''|| ',
'      (SELECT e.nombre FROM sgt_Equipos e',
'       WHERE e.rack_id = :P12_ID',
'         AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'         AND e.posicion = ''Front''',
'       AND ROWNUM = 1) ||''</span>''',
'    ELSE',
'      ''<span class="u-libre u-clickable" data-ua="''|| p.posicion_u ||''">Seleccionar Aqui</span>''',
'  END AS Equipo',
'FROM Pisos p',
'ORDER BY p.posicion_u DESC;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P12_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>60
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51494079330282384801)
,p_query_column_id=>1
,p_column_alias=>'U'
,p_column_display_sequence=>10
,p_column_heading=>'U'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51494079451723384802)
,p_query_column_id=>2
,p_column_alias=>'EQUIPO'
,p_column_display_sequence=>20
,p_column_heading=>'Equipo'
,p_heading_alignment=>'LEFT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(51494079562800384803)
,p_name=>'VISTA_BACK'
,p_title=>'Vista Posterior Rack'
,p_parent_plug_id=>wwv_flow_imp.id(29962991639128667710)
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_css_classes=>'back'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Pisos(posicion_u) AS (',
'  SELECT 1 FROM dual',
'  UNION ALL',
'  SELECT posicion_u + 1 FROM Pisos',
'  WHERE posicion_u + 1 <= (',
'    SELECT altura_u FROM sgt_Racks WHERE id=:P12_ID',
'  )',
')',
'',
'SELECT ',
'  ''U''||p.posicion_u as "U", ',
'  CASE ',
'    WHEN EXISTS (',
'      SELECT 1 FROM sgt_Equipos e',
'      WHERE e.rack_id = :P12_ID',
'        AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'        AND e.posicion = ''Back''',
'    ) THEN ',
'      ''<span class="u-ocupada u-clickable">''|| ',
'      (SELECT e.nombre FROM sgt_Equipos e',
'       WHERE e.rack_id = :P12_ID',
'         AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'         AND e.posicion = ''Back''',
'       AND ROWNUM = 1) ||''</span>''',
'    ELSE',
'      ''<span class="u-libre u-clickable" data-ua="''|| p.posicion_u ||''">Seleccionar Aqui</span>''',
'  END AS Equipo',
'FROM Pisos p',
'ORDER BY p.posicion_u DESC;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>60
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51494079675743384804)
,p_query_column_id=>1
,p_column_alias=>'U'
,p_column_display_sequence=>10
,p_column_heading=>'U'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51494079786979384805)
,p_query_column_id=>2
,p_column_alias=>'EQUIPO'
,p_column_display_sequence=>20
,p_column_heading=>'Equipo'
,p_heading_alignment=>'LEFT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64554407306447252531)
,p_plug_name=>'Datos'
,p_parent_plug_id=>wwv_flow_imp.id(29962991639128667710)
,p_region_css_classes=>'u-libre'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'Rack: &P12_NOMBRE.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200718420389393803894)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200718420787408803895)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(200718420389393803894)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200718422174543803896)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(200718420389393803894)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'DELETE'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200718422529026803896)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(200718420389393803894)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_APLICAR_CAMBIOS!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200718422949256803896)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(200718420389393803894)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(51494083588785384843)
,p_branch_name=>'LISTADO'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42592132186274121688)
,p_name=>'P12_ALTURA_U'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Cantidad de U'
,p_placeholder=>unistr('Ingrese aqu\00ED la cantidad de U del rack')
,p_source=>'ALTURA_U'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42592132305097121689)
,p_name=>'P12_DIMENCIONES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Dimenciones'
,p_source=>'DIMENSIONES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42592132425381121690)
,p_name=>'P12_MARCA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Marca'
,p_source=>'MARCA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(117089387609062048098)
,p_name=>'P12_TITULO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(117089387709215048099)
,p_name=>'P12_SITIO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(117089387813610048100)
,p_name=>'P12_CIUDAD'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(117089387865272048101)
,p_name=>'P12_DEPARTAMENTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200718415492251803890)
,p_name=>'P12_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200718415849596803891)
,p_name=>'P12_UNIDAD_ENCARGADA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Unidad Encargada'
,p_source=>'UNIDAD_ENCARGADA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_named_lov=>'LOV_UNI_ENCAR'
,p_lov=>'.'||wwv_flow_imp.id(200719442741094818409)||'.'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200718417514962803892)
,p_name=>'P12_MODELO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Modelo'
,p_source=>'MODELO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200718417851159803892)
,p_name=>'P12_DETALLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Detalle'
,p_source=>'DETALLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202816056687892564098)
,p_name=>'P12_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Nombre'
,p_source=>'NOMBRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202816057904285564109)
,p_name=>'P12_SALA_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(29962991573714667709)
,p_item_source_plug_id=>wwv_flow_imp.id(200718415171211803890)
,p_prompt=>'Sala'
,p_source=>'SALA_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SALAS.NOMBRE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SGT_SITIOS.SIGLAS || ''.''|| SGT_SALAS.SIGLAS AS MOSTRAR , SGT_SALAS.ID AS CLAVE',
'FROM SGT_SALAS INNER JOIN',
'SGT_SITIOS ON SGT_SALAS.SITIO_ID = SGT_SITIOS.ID'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P12_SITIO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(117089387499476048097)
,p_name=>unistr('Actualizar titulo de p\00E1gina')
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(117089387382893048096)
,p_event_id=>wwv_flow_imp.id(117089387499476048097)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {',
'',
'apex.util.getTopApex().jQuery(".t-Body-title").dialog("option", "title", "&P12_TITULO.");',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51494081790371384825)
,p_name=>'CHECK_NOMBRE'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_NOMBRE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51494081881580384826)
,p_event_id=>wwv_flow_imp.id(51494081790371384825)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("CHECK_RACK_DUPLICADO", {',
'    pageItems: "#P12_ID,#P12_NOMBRE,#P12_SALA_ID",',
'    loadingIndicator: "#P12_NOMBRE",  // opcional: puedes asociar el spinner a este campo',
'    showWait: true',
'}, {',
'    success: function(pData) {',
'        apex.message.clearErrors();',
'    },',
'    error: function(pData) {',
'        if (pData.responseJSON.error) {',
'            apex.message.showErrors([',
'                {',
'                    type: "error",',
'                    location: ["inline"],',
'                    pageItem: "P12_NOMBRE",',
'                    message: pData.responseJSON.error,',
'                    unsafe: false',
'                }',
'            ]);',
'            let $campo = $("#P12_NOMBRE");',
'            $campo.addClass("apex-page-item-error");',
'',
'        }',
'    }',
'});'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(200718423742843803897)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(200718415171211803890)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form SGT_RACKS_FORM'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>79373490124085883606
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(200718424184193803897)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_internal_uid=>79373490565435883606
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(200718423400314803897)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(200718415171211803890)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SGT_RACKS_FORM'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>79373489781556883606
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51494081674121384824)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_RACK_DUPLICADO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_count NUMBER;',
'    v_sugerencias  VARCHAR2(1000);',
'    v_id number;',
'BEGIN',
'    IF :P12_ID IS NULL OR TRIM(:P12_ID) = '''' THEN',
'      v_id := NULL;',
'   ELSE',
'      v_id := TO_NUMBER(:P12_ID);',
'   END IF;  ',
'',
'    SELECT COUNT(*)',
'      INTO v_count',
'      FROM SGT_RACKS',
'     WHERE NOMBRE = UPPER(:P12_NOMBRE)',
'       AND SALA_ID = :P12_SALA_ID',
'       AND (v_id IS NULL OR ID != v_id); ',
'       ',
'    IF v_count > 0 THEN',
'        -- Devuelve un mensaje de error al cliente (en JSON)',
'        -- Sugerencias: buscar racks similares del mismo sitio',
'        APEX_JSON.OPEN_OBJECT;',
'        APEX_JSON.WRITE(''success'', false);',
'        APEX_JSON.WRITE(''error_code'', ''ORA-00001'');',
'        APEX_JSON.WRITE(''error'', ''Ya existe un rack con ese nombre en la sala seleccionada.'');',
'        APEX_JSON.CLOSE_OBJECT;',
'',
'',
'',
'    ELSE',
'        APEX_JSON.OPEN_OBJECT;',
'        APEX_JSON.WRITE(''success'', ''OK'');',
'        APEX_JSON.CLOSE_OBJECT;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>51494081674121384824
);
wwv_flow_imp.component_end;
end;
/
