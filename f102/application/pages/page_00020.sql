prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>'PRUEBATREE'
,p_alias=>'PRUEBATREE'
,p_step_title=>'PRUEBATREE'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'20'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(201656199244269324771)
,p_plug_name=>'PRUEBATREE'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with data as (',
'/*',
'select ''Z'' as link_type, to_char(parent_id) as PARENT_ID, to_char(sgt_zonas.id) as ID , NOMBRE AS name, null as sub_id from sgt_zonas ',
'union all',
'select ''S'' as link_type, to_char(zona_id) as PARENT_ID, to_char(b.zona_id) ||''-''||to_char(b.id) as ID,  nombre as name, b.id as sub_id from sgt_sitios b',
'union all',
'select (''SC'') as link_type, to_char(c.zona_id) || ''-'' || to_char(sitio_id) as PARENT_ID, to_char(zona_id) ||''-''||to_char(c.sitio_id) ||''-''||to_char(c.id) as ID, c.nombre as name, c.id as sub_id from sgt_salas c',
'union all',
'select (''R'') as link_type,to_char(zona_id)||''-''||to_char(sitio_id)||''-''||to_char(sala_id) as PARENT_ID, to_char(zona_id) || ''-'' || to_char(sitio_id) || ''-''||to_char(sala_id)||''-''||to_char(d.id) as ID, d.nombre as name, d.id as sub_id from sgt_racks d'
||'  ',
'*/',
'select ''Z'' as link_type, to_char(parent_id) as PARENT_ID, to_char(sgt_zonas.id) as ID , NOMBRE AS name, null as sub_id from sgt_zonas ',
'union all',
'select ''S'' as link_type, to_char(zona_id) as PARENT_ID, ''S-''||to_char(b.id) as ID,  nombre as name, b.id as sub_id from sgt_sitios b',
'union all',
'select (''SC'') as link_type, ''S-''||to_char(sitio_id) as PARENT_ID, ''SC-''||to_char(c.id) as ID, c.siglas as name, c.id as sub_id from sgt_salas c',
'union all',
'select (''R'') as link_type,''SC-''||to_char(sala_id) as PARENT_ID, ''R-''||to_char(d.id) as ID, d.nombre as name, d.id as sub_id from sgt_racks d  ',
'union all ',
'select (''E'') as link_type,  ''R-''||to_char(rack_id) as parent_id , ''E-''||to_char(e.id) as ID, e.nombre as name, e.id as sub_id from sgt_equipos e',
'/*',
'union all',
'select (''E'') as link_type,',
'to_char(zona_id)||''-''||to_char(sitio_id)||''-''||to_char(sala_id)||''-''||to_char(rack_id) as PARENT_ID, ',
'to_char(zona_id)||''-''||to_char(sitio_id)||''-''||to_char(sala_id)||''-''||to_char(rack_id)||''-''||to_char(E.ID) as ID,',
'E.NOMBRE AS name,',
'e.id as sub_id',
'from sgt_equipos E  ',
'*/',
')',
'select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status, ',
'       level,',
'       name as title, ',
'       null as icon, ',
'       "ID" as value, ',
'       null as tooltip, ',
'       null as link ',
'from data',
'start with "PARENT_ID" is null',
'connect by prior "ID" = "PARENT_ID"',
'order siblings by name'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'default_icon_css_class', 'icon-tree-folder',
  'hierarchy_level_column', 'LEVEL',
  'icon_css_class_column', 'ICON',
  'icon_type_css_class', 'a-Icon',
  'link_column', 'LINK',
  'node_label_column', 'TITLE',
  'node_status_column', 'STATUS',
  'node_value_column', 'VALUE',
  'tree_hierarchy', 'LEVEL',
  'tree_tooltip', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(201656199710339324771)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(201656199244269324771)
,p_button_name=>'CONTRACT_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Collapse All'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(201656200968917324774)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(201656199244269324771)
,p_button_name=>'EXPAND_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Expand All'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(201656200035367324773)
,p_name=>'CONTRACT_ALL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(201656199710339324771)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201656200603579324774)
,p_event_id=>wwv_flow_imp.id(201656200035367324773)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(201656199244269324771)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(201656201335685324775)
,p_name=>'EXPAND_ALL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(201656200968917324774)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201656201916746324775)
,p_event_id=>wwv_flow_imp.id(201656201335685324775)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(201656199244269324771)
);
wwv_flow_imp.component_end;
end;
/
