prompt --application/deployment/install/install_crear_types
begin
--   Manifest
--     INSTALL: INSTALL-CREAR_TYPES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2453158381496320)
,p_install_id=>wwv_flow_imp.id(519733554265288)
,p_name=>'CREAR_TYPES'
,p_sequence=>70
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace type "TABLA_IDS" as ',
'table of number',
'/',
'create or replace TYPE coord_obj AS OBJECT ( ',
'    lat NUMBER, ',
'    lon NUMBER ',
')',
'/',
'',
' '))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2453452155496320)
,p_script_id=>wwv_flow_imp.id(2453158381496320)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TYPE'
,p_object_name=>'COORD_OBJ'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2453325856496320)
,p_script_id=>wwv_flow_imp.id(2453158381496320)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TYPE'
,p_object_name=>'TABLA_IDS'
);
wwv_flow_imp.component_end;
end;
/
