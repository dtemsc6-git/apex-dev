prompt --application/shared_components/user_interface/lovs/modo_fo
begin
--   Manifest
--     MODO_FO
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
 p_id=>wwv_flow_imp.id(16824834299877558860)
,p_lov_name=>'MODO_FO'
,p_lov_query=>'.'||wwv_flow_imp.id(16824834299877558860)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652208688775
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16824834569477558861)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'SM'
,p_lov_return_value=>'SM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16824834990728558862)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'MM'
,p_lov_return_value=>'MM'
);
wwv_flow_imp.component_end;
end;
/
