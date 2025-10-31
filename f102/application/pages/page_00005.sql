prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'SGT_FORM_SALA'
,p_alias=>'SGT-FORM-SALA'
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
 p_id=>wwv_flow_imp.id(202814171380937557259)
,p_plug_name=>'SGT_FORM_SALA'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SGT_SALAS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202814175462450557263)
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
 p_id=>wwv_flow_imp.id(202814175875980557264)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(202814175462450557263)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(202814177305458557265)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(202814175462450557263)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(202814177712949557266)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(202814175462450557263)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_APLICAR_CAMBIOS!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(202814178048062557266)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(202814175462450557263)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42592132972568121696)
,p_name=>'P5_CIUDAD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_prompt=>'Ciudad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre, id from sgt_ciudad',
'where depto_id = :P5_DEPTO'))
,p_lov_cascade_parent_items=>'P5_DEPTO'
,p_ajax_items_to_submit=>'P5_DEPTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42592133042810121697)
,p_name=>'P5_DEPTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SGT_DPTO'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42592133185388121698)
,p_name=>'P5_SIGLAS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_item_source_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_prompt=>'Siglas'
,p_source=>'SIGLAS'
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
 p_id=>wwv_flow_imp.id(117089388196113048104)
,p_name=>'P5_TITULO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202814171673322557260)
,p_name=>'P5_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_item_source_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202814172035402557260)
,p_name=>'P5_SITIO_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_item_source_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_prompt=>'Sitio'
,p_source=>'SITIO_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre, id from sgt_sitios',
'where ciudad_id = :P5_CIudad'))
,p_lov_cascade_parent_items=>'P5_CIUDAD'
,p_ajax_items_to_submit=>'P5_CIUDAD'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202816056921894564101)
,p_name=>'P5_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_item_source_plug_id=>wwv_flow_imp.id(202814171380937557259)
,p_prompt=>'Nombre'
,p_source=>'NOMBRE'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202814175963374557264)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(202814175875980557264)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202814176721017557265)
,p_event_id=>wwv_flow_imp.id(202814175963374557264)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(117089388066924048103)
,p_name=>unistr('Actualizar t\00EDtulo de p\00E1gina')
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(117089387959597048102)
,p_event_id=>wwv_flow_imp.id(117089388066924048103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {',
'',
'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P5_TITULO.");',
'});'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202814178874182557266)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(202814171380937557259)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form SGT_FORM_SALA'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>81469245255424636975
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202814179247296557267)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>81469245628538636976
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202814178449552557266)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(202814171380937557259)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SGT_FORM_SALA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>81469244830794636975
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(109139832286416025016)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar editar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT s.CIUDAD_ID, c.DEPTO_ID',
'    INTO :P5_CIUDAD, :P5_DEPTO',
'    FROM SGT_SITIOS s',
'    JOIN SGT_CIUDAD c ON s.CIUDAD_ID = c.ID',
'    WHERE s.ID = :P5_SITIO_ID;',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'        :P5_CIUDAD := NULL;',
'        :P5_DEPTO := NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14912547453776650601
);
wwv_flow_imp.component_end;
end;
/
