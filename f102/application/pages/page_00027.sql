prompt --application/pages/page_00027
begin
--   Manifest
--     PAGE: 00027
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
 p_id=>27
,p_name=>'SGT_FORM_ENLACES_FO'
,p_alias=>'SGT-FORM-ENLACES-FO'
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
 p_id=>wwv_flow_imp.id(42627026800682534082)
,p_plug_name=>'SGT_FORM_ENLACES_FO'
,p_title=>'Agregar  / Editar Enlace FO'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SGT_ENLACES_FO'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42101939354909121405)
,p_plug_name=>'DATOS_LOG'
,p_parent_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>260
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Creado por: &P27_CREADO_POR. el: &P27_CREADO_EL. ',
'Actualizado por: &P27_ACTUALIZADO_POR. el: &P27_ACTUALIZADO_EL. '))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P27_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51494080478475384812)
,p_plug_name=>'DETALLES_FORM'
,p_title=>'Detalles'
,p_parent_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>250
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51494080541081384813)
,p_plug_name=>'DATOS_ENLACES'
,p_title=>'Datos Enlace'
,p_parent_plug_id=>wwv_flow_imp.id(51494080478475384812)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(51494080630010384814)
,p_plug_name=>'DATOS_CABLE'
,p_title=>'Datos Cable'
,p_parent_plug_id=>wwv_flow_imp.id(51494080478475384812)
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
 p_id=>wwv_flow_imp.id(42627044675434534098)
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
 p_id=>wwv_flow_imp.id(42627045094364534098)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(42627044675434534098)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42627046453564534099)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(42627044675434534098)
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
,p_button_condition=>'P27_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42627046836565534100)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(42627044675434534098)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_APLICAR_CAMBIOS!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P27_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42627047204225534100)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(42627044675434534098)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&APP_TEXT$BTN_CREAR!RAW.'
,p_button_position=>'NEXT'
,p_button_condition=>'P27_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627027184544534083)
,p_name=>'P27_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
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
 p_id=>wwv_flow_imp.id(42627027578683534084)
,p_name=>'P27_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Nombre'
,p_placeholder=>'Ingrese un nombre de 255 char'
,p_source=>'NOMBRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_inline_help_text=>'El nombre debe ser unico y se recomienda el siguiente formato SITOA_SITIOB_CABLE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627027999555534084)
,p_name=>'P27_SITIO_ID_A'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Sitio Lado A'
,p_source=>'SITIO_ID_A'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_SITIOS_SF'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>'Seleccione el punto desde donde parte el enlace'
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
 p_id=>wwv_flow_imp.id(42627028315394534085)
,p_name=>'P27_EQUIPO_ID_A'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Equipo Lado A'
,p_source=>'EQUIPO_ID_A'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.nombre Mostrar, e.id Valor from SGT_EQUIPOS e',
'left join sgt_racks r on e.rack_id = r.id',
'left join sgt_salas s on r.sala_id = s.id',
'left join sgt_sitios ss on s.sitio_id = ss.id',
'where ss.id = :P27_SITIO_ID_A '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P27_SITIO_ID_A'
,p_ajax_items_to_submit=>'P27_SITIO_ID_A'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(42627028731386534085)
,p_name=>'P27_SITIO_ID_B'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Sitio Lado B'
,p_source=>'SITIO_ID_B'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_SITIOS_SF'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>'Seleccione el punto donde termina el enlace'
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
 p_id=>wwv_flow_imp.id(42627029119181534085)
,p_name=>'P27_EQUIPO_ID_B'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Equipo Lado B'
,p_source=>'EQUIPO_ID_B'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  e.nombre Mostrar, e.id Valor from SGT_EQUIPOS e',
'left join sgt_racks r on e.rack_id = r.id',
'left join sgt_salas s on r.sala_id = s.id',
'left join sgt_sitios ss on s.sitio_id = ss.id',
'where ss.id = :P27_SITIO_ID_B '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P27_SITIO_ID_B'
,p_ajax_items_to_submit=>'P27_EQUIPO_ID_B'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(42627029598368534086)
,p_name=>unistr('P27_CERTIFICACI\00D3N')
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>unistr('Certificaci\00F3n')
,p_source=>unistr('CERTIFICACI\00D3N')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627029970410534086)
,p_name=>'P27_UNIDAD_MEDIDA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Unidad Medida'
,p_source=>'UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:km;km,m;m,cm;cm'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>unistr('Seleccione la unidad de medida de la certificaci\00F3n')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627030377702534087)
,p_name=>'P27_ABS_LONGITUD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Abs Longitud'
,p_source=>'ABS_LONGITUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627030787237534087)
,p_name=>'P27_CANTIDAD_DE_PELOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Cantidad De Pelos'
,p_source=>'CANTIDAD_DE_PELOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '144',
  'min_value', '0',
  'number_alignment', 'left',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627031154851534087)
