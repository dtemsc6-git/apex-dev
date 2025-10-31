prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
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
 p_id=>30
,p_name=>'SGT_FROM_INTERFACES'
,p_alias=>'SGT-FROM-INTERFACES'
,p_page_mode=>'MODAL'
,p_step_title=>'Agregar / Editar'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(57024536698229459190)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43191653727341446998)
,p_plug_name=>'SGT_FROM_INTERFACES'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SGT_INTERFACES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64554407550391252533)
,p_plug_name=>'EN_USO'
,p_title=>unistr('Atenci\00F3n')
,p_parent_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_region_css_classes=>'warning'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>unistr('Esta interfaz esta en uso, modificar los datos podr\00EDa afectar: Servicios / Enlaces / Otros.-')
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_id_interfaz CONSTANT sgt_interfaces.id%TYPE := :P30_ID;',
'   v_existe NUMBER;',
'BEGIN',
'   -- Consulta combinada',
'   BEGIN',
'      SELECT 1 INTO v_existe',
'      FROM dual',
'      WHERE EXISTS (',
'         SELECT 1 FROM sgt_enlaces_logicos',
'         WHERE interfaz_a_id = v_id_interfaz OR interfaz_b_id = v_id_interfaz',
'      ) OR EXISTS (',
'         SELECT 1 FROM sgt_enlaces_tramos',
'         WHERE interfaz_a_id = v_id_interfaz OR interfaz_b_id = v_id_interfaz',
'      );',
'      ',
'      RETURN TRUE; -- Existe en alguna tabla',
'   EXCEPTION',
'      WHEN NO_DATA_FOUND THEN',
'         RETURN FALSE; -- No existe en ninguna tabla',
'   END;',
'END;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43191667442169447013)
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
 p_id=>wwv_flow_imp.id(43191667812177447013)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(43191667442169447013)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(43191669240405447015)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(43191667442169447013)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'&APP_TEXT$BTN_BORRAR!RAW.'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P30_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(43191669653579447015)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(43191667442169447013)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_APLICAR_CAMBIOS!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P30_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(43191670112430447015)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(43191667442169447013)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P30_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42101940047736121412)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(43191667442169447013)
,p_button_name=>'VARIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR_VARIOS!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P30_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191654077773446999)
,p_name=>'P30_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191654893734447001)
,p_name=>'P30_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Nombre'
,p_source=>'NOMBRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Ingrese nombre, puede agregar rangos ejemplo: ',
'ge/[0-2]/[0-3]/[0-10] para crear varios Items.',
unistr('La cantidad maxima de items por creaci\00F3n esta limitada a 100 registros. ')))
,p_inline_help_text=>'Ingrese nombre, puede agregar rangos[1-30] para crear varios items '
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191655271762447001)
,p_name=>'P30_ETIQUETA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Etiqueta'
,p_source=>'ETIQUETA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Ingrese etiqueta, puede agregar rangos ejemplo: ',
'ge/[0-2]/[0-3]/[0-10] para crear varios Items.',
unistr('La cantidad maxima de items por creaci\00F3n esta limitada a 100 registros. ')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191655605756447002)
,p_name=>'P30_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_default=>'up'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'INTERFAZ_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(43199625631148317953)||'.'
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
 p_id=>wwv_flow_imp.id(43191656020797447002)
,p_name=>'P30_MODO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_default=>'access'
,p_prompt=>'Modo'
,p_source=>'MODO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'INTERFACE_MODO'
,p_lov=>'.'||wwv_flow_imp.id(43201033517964343837)||'.'
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
 p_id=>wwv_flow_imp.id(43191656485241447002)
,p_name=>'P30_DUPLEX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_default=>'auto'
,p_prompt=>'Duplex'
,p_source=>'DUPLEX'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'INTERFACE_DUPLEX'
,p_lov=>'.'||wwv_flow_imp.id(43201969178408363692)||'.'
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
 p_id=>wwv_flow_imp.id(43191657228678447003)
,p_name=>'P30_TX_EN_DBM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_default=>'0'
,p_prompt=>'Tx En Dbm'
,p_source=>'TX_EN_DBM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
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
 p_id=>wwv_flow_imp.id(43191657680538447004)
