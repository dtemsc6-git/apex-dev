prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(56800655354572124098)
,p_name=>'ACCESS_CONTROL_SCOPE'
,p_value=>'ALL_USERS'
,p_is_required=>'N'
,p_valid_values=>'ACL_ONLY, ALL_USERS'
,p_on_upgrade_keep_value=>true
,p_required_patch=>wwv_flow_imp.id(56800655087424124095)
,p_comments=>'The default access level given to authenticated users who are not in the access control list'
,p_version_scn=>15633504633762
);
wwv_flow_imp.component_end;
end;
/
