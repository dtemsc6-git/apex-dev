prompt --application/comments
begin
--   Manifest
--     APPLICATION COMMENTS: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_app_comments(
 p_id=>wwv_flow_imp.id(64304266703257110274)
,p_pages=>'14'
,p_app_comment=>unistr('Voy a implementar funciones para nombrar los equipos, he cambiado la disposici\00F3n de los input y creado de tabs, una con los campos obligatorios y otra con los opcionales, al hacer click en el tipo de equipo a crear seteara el grupo de equipo y creara')
||' el nombre del equipo con el siguiente formato: nombre_rack-siglas_tipo_equipo_numero_orden Ej: Rack B1, tipo de Equipo Mux Ethernet, el primero en el rack nombre = B1_MXE_01'
);
wwv_flow_imp_shared.create_app_comments(
 p_id=>wwv_flow_imp.id(64304316647630129994)
,p_pages=>'13'
,p_app_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Voy a implementar funciones para nombrar los equipos, he cambiado la disposici\00F3n de los input y creado de tabs, una con los campos obligatorios y otra con los opcionales, al hacer click en el tipo de equipo a crear seteara el grupo de equipo y creara')
||' el nombre del equipo con el siguiente formato: nombre_rack-siglas_tipo_equipo_numero_orden',
'Ej: Rack B1, tipo de Equipo Mux Ethernet, el primero en el rack',
'nombre = B1_MXE_01'))
);
wwv_flow_imp.component_end;
end;
/
