prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_name=>'SGT_FORM_EQUIPO'
,p_alias=>'SGT-FORM-EQUIPO'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(57024536698229459190)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200805748090942280007)
,p_plug_name=>'SGT_FORM_EQUIPO'
,p_title=>'Agregar / Editar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SGT_EQUIPOS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51494082047219384828)
,p_plug_name=>'DATOS_LOG'
,p_parent_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Creado por: &P14_CREADO_POR. el: &P14_CREADO_EL. ',
'Actualizado por: &P14_ACTUALIZADO_POR. el: &P14_ACTUALIZADO_EL. '))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P14_CREADO_POR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200746701006186948329)
,p_plug_name=>'TABS'
,p_title=>'TABS'
,p_parent_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16831388701746382036)
,p_plug_name=>'ALIMENTACION'
,p_title=>unistr('Alimentaci\00F3n')
,p_parent_plug_id=>wwv_flow_imp.id(200746701006186948329)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51494081943826384827)
,p_plug_name=>'OBLIGATORIOS'
,p_title=>'Obligatorios'
,p_parent_plug_id=>wwv_flow_imp.id(200746701006186948329)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200746701046582948330)
,p_plug_name=>'UBICACION'
,p_title=>unistr('Ubicaci\00F3n')
,p_parent_plug_id=>wwv_flow_imp.id(200746701006186948329)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200746701216699948331)
,p_plug_name=>'DATOS_OPCIONALES'
,p_title=>'Datos opcionales'
,p_parent_plug_id=>wwv_flow_imp.id(200746701006186948329)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(200746701311080948332)
,p_plug_name=>'IMPLEMENTACION'
,p_title=>unistr('Implementaci\00F3n')
,p_parent_plug_id=>wwv_flow_imp.id(200746701006186948329)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(200746701330124948333)
,p_plug_name=>'HARDWARE-SOFTWARE'
,p_title=>'Hardware/Software'
,p_parent_plug_id=>wwv_flow_imp.id(200746701006186948329)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200746701500204948334)
,p_plug_name=>'SERIALES'
,p_title=>'Seriales'
,p_parent_plug_id=>wwv_flow_imp.id(200746701006186948329)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200805765095450280019)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16828915835062582981)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_button_name=>'Seleccionar_U'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Seleccionar U'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P14_RACK_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-ai-sparkle-zoom-in'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200805765475736280020)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(200805765095450280019)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200805766822522280021)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(200805765095450280019)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200805767257120280021)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(200805765095450280019)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_APLICAR_CAMBIOS!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(200805767658445280021)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(200805765095450280019)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16831387285978382021)
,p_name=>'P14_UNIDAD_ENCARGADA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
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
 p_id=>wwv_flow_imp.id(16831387483532382023)
