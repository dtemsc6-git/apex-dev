prompt --application/pages/page_00053
begin
--   Manifest
--     PAGE: 00053
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
 p_id=>53
,p_name=>'Paso 3'
,p_alias=>'PASO-3'
,p_page_mode=>'MODAL'
,p_step_title=>'Seleccionar Enlaces WAN'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(151090755630571095682)
,p_plug_name=>'Wizard Progress'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_imp.id(67812692495749518409)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2010149141494510257
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(151090755729507095682)
,p_plug_name=>'Step 2'
,p_title=>unistr('Crear Enlace L\00F3gico')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(151090755799212095682)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(83278063267848577279)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(151090755799212095682)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(83278064071020577280)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(151090755799212095682)
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
 p_id=>wwv_flow_imp.id(83278063634502577280)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(151090755799212095682)
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
 p_id=>wwv_flow_imp.id(83278066946526577283)
,p_branch_name=>'Go To Page 52'
,p_branch_action=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(83278064071020577280)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(83278066501106577283)
,p_branch_name=>'Go To Page 51'
,p_branch_action=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(83278063634502577280)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(161721903557977944394)
,p_name=>'P53_ENLACES_WAN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(151090755729507095682)
,p_prompt=>'Enlaces Wan'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select enlace_id from SGT_ENLACES_WAN_SERVICIO',
'where servicio_id = :P50_ID'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct nombre, valor from (',
'',
'',
'SELECT ',
'    wan.nombre, WAN.ID VALOR',
'FROM ',
'  sgt_enlaces_wan wan inner join  sgt_sitios_enlace_wan sitios_wan on wan.id = sitios_wan.enlace_wan_id',
'',
'WHERE',
'    sitios_wan.sitio_id IN (',
'        SELECT column_value ',
'        FROM apex_string.split_numbers(:P51_SITIOS_TRANSITO, '','')',
'    )',
'order by sitios_wan.seq    ',
'',
')'))
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'ALL')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(161721903675591944395)
,p_name=>'P53_BUSCAR_ENLACES_WAN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(151090755729507095682)
,p_prompt=>'Buscar Enlaces Wan'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(83278064648751577281)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(83278063267848577279)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(83278065165649577281)
,p_event_id=>wwv_flow_imp.id(83278064648751577281)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(83278065598640577282)
,p_name=>'Filtrar'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P53_BUSCAR_ENLACES_WAN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(83278066098063577282)
,p_event_id=>wwv_flow_imp.id(83278065598640577282)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//function filtrarShuttle(filtro) {',
'  console.log("filtrar datos")',
'',
'  var filtro = $("#P53_BUSCAR_ENLACES_WAN").val();',
'  var filtroLower = filtro.toLowerCase();',
'  var opciones = document.querySelectorAll("#P53_ENLACES_WAN_LEFT option");',
'',
'  opciones.forEach(function(opt) {',
'    if (opt.text.toLowerCase().includes(filtroLower)) {',
'      opt.style.display = "";   // mostrar',
'    } else {',
'      opt.style.display = "none"; // ocultar',
'    }',
'  });',
'//}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(78443844906110367129)
,p_name=>'NoSubmit'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P53_BUSCAR_ENLACES_WAN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(78443845003772367130)
,p_event_id=>wwv_flow_imp.id(78443844906110367129)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("Key Press")',
'console.log(event);',
'',
'if (event.key === "Enter") {',
'    event.preventDefault(); // evita el submit',
'    return false;',
'}',
'',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
