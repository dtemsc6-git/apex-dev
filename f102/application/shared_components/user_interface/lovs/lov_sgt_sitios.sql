prompt --application/shared_components/user_interface/lovs/lov_sgt_sitios
begin
--   Manifest
--     LOV_SGT_SITIOS
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
 p_id=>wwv_flow_imp.id(122658656065915391705)
,p_lov_name=>'LOV_SGT_SITIOS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SGT_SITIOS'
,p_query_where=>'CIUDAD_ID = :CIUDAD_ID'
,p_return_column_name=>'ID'
,p_display_column_name=>'NOMBRE'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'NOMBRE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>15610018144639
);
wwv_flow_imp.component_end;
end;
/
