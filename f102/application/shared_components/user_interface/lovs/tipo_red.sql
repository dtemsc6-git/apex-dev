prompt --application/shared_components/user_interface/lovs/tipo_red
begin
--   Manifest
--     TIPO_RED
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
 p_id=>wwv_flow_imp.id(17291432086166556461)
,p_lov_name=>'TIPO_RED'
,p_lov_query=>'.'||wwv_flow_imp.id(17291432086166556461)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652209137227
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291432345857556463)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Desconocido'
,p_lov_return_value=>'Desconocido'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291432779145556463)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Externa'
,p_lov_return_value=>'Externa'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291433133476556464)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Miscelaneas'
,p_lov_return_value=>'Miscelaneas'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291433520615556464)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Red Corporativa'
,p_lov_return_value=>'Red Corporativa'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291433971063556465)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Red ECCANDE'
,p_lov_return_value=>'Red ECCANDE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291434335691556465)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Red Radio DMR'
,p_lov_return_value=>'Red Radio DMR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291434773170556465)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Red SCADA'
,p_lov_return_value=>'Red SCADA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291435119701556465)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>unistr('Red Telefon\00EDa')
,p_lov_return_value=>unistr('Red Telefon\00EDa')
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291435583458556465)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'Red Transporte'
,p_lov_return_value=>'Red Transporte'
);
wwv_flow_imp.component_end;
end;
/
