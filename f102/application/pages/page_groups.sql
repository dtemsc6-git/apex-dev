prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(197180568163528446399)
,p_group_name=>'Administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(57024536698229459190)
,p_group_name=>'Implementadores'
,p_group_desc=>'Grupo de paginas para los implementadores'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(57024513574816456779)
,p_group_name=>'Jefaturas'
,p_group_desc=>'Grupo de paginas accesibles solo para las Jefaturas'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(57023520474492442229)
,p_group_name=>unistr('T\00E9cnicos')
,p_group_desc=>unistr('Grupo de paginas para accesos de los t\00E9cnicos')
);
wwv_flow_imp.component_end;
end;
/
