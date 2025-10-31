prompt --application/shared_components/logic/application_items/depto_id
begin
--   Manifest
--     APPLICATION ITEM: DEPTO_ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(17306282514286614204)
,p_name=>'DEPTO_ID'
,p_protection_level=>'I'
,p_item_comment=>'Prueba para pasar parametros a la LOV'
,p_version_scn=>15610020409736
);
wwv_flow_imp.component_end;
end;
/
