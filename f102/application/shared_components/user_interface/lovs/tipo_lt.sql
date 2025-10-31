prompt --application/shared_components/user_interface/lovs/tipo_lt
begin
--   Manifest
--     TIPO_LT
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
 p_id=>wwv_flow_imp.id(43130638651458210618)
,p_lov_name=>'TIPO_LT'
,p_lov_query=>'.'||wwv_flow_imp.id(43130638651458210618)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652209118624
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43130638966643210620)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ALI-23KV'
,p_lov_return_value=>'ALI-23KV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43130639318406210621)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'LT-66KV'
,p_lov_return_value=>'LT-66KV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43130639711754210621)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'LT-220KV'
,p_lov_return_value=>'LT-220KV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(43130640166397210621)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'LT-500KV'
,p_lov_return_value=>'LT-500KV'
);
wwv_flow_imp.component_end;
end;
/
