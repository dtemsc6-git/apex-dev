prompt --application/shared_components/user_interface/lovs/lov_uni_encar
begin
--   Manifest
--     LOV_UNI_ENCAR
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
 p_id=>wwv_flow_imp.id(200719442741094818409)
,p_lov_name=>'LOV_UNI_ENCAR'
,p_lov_query=>'.'||wwv_flow_imp.id(200719442741094818409)||'.'
,p_location=>'STATIC'
,p_version_scn=>15589438822245
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200719443085789818410)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'DTE/DIC'
,p_lov_return_value=>'DTE_DIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200719443461200818410)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'DTE/MSC'
,p_lov_return_value=>'DTE_MSC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200719443916766818410)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'DTE/ISC'
,p_lov_return_value=>'DTE_ISC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200719444301256818411)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'DTE/MCO'
,p_lov_return_value=>'DTE_MCO'
);
wwv_flow_imp.component_end;
end;
/
