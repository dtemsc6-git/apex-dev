prompt --application/shared_components/security/authorizations/tecnico_rights
begin
--   Manifest
--     SECURITY SCHEME: Tecnico Rights
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(56843600635088994994)
,p_name=>'Tecnico Rights'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attribute_01=>'Tecnico,Jefatura,Implementador,Administrator'
,p_attribute_02=>'A'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>15633500529780
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
