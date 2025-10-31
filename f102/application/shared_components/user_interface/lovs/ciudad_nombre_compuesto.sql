prompt --application/shared_components/user_interface/lovs/ciudad_nombre_compuesto
begin
--   Manifest
--     CIUDAD.NOMBRE-COMPUESTO
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
 p_id=>wwv_flow_imp.id(2341386040577256)
,p_lov_name=>'CIUDAD.NOMBRE-COMPUESTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select C.ID VALOR, D.NOMBRE||'', ''||C.NOMBRE  DISPLAY, D.ID DEPTO_ID from SGT_CIUDAD C',
'JOIN SGT_DEPTO D ON C.DEPTO_ID = D.ID',
'ORDER BY DISPLAY'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'VALOR'
,p_display_column_name=>'DISPLAY'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39022125130998
);
wwv_flow_imp.component_end;
end;
/