,p_name=>'P14_TIPO_RED'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51494081943826384827)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Tipo Red'
,p_source=>'TIPO_RED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_RED'
,p_lov=>'.'||wwv_flow_imp.id(17291432086166556461)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccionar red a la que pertenece el equipo'
,p_inline_help_text=>'Seleccionar red a la que pertenece el equipo'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16831387621072382025)
,p_name=>'P14_SUB_TIPO_EQUIPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Sub Tipo Equipo'
,p_source=>'SUB_TIPO_EQUIPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SUB_TIPO_EQUIPO'
,p_lov=>'.'||wwv_flow_imp.id(17292525545179850352)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16831387723238382026)
,p_name=>'P14_OBSERVACIONES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Observaciones'
,p_source=>'OBSERVACIONES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16831387847633382027)
,p_name=>'P14_NI_ANDE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Ande NI'
,p_source=>'NI_ANDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_inline_help_text=>unistr('Ingrese el N\00FAmero de Inventario del equipo')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16831387900014382028)
,p_name=>'P14_SERIAL_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Serial Number'
,p_source=>'SERIAL_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(16831388022474382029)
,p_name=>'P14_VERSION_HARDWARE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Version Hardware'
,p_source=>'VERSION_HARDWARE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(16831388130932382030)
,p_name=>'P14_VERSION_SOFTWARE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Version Software'
,p_source=>'VERSION_SOFTWARE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(16831388208106382031)
,p_name=>'P14_VERSION_PATCH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Version Patch'
,p_source=>'VERSION_PATCH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(16831388613329382035)
,p_name=>'P14_FECHA_IMPLE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>unistr('Fecha Implementaci\00F3n')
,p_source=>'FECHA_IMPLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29962992738885667721)
,p_name=>'P14_TITULO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902964454304091007)
,p_name=>'P14_RACK_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51494081943826384827)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Rack'
,p_source=>'RACK_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SGT_RACKS_FILTRADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       S.SIGLAS||''-''||R.NOMBRE MOSTRAR,',
'       R.ID VALOR        ',
'  from SGT_RACKS R',
'  LEFT JOIN SGT_SALAS S ON R.SALA_ID = S.ID',
'  left join SGT_SITIOS SS ON S.SITIO_ID = SS.ID',
' where',
' SS.ID = :P14_SITIO_ID'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P14_SITIO_ID'
,p_ajax_items_to_submit=>'P14_SITIO_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902964597795091008)
,p_name=>'P14_TIPO_EQUIPO_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(51494081943826384827)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Tipo Equipo'
,p_source=>'TIPO_EQUIPO_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIPO_EQUIPOS'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902964616284091009)
,p_name=>'P14_ALIMENTACION1_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Alimentacion1 Id'
,p_source=>'ALIMENTACION1_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(47902964773957091010)
,p_name=>'P14_ALIMENTACION2_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Alimentacion2 Id'
,p_source=>'ALIMENTACION2_ID'
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
 p_id=>wwv_flow_imp.id(47902964819288091011)
