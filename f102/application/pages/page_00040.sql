prompt --application/pages/page_00040
begin
--   Manifest
--     PAGE: 00040
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
 p_id=>40
,p_name=>'SGT_FORM_ENLACE_TRAMOS_FO'
,p_alias=>'SGT-FORM-ENLACE-TRAMOS-FO'
,p_page_mode=>'MODAL'
,p_step_title=>'Agregar / Editar'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(57024536698229459190)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44132874885000381930)
,p_plug_name=>'SGT_FORM_ENLACE_TRAMOS_FO'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SGT_ENLACES_TRAMOS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44132891399256381948)
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
 p_id=>wwv_flow_imp.id(44132891748000381949)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(44132891399256381948)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44132893197866381950)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(44132891399256381948)
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
,p_button_condition=>'P40_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44132893545448381951)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(44132891399256381948)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_APLICAR_CAMBIOS!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P40_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44132893953198381951)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(44132891399256381948)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P40_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(43996539201494508723)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(44132891399256381948)
,p_button_name=>'ADD_MORE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR_VARIOS!RAW.'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43996541522596508746)
,p_name=>'P40_LADO_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Sitio'
,p_source=>'LADO_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SGT_SITIOS.SIGLAS'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P40_ENLACE_ID'
,p_ajax_items_to_submit=>'P40_ENLACE_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(44132875186652381930)
,p_name=>'P40_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44132875523738381931)
,p_name=>'P40_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Nombre'
,p_placeholder=>'Ingrese un nombre '
,p_source=>'NOMBRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Puede ser la etiqueta del cable de interconexi\00F3n (Patchcord)')
,p_inline_help_text=>unistr('Nombre del cable de interconexi\00F3n, o etiqueta, ej: patchcord 01 ')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44132875952974381932)
,p_name=>'P40_ENLACE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Enlace'
,p_source=>'ENLACE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_named_lov=>'SGT_ENLACES_FO.NOMBRE'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
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
 p_id=>wwv_flow_imp.id(44132878793821381935)
,p_name=>'P40_EQUIPO_A_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Equipo A'
,p_source=>'EQUIPO_A_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.nombre Mostrar, e.id Valor from SGT_EQUIPOS e',
'left join sgt_racks r on e.rack_id = r.id',
'left join sgt_salas s on r.sala_id = s.id',
'left join sgt_sitios ss on s.sitio_id = ss.id',
'WHERE :P40_LADO_ID IS NULL OR ss.id = :P40_LADO_ID;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P40_LADO_ID'
,p_ajax_items_to_submit=>'P40_LADO_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(44132879561937381936)
,p_name=>'P40_INTERFAZ_A_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Interfaz A'
,p_source=>'INTERFAZ_A_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NOMBRE, ID FROM SGT_INTERFACES I',
'WHERE I.EQUIPO_ID =:P40_EQUIPO_A_ID;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P40_EQUIPO_A_ID'
,p_ajax_items_to_submit=>'P40_EQUIPO_A_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(44132881474022381939)
,p_name=>'P40_EQUIPO_B_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Equipo B'
,p_source=>'EQUIPO_B_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.nombre Mostrar, e.id Valor from SGT_EQUIPOS e',
'left join sgt_racks r on e.rack_id = r.id',
'left join sgt_salas s on r.sala_id = s.id',
'left join sgt_sitios ss on s.sitio_id = ss.id',
'WHERE :P40_LADO_ID IS NULL OR ss.id = :P40_LADO_ID;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P40_LADO_ID'
,p_ajax_items_to_submit=>'P40_LADO_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(44132882269933381940)
,p_name=>'P40_INTERFAZ_B_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Interfaz B'
,p_source=>'INTERFAZ_B_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NOMBRE, ID FROM SGT_INTERFACES I',
'WHERE I.EQUIPO_ID =:P40_EQUIPO_b_ID;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P40_EQUIPO_B_ID'
,p_ajax_items_to_submit=>'P40_EQUIPO_B_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(47902965850753091021)
,p_name=>'P40_CREADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Creado Por'
,p_source=>'CREADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902965983999091022)
,p_name=>'P40_CREADO_EL'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Creado El'
,p_source=>'CREADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902966094603091023)
,p_name=>'P40_ACTUALIZADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Actualizado Por'
,p_source=>'ACTUALIZADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902966151414091024)
,p_name=>'P40_ACTUALIZADO_EL'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Actualizado El'
,p_source=>'ACTUALIZADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902966207580091025)
,p_name=>'P40_TIPO_CONEXION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_item_source_plug_id=>wwv_flow_imp.id(44132874885000381930)
,p_prompt=>'Tipo Conexion'
,p_source=>'TIPO_CONEXION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:F\00EDsica;F\00EDsica,L\00F3gica;L\00F3gica')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44132891851353381949)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44132891748000381949)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44132892601919381950)
,p_event_id=>wwv_flow_imp.id(44132891851353381949)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(47902966369244091026)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P40_TIPO_CONEXION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(47902966457820091027)
,p_event_id=>wwv_flow_imp.id(47902966369244091026)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P40_ENLACE_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44132894680571381951)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(44132874885000381930)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form SGT_FORM_ENLACE_TRAMOS_FO'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>44132894680571381951
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44132895177657381952)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>44132895177657381952
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44132894381459381951)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(44132874885000381930)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SGT_FORM_ENLACE_TRAMOS_FO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>44132894381459381951
);
wwv_flow_imp.component_end;
end;
/
