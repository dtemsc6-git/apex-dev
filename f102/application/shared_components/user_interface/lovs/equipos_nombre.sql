prompt --application/shared_components/user_interface/lovs/equipos_nombre
begin
--   Manifest
--     EQUIPOS.NOMBRE
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
 p_id=>wwv_flow_imp.id(16838483136411509974)
,p_lov_name=>'EQUIPOS.NOMBRE'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SGT_EQUIPOS'
,p_return_column_name=>'ID'
,p_display_column_name=>'NOMBRE'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'NOMBRE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>15662090176704
);
wwv_flow_imp.component_end;
end;
/
