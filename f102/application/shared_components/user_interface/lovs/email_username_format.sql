prompt --application/shared_components/user_interface/lovs/email_username_format
begin
--   Manifest
--     EMAIL_USERNAME_FORMAT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(56800680113856124143)
,p_lov_name=>'EMAIL_USERNAME_FORMAT'
,p_lov_query=>'.'||wwv_flow_imp.id(56800680113856124143)||'.'
,p_location=>'STATIC'
,p_version_scn=>15633301326113
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(56800680465942124143)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Email Addresses'
,p_lov_return_value=>'EMAIL'
);
wwv_flow_imp.component_end;
end;
/