,p_name=>'P30_RX_EN_DBM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_default=>'0'
,p_prompt=>'Rx En Dbm'
,p_source=>'RX_EN_DBM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
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
 p_id=>wwv_flow_imp.id(43191658080249447004)
,p_name=>'P30_MAC_ADDRESS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Mac Address'
,p_source=>'MAC_ADDRESS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
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
 p_id=>wwv_flow_imp.id(43191658415147447005)
,p_name=>'P30_NUMERO_SERIE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Numero Serie'
,p_source=>'NUMERO_SERIE'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191658800781447005)
,p_name=>'P30_HW_VERSION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Hw Version'
,p_source=>'HW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(43191659331577447006)
,p_name=>'P30_SW_VERSION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Sw Version'
,p_source=>'SW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(43191659610484447006)
,p_name=>'P30_CREADO_EL'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_source=>'CREADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191660455438447008)
,p_name=>'P30_ACTUALIZADO_EL'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_source=>'ACTUALIZADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191661245158447008)
,p_name=>'P30_ACTUALIZADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_source=>'ACTUALIZADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43191661646367447009)
,p_name=>'P30_CREADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_source=>'CREADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47902963828692091001)
,p_name=>'P30_EQUIPO_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Equipo'
,p_source=>'EQUIPO_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
,p_lov_cascade_parent_items=>'P30_SITIO'
,p_ajax_items_to_submit=>'P30_SITIO'
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
 p_id=>wwv_flow_imp.id(47902963934699091002)
,p_name=>'P30_TIPO_INTERFACE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_item_source_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Tipo Interface Id'
,p_source=>'TIPO_INTERFACE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_TIPO_INTERFAZ'
,p_lov_display_null=>'YES'
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
 p_id=>wwv_flow_imp.id(88034738700254770430)
