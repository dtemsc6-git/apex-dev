prompt --application/pages/page_00402
begin
--   Manifest
--     PAGE: 00402
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
 p_id=>402
,p_name=>'Seleccionar los sitios'
,p_alias=>'SELECCIONAR-LOS-SITIOS'
,p_page_mode=>'MODAL'
,p_step_title=>'Seleccionar los sitios'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function filtrarShuttle() {',
'var filtro = $("#P402_FILTRAR_SITIOS").val();',
'    var filtroLower = filtro.toLowerCase();',
'    var opciones = document.querySelectorAll("#P402_SITIOS_LEFT option");',
'',
'    opciones.forEach(function (opt) {',
'        if (opt.text.toLowerCase().includes(filtroLower)) {',
'            opt.style.display = "";   // mostrar',
'        } else {',
'            opt.style.display = "none"; // ocultar',
'        }',
'    });',
'}'))
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85027395281953935786)
,p_plug_name=>'Wizard Progress'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_imp.id(85027390009745935778)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2010149141494510257
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85027395317197935786)
,p_plug_name=>'Seleccionar los sitios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85027395498502935786)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(85027396933146935788)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(85027395498502935786)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(85027397279918935788)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(85027395498502935786)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(85027397128322935788)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(85027395498502935786)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(85027399539429935790)
,p_branch_action=>'f?p=&APP_ID.:403:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(85027397279918935788)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(85027398867878935789)
,p_branch_action=>'f?p=&APP_ID.:401:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(85027397128322935788)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(85693680276711747609)
,p_name=>'P402_FILTRAR_SITIOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(85027395317197935786)
,p_prompt=>'Filtrar Sitios'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(85693680304662747610)
,p_name=>'P402_SITIOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(85027395317197935786)
,p_prompt=>'Sitios'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SITIO_ID FROM sgt_sitios_enlace_wan wan',
'where wan.enlace_wan_id = :P401_ID',
'',
'order by seq'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'SGT_SITIOS.SIGLAS'
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>'Arrastre a la derecha los sitios por donde pasa el enlace WAN a crear'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'ALL')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(85027397399173935788)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(85027396933146935788)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85027398154826935789)
,p_event_id=>wwv_flow_imp.id(85027397399173935788)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(85693680486970747611)
,p_name=>'NO_SUBMIT'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P402_FILTRAR_SITIOS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85693680595618747612)
,p_event_id=>wwv_flow_imp.id(85693680486970747611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'STOP_SUBMIT'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (event.key === "Enter") {',
'    filtrarShuttle();    ',
'    event.preventDefault();',
'    return false;',
'}',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(85693680627231747613)
,p_name=>'FILTRAR_SHUTTLE'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P402_FILTRAR_SITIOS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85693680777562747614)
,p_event_id=>wwv_flow_imp.id(85693680627231747613)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'filtrarShuttle();'
);
wwv_flow_imp.component_end;
end;
/
