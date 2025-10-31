prompt --application/shared_components/user_interface/lovs/lov_sitios_sf
begin
--   Manifest
--     LOV_SITIOS_SF
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
 p_id=>wwv_flow_imp.id(43095952120864982568)
,p_lov_name=>'LOV_SITIOS_SF'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SGT_SITIOS'
,p_return_column_name=>'ID'
,p_display_column_name=>'SIGLAS'
,p_group_column_name=>'CIUDAD_ID'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'SIGLAS'
,p_default_sort_direction=>'ASC'
,p_version_scn=>15624440313532
);
wwv_flow_imp.component_end;
end;
/