,p_name=>'P30_SITIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(43191653727341446998)
,p_prompt=>'Sitio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SGT_SITIOS.SIGLAS'
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(43191660172644447007)
,p_validation_name=>'P30_CREADO_EL must be timestamp'
,p_validation_sequence=>140
,p_validation=>'P30_CREADO_EL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(43191659610484447006)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(43191660982229447008)
,p_validation_name=>'P30_ACTUALIZADO_EL must be timestamp'
,p_validation_sequence=>150
,p_validation=>'P30_ACTUALIZADO_EL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(43191660455438447008)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(43191667993711447013)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(43191667812177447013)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(43191668723764447014)
,p_event_id=>wwv_flow_imp.id(43191667993711447013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42101939500166121407)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AgregarVarios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_input VARCHAR2(100) := :P30_NOMBRE; ',
'  v_prefix VARCHAR2(10);',
'  v_start_num NUMBER;',
'  v_end_num NUMBER;',
'  v_count NUMBER := 0;',
'  ',
'BEGIN',
'  --Desea eliminar el registro?',
'  IF :REQUEST = ''DELETE'' THEN',
'    APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := ''El usuario presiono DELETE''; ',
'    delete from sgt_interfaces where id = :P30_ID;',
'    return;',
'  else ',
'  --Chequear si quiere actualizar',
'  if :P30_ID is not null then',
'    SELECT COUNT(*) INTO v_count ',
'    FROM sgt_interfaces ',
'    WHERE id = :P30_ID;',
'    ',
'    IF v_count = 0 THEN',
'        RAISE_APPLICATION_ERROR(-20001, ''El registro no existe'');',
'    END IF;',
'     update sgt_interfaces set ',
'     equipo_id = :P30_EQUIPO_ID,',
'      nombre = :P30_NOMBRE, ',
'      etiqueta = :P30_ETIQUETA,',
'      estado = :P30_ESTADO,',
'      modo = :P30_MODO,',
'      duplex = :P30_DUPLEX,',
'      TIPO_INTERFACE_ID = :P30_TIPO_INTERFACE_ID,',
'      TX_EN_DBM = :P30_TX_EN_DBM,',
'      RX_EN_DBM = :P30_RX_EN_DBM,',
'      MAC_ADDRESS =:P30_MAC_ADDRESS,',
'      NUMERO_SERIE =:P30_NUMERO_SERIE,',
'      HW_VERSION = :P30_HW_VERSION,',
'      SW_VERSION = :P30_SW_VERSION',
'      where id = :P30_ID;',
'',
'    ',
'    APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := ''El usuario esta actualizando datos'';',
'   ',
'    return;',
'    end if; ',
'  end if;',
'',
unistr('  -- Extraer el prefijo (ge) y los n\00FAmeros del rango [0-10]'),
'  v_prefix := REGEXP_SUBSTR(v_input, ''^([^\[]+)'', 1, 1, '''', 1);',
'  v_start_num := TO_NUMBER(REGEXP_SUBSTR(v_input, ''\[(\d+)-(\d+)\]'', 1, 1, '''', 1));',
'  v_end_num := TO_NUMBER(REGEXP_SUBSTR(v_input, ''\[(\d+)-(\d+)\]'', 1, 1, '''', 2));',
'',
'  --Chequear un solo registro',
'',
'  IF v_prefix = v_input  THEN',
'',
'    INSERT INTO sgt_interfaces(',
'      equipo_id,',
'      nombre, ',
'      etiqueta,',
'      estado,',
'      modo,',
'      duplex,',
'      TIPO_INTERFACE_ID,',
'      TX_EN_DBM,',
'      RX_EN_DBM,',
'      MAC_ADDRESS,',
'      NUMERO_SERIE,',
'      HW_VERSION,',
'      SW_VERSION',
'      ) VALUES (',
'      ',
'      :P30_EQUIPO_ID,',
'      v_prefix,',
'      :P30_etiqueta ,',
'      :P30_estado,',
'      :P30_modo,',
'      :P30_duplex,',
'      :P30_TIPO_INTERFACE_ID,',
'      :P30_TX_EN_DBM,',
'      :P30_RX_EN_DBM,',
'      :P30_MAC_ADDRESS,',
'      :P30_NUMERO_SERIE,',
'      :P30_HW_VERSION,',
'      :P30_SW_VERSION',
'    );  ',
'  ELSE',
'      IF v_end_num - v_start_num + 1 > 48 THEN',
'        v_end_num := v_start_num + 47;',
unistr('        APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := ''Se ha limitado la creaci\00F3n a 48 registros'';'),
'      END IF;',
'      -- Generar los registros',
'      FOR i IN v_start_num..v_end_num LOOP',
'        INSERT INTO sgt_interfaces(',
'          equipo_id,',
'          nombre, ',
'          etiqueta,',
'          estado,',
'          modo,',
'          duplex,',
'          TIPO_INTERFACE_ID,',
'          TX_EN_DBM,',
'          RX_EN_DBM,',
'          MAC_ADDRESS,',
'          NUMERO_SERIE,',
'          HW_VERSION,',
'          SW_VERSION',
'          ) VALUES (',
'          ',
'          :P30_EQUIPO_ID,',
'          v_prefix || i,',
'          :P30_etiqueta ,',
'          :P30_estado,',
'          :P30_modo,',
'          :P30_duplex,',
'          :P30_TIPO_INTERFACE_ID,',
'          :P30_TX_EN_DBM,',
'          :P30_RX_EN_DBM,',
'          :P30_MAC_ADDRESS,',
'          :P30_NUMERO_SERIE,',
'          :P30_HW_VERSION,',
'          :P30_SW_VERSION',
'          ',
'        );',
'        ',
'        v_count := v_count + 1;',
'      END LOOP;',
'    END IF;  ',
'  ',
unistr('  -- Mensaje de \00E9xito'),
'  APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := ''Se han creado '' || v_count || '' registros correctamente'';',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE:= ''Error: '' || SQLERRM;',
'    RAISE;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE,VARIOS'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>42101939500166121407
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(43191670908989447016)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(43191653727341446998)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form SGT_FROM_INTERFACES'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al procesar :ROWS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(43191669240405447015)
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Se procesaron :ROWS'
,p_internal_uid=>43191670908989447016
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(43191671388602447016)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>43191671388602447016
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(43191670508660447015)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(43191653727341446998)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SGT_FROM_INTERFACES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>43191670508660447015
);
wwv_flow_imp.component_end;
end;
/
