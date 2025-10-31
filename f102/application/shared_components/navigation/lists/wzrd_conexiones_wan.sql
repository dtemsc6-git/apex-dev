prompt --application/shared_components/navigation/lists/wzrd_conexiones_wan
begin
--   Manifest
--     LIST: WZRD_CONEXIONES_WAN
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(85027390009745935778)
,p_name=>'WZRD_CONEXIONES_WAN'
,p_list_status=>'PUBLIC'
,p_version_scn=>15653174290726
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(85027391402073935782)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Crear el enlace WAN'
,p_list_item_link_target=>'f?p=&APP_ID.:401:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(85027395725271935786)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Seleccionar los sitios'
,p_list_item_link_target=>'f?p=&APP_ID.:402:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(85027400765264935790)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Seleccionar las conexiones'
,p_list_item_link_target=>'f?p=&APP_ID.:403:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(85027405738428935794)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Verificar las instrucciones'
,p_list_item_link_target=>'f?p=&APP_ID.:404:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
