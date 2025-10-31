prompt --application/shared_components/user_interface/lovs/interface_duplex
begin
--   Manifest
--     INTERFACE_DUPLEX
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
 p_id=>wwv_flow_imp.id(43201969178408363692)
,p_lov_name=>'INTERFACE_DUPLEX'
,p_lov_query=>'.'||wwv_flow_imp.id(43201969178408363692)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652208652355
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43201969509925363694)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'auto'
,p_lov_return_value=>'auto'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43201969936959363695)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'full'
,p_lov_return_value=>'full'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43201970324847363695)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'half'
,p_lov_return_value=>'half'
);
wwv_flow_imp.component_end;
end;
/
