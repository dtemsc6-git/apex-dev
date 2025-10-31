prompt --application/deployment/install/install_crear_seq
begin
--   Manifest
--     INSTALL: INSTALL-CREAR_SEQ
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
 p_id=>wwv_flow_imp.id(2452072744485513)
,p_install_id=>wwv_flow_imp.id(519733554265288)
,p_name=>'CREAR_SEQ'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   CREATE SEQUENCE  "AUDIT_DETAIL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 52065 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;',
'',
'   CREATE SEQUENCE  "AUDIT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6446 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;',
'',
'   CREATE SEQUENCE  "SGT_ENLACES_WAN_SERVICIO_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 91 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ; '))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2452393150485513)
,p_script_id=>wwv_flow_imp.id(2452072744485513)
,p_object_owner=>'#OWNER#'
,p_object_type=>'SEQUENCE'
,p_object_name=>'AUDIT_DETAIL_SEQ'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2452224243485513)
,p_script_id=>wwv_flow_imp.id(2452072744485513)
,p_object_owner=>'#OWNER#'
,p_object_type=>'SEQUENCE'
,p_object_name=>'AUDIT_SEQ'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2452604965485513)
,p_script_id=>wwv_flow_imp.id(2452072744485513)
,p_object_owner=>'#OWNER#'
,p_object_type=>'SEQUENCE'
,p_object_name=>'SGT_ENLACES_WAN_SERVICIO_ID_SEQ'
);
wwv_flow_imp.component_end;
end;
/
