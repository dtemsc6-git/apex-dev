prompt --application/pages/page_00037
begin
--   Manifest
--     PAGE: 00037
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
 p_id=>37
,p_name=>'SGT_UBICAR_EQUIPO_RACK'
,p_alias=>'UBICAR-EQUIPO-RACK'
,p_page_mode=>'MODAL'
,p_step_title=>'Ubicar Equipo'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#racks#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51494083692716384844)
,p_plug_name=>'Contenido'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64554406512478252523)
,p_plug_name=>'Controles'
,p_parent_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64554407489940252532)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'racks'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64554407007841252528)
,p_plug_name=>'NombreRack'
,p_parent_plug_id=>wwv_flow_imp.id(64554407489940252532)
,p_region_css_classes=>'u-libre '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'Rack: &P37_RACK_NOMBRE.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(94299977311860057527)
,p_name=>'VISTA_FRONT'
,p_title=>'Vista Frontal Rack'
,p_parent_plug_id=>wwv_flow_imp.id(64554407489940252532)
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_css_classes=>'table-front'
,p_region_sub_css_classes=>'tabla-front'
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
'    SELECT altura_u FROM sgt_Racks WHERE id=:P37_RACK_ID',
'  )',
')',
'',
'SELECT ',
'  ''U''||p.posicion_u as "U", ',
'  CASE ',
'    WHEN EXISTS (',
'      SELECT 1 FROM sgt_Equipos e',
'      WHERE e.rack_id = :P37_RACK_ID',
'        AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'        AND e.posicion = ''Front''',
'    ) THEN ',
'      ''<span class="u-ocupada u-clickable">''|| ',
'      (SELECT e.nombre FROM sgt_Equipos e',
'       WHERE e.rack_id = :P37_RACK_ID',
'         AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'         AND e.posicion = ''Front''',
'       AND ROWNUM = 1) ||''</span>''',
'    ELSE',
'      ''<span class="u-libre u-clickable" data-ua="''|| p.posicion_u ||''">Seleccionar Aqui</span>''',
'  END AS Equipo',
'FROM Pisos p',
'ORDER BY p.posicion_u DESC;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P37_ID'
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
 p_id=>wwv_flow_imp.id(64554406041898252518)
,p_query_column_id=>1
,p_column_alias=>'U'
,p_column_display_sequence=>10
,p_column_heading=>'U'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(64554406142777252519)
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
 p_id=>wwv_flow_imp.id(115831090010031778407)
,p_name=>'VISTA_BACK'
,p_title=>'Vista Posterior Rack'
,p_parent_plug_id=>wwv_flow_imp.id(64554407489940252532)
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
'    SELECT altura_u FROM sgt_Racks WHERE id=:P37_RACK_ID',
'  )',
')',
'',
'SELECT ',
'  ''U''||p.posicion_u as "U", ',
'  CASE ',
'    WHEN EXISTS (',
'      SELECT 1 FROM sgt_Equipos e',
'      WHERE e.rack_id = :P37_RACK_ID',
'        AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'        AND e.posicion = ''Back''',
'    ) THEN ',
'      ''<span class="u-ocupada u-clickable">''|| ',
'      (SELECT e.nombre FROM sgt_Equipos e',
'       WHERE e.rack_id = :P37_RACK_ID',
'         AND p.posicion_u BETWEEN e.u AND (e.u + e.altura_u - 1)',
'         AND e.posicion = ''Back''',
'       AND ROWNUM = 1) ||''</span>''',
'    ELSE',
'      ''<span class="u-libre u-clickable" data-pos="''|| p.posicion_u ||''">Seleccionar Aqui</span>''',
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
 p_id=>wwv_flow_imp.id(64337010723613393608)
