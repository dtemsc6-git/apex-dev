prompt --application/shared_components/navigation/lists/asistente_servicios
begin
--   Manifest
--     LIST: Asistente Servicios
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
 p_id=>wwv_flow_imp.id(67812692495749518409)
,p_name=>'Asistente Servicios'
,p_list_status=>'PUBLIC'
,p_version_scn=>15652207663415
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(67812693885511518413)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Paso 1'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(67812698114385518417)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Paso 2'
,p_list_item_link_target=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(67812703194364518420)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Paso 3'
,p_list_item_link_target=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(83278655706620590738)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Paso 4'
,p_list_item_link_target=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(67812708114953518424)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Paso 5'
,p_list_item_link_target=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
