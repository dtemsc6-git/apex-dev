prompt --application/shared_components/user_interface/lovs/estado_equipo
begin
--   Manifest
--     ESTADO_EQUIPO
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
 p_id=>wwv_flow_imp.id(203663371051164540142)
,p_lov_name=>'ESTADO_EQUIPO'
,p_lov_query=>'.'||wwv_flow_imp.id(203663371051164540142)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652208638821
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(203663371403443540142)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Apagado'
,p_lov_return_value=>'Apagado'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(203663371724885540143)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Utilizado'
,p_lov_return_value=>'Utilizado'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291005545094836159)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'No utilizado'
,p_lov_return_value=>'No utilizado'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17291025687869838470)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'S/D'
,p_lov_return_value=>'S/D'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17292442094612840685)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Desconocido'
,p_lov_return_value=>'Desconocido'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(42523351391228099593)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Retirado'
,p_lov_return_value=>'Retirado'
);
wwv_flow_imp.component_end;
end;
/
