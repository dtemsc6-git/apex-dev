prompt --application/shared_components/user_interface/lovs/nivel_prioridad
begin
--   Manifest
--     NIVEL_PRIORIDAD
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
 p_id=>wwv_flow_imp.id(83355472626096331408)
,p_lov_name=>'NIVEL_PRIORIDAD'
,p_lov_query=>'.'||wwv_flow_imp.id(83355472626096331408)||'.'
,p_location=>'STATIC'
,p_version_scn=>15657376900796
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(83355472944643331409)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Cr\00EDtico ')
,p_lov_return_value=>'10'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(83355473371844331410)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Alta'
,p_lov_return_value=>'20'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(83355473705856331410)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Media'
,p_lov_return_value=>'30'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(83355474136670331410)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Baja'
,p_lov_return_value=>'40'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(83355474562202331410)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Est\00E1ndar')
,p_lov_return_value=>'50'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(83355474928532331410)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Experimental'
,p_lov_return_value=>'60'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(83355475349037331411)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Otros'
,p_lov_return_value=>'70'
);
wwv_flow_imp.component_end;
end;
/
