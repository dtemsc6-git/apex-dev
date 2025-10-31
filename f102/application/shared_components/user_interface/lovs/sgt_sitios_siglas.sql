prompt --application/shared_components/user_interface/lovs/sgt_sitios_siglas
begin
--   Manifest
--     SGT_SITIOS.SIGLAS
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
 p_id=>wwv_flow_imp.id(202814172118838557260)
,p_lov_name=>'SGT_SITIOS.SIGLAS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SGT_SITIOS'
,p_return_column_name=>'ID'
,p_display_column_name=>'SIGLAS'
,p_default_sort_column_name=>'SIGLAS'
,p_default_sort_direction=>'ASC'
,p_version_scn=>15589933126585
);
wwv_flow_imp.component_end;
end;
/
