prompt --application/shared_components/user_interface/lovs/sub_tipo_equipo
begin
--   Manifest
--     SUB_TIPO_EQUIPO
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
 p_id=>wwv_flow_imp.id(17292525545179850352)
,p_lov_name=>'SUB_TIPO_EQUIPO'
,p_lov_query=>'.'||wwv_flow_imp.id(17292525545179850352)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652208716321
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17292525895987850353)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Activo'
,p_lov_return_value=>'Activo'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17292526210753850354)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Pasivo'
,p_lov_return_value=>'Pasivo'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17292526613330850354)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Energ\00EDa')
,p_lov_return_value=>unistr('Energ\00EDa')
);
wwv_flow_imp.component_end;
end;
/