,p_name=>'P27_TIPO_DE_FO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Tipo De Fo'
,p_source=>'TIPO_DE_FO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_FO'
,p_lov=>'.'||wwv_flow_imp.id(16833235324014392556)||'.'
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
 p_id=>wwv_flow_imp.id(42627031560669534088)
,p_name=>'P27_TIPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Tipo'
,p_source=>'TIPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_ENLACE'
,p_lov=>'.'||wwv_flow_imp.id(43126193997789167292)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>unistr('Indica la funci\00F3n del enlace, debe cambiarse el nombre del campo.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627031981740534088)
,p_name=>'P27_LT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Lt'
,p_source=>'LT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_LT'
,p_lov=>'.'||wwv_flow_imp.id(43130638651458210618)||'.'
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
 p_id=>wwv_flow_imp.id(42627032334366534088)
,p_name=>'P27_CONECTOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Conector'
,p_source=>'CONECTOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_CONECTOR'
,p_lov=>'.'||wwv_flow_imp.id(16833195677697386387)||'.'
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
 p_id=>wwv_flow_imp.id(42627032711544534089)
,p_name=>'P27_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ESTADO_ENLACE_FO'
,p_lov=>'.'||wwv_flow_imp.id(52385217569870497397)||'.'
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
 p_id=>wwv_flow_imp.id(42627033199218534089)
,p_name=>'P27_COMENTARIOS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Comentarios'
,p_source=>'COMENTARIOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_MARKDOWN_EDITOR'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'syntax_highlighting', 'Y',
  'toolbar', 'SIMPLE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627033597283534089)
,p_name=>unistr('P27_PROYECTO_DE_IMPLEMENTACI\00D3N')
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>unistr('Proyecto De Implementaci\00F3n')
,p_source=>unistr('PROYECTO_DE_IMPLEMENTACI\00D3N')
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
 p_id=>wwv_flow_imp.id(42627033996855534090)
,p_name=>unistr('P27_FECHA_IMPLEMENTACI\00D3N')
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>unistr('Fecha Implementaci\00F3n')
,p_source=>unistr('FECHA_IMPLEMENTACI\00D3N')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(42627034740416534091)
,p_name=>'P27_UNIDAD_ENCARGADA_ACTUAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51494080541081384813)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Unidad Encargada Actual'
,p_source=>'UNIDAD_ENCARGADA_ACTUAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_named_lov=>'LOV_UNI_ENCAR'
,p_lov=>'.'||wwv_flow_imp.id(200719442741094818409)||'.'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(42627035196248534091)
,p_name=>'P27_CREADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_source=>'CREADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627035557240534091)
,p_name=>'P27_CREADO_EL'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_source=>'CREADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627036310740534092)
,p_name=>'P27_ACTUALIZADO_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_source=>'ACTUALIZADO_POR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42627036793428534093)
,p_name=>'P27_ACTUALIZADO_EL'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_source=>'ACTUALIZADO_EL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51494079829111384806)
,p_name=>'P27_TIPO_CABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Tipo Cable'
,p_source=>'TIPO_CABLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_CABLE'
,p_lov=>'.'||wwv_flow_imp.id(16824711784220248610)||'.'
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
 p_id=>wwv_flow_imp.id(51494079924446384807)
,p_name=>'P27_TIPO_TENDIDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51494080630010384814)
,p_item_source_plug_id=>wwv_flow_imp.id(42627026800682534082)
,p_prompt=>'Tipo Tendido'
,p_source=>'TIPO_TENDIDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC2:A\00E9reo;A\00E9reo,Subterr\00E1neo;Subterr\00E1neo,Mix;Mix')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(42627034496450534090)
,p_validation_name=>unistr('P27_FECHA_IMPLEMENTACI\00D3N must be timestamp')
,p_validation_sequence=>170
,p_validation=>unistr('P27_FECHA_IMPLEMENTACI\00D3N')
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(42627033996855534090)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(42627036083279534092)
,p_validation_name=>'P27_CREADO_EL must be timestamp'
,p_validation_sequence=>200
,p_validation=>'P27_CREADO_EL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(42627035557240534091)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(42627037262965534093)
,p_validation_name=>'P27_ACTUALIZADO_EL must be timestamp'
,p_validation_sequence=>220
,p_validation=>'P27_ACTUALIZADO_EL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(42627036793428534093)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42627045181025534098)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(42627045094364534098)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42627045962055534099)
,p_event_id=>wwv_flow_imp.id(42627045181025534098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42627048039742534100)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(42627026800682534082)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form SGT_FORM_ENLACES_FO'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>42627048039742534100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42627048449219534101)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>42627048449219534101
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42627047619207534100)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(42627026800682534082)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SGT_FORM_ENLACES_FO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>42627047619207534100
);
wwv_flow_imp.component_end;
end;
/
