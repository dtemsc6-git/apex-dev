
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_AUDIT_CONSOLIDADO" ("AUDIT_ID", "USUARIO", "USUARIO_BD", "TIPO_OPERACION", "FECHA_HORA", "FECHA", "HORA", "APP_ID", "PAGE_ID", "IP_ADDRESS", "TABLA", "CAMPOS_MODIFICADOS", "CAMPOS_LISTA", "DETALLE_OLD_VALUE", "DETALLE_NEW_VALUE", "MODULO", "TIPO_CAMBIO", "NIVEL_CRITICIDAD", "TURNO", "PERIODO", "INDICADOR_VISUAL", "FECHA_HORA_FILTRO") AS 
  SELECT  
    -- Información base de AUDIT_MASTER 
    am.AUDIT_ID, 
    am.APEX_USER as USUARIO, 
    am.DB_USER as USUARIO_BD, 
    am.ACTION_TYPE as TIPO_OPERACION, 
    am.TIMESTAMP as FECHA_HORA, 
    TO_CHAR(am.TIMESTAMP, 'DD/MM/YYYY') as FECHA, 
    TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') as HORA, 
    am.APP_ID, 
    am.PAGE_ID, 
    am.IP_ADDRESS, 
     
    -- Información de la tabla afectada (toma la primera tabla si hay múltiples) 
    (SELECT ad1.TABLE_NAME  
     FROM AUDIT_DETAIL ad1  
     WHERE ad1.AUDIT_ID = am.AUDIT_ID  
     AND ROWNUM = 1) as TABLA, 
     
    -- NUEVO: Número total de campos modificados 
    (SELECT COUNT(*)  
     FROM AUDIT_DETAIL ad2  
     WHERE ad2.AUDIT_ID = am.AUDIT_ID) as CAMPOS_MODIFICADOS, 
     
    -- NUEVO: Lista concatenada de campos modificados 
    (SELECT LISTAGG(ad3.COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY ad3.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad3  
     WHERE ad3.AUDIT_ID = am.AUDIT_ID) as CAMPOS_LISTA, 
     
    -- Solo valores anteriores concatenados (Campo: Valor_Anterior) 
    (SELECT LISTAGG( 
        ad4a.COLUMN_NAME || ': ' ||  
        CASE  
            WHEN ad4a.OLD_VALUE IS NULL THEN '[NULL]' 
            WHEN LENGTH(ad4a.OLD_VALUE) > 50 THEN SUBSTR(ad4a.OLD_VALUE, 1, 47) || '...' 
            ELSE ad4a.OLD_VALUE 
        END,  
        ' | ') WITHIN GROUP (ORDER BY ad4a.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad4a  
     WHERE ad4a.AUDIT_ID = am.AUDIT_ID) as DETALLE_OLD_VALUE, 
     
    -- Solo valores actuales concatenados (Campo: Valor_Nuevo) 
    (SELECT LISTAGG( 
        ad4b.COLUMN_NAME || ': ' ||  
        CASE  
            WHEN ad4b.NEW_VALUE IS NULL THEN '[NULL]' 
            WHEN LENGTH(ad4b.NEW_VALUE) > 50 THEN SUBSTR(ad4b.NEW_VALUE, 1, 47) || '...' 
            ELSE ad4b.NEW_VALUE 
        END,  
        ' | ') WITHIN GROUP (ORDER BY ad4b.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad4b  
     WHERE ad4b.AUDIT_ID = am.AUDIT_ID) as DETALLE_NEW_VALUE, 
     
    -- Información derivada para compatibilidad con filtros existentes 
    CASE  
        WHEN (SELECT ad5.TABLE_NAME FROM AUDIT_DETAIL ad5 WHERE ad5.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) LIKE 'SGT_EQUIPOS' THEN 'GESTION_ACTIVOS' 
        WHEN (SELECT ad5.TABLE_NAME FROM AUDIT_DETAIL ad5 WHERE ad5.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) LIKE 'SGT_SITIOS' THEN 'GESTION_ACTIVOS' 
        WHEN (SELECT ad5.TABLE_NAME FROM AUDIT_DETAIL ad5 WHERE ad5.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) LIKE 'SGT_INTERFACES' THEN 'GESTION_ACTIVOS' 
        WHEN (SELECT ad5.TABLE_NAME FROM AUDIT_DETAIL ad5 WHERE ad5.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) LIKE 'SGT_ENLACES%' THEN 'GESTION_ENLACES' 
        WHEN (SELECT ad5.TABLE_NAME FROM AUDIT_DETAIL ad5 WHERE ad5.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) LIKE 'SGT_SERVICIOS%' THEN 'GESTION_SERVICIOS' 
        ELSE 'OTROS' 
    END as MODULO, 
     
    -- Categorización de la transacción 
    CASE  
        WHEN (SELECT COUNT(*) FROM AUDIT_DETAIL ad6 WHERE ad6.AUDIT_ID = am.AUDIT_ID) = 1 THEN 'Cambio Simple' 
        WHEN (SELECT COUNT(*) FROM AUDIT_DETAIL ad6 WHERE ad6.AUDIT_ID = am.AUDIT_ID) <= 5 THEN 'Cambio Múltiple' 
        ELSE 'Cambio Masivo' 
    END as TIPO_CAMBIO, 
     
    -- Nivel de criticidad de la transacción 
    CASE  
        WHEN (SELECT ad7.TABLE_NAME FROM AUDIT_DETAIL ad7 WHERE ad7.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) IN ('USUARIOS', 'ROLES', 'PERMISOS', 'SGT_USUARIOS') THEN 'Crítico' 
        WHEN (SELECT ad7.TABLE_NAME FROM AUDIT_DETAIL ad7 WHERE ad7.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) LIKE '%CONFIG%'  
          OR (SELECT ad7.TABLE_NAME FROM AUDIT_DETAIL ad7 WHERE ad7.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) LIKE '%PARAM%' THEN 'Alto' 
        WHEN am.ACTION_TYPE IN ('DELETE', 'Eliminación') THEN 'Alto' 
        WHEN (SELECT COUNT(*) FROM AUDIT_DETAIL ad8 WHERE ad8.AUDIT_ID = am.AUDIT_ID) > 10 THEN 'Alto' 
        ELSE 'Normal' 
    END as NIVEL_CRITICIDAD, 
     
    -- Turno laboral 
    CASE  
        WHEN TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') BETWEEN '00:00:00' AND '07:59:59' THEN 'Nocturno' 
        WHEN TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') BETWEEN '08:00:00' AND '17:59:59' THEN 'Laboral' 
        ELSE 'Vespertino' 
    END as TURNO, 
     
    -- Período relativo 
    CASE  
        WHEN TRUNC(am.TIMESTAMP) = TRUNC(SYSDATE) THEN 'Hoy' 
        WHEN TRUNC(am.TIMESTAMP) = TRUNC(SYSDATE - 1) THEN 'Ayer' 
        WHEN TRUNC(am.TIMESTAMP) >= TRUNC(SYSDATE - 7) THEN 'Esta Semana' 
        ELSE 'Anterior' 
    END as PERIODO, 
    CASE  
        WHEN (SELECT COUNT(DISTINCT ad9.COLUMN_NAME) FROM AUDIT_DETAIL ad9 WHERE ad9.AUDIT_ID = am.AUDIT_ID) > 5 THEN '🔴' 
        WHEN (SELECT COUNT(DISTINCT ad9.COLUMN_NAME) FROM AUDIT_DETAIL ad9 WHERE ad9.AUDIT_ID = am.AUDIT_ID) > 2 THEN '🟡' 
        ELSE '🟢' 
    END as INDICADOR_VISUAL, 
    am.TIMESTAMP as FECHA_HORA_FILTRO 
FROM AUDIT_MASTER am 
WHERE EXISTS (SELECT 1 FROM AUDIT_DETAIL ad WHERE ad.AUDIT_ID = am.AUDIT_ID) 
ORDER BY am.TIMESTAMP DESC;