prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56706629025293001274)
,p_name=>'BTN_APLICAR_CAMBIOS'
,p_message_language=>'es-py'
,p_message_text=>'Aplicar Cambios'
,p_version_scn=>15633241136170
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(90822758512904447586)
,p_name=>'BTN_BORRAR'
,p_message_language=>'es-py'
,p_message_text=>'Borrar'
,p_version_scn=>15657353489811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56706170302728274017)
,p_name=>'BTN_CREAR'
,p_message_language=>'es-py'
,p_message_text=>'Crear'
,p_version_scn=>15633241059974
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56716804124895494591)
,p_name=>'BTN_CREAR_VARIOS'
,p_message_language=>'es-py'
,p_message_text=>'Crear Varios'
,p_version_scn=>15633249159084
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56712713069479399778)
,p_name=>'BTN_IMPORTAR_XLS'
,p_message_language=>'es-py'
,p_message_text=>'Importar XLS'
,p_version_scn=>15633246645919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(32052807619383536870)
,p_name=>'DELETE_MSG'
,p_message_language=>'es-py'
,p_message_text=>unistr('\00BFEst\00E1s seguro de que deseas eliminar?')
,p_version_scn=>15619195205176
);
wwv_flow_imp.component_end;
end;
/
