prompt --application/shared_components/user_interface/lovs/interfaz_estado
begin
--   Manifest
--     INTERFAZ_ESTADO
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
 p_id=>wwv_flow_imp.id(43199625631148317953)
,p_lov_name=>'INTERFAZ_ESTADO'
,p_lov_query=>'.'||wwv_flow_imp.id(43199625631148317953)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652208674366
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43199625998691317954)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'up'
,p_lov_return_value=>'up'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43199626337993317954)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'down'
,p_lov_return_value=>'down'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43199826764691317955)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'administratively down'
,p_lov_return_value=>'administratively down'
);
wwv_flow_imp.component_end;
end;
/
