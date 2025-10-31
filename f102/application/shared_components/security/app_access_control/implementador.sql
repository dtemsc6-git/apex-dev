prompt --application/shared_components/security/app_access_control/implementador
begin
--   Manifest
--     ACL ROLE: Implementador
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(56843572507589977791)
,p_static_id=>'IMPLEMENTADOR'
,p_name=>'Implementador'
,p_description=>'Rol asignado a los implementadores de sistemas'
,p_version_scn=>15633352378774
);
wwv_flow_imp.component_end;
end;
/
