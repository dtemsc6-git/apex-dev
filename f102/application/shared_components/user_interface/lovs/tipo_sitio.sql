prompt --application/shared_components/user_interface/lovs/tipo_sitio
begin
--   Manifest
--     TIPO_SITIO
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
 p_id=>wwv_flow_imp.id(200544013714325726183)
,p_lov_name=>'TIPO_SITIO'
,p_lov_query=>'.'||wwv_flow_imp.id(200544013714325726183)||'.'
,p_location=>'STATIC'
,p_version_scn=>39022127803009
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200544014004291726183)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Estaci\00F3n/Subestaci\00F3n El\00E9ctrica')
,p_lov_return_value=>unistr('Estaci\00F3n/Subestaci\00F3n El\00E9ctrica')
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200544014407655726184)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Caseta Repetidora de Radiocomunicaciones'
,p_lov_return_value=>'Caseta Repetidora de Radiocomunicaciones'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200544014737088726184)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Agencia Comercial y/o de Reclamo'
,p_lov_return_value=>'Agencia Comercial y/o de Reclamo'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200544015170316726184)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Central Hidroel\00E9ctrica')
,p_lov_return_value=>unistr('Central Hidroel\00E9ctrica')
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200544015609130726185)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Centro de Control'
,p_lov_return_value=>'Centro de Control'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(200544015942454726185)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Otro'
,p_lov_return_value=>'Otro'
);
wwv_flow_imp.component_end;
end;
/
