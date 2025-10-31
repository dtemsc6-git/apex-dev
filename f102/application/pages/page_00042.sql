prompt --application/pages/page_00042
begin
--   Manifest
--     PAGE: 00042
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
 p_id=>42
,p_name=>'FORM_CONEXIONES_ENLACES_WAN'
,p_alias=>'FORM-CONEXIONES-ENLACES-WAN'
,p_page_mode=>'MODAL'
,p_step_title=>'Asociar una WAN a las Conexiones'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(57024536698229459190)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function filtrarTramo() {',
'var filtro = $("#P42_FILTRAR_CONEXIONES").val();',
'    var filtroLower = filtro.toLowerCase();',
'    var opciones = document.querySelectorAll("#P42_TRAMO_ID_LEFT option");',
'',
'    opciones.forEach(function (opt) {',
'        if (opt.text.toLowerCase().includes(filtroLower)) {',
'            opt.style.display = "";   // mostrar',
'        } else {',
'            opt.style.display = "none"; // ocultar',
'        }',
'    });',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(84580388946476850180)
,p_plug_name=>'FORM_CONEXIONES_ENLACES_WAN'
,p_title=>'Asociar una WAN a sus conexiones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SGT_ENLACE_LOGICO_TRAMO'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(84580391303003850183)
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
 p_id=>wwv_flow_imp.id(84580391737963850184)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(84580391303003850183)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(84580393186338850185)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(84580391303003850183)
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
,p_button_condition=>'P42_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(84580393523434850186)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(84580391303003850183)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P42_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(84580393959820850186)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(84580391303003850183)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P42_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78443846026285367140)
,p_name=>'P42_FILTRAR_CONEXIONES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(84580388946476850180)
,p_prompt=>'Filtrar Conexiones'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>'Filtrar las conexiones que pertenecen a este enlace'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(84580389203200850180)
,p_name=>'P42_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(84580388946476850180)
,p_item_source_plug_id=>wwv_flow_imp.id(84580388946476850180)
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
 p_id=>wwv_flow_imp.id(84580389653506850181)
,p_name=>'P42_ENLACES_WAN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(84580388946476850180)
,p_item_source_plug_id=>wwv_flow_imp.id(84580388946476850180)
,p_prompt=>'Enlaces Wan'
,p_source=>'ENLACE_LOGICO_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'ENLACES_WAN'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(84580390068407850182)
,p_name=>'P42_TRAMO_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(84580388946476850180)
,p_prompt=>'Conexiones'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT tramo_id',
'FROM SGT_ENLACE_LOGICO_TRAMO',
'WHERE enlace_logico_id = :P42_ENLACE_LOGICO_ID'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Equipo_A ||'',''|| Interfaz_A || ''->''||equipo_b||'',''||interfaz_b NOMBRE, id VALOR',
'from v_tramos_nombres  ',
'',
'where',
'',
'sitio_a_id in (select sitio_a_id from SGT_ENLACES_WAN wan where wan.id = :P42_ENLACES_WAN)',
'',
'or ',
'',
'sitio_b_id in (select sitio_b_id from SGT_ENLACES_WAN wan where wan.id = :P42_ENLACES_WAN)',
'',
'and',
'',
unistr('lower(v_tramos_nombres.tipo_conexion) = ''f\00EDsica''')))
,p_lov_cascade_parent_items=>'P42_ENLACES_WAN'
,p_ajax_items_to_submit=>'P42_ENLACES_WAN'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>'Arrastre a la derecha las conexiones que pertenecen al enlace wan'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'ALL')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(84580391875241850184)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(84580391737963850184)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(84580392602767850185)
,p_event_id=>wwv_flow_imp.id(84580391875241850184)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(78443846101929367141)
,p_name=>'FiltrarDatos'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_FILTRAR_CONEXIONES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(78443846229777367142)
,p_event_id=>wwv_flow_imp.id(78443846101929367141)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'filtrarTramo();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(78443846476027367144)
,p_name=>'REFRESCAR_SOURCE'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ENLACES_WAN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(78443846505205367145)
,p_event_id=>wwv_flow_imp.id(78443846476027367144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TRAMO_ID'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT enlace_tramo_id',
'FROM SGT_CONEXIONES_ENLACE_WAN',
'WHERE enlace_wan_id = :P42_ENLACES_WAN'))
,p_attribute_07=>'P42_ENLACES_WAN'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(84580394767034850187)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(84580388946476850180)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form FORM_CONEXIONES_ENLACES_WAN'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_internal_uid=>84580394767034850187
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78443846387719367143)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GUARDAR_CONEXIONES_WAN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Deseo guardar las conexiones de mi enlace_wan en la tabla sgt_conexiones_enlaces_wan',
'',
unistr('Crear una transacci\00F3n, es necesario crear una transaccion en un proceso oracle apex?'),
'guardar enlace_wan_id',
'iterar el P42_TRAMO_ID del tipo shuttle y guardar cada uno de los enlace_wan_id seleccionados, en el orden que ',
'aparecen, el orden se asigna al campo secuencia, que debe incrementarse de 10 en 10.',
'*/',
'DECLARE',
'    l_seq    NUMBER := 10;',
'BEGIN',
'    -- Primero eliminar conexiones previas del enlace (si aplica)',
'    DELETE FROM sgt_conexiones_enlaces_wan',
'    WHERE enlace_wan_id = :P42_ENLACE_LOGICO_ID;',
'',
'    -- Insertar cada tramo en orden',
'    FOR rec IN (',
'        SELECT column_value AS tramo_id',
'        FROM TABLE(apex_string.split_numbers(:P42_TRAMO_ID, '':''))',
'        ORDER BY ROWNUM',
'    )',
'    LOOP',
'        INSERT INTO sgt_conexiones_enlaces_wan (',
'            enlace_wan_id,',
'            tramo_id,',
'            secuencia',
'        ) VALUES (',
'            :P42_ENLACE_LOGICO_ID;,',
'            rec.tramo_id,',
'            l_seq',
'        );',
'',
'        l_seq := l_seq + 10;',
'    END LOOP;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>78443846387719367143
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(84580395168069850187)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>84580395168069850187
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(84580394333256850186)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(84580388946476850180)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form FORM_CONEXIONES_ENLACES_WAN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>84580394333256850186
);
wwv_flow_imp.component_end;
end;
/
