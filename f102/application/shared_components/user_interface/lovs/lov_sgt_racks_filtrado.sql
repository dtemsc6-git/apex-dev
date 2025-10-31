prompt --application/shared_components/user_interface/lovs/lov_sgt_racks_filtrado
begin
--   Manifest
--     LOV_SGT_RACKS_FILTRADO
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
 p_id=>wwv_flow_imp.id(17290052017182763958)
,p_lov_name=>'LOV_SGT_RACKS_FILTRADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       S.SIGLAS||''-''||R.NOMBRE MOSTRAR,',
'       R.ID VALOR        ',
'  from SGT_RACKS R',
'  LEFT JOIN SGT_SALAS S ON R.SALA_ID = S.ID',
'  left join SGT_SITIOS SS ON S.SITIO_ID = SS.ID',
' where',
' SS.ID = :P14_SITIO_ID'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'VALOR'
,p_display_column_name=>'MOSTRAR'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>15638121453211
);
wwv_flow_imp.component_end;
end;
/
