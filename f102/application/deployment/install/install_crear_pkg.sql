prompt --application/deployment/install/install_crear_pkg
begin
--   Manifest
--     INSTALL: INSTALL-CREAR_PKG
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
 p_id=>wwv_flow_imp.id(2451551067477063)
,p_install_id=>wwv_flow_imp.id(519733554265288)
,p_name=>'CREAR_PKG'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace PACKAGE AUDIT_PKG AS  ',
'  ',
'    FUNCTION START_AUDIT (  ',
'        p_table_name IN VARCHAR2,  ',
'        p_action     IN VARCHAR2  ',
'    ) RETURN NUMBER;  ',
'      ',
'  ',
'    PROCEDURE LOG_CHANGES (  ',
'        p_audit_id    IN NUMBER,  ',
'        p_table_name  IN VARCHAR2,  ',
'        p_record_key  IN VARCHAR2,  ',
'        p_key_value   IN VARCHAR2,  ',
'        p_column_name IN VARCHAR2,  ',
'        p_old_value   IN VARCHAR2,  ',
'        p_new_value   IN VARCHAR2  ',
'    );  ',
'END AUDIT_PKG;',
'/',
'create or replace PACKAGE BODY AUDIT_PKG AS  ',
'    FUNCTION START_AUDIT (  ',
'        p_table_name  IN VARCHAR2,  ',
'        p_action      IN VARCHAR2  ',
'    ) RETURN NUMBER IS  ',
'        v_audit_id NUMBER;  ',
'        v_apex_user VARCHAR2(30) := NULL;  ',
'        v_app_id NUMBER := NULL;  ',
'        v_page_id NUMBER := NULL;  ',
'    BEGIN  ',
'  ',
'        BEGIN  ',
'            v_apex_user := NVL(APEX_APPLICATION.G_USER, USER);  ',
'            v_app_id := APEX_APPLICATION.G_FLOW_ID;  ',
'            v_page_id := APEX_APPLICATION.G_FLOW_STEP_ID;  ',
'        EXCEPTION  ',
'            WHEN OTHERS THEN  ',
'                v_apex_user := USER;  ',
'        END;  ',
'          ',
'  ',
'        INSERT INTO AUDIT_MASTER (  ',
'            AUDIT_ID, DB_USER, APP_USER, APEX_USER,  ',
'            APP_ID, PAGE_ID, IP_ADDRESS, ACTION_TYPE  ',
'        ) VALUES (  ',
'            AUDIT_SEQ.NEXTVAL, USER, v_apex_user, v_apex_user,  ',
'            v_app_id, v_page_id,   ',
'            SYS_CONTEXT(''USERENV'', ''IP_ADDRESS''),  ',
'            p_action  ',
'        ) RETURNING AUDIT_ID INTO v_audit_id;  ',
'          ',
'        RETURN v_audit_id;  ',
'    END START_AUDIT;  ',
'      ',
'    PROCEDURE LOG_CHANGES (  ',
'        p_audit_id    IN NUMBER,  ',
'        p_table_name  IN VARCHAR2,  ',
'        p_record_key  IN VARCHAR2,  ',
'        p_key_value   IN VARCHAR2,  ',
'        p_column_name IN VARCHAR2,  ',
'        p_old_value   IN VARCHAR2,  ',
'        p_new_value   IN VARCHAR2  ',
'    ) IS  ',
'    BEGIN  ',
'  ',
'        INSERT INTO AUDIT_DETAIL (  ',
'            AUDIT_DETAIL_ID,   ',
'            AUDIT_ID,  ',
'            TABLE_NAME,   ',
'            COLUMN_NAME,   ',
'            OLD_VALUE,   ',
'            NEW_VALUE,  ',
'            PK_COLUMN,   ',
'            PK_VALUE  ',
'        ) VALUES (  ',
'            AUDIT_DETAIL_SEQ.NEXTVAL,   ',
'            p_audit_id,  ',
'            p_table_name,  ',
'            p_column_name,   ',
'            p_old_value,   ',
'            p_new_value,  ',
'            p_record_key,   ',
'            p_key_value  ',
'        );  ',
'          ',
'    EXCEPTION  ',
'        WHEN OTHERS THEN  ',
'  ',
'            NULL;  ',
'    END LOG_CHANGES;  ',
'END AUDIT_PKG;',
'/ '))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2451674409477063)
,p_script_id=>wwv_flow_imp.id(2451551067477063)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'AUDIT_PKG'
);
wwv_flow_imp.component_end;
end;
/