,p_query_column_id=>1
,p_column_alias=>'U'
,p_column_display_sequence=>10
,p_column_heading=>'U'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(64337011126394393609)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(64554406248135252520)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(64554406512478252523)
,p_button_name=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Limpiar Selecci\00F3n')
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(64554406625542252524)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(64554406512478252523)
,p_button_name=>'Asignar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Asignar'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51494084043959384848)
,p_name=>'P37_RACK_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64554404386239252501)
,p_name=>'P37_ALTURA_U'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64554404445112252502)
,p_name=>'P37_POSICION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64554404500312252503)
,p_name=>'P37_U'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64554406900422252527)
,p_name=>'P37_NOMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64554407150703252529)
,p_name=>'P37_RACK_NOMBRE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51494083692716384844)
,p_prompt=>'New'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64554404937528252507)
,p_name=>'AsignarU'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.u-clickable'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64554405021201252508)
,p_event_id=>wwv_flow_imp.id(64554404937528252507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'DMF: Chequear la altura en U de equipo a ubicar, verificar',
'que la u esta disponible y que la altura no coliciona con otras U Ocupadas.',
'',
'Obtener el punto donde se hizo click y preguntar el estado de los ',
'que estan abajo de ese punto ',
'',
'Determinar si esta en la vista frontal o back',
'',
'Proceso: ',
'Obtener el elemento donde se hace click.',
'Preguntar si las ubicaciones estan libres',
'iterar la tabla y chequear que todas las u necesarias estan disponibles',
'Si no se puede asignar alguna de las U notificar al usuario y normalizar la vista',
'Si pasa las validaciones asignar al equipo.',
'',
unistr('Validaci\00F3n:'),
unistr('Si ya se tiene una selecci\00F3n no se puede volver a seleccionar, se debe limpiar '),
'Examinar opciones para las ediciones:',
'   Al presionar Limpiar debe limpiar las U donde coinciden los nombres de los equipos o las ',
'   U que digan asignado.',
'',
'2 la u seleccionada + la altura del equipo no puede superar la altura del rack',
'2 Si alguna de las U estan en uso en el intervalo u seleccionada alturaU cancelar y notificar',
'3 Si pasa las validaciones asignar',
'',
'*/',
'',
'',
'let elementosModificados = [];',
'',
'console.log((this));',
'console.log(this.triggeringElement.getAttribute(''data-ua''));',
'',
'if (apex.item("P37_POSICION").getValue().length > 0 ){',
unistr('    alert("Presione el boton limpiar para realizar una nueva seleci\00F3n")'),
'    return false;',
'}',
'',
'',
'var alturaEquipo = Number(apex.item("P37_ALTURA_U").getValue());',
'',
'',
'// Preguntar si el elemento tiene la propiedad data-pos si tiene estamos en la vista posterior',
'var posicion = this.triggeringElement.hasAttribute(''data-pos'') ? "Back" : "Front";',
'',
'',
unistr('// elemento que dispar\00F3 el evento'),
'var $elem = $(this.triggeringElement);  ',
'var uSeleccionada = $elem.closest(''tr'').index();',
unistr('// Obtener la tabla m\00E1s cercana a ese elemento'),
'var $tabla = $elem.closest(''table'');',
'//',
'var alturaRack = $tabla.find(''tbody tr'').length;',
'// Iterar sobre las filas del tbody',
'console.log(''Altura rack: ''+alturaRack);',
'//var validacion = uSeleccionada + alturaEquipo-1',
'//console.log(''Validacion 1: ''+ (validacion));',
'/*if (alturaRack < validacion) {',
'    alert("Val1 No se puede seleccionar esa U");',
'    return false;',
'}',
'',
'var index = alturaRack - uSeleccionada - alturaEquipo + 1;',
'*/',
'//validar si la uSeleccionada - la alturaEquipo es menor a cero',
'if (uSeleccionada + 1 - alturaEquipo < 0) {',
'    alert("Val 1: No se puede seleccionar la U, no hay espacio")',
'    return false;',
'}',
'for (i=uSeleccionada; i>uSeleccionada-alturaEquipo; i-- ) {',
'    var $span = $tabla.find(''tbody tr'').eq(i).find(''td'').eq(1).find(''span'');',
'    var textoCol = $tabla.find(''tbody tr'').eq(i).find(''td'').eq(1).text().trim().toLowerCase();',
'    console.log(''Bucle for: ''+i+'',text: ''+textoCol);',
'    if (textoCol !== "seleccionar aqui") {',
'        alert("Val2 No se puede seleccionar esa U");',
'        elementosModificados.forEach((i) => {',
'            i.removeClass(''u-ocupada'').addClass(''u-libre'');',
'            i.text("Seleccionar Aqui");',
'        });',
'        return false;',
'    }',
'    else {',
'        $span.removeClass(''u-libre'').addClass(''u-ocupada'');',
'        $span.text("Asignado");',
'        //Guardar las U asignadas en caso de necesitar revertir',
'        elementosModificados.push ($span);',
'',
'    }',
'',
'} ',
'',
'//Asignar los datos',
'apex.item("P37_POSICION").setValue(posicion);',
'apex.item("P37_U").setValue(alturaRack - uSeleccionada);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64554406308481252521)
,p_name=>'LimpiarSeleccion'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(64554406248135252520)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64554406470562252522)
,p_event_id=>wwv_flow_imp.id(64554406308481252521)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'DMF: Obtener las tablas de la vista, iterar sobre ellas, limpiar los campos que tengan el texto',
'Asignado o que el nombre del equipo en minusculas coincidan.',
'*/',
'var equipo = apex.item(''P37_NOMBRE'').getValue().trim().toLowerCase();',
'var $spanOcupado = $(''.u-ocupada'');',
'',
'$spanOcupado.each(function (index) { ',
'       ',
'        var $span = $(this);',
'        var textoCol = $span.text().trim().toLowerCase();',
unistr('         console.log("LimpiarSelecci\00F3n: "+index+ ":"+equipo+":"+textoCol);  '),
'        if (textoCol === "asignado" || textoCol === equipo) {',
'            ',
'            $span.removeClass(''u-ocupada'').addClass(''u-libre'');',
'            $span.text("Seleccionar Aqui");',
'        }',
'        ',
'    ',
'});',
'',
'apex.item("P37_POSICION").setValue("");',
'apex.item("P37_U").setValue("");'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64554406738635252525)
,p_name=>'AceptarDatos'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(64554406625542252524)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64554406855189252526)
,p_event_id=>wwv_flow_imp.id(64554406738635252525)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P37_POSICION,P37_U'
,p_da_action_comment=>'Al presionar cierra el dialogo y devuelve la u y posicion como valores de salida'
);
wwv_flow_imp.component_end;
end;
/
