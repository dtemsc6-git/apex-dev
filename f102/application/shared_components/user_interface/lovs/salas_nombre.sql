prompt --application/shared_components/user_interface/lovs/salas_nombre
begin
--   Manifest
--     SALAS.NOMBRE
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
 p_id=>wwv_flow_imp.id(18963831332535051533)
,p_lov_name=>'SALAS.NOMBRE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SGT_SITIOS.SIGLAS || ''.''|| SGT_SALAS.SIGLAS AS MOSTRAR , SGT_SALAS.ID AS CLAVE',
'FROM SGT_SALAS INNER JOIN',
'SGT_SITIOS ON SGT_SALAS.SITIO_ID = SGT_SITIOS.ID'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'CLAVE'
,p_display_column_name=>'MOSTRAR'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>15662646196351
);
wwv_flow_imp.component_end;
end;
/