,p_name=>'P14_PROYECTO_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Proyecto Id'
,p_source=>'PROYECTO_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(47902964945283091012)
,p_name=>'P14_ALTURA_U'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(51494081943826384827)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Altura U'
,p_placeholder=>'Ingrese la altura del equipo'
,p_source=>'ALTURA_U'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>'Indicar cantidad de Us que ocupa el equipo'
,p_inline_help_text=>'Indicar cantidad de Us que ocupa el equipo'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902965082170091013)
,p_name=>'P14_POSICION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_source=>'POSICION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902965103229091014)
,p_name=>'P14_SITIO_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51494081943826384827)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Sitio'
,p_source=>'SITIO_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SGT_SITIOS.SIGLAS'
,p_lov_display_null=>'YES'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51494082149985384829)
,p_name=>'P14_CREADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_source=>'CREADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51494082288771384830)
,p_name=>'P14_CREADO_EL'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_source=>'CREADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51494082306997384831)
,p_name=>'P14_ACTUALIZADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_source=>'ACTUALIZADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51494082480375384832)
,p_name=>'P14_ACTUALIZADO_EL'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_source=>'ACTUALIZADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200746700255292948322)
,p_name=>'P14_IP_GESTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_item_default=>'0.0.0.0'
,p_prompt=>'IP Gestion'
,p_format_mask=>'000.000.000.000'
,p_source=>'IP_GESTION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_security_scheme=>wwv_flow_imp.id(56843702980053272617)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200746701620681948336)
,p_name=>'P14_SALAS_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(200746701046582948330)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200805748333846280008)
,p_name=>'P14_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200805750785760280011)
,p_name=>'P14_U'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_source=>'U'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_inline_help_text=>'Indicar la U de inicio'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200805751955409280012)
,p_name=>'P14_MARCA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Marca'
,p_source=>'MARCA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(200805752370361280012)
,p_name=>'P14_MODELO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(200746701216699948331)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Modelo'
,p_source=>'MODELO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(200805752745290280012)
,p_name=>'P14_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(51494081943826384827)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ESTADO_EQUIPO'
,p_lov=>'.'||wwv_flow_imp.id(203663371051164540142)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202816058089264564111)
,p_name=>'P14_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(51494081943826384827)
,p_item_source_plug_id=>wwv_flow_imp.id(200805748090942280007)
,p_prompt=>'Nombre'
,p_placeholder=>'Ingrese ej: BG30 / L5230'
,p_source=>'NOMBRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<h6>NOMBRE \00DANICO PARA EL EQUIPO EN TODA LA RED. Abreviaciones:</h6>'),
'<p>',
'    <ul>',
'<li>PP: Patch panel. Ej.: PP1 </li>',
unistr('<li>DO: Distribuidor \00F3ptico. Ej.: DO1 </li>'),
unistr('<li>PWR: Fuente de alimentaci\00F3n, rectificador, UPS. Ej.: PWR</li>'),
unistr('<li>TBL: Tablero el\00E9ctrico / Tablero de TMs. Ej.: TBL01</li>'),
'<li>TVR: transceiver / conversor de FO</li>',
'<li>PDU</li>',
'<li>PROT: Patch panel protector de puertos</li>',
unistr('<li>BB: Banco de bater\00EDas</li>'),
'<li>48VCC Rectificador -48VCC SOCOMEC</li>',
'<li>110VCC Rectificador 110VCC correspondiente a GT/DPPM</li>',
'<li>UPS UPS correspondiente a ISC/MCO</li>',
'<li>12VCC Rectificador 12V/30A correspondiente</li>',
'<li>TBL_220VAC Tablero genera 220VAC es SC01</li>',
'    </ul>',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(200805765587854280020)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(200805765475736280020)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(200805766411310280021)
,p_event_id=>wwv_flow_imp.id(200805765587854280020)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(200746701817569948337)
,p_name=>'OnChangeProyectoId'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_PROYECTO_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(200746701861663948338)
,p_event_id=>wwv_flow_imp.id(200746701817569948337)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'SetFecha'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_FECHA_IMPLEMENTACION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select sysdate from dual;'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29962992883062667722)
,p_name=>'ActualizarTitulo'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29962992971020667723)
,p_event_id=>wwv_flow_imp.id(29962992883062667722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ActualizarTitulo'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {',
'',
'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P14_TITULO.");',
'',
'/*',
'*/ ',
'apex.jQuery(window).on(''apexafterclosedialog'', function(event, data){',
'  console.log(data);',
'  if(data && data.P37_U) {',
'    // Usa los valores devueltos: data.clienteId, data.nombre',
'    apex.item(''P14_U'').setValue(data.P37_U);',
'    apex.item(''P14_POSICION'').setValue(data.P37_POSICION);',
unistr('    // Aqu\00ED puedes actualizar otras regiones, invocar DAs, etc.'),
'  }',
'});',
'',
'',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51494083342959384841)
,p_name=>'Limpiar_Nombre_Marca'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_TIPO_EQUIPO_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51494083412315384842)
,p_event_id=>wwv_flow_imp.id(51494083342959384841)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_NOMBRE,P14_MARCA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51494082595657384833)
,p_name=>'Get_Nombre'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_TIPO_EQUIPO_ID,P14_MARCA,P14_RACK_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51494082674990384834)
,p_event_id=>wwv_flow_imp.id(51494082595657384833)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'BuscarNombre'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' $("#P14_NOMBRE").val("Generando nombre...");',
'apex.server.process("GET_NOMBRE_EQUIPO", {',
'    pageItems: "#P14_ID, #P14_RACK_ID, #P14_TIPO_EQUIPO_ID, #P14_MARCA",',
'    loadingIndicator: "#P14_TIPO_EQUIPO_ID",  // opcional: puedes asociar el spinner a este campo',
'    showWait: true',
'}, {',
'    success: function(data) {',
'        console.log(data);',
'        apex.item("P14_NOMBRE").setValue(data.nombre);',
'        apex.item("P14_SUB_TIPO_EQUIPO").setValue(data.sub_tipo_equipo);',
'    },',
'    error: function(pData) {        ',
'    console.log(pData);',
'        }',
'    }',
');'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64554404749330252505)
,p_name=>'OpenModal'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(16828915835062582981)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64554404840368252506)
,p_event_id=>wwv_flow_imp.id(64554404749330252505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GET_URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rackId = apex.item("P14_RACK_ID").getValue();',
'var rackNombre = apex.item("P14_RACK_ID").displayValueFor(rackId).toUpperCase();',
'apex.server.process(',
'    ''GET_URL'',',
'    { P37_RACK_ID: rackId,',
'      P37_RACK_NOMBRE: rackNombre,',
'      P37_ALTURA_U: apex.item("P14_ALTURA_U").getValue(), ',
'      P37_POSICION: apex.item("P14_POSICION").getValue(),',
'      P37_NOMBRE: apex.item("P14_NOMBRE").getValue(),',
'      P37_U: apex.item("P14_U").getValue(),',
'     },',
'    {',
'        success: function(pData) {',
'            ',
'            apex.navigation.dialog(',
'                pData.url,',
'                {',
'                    title: ''Seleccionar Rack'',',
'                    closeExisting: false',
'                }',
'                /*,''t-Dialog--standard'',',
'                function(dialog) {',
'                     console.log(dialog);',
'                     dialog.on(''dialogclose'',  function(event, data) {',
'                        if (data) {',
'                            console.log(data);',
'                            apex.item("P14_U").setValue(data.u);',
'                            apex.item("P14_POSICION").setValue(data.posicion);',
'                            apex.message.showPageSuccess("Datos Recibidos");',
'                        }',
'                     });',
'                }*/',
'            );',
'        }',
'    }',
');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(200805768516769280022)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(200805748090942280007)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form SGT_FORM_EQUIPO'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>79460834898011359731
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(200805768899070280022)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>79460835280312359731
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(200805768028222280022)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(200805748090942280007)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SGT_FORM_EQUIPO'
,p_internal_uid=>79460834409464359731
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51494082829904384836)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_NOMBRE_EQUIPO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'   Identificar si esta creando o editando ',
'   Si esta creando generar un nombre en base a los datos enviados,',
'',
'   Si esta editando, entonces el ID no es null, ',
'   si te y marca siguen siendo iguales que los datos en db, devolver el mismo nombre',
'   si cambio alguno de ellos generar un nuevo nombre',
'   */',
'  ',
'',
'DECLARE',
'    v_id             NUMBER;',
'    v_count          NUMBER;',
'    v_rack           VARCHAR2(255);',
'    v_te             VARCHAR2(255);',
'    v_ste            VARCHAR2(255);',
'    v_marca          VARCHAR2(255);',
'    v_nombre_original VARCHAR2(255);',
'    ',
'BEGIN',
unistr('    -- 1. Manejo m\00E1s eficiente de par\00E1metros'),
'    v_id := CASE WHEN TRIM(:P14_ID) IS NULL THEN NULL ELSE TO_NUMBER(:P14_ID) END;',
'    v_marca := CASE WHEN TRIM(:P14_MARCA) IS NULL THEN NULL ELSE :P14_MARCA END;',
'',
unistr('    -- 2. Validaci\00F3n de datos esenciales'),
'    IF :P14_TIPO_EQUIPO_ID IS NULL THEN',
'        RAISE_APPLICATION_ERROR(-20001, ''Tipo de equipo es requerido'');',
'    END IF;',
'    ',
unistr('    -- 3. Optimizaci\00F3n de consultas (single fetch)'),
'    SELECT siglas, grupo_equipo ',
'    INTO v_te, v_ste ',
'    FROM sgt_tipo_equipos ',
'    WHERE id = :P14_TIPO_EQUIPO_ID;',
'',
unistr('    -- 4. Modo Edici\00F3n'),
'    SELECT count(*) INTO v_count ',
'            FROM sgt_equipos',
'            WHERE RACK_ID = :P14_RACK_ID',
'            AND TIPO_EQUIPO_ID = :P14_TIPO_EQUIPO_ID',
'            AND (MARCA = v_marca OR (MARCA IS NULL AND v_marca IS NULL))',
'            AND ID = v_id;',
'',
'',
'',
'    IF v_id IS NOT NULL AND v_count = 1 THEN ',
'           select nombre into v_nombre_original FROM sgt_equipos WHERE id = v_id;              ',
'    ELSE',
unistr('    -- 5. Modo Creaci\00F3n'),
'       -- BEGIN',
'            SELECT nombre INTO v_rack ',
'            FROM sgt_racks ',
'            WHERE id = :P14_RACK_ID;',
'            ',
'            -- 6. Conteo seguro con manejo de nulos',
'            SELECT COUNT(*) INTO v_count',
'            FROM SGT_EQUIPOS',
'            WHERE RACK_ID = :P14_RACK_ID',
'            AND TIPO_EQUIPO_ID = :P14_TIPO_EQUIPO_ID',
'            AND (v_marca IS NULL OR MARCA = v_marca);',
'            ',
'            v_count := v_count + 1;',
'            ',
unistr('            -- 7. Construcci\00F3n de nombre optimizada'),
'            /*2025-10-18 CAMBIO ALGORITMO DE CREACION NOMBRE, SE ELIMINA EL RACK PORQUE AHORA SE ',
unistr('            MOSTRARA COMPLETO como concatenaci\00F3n sitio.sala.rack.nombre'),
'            v_rack || ''-'' || ',
'            */',
'            v_nombre_original := v_te || ',
'                CASE WHEN v_marca IS NOT NULL THEN ''-'' || v_marca END || ',
'                ''-'' || v_count;',
'    END IF ;',
'',
'    APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''success'', ''OK'');',
'    APEX_JSON.WRITE(''nombre'', v_nombre_original);',
'    APEX_JSON.WRITE(''sub_tipo_equipo'', v_ste);',
'            APEX_JSON.CLOSE_OBJECT;   ',
'',
'',
'                ',
'       /* EXCEPTION',
'            WHEN NO_DATA_FOUND THEN',
'                RAISE_APPLICATION_ERROR(-20002, ''Rack no encontrado'');',
'        END; */',
'    ',
'EXCEPTION',
'    -- 8. Manejo global de errores',
'    WHEN OTHERS THEN',
'        APEX_JSON.OPEN_OBJECT;',
'        APEX_JSON.WRITE(''success'', ''ERROR'');',
'        APEX_JSON.WRITE(''message'', ''Error: '' || SQLERRM);',
'        APEX_JSON.CLOSE_OBJECT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>51494082829904384836
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(64554404694807252504)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_URL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   l_url VARCHAR2(4000);',
'BEGIN',
'   l_url := apex_page.get_url (',
'      p_application => :APP_ID,',
'      p_page        => 37,',
'      p_items       => ''P37_RACK_ID,P37_RACK_NOMBRE,P37_ALTURA_U,P37_POSICION,P37_U,P37_NOMBRE'',',
'      p_values      => apex_string.join(',
'                          ',
'                          p_table => apex_t_varchar2(',
'                                        apex_json.get_varchar2(''P37_RACK_ID''),',
'                                        apex_json.get_varchar2(''P37_RACK_NOMBRE''),',
'                                        apex_json.get_varchar2(''P37_ALTURA_U''),',
'                                        apex_json.get_varchar2(''P37_POSICION''),',
'                                        apex_json.get_varchar2(''P37_U''),',
'                                        apex_json.get_varchar2(''P37_NOMBRE'')',
'                                     ),',
'                           p_sep   => '',''          ',
'                       )',
'   );',
'  ',
'   apex_json.open_object;',
'   apex_json.write(''success'', ''OK'');',
'   apex_json.write(''url'', l_url);                 ',
'   apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>64554404694807252504
);
wwv_flow_imp.component_end;
end;
/
