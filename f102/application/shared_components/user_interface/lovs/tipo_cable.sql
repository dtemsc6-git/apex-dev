prompt --application/shared_components/user_interface/lovs/tipo_cable
begin
--   Manifest
--     TIPO_CABLE
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
 p_id=>wwv_flow_imp.id(16824711784220248610)
,p_lov_name=>'TIPO_CABLE'
,p_lov_query=>'.'||wwv_flow_imp.id(16824711784220248610)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652208728781
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16824712104991248611)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ADSS'
,p_lov_return_value=>'ADSS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16824712559843248613)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'OPGW'
,p_lov_return_value=>'OPGW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16824712881740248613)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'ARMORED'
,p_lov_return_value=>'ARMORED'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16824713302178248614)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'PDC'
,p_lov_return_value=>'PDC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16824713726022248614)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'DROP'
,p_lov_return_value=>'DROP'
);
wwv_flow_imp.component_end;
end;
/
