prompt --application/shared_components/user_interface/lovs/tipo_enlace
begin
--   Manifest
--     TIPO_ENLACE
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
 p_id=>wwv_flow_imp.id(43126193997789167292)
,p_lov_name=>'TIPO_ENLACE'
,p_lov_query=>'.'||wwv_flow_imp.id(43126193997789167292)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652209081831
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43126194379680167293)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Troncal'
,p_lov_return_value=>'Troncal'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43126194709193167294)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Interno'
,p_lov_return_value=>'Interno'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43126195104628167294)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'De terceros'
,p_lov_return_value=>'De terceros'
);
wwv_flow_imp.component_end;
end;
/
