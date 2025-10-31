prompt --application/shared_components/user_interface/lovs/estado_enlace_fo
begin
--   Manifest
--     ESTADO_ENLACE_FO
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
 p_id=>wwv_flow_imp.id(52385217569870497397)
,p_lov_name=>'ESTADO_ENLACE_FO'
,p_lov_query=>'.'||wwv_flow_imp.id(52385217569870497397)||'.'
,p_location=>'STATIC'
,p_version_scn=>15652208579374
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385217849707497399)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Activo'
,p_lov_return_value=>'Activo'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385218233504497399)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Planificado'
,p_lov_return_value=>'Planificado'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385218675755497399)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Comisionamiento'
,p_lov_return_value=>'Comisionamiento'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385219079385497400)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Falla'
,p_lov_return_value=>'Falla'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385219411082497400)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Mantenimiento'
,p_lov_return_value=>'Mantenimiento'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385219878390497400)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>unistr('Sin supervisi\00F3n')
,p_lov_return_value=>unistr('Sin supervisi\00F3n')
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385220216597497400)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Decomisionado'
,p_lov_return_value=>'Decomisionado'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(52385220628337497400)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'Retirado'
,p_lov_return_value=>'Retirado'
);
wwv_flow_imp.component_end;
end;
/
