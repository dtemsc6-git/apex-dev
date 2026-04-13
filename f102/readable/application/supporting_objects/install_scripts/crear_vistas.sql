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

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_AUDIT_CUMPLIMIENTO" ("TABLA", "CAMPO", "CRITICIDAD", "CATEGORIA_CAMPO", "MODULO", "FRECUENCIA_CAMBIOS", "USUARIOS_INVOLUCRADOS", "REGISTROS_AFECTADOS", "TOTAL_INSERTS", "TOTAL_UPDATES", "TOTAL_DELETES", "PRIMER_CAMBIO", "ULTIMO_CAMBIO", "HORAS_ENTRE_PRIMER_ULTIMO", "CAMBIOS_HORARIO_LABORAL", "CAMBIOS_HORARIO_EXTENDIDO", "CAMBIOS_HORARIO_NOCTURNO", "CAMBIOS_FINES_SEMANA", "NIVEL_RIESGO", "ESTADO_CUMPLIMIENTO", "PCT_CAMBIOS_CRITICOS", "PCT_ELIMINACIONES", "PCT_HORARIO_NOCTURNO", "RANKING_CRITICIDAD") AS 
  SELECT   
    -- Información básica  
    TABLA,  
    CAMPO,  
    CRITICIDAD,  
    CATEGORIA_CAMPO,  
    MODULO,  
      
    -- Métricas de actividad  
    COUNT(*) as FRECUENCIA_CAMBIOS,  
    COUNT(DISTINCT USUARIO) as USUARIOS_INVOLUCRADOS,  
    COUNT(DISTINCT ID_REGISTRO) as REGISTROS_AFECTADOS,  
      
    -- Análisis por tipo de operación  
    SUM(CASE WHEN ACCION = 'INSERT' THEN 1 ELSE 0 END) as TOTAL_INSERTS,  
    SUM(CASE WHEN ACCION = 'UPDATE' THEN 1 ELSE 0 END) as TOTAL_UPDATES,  
    SUM(CASE WHEN ACCION = 'DELETE' THEN 1 ELSE 0 END) as TOTAL_DELETES,  
      
    -- Análisis temporal  
    TO_CHAR(MIN(FECHA_HORA), 'DD/MM/YYYY HH24:MI') as PRIMER_CAMBIO,  
    TO_CHAR(MAX(FECHA_HORA), 'DD/MM/YYYY HH24:MI') as ULTIMO_CAMBIO,  
    ROUND((CAST(MAX(FECHA_HORA) AS DATE) - CAST(MIN(FECHA_HORA) AS DATE)) * 24, 2) as HORAS_ENTRE_PRIMER_ULTIMO,  
      
    -- Análisis de cumplimiento por horario  
    SUM(CASE   
        WHEN TO_NUMBER(TO_CHAR(FECHA_HORA, 'HH24')) BETWEEN 8 AND 18 THEN 1   
        ELSE 0   
    END) as CAMBIOS_HORARIO_LABORAL,  
      
    SUM(CASE   
        WHEN TO_NUMBER(TO_CHAR(FECHA_HORA, 'HH24')) BETWEEN 19 AND 23 THEN 1   
        ELSE 0   
    END) as CAMBIOS_HORARIO_EXTENDIDO,  
      
    SUM(CASE   
        WHEN TO_NUMBER(TO_CHAR(FECHA_HORA, 'HH24')) BETWEEN 0 AND 7 THEN 1   
        ELSE 0   
    END) as CAMBIOS_HORARIO_NOCTURNO,  
      
    -- Análisis por día de semana  
    SUM(CASE   
        WHEN TO_CHAR(FECHA_HORA, 'D') IN ('1', '7') THEN 1   
        ELSE 0   
    END) as CAMBIOS_FINES_SEMANA,  
      
    -- Cálculo de nivel de riesgo  
    CASE   
        WHEN TABLA IN ('SGT_SITIOS', 'SGT_EQUIPOS', 'SGT_SERVICIOS', 'SGT_ENLACES_FO', 'SGT_ENLACES_LOGICOS', 'SGT_INTERFACES', 'SGT_ENLACES_TRAMOS')   
             AND SUM(CASE WHEN ACCION = 'DELETE' THEN 1 ELSE 0 END) > 0   
        THEN 'ALTO_RIESGO'  
        WHEN CRITICIDAD = 'ALTA'   
             AND COUNT(*) > 50   
        THEN 'MEDIO_RIESGO'  
        ELSE 'BAJO_RIESGO'  
    END as NIVEL_RIESGO,  
      
    -- Estado de cumplimiento  
    CASE          WHEN SUM(CASE WHEN ACCION = 'DELETE' THEN 1 ELSE 0 END) > 0   
             AND TABLA IN ('SGT_SITIOS', 'SGT_EQUIPOS', 'SGT_SERVICIOS', 'SGT_ENLACES_FO', 'SGT_ENLACES_LOGICOS', 'SGT_INTERFACES', 'SGT_ENLACES_TRAMOS')  
             AND SUM(CASE WHEN TO_NUMBER(TO_CHAR(FECHA_HORA, 'HH24')) BETWEEN 0 AND 7 THEN 1 ELSE 0 END) > 0  
        THEN 'VIOLACION_POLITICA'  
        WHEN SUM(CASE WHEN TO_CHAR(FECHA_HORA, 'D') IN ('1', '7') THEN 1 ELSE 0 END) > 0  
             AND TABLA IN ('SGT_SITIOS', 'SGT_EQUIPOS', 'SGT_ENLACES_FO', 'SGT_ENLACES_LOGICOS', 'SGT_INTERFACES', 'SGT_ENLACES_TRAMOS', 'SGT_SERVICIOS')  
             AND SUM(CASE WHEN ACCION IN ('UPDATE', 'DELETE') THEN 1 ELSE 0 END) > 0  
        THEN 'REVISION_REQUERIDA'  
        ELSE 'CUMPLE_POLITICAS'  
    END as ESTADO_CUMPLIMIENTO,  
      
    -- Porcentajes para análisis  
    ROUND((SUM(CASE WHEN CRITICIDAD = 'ALTA' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)), 2) as PCT_CAMBIOS_CRITICOS,  
    ROUND((SUM(CASE WHEN ACCION = 'DELETE' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)), 2) as PCT_ELIMINACIONES,  
    ROUND((SUM(CASE WHEN TO_NUMBER(TO_CHAR(FECHA_HORA, 'HH24')) BETWEEN 0 AND 7 THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)), 2) as PCT_HORARIO_NOCTURNO,  
      
    -- Ranking de criticidad  
    DENSE_RANK() OVER (ORDER BY   
        SUM(CASE WHEN CRITICIDAD = 'ALTA' THEN 1 ELSE 0 END) DESC,  
        COUNT(*) DESC  
    ) as RANKING_CRITICIDAD  
  
FROM V_AUDIT_GENERAL  
WHERE CRITICIDAD = 'ALTA'  -- Solo cambios críticos para cumplimiento  
  AND FECHA_HORA >= SYSDATE - 90  -- Últimos 90 días  
GROUP BY TABLA, CAMPO, CRITICIDAD, CATEGORIA_CAMPO, MODULO  
HAVING COUNT(*) >= 1  -- Al menos un cambio  
ORDER BY FRECUENCIA_CAMBIOS DESC, ULTIMO_CAMBIO DESC;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_AUDIT_DASHBOARD_EJECUTIVO" ("MODULO", "TOTAL_CAMBIOS", "REGISTROS_AFECTADOS", "USUARIOS_ACTIVOS", "CAMBIOS_CRITICOS", "CAMBIOS_MEDIOS", "CAMBIOS_BAJOS", "CAMBIOS_HOY", "CAMBIOS_SEMANA", "CAMBIOS_MES", "TOTAL_INSERTS", "TOTAL_UPDATES", "TOTAL_DELETES", "PRIMER_CAMBIO", "ULTIMO_CAMBIO", "PCT_CRITICOS", "PCT_HOY", "RANKING_ACTIVIDAD") AS 
  WITH DATOS_MODULOS AS (  
    SELECT   
        MODULO,  
        COUNT(*) as TOTAL_CAMBIOS,  
        COUNT(DISTINCT ID_REGISTRO) as REGISTROS_AFECTADOS,  
        COUNT(DISTINCT USUARIO) as USUARIOS_ACTIVOS,  
          
  
        SUM(CASE WHEN CRITICIDAD = 'ALTA' THEN 1 ELSE 0 END) as CAMBIOS_CRITICOS,  
        SUM(CASE WHEN CRITICIDAD = 'MEDIA' THEN 1 ELSE 0 END) as CAMBIOS_MEDIOS,  
        SUM(CASE WHEN CRITICIDAD = 'BAJA' THEN 1 ELSE 0 END) as CAMBIOS_BAJOS,  
          
  
        SUM(CASE WHEN PERIODO = 'HOY' THEN 1 ELSE 0 END) as CAMBIOS_HOY,  
        SUM(CASE WHEN PERIODO = 'ESTA_SEMANA' THEN 1 ELSE 0 END) as CAMBIOS_SEMANA,  
        SUM(CASE WHEN PERIODO = 'ESTE_MES' THEN 1 ELSE 0 END) as CAMBIOS_MES,  
          
  
        SUM(CASE WHEN ACCION = 'INSERT' THEN 1 ELSE 0 END) as TOTAL_INSERTS,  
        SUM(CASE WHEN ACCION = 'UPDATE' THEN 1 ELSE 0 END) as TOTAL_UPDATES,  
        SUM(CASE WHEN ACCION = 'DELETE' THEN 1 ELSE 0 END) as TOTAL_DELETES,  
          
  
        TO_CHAR(MIN(FECHA_HORA), 'DD/MM/YYYY HH24:MI') as PRIMER_CAMBIO,  
        TO_CHAR(MAX(FECHA_HORA), 'DD/MM/YYYY HH24:MI') as ULTIMO_CAMBIO,  
          
  
        ROUND((SUM(CASE WHEN CRITICIDAD = 'ALTA' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)), 2) as PCT_CRITICOS,  
        ROUND((SUM(CASE WHEN PERIODO = 'HOY' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)), 2) as PCT_HOY  
  
    FROM V_AUDIT_GENERAL  
    WHERE FECHA_HORA >= SYSDATE - 30  -- Últimos 30 días  
    GROUP BY MODULO  
),  
TOTALES_GENERALES AS (  
    SELECT   
        'RESUMEN GENERAL' as MODULO,  
        COUNT(*) as TOTAL_CAMBIOS,  
        COUNT(DISTINCT ID_REGISTRO) as REGISTROS_AFECTADOS,  
        COUNT(DISTINCT USUARIO) as USUARIOS_ACTIVOS,  
          
        SUM(CASE WHEN CRITICIDAD = 'ALTA' THEN 1 ELSE 0 END) as CAMBIOS_CRITICOS,  
        SUM(CASE WHEN CRITICIDAD = 'MEDIA' THEN 1 ELSE 0 END) as CAMBIOS_MEDIOS,  
        SUM(CASE WHEN CRITICIDAD = 'BAJA' THEN 1 ELSE 0 END) as CAMBIOS_BAJOS,  
          
        SUM(CASE WHEN PERIODO = 'HOY' THEN 1 ELSE 0 END) as CAMBIOS_HOY,  
        SUM(CASE WHEN PERIODO = 'ESTA_SEMANA' THEN 1 ELSE 0 END) as CAMBIOS_SEMANA,  
        SUM(CASE WHEN PERIODO = 'ESTE_MES' THEN 1 ELSE 0 END) as CAMBIOS_MES,  
          
        SUM(CASE WHEN ACCION = 'INSERT' THEN 1 ELSE 0 END) as TOTAL_INSERTS,  
        SUM(CASE WHEN ACCION = 'UPDATE' THEN 1 ELSE 0 END) as TOTAL_UPDATES,  
        SUM(CASE WHEN ACCION = 'DELETE' THEN 1 ELSE 0 END) as TOTAL_DELETES,  
          
        TO_CHAR(MIN(FECHA_HORA), 'DD/MM/YYYY HH24:MI') as PRIMER_CAMBIO,  
        TO_CHAR(MAX(FECHA_HORA), 'DD/MM/YYYY HH24:MI') as ULTIMO_CAMBIO,  
          
        ROUND((SUM(CASE WHEN CRITICIDAD = 'ALTA' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)), 2) as PCT_CRITICOS,  
        ROUND((SUM(CASE WHEN PERIODO = 'HOY' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)), 2) as PCT_HOY  
  
    FROM V_AUDIT_GENERAL  
    WHERE FECHA_HORA >= SYSDATE - 30  
)  
SELECT   
    MODULO,  
    TOTAL_CAMBIOS,  
    REGISTROS_AFECTADOS,  
    USUARIOS_ACTIVOS,  
    CAMBIOS_CRITICOS,  
    CAMBIOS_MEDIOS,  
    CAMBIOS_BAJOS,  
    CAMBIOS_HOY,  
    CAMBIOS_SEMANA,  
    CAMBIOS_MES,  
    TOTAL_INSERTS,  
    TOTAL_UPDATES,  
    TOTAL_DELETES,  
    PRIMER_CAMBIO,  
    ULTIMO_CAMBIO,  
    PCT_CRITICOS,  
    PCT_HOY,  
    -- Ranking por actividad  
    CASE   
        WHEN MODULO = 'RESUMEN GENERAL' THEN 0   
        ELSE ROW_NUMBER() OVER (ORDER BY TOTAL_CAMBIOS DESC)   
    END as RANKING_ACTIVIDAD  
FROM (  
    SELECT * FROM DATOS_MODULOS  
    UNION ALL  
    SELECT * FROM TOTALES_GENERALES  
)  
ORDER BY   
    CASE WHEN MODULO = 'RESUMEN GENERAL' THEN 0 ELSE 1 END,  
    TOTAL_CAMBIOS DESC;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_AUDIT_DETALLE" ("AUDIT_ID", "ID_REGISTRO", "TABLA", "NOMBRE_REGISTRO", "USUARIO", "USUARIO_BD", "IP_ADDRESS", "APP_ID", "PAGE_ID", "TIPO_OPERACION", "ACCION", "CAMPO", "VALOR_ANTERIOR", "VALOR_NUEVO", "TIPO_CAMBIO", "MODULO", "CRITICIDAD", "CATEGORIA_CAMPO", "PERIODO", "FECHA_HORA", "FECHA", "HORA", "DIA_SEMANA", "MES_ANIO", "LONGITUD_VALOR", "ES_CRITICO", "ES_HOY", "ES_ELIMINACION", "TIPO_HORARIO", "TABLA_CAMPO", "MODULO_DETALLADO", "RANKING_CAMBIO_TABLA", "SECUENCIA_CAMBIO_REGISTRO") AS 
  SELECT   
  
    AUDIT_ID,  
    ID_REGISTRO,  
    TABLA,  
    NOMBRE_REGISTRO,  
  
    USUARIO,  
    USUARIO_BD,  
    IP_ADDRESS,  
    APP_ID,  
    PAGE_ID,  
      
    TIPO_OPERACION,  
    ACCION,  
    CAMPO,  
    VALOR_ANTERIOR,  
    VALOR_NUEVO,  
    TIPO_CAMBIO,  
      
    MODULO,  
    CRITICIDAD,  
    CATEGORIA_CAMPO,  
    PERIODO,  
      
    FECHA_HORA,  
    FECHA,  
    HORA,  
    TO_CHAR(FECHA_HORA, 'Day') as DIA_SEMANA,  
    TO_CHAR(FECHA_HORA, 'Month YYYY') as MES_ANIO,  
      
  
    CASE   
        WHEN VALOR_ANTERIOR IS NULL THEN LENGTH(VALOR_NUEVO)  
        WHEN VALOR_NUEVO IS NULL THEN LENGTH(VALOR_ANTERIOR)  
        ELSE GREATEST(LENGTH(VALOR_ANTERIOR), LENGTH(VALOR_NUEVO))  
    END as LONGITUD_VALOR,  
      
  
    CASE WHEN CRITICIDAD = 'ALTA' THEN 1 ELSE 0 END as ES_CRITICO,  
    CASE WHEN PERIODO = 'HOY' THEN 1 ELSE 0 END as ES_HOY,  
    CASE WHEN ACCION = 'DELETE' THEN 1 ELSE 0 END as ES_ELIMINACION,  
      
  
    CASE   
        WHEN HORA BETWEEN '08:00:00' AND '14:59:59' THEN 'HORARIO_LABORAL'  
        WHEN HORA BETWEEN '14:00:00' AND '19:59:59' THEN 'HORARIO_EXTENDIDO'  
        ELSE 'HORARIO_NOCTURNO'  
    END as TIPO_HORARIO,  
      
    -- Para agrupaciones en reportes  
    TABLA || ' - ' || CAMPO as TABLA_CAMPO,  
    MODULO || ' (' || TABLA || ')' as MODULO_DETALLADO,  
      
    -- Ranking de cambios por usuario (útil para análisis)  
    DENSE_RANK() OVER (  
        PARTITION BY TABLA   
        ORDER BY FECHA_HORA DESC  
    ) as RANKING_CAMBIO_TABLA,  
      
    -- Secuencia de cambios por registro  
    ROW_NUMBER() OVER (  
        PARTITION BY TABLA, ID_REGISTRO   
        ORDER BY FECHA_HORA DESC  
    ) as SECUENCIA_CAMBIO_REGISTRO  
  
FROM V_AUDIT_GENERAL  
  
ORDER BY FECHA_HORA DESC, TABLA, CAMPO;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_AUDIT_EQUIPOS" ("AUDIT_ID", "USUARIO", "TIPO_OPERACION", "FECHA_HORA", "FECHA", "HORA", "TABLA_ORIGEN", "EQUIPO_ID", "TIPO_COMPONENTE", "REGISTRO_ID", "DETALLE_OLD_VALUE", "DETALLE_NEW_VALUE", "FECHA_HORA_FILTRO") AS 
  SELECT  
    am.AUDIT_ID, 
    am.APEX_USER as USUARIO, 
    am.ACTION_TYPE as TIPO_OPERACION, 
    am.TIMESTAMP as FECHA_HORA, 
    TO_CHAR(am.TIMESTAMP, 'DD/MM/YYYY') as FECHA, 
    TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') as HORA, 
    'SGT_EQUIPOS' as TABLA_ORIGEN, 
    TO_NUMBER((SELECT ad.PK_VALUE FROM AUDIT_DETAIL ad WHERE ad.AUDIT_ID = am.AUDIT_ID AND ad.TABLE_NAME = 'SGT_EQUIPOS' AND ROWNUM = 1)) as EQUIPO_ID, 
    'Equipo Principal' as TIPO_COMPONENTE, 
    (SELECT ad.PK_VALUE FROM AUDIT_DETAIL ad WHERE ad.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) as REGISTRO_ID, 
    -- CAMBIO: Concatenar TODOS los campos con LISTAGG 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.OLD_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad  
     WHERE ad.AUDIT_ID = am.AUDIT_ID  
     AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_OLD_VALUE, 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.NEW_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad  
     WHERE ad.AUDIT_ID = am.AUDIT_ID  
     AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_NEW_VALUE, 
    am.TIMESTAMP as FECHA_HORA_FILTRO 
FROM AUDIT_MASTER am 
WHERE EXISTS ( 
    SELECT 1 FROM AUDIT_DETAIL ad  
    WHERE ad.AUDIT_ID = am.AUDIT_ID 
    AND ad.TABLE_NAME = 'SGT_EQUIPOS' 
) 
AND am.ACTION_TYPE NOT IN ('INSERT', 'Inserción') 
 
UNION ALL 
 
-- ============================================================================ 
-- 2. Cambios en SGT_INTERFACES 
-- ============================================================================ 
SELECT  
    am.AUDIT_ID, 
    am.APEX_USER as USUARIO, 
    am.ACTION_TYPE as TIPO_OPERACION, 
    am.TIMESTAMP as FECHA_HORA, 
    TO_CHAR(am.TIMESTAMP, 'DD/MM/YYYY') as FECHA, 
    TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') as HORA, 
    'SGT_INTERFACES' as TABLA_ORIGEN, 
 
        /* EQUIPO_ID derivado solo de AUDIT_DETAIL - optimizado */ 
    TO_NUMBER(( 
        SELECT COALESCE(ad_eq.NEW_VALUE, ad_eq.OLD_VALUE) 
          FROM AUDIT_DETAIL ad_eq 
         WHERE ad_eq.TABLE_NAME = 'SGT_INTERFACES' 
           AND ad_eq.COLUMN_NAME = 'EQUIPO_ID' 
           AND ad_eq.PK_VALUE = ( 
                SELECT ad_pk.PK_VALUE 
                  FROM AUDIT_DETAIL ad_pk 
                 WHERE ad_pk.AUDIT_ID = am.AUDIT_ID 
                   AND ad_pk.TABLE_NAME = 'SGT_INTERFACES' 
                   AND ROWNUM = 1) 
           AND ad_eq.AUDIT_ID <= am.AUDIT_ID 
         ORDER BY CASE WHEN ad_eq.AUDIT_ID = am.AUDIT_ID THEN 0 ELSE 1 END, 
                  ad_eq.AUDIT_ID DESC 
         FETCH FIRST 1 ROW ONLY 
    )) as EQUIPO_ID, 
 
    'Interface' as TIPO_COMPONENTE, 
    (SELECT ad.PK_VALUE FROM AUDIT_DETAIL ad WHERE ad.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) as REGISTRO_ID, 
 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.OLD_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
       FROM AUDIT_DETAIL ad  
      WHERE ad.AUDIT_ID = am.AUDIT_ID  
        AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_OLD_VALUE, 
 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.NEW_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
       FROM AUDIT_DETAIL ad  
      WHERE ad.AUDIT_ID = am.AUDIT_ID  
        AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_NEW_VALUE, 
 
    am.TIMESTAMP as FECHA_HORA_FILTRO 
FROM AUDIT_MASTER am 
WHERE EXISTS ( 
    SELECT 1 FROM AUDIT_DETAIL ad  
    WHERE ad.AUDIT_ID = am.AUDIT_ID 
      AND ad.TABLE_NAME = 'SGT_INTERFACES' 
) 
AND am.ACTION_TYPE NOT IN ('INSERT', 'Inserción') 
 
UNION ALL 
 
-- ============================================================================ 
-- 3. Cambios en SGT_ENLACES_FO vista desde EQUIPO_ID_A 
-- ============================================================================ 
SELECT  
    am.AUDIT_ID, 
    am.APEX_USER as USUARIO, 
    am.ACTION_TYPE as TIPO_OPERACION, 
    am.TIMESTAMP as FECHA_HORA, 
    TO_CHAR(am.TIMESTAMP, 'DD/MM/YYYY') as FECHA, 
    TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') as HORA, 
    'SGT_ENLACES_FO' as TABLA_ORIGEN, 
    /* EQUIPO_ID_A derivado solo de AUDIT_DETAIL - optimizado */ 
    TO_NUMBER(( 
        SELECT COALESCE(ad_eq.NEW_VALUE, ad_eq.OLD_VALUE) 
          FROM AUDIT_DETAIL ad_eq 
         WHERE ad_eq.TABLE_NAME = 'SGT_ENLACES_FO' 
           AND ad_eq.COLUMN_NAME = 'EQUIPO_ID_A' 
           AND ad_eq.PK_VALUE = ( 
                SELECT ad_pk.PK_VALUE 
                  FROM AUDIT_DETAIL ad_pk 
                 WHERE ad_pk.AUDIT_ID = am.AUDIT_ID 
                   AND ad_pk.TABLE_NAME = 'SGT_ENLACES_FO' 
                   AND ROWNUM = 1) 
           AND ad_eq.AUDIT_ID <= am.AUDIT_ID 
         ORDER BY CASE WHEN ad_eq.AUDIT_ID = am.AUDIT_ID THEN 0 ELSE 1 END, 
                  ad_eq.AUDIT_ID DESC 
         FETCH FIRST 1 ROW ONLY 
    )) as EQUIPO_ID, 
    'Enlace FO' as TIPO_COMPONENTE, 
    (SELECT ad.PK_VALUE FROM AUDIT_DETAIL ad WHERE ad.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) as REGISTRO_ID, 
    -- CAMBIO: LISTAGG 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.OLD_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad  
     WHERE ad.AUDIT_ID = am.AUDIT_ID  
     AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_OLD_VALUE, 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.NEW_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad  
     WHERE ad.AUDIT_ID = am.AUDIT_ID  
     AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_NEW_VALUE, 
    am.TIMESTAMP as FECHA_HORA_FILTRO 
FROM AUDIT_MASTER am 
WHERE EXISTS ( 
    SELECT 1 FROM AUDIT_DETAIL ad  
    WHERE ad.AUDIT_ID = am.AUDIT_ID 
    AND ad.TABLE_NAME = 'SGT_ENLACES_FO' 
) 
AND am.ACTION_TYPE NOT IN ('INSERT', 'Inserción') 
 
UNION ALL 
 
-- ============================================================================ 
-- 4. Cambios en SGT_ENLACES_FO vista desde EQUIPO_ID_B 
-- ============================================================================ 
SELECT  
    am.AUDIT_ID, 
    am.APEX_USER as USUARIO, 
    am.ACTION_TYPE as TIPO_OPERACION, 
    am.TIMESTAMP as FECHA_HORA, 
    TO_CHAR(am.TIMESTAMP, 'DD/MM/YYYY') as FECHA, 
    TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') as HORA, 
    'SGT_ENLACES_FO' as TABLA_ORIGEN, 
    /* EQUIPO_ID_B derivado solo de AUDIT_DETAIL - optimizado */ 
    TO_NUMBER(( 
        SELECT COALESCE(ad_eq.NEW_VALUE, ad_eq.OLD_VALUE) 
          FROM AUDIT_DETAIL ad_eq 
         WHERE ad_eq.TABLE_NAME = 'SGT_ENLACES_FO' 
           AND ad_eq.COLUMN_NAME = 'EQUIPO_ID_B' 
           AND ad_eq.PK_VALUE = ( 
                SELECT ad_pk.PK_VALUE 
                  FROM AUDIT_DETAIL ad_pk 
                 WHERE ad_pk.AUDIT_ID = am.AUDIT_ID 
                   AND ad_pk.TABLE_NAME = 'SGT_ENLACES_FO' 
                   AND ROWNUM = 1) 
           AND ad_eq.AUDIT_ID <= am.AUDIT_ID 
         ORDER BY CASE WHEN ad_eq.AUDIT_ID = am.AUDIT_ID THEN 0 ELSE 1 END, 
                  ad_eq.AUDIT_ID DESC 
         FETCH FIRST 1 ROW ONLY 
    )) as EQUIPO_ID, 
    'Enlace FO' as TIPO_COMPONENTE, 
    (SELECT ad.PK_VALUE FROM AUDIT_DETAIL ad WHERE ad.AUDIT_ID = am.AUDIT_ID AND ROWNUM = 1) as REGISTRO_ID, 
    -- CAMBIO: LISTAGG 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.OLD_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad  
     WHERE ad.AUDIT_ID = am.AUDIT_ID  
     AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_OLD_VALUE, 
    (SELECT LISTAGG(ad.COLUMN_NAME || ': ' || COALESCE(ad.NEW_VALUE, '[NULL]'), ' | ')  
            WITHIN GROUP (ORDER BY ad.COLUMN_NAME) 
     FROM AUDIT_DETAIL ad  
     WHERE ad.AUDIT_ID = am.AUDIT_ID  
     AND (ad.OLD_VALUE IS NOT NULL OR ad.NEW_VALUE IS NOT NULL)) as DETALLE_NEW_VALUE, 
    am.TIMESTAMP as FECHA_HORA_FILTRO 
FROM AUDIT_MASTER am 
WHERE EXISTS ( 
    SELECT 1 FROM AUDIT_DETAIL ad  
    WHERE ad.AUDIT_ID = am.AUDIT_ID 
    AND ad.TABLE_NAME = 'SGT_ENLACES_FO' 
) 
AND am.ACTION_TYPE NOT IN ('INSERT', 'Inserción') 
 
ORDER BY FECHA_HORA_FILTRO DESC, AUDIT_ID DESC;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_AUDIT_GENERAL" ("AUDIT_ID", "USUARIO", "USUARIO_BD", "ACCION", "FECHA_HORA", "FECHA", "HORA", "APP_ID", "PAGE_ID", "IP_ADDRESS", "TABLA", "CAMPO", "VALOR_ANTERIOR", "VALOR_NUEVO", "ID_REGISTRO", "COLUMNA_PK", "TIPO_OPERACION", "TIPO_CAMBIO", "MODULO", "CRITICIDAD", "PERIODO", "CATEGORIA_CAMPO", "NOMBRE_REGISTRO") AS 
  SELECT  
    am.AUDIT_ID, 
    am.APEX_USER as USUARIO, 
    am.DB_USER as USUARIO_BD, 
    am.ACTION_TYPE as ACCION, 
    am.TIMESTAMP as FECHA_HORA, 
    TO_CHAR(am.TIMESTAMP, 'DD/MM/YYYY') as FECHA, 
    TO_CHAR(am.TIMESTAMP, 'HH24:MI:SS') as HORA, 
    am.APP_ID, 
    am.PAGE_ID, 
    am.IP_ADDRESS, 
    ad.TABLE_NAME as TABLA, 
    ad.COLUMN_NAME as CAMPO, 
    ad.OLD_VALUE as VALOR_ANTERIOR, 
    ad.NEW_VALUE as VALOR_NUEVO, 
    ad.PK_VALUE as ID_REGISTRO, 
    ad.PK_COLUMN as COLUMNA_PK, 
     
 
    CASE  
        WHEN am.ACTION_TYPE = 'INSERT' THEN 'Creación' 
        WHEN am.ACTION_TYPE = 'UPDATE' THEN 'Modificación' 
        WHEN am.ACTION_TYPE = 'DELETE' THEN 'Eliminación' 
        ELSE am.ACTION_TYPE 
    END as TIPO_OPERACION, 
     
 
    CASE  
        WHEN ad.OLD_VALUE IS NULL AND ad.NEW_VALUE IS NOT NULL THEN 'CREADO' 
        WHEN ad.OLD_VALUE IS NOT NULL AND ad.NEW_VALUE IS NULL THEN 'ELIMINADO' 
        WHEN ad.OLD_VALUE != ad.NEW_VALUE THEN 'MODIFICADO' 
        ELSE 'SIN_CAMBIO' 
    END as TIPO_CAMBIO, 
 
    CASE  
        WHEN ad.TABLE_NAME = 'SGT_SITIOS' THEN 'Gestión de Sitios' 
        WHEN ad.TABLE_NAME = 'SGT_EQUIPOS' THEN 'Gestión de Equipos' 
        WHEN ad.TABLE_NAME = 'SGT_INTERFACES' THEN 'Gestión de Interfaces' 
        WHEN ad.TABLE_NAME = 'SGT_ENLACES_FO' THEN 'Gestión de Enlaces de Fibra Óptica' 
        WHEN ad.TABLE_NAME = 'SGT_ENLACES_TRAMOS' THEN 'Gestión de Enlaces - Tramos' 
       -- WHEN ad.TABLE_NAME = 'SGT_ENLACES_LOGICOS' THEN 'Gestión de Enlaces Lógicos' 
       -- WHEN ad.TABLE_NAME = 'SGT_ENLACE_LOGICO_TRAMO' THEN 'Gestión de Enlace Lógico - Tramos' 
        WHEN ad.TABLE_NAME = 'SGT_SERVICIOS' THEN 'Gestión de Servicios' 
        WHEN ad.TABLE_NAME = 'SGT_RACKS' THEN 'Gestión de Racks' 
    WHEN ad.TABLE_NAME = 'SGT_CONEXIONES_SERVICIO' THEN 'Gestión de Conexiones - Servicio' 
    WHEN ad.TABLE_NAME = 'SGT_ENLACES_WAN_SERVICIO' THEN 'Gestión de Servicios - Enlaces WAN' 
    WHEN ad.TABLE_NAME = 'SGT_CONEXIONES_ENLACE_WAN' THEN 'Gestión de Conexiones - Enlace WAN' 
    WHEN ad.TABLE_NAME = 'SGT_SITIOS_SERVICIO' THEN 'Gestión de Sitios - Servicios' 
    WHEN ad.TABLE_NAME = 'SGT_SITIOS_ENLACE_WAN' THEN 'Gestión de Sitios - Enlaces WAN' 
        WHEN ad.TABLE_NAME = 'SGT_ZONAS' THEN 'Gestión de Zonas' 
        WHEN ad.TABLE_NAME = 'SGT_TIPO_INTERFAZ' THEN 'Gestión de Tipos de Interfaz' 
        WHEN ad.TABLE_NAME = 'SGT_TIPO_EQUIPOS' THEN 'Gestión de Tipos de Equipos' 
        WHEN ad.TABLE_NAME = 'SGT_TIPO_CABLE' THEN 'Gestión de Tipos de Cable' 
        WHEN ad.TABLE_NAME = 'SGT_SALAS' THEN 'Gestión de Salas' 
        WHEN ad.TABLE_NAME = 'SGT_DEPTO' THEN 'Gestión de Departamentos' 
        WHEN ad.TABLE_NAME = 'SGT_CIUDAD' THEN 'Gestión de Ciudades' 
        ELSE REPLACE(ad.TABLE_NAME, 'SGT_', 'Sistema ') 
    END as MODULO, 
     
    CASE  
        -- Criticidad basada en el campo principalmente, con DELETE como excepción 
        WHEN ad.COLUMN_NAME IN ('ESTADO', 'ACTIVO', 'PRECIO', 'COSTO', 'VALOR', 'NOMBRE', 'IP_GESTION', 'VERSION_SOFTWARE', 'SITIO_ID', 'TX_EN_DBM', 'RX_EN_DBM', 'MAC_ADDRESS', 'CERTIFICACIÓN', 'ABS_LONGITUD', 'TIPO_CONEXION', 'SITIO_A_ID', 'SITIO_B_ID', 'EQUIPO_A_ID', 'EQUIPO_B_ID', 'INTERFAZ_A_ID', 'INTERFAZ_B_ID', 'ENLACE_LOGICO_ID', 'ENLACE_WAN_ID', 'TRAMO_ID', 'SERVICIO_ID', 'NIVEL_DE_PRIORIDAD', 'SALA_ID', 'CAPITAL', 'DEPTO_ID') THEN 'ALTA' 
        WHEN ad.COLUMN_NAME IN ('TIPO_EQUIPO_ID', 'MARCA', 'MODELO', 'SERIAL_NUMBER', 'VERSION_HARDWARE', 'MODO', 'DUPLEX', 'TIPO_INTERFACE_ID', 'NUMERO_SERIE', 'HW_VERSION', 'SW_VERSION', 'SITIO_ID_A', 'SITIO_ID_B', 'EQUIPO_ID_A', 'EQUIPO_ID_B', 'TIPO_DE_FO', 'TIPO', 'CANTIDAD_DE_PELOS', 'LADO_ID', 'GRUPO_RED', 'ALTURA_U', 'VALOR', 'MOSTRAR', 'GRUPO_CABLES', 'SIGLAS') THEN 'MEDIA' 
        WHEN ad.COLUMN_NAME IN ('ENLACE_ID', 'COMENTARIOS', 'OBSERVACIONES', 'OBSERVACION', 'PROYECTO_DE_IMPLEMENTACIÓN', 'PROYECTO_ID', 'FECHA_IMPLEMENTACIÓN', 'FECHA_IMPLE', 'UNIDAD_ENCARGADA_ACTUAL', 'UNIDAD_ENCARGADA', 'PROPIETARIO', 'ETIQUETA', 'TIPO_CABLE', 'TIPO_TENDIDO', 'CONECTOR', 'LT', 'UNIDAD_MEDIDA', 'INFORMACIÓN_ADICIONAL', 'DETALLE', 'DIMENSIONES') THEN 'BAJA' 
        -- DELETE siempre es ALTA independientemente del campo 
        WHEN am.ACTION_TYPE = 'DELETE' THEN 'ALTA' 
        -- INSERT por defecto es MEDIA si no está clasificado específicamente 
        WHEN am.ACTION_TYPE = 'INSERT' THEN 'MEDIA' 
        ELSE 'BAJA' 
    END as CRITICIDAD, 
     
 
    CASE  
        WHEN am.TIMESTAMP >= SYSDATE - 1 THEN 'HOY' 
        WHEN am.TIMESTAMP >= SYSDATE - 7 THEN 'ESTA_SEMANA' 
        WHEN am.TIMESTAMP >= SYSDATE - 30 THEN 'ESTE_MES' 
        ELSE 'ANTERIOR' 
    END as PERIODO, 
 
    -- Categorización de campos para análisis 
    CASE  
        WHEN ad.COLUMN_NAME IN ('NOMBRE', 'SIGLAS', 'NI_ANDE', 'SERIAL_NUMBER', 'NUMERO_SERIE', 'ETIQUETA') THEN 'IDENTIFICACIÓN' 
        WHEN ad.COLUMN_NAME IN ('ESTADO', 'ACTIVO', 'MODO', 'DUPLEX', 'NIVEL_DE_PRIORIDAD') THEN 'ESTADO' 
        WHEN ad.COLUMN_NAME IN ('TIPO_EQUIPO_ID', 'SUB_TIPO_EQUIPO', 'TIPO_DE_SITIO', 'TIPO_RED', 'TIPO_INTERFACE_ID', 'TIPO_DE_FO', 'TIPO', 'TIPO_CABLE', 'TIPO_TENDIDO', 'TIPO_CONEXION') THEN 'CLASIFICACIÓN' 
        WHEN ad.COLUMN_NAME IN ('MARCA', 'MODELO', 'VERSION_HARDWARE', 'HW_VERSION') THEN 'HARDWARE' 
        WHEN ad.COLUMN_NAME IN ('VERSION_SOFTWARE', 'VERSION_PATCH', 'SW_VERSION') THEN 'SOFTWARE' 
        WHEN ad.COLUMN_NAME IN ('IP_GESTION', 'TIPO_RED', 'MAC_ADDRESS') THEN 'CONECTIVIDAD' 
        WHEN ad.COLUMN_NAME IN ('SITIO_ID', 'RACK_ID', 'U', 'ALTURA_U', 'POSICION', 'ZONA_ID', 'CIUDAD_ID', 'LATITUD', 'LONGITUD', 'UBICACIÓN', 'EQUIPO_ID', 'SITIO_ID_A', 'SITIO_ID_B', 'EQUIPO_ID_A', 'EQUIPO_ID_B', 'EQUIPO_A_ID', 'EQUIPO_B_ID', 'LADO_ID', 'SITIO_A_ID', 'SITIO_B_ID', 'SALA_ID', 'DIMENSIONES', 'PARENT_ID', 'DEPTO_ID', 'CAPITAL') THEN 'UBICACIÓN' 
        WHEN ad.COLUMN_NAME IN ('ALIMENTACION1_ID', 'ALIMENTACION2_ID') THEN 'INFRAESTRUCTURA' 
        WHEN ad.COLUMN_NAME IN ('UNIDAD_ENCARGADA', 'PROPIETARIO', 'UNIDAD_ENCARGADA_ACTUAL') THEN 'RESPONSABILIDAD' 
        WHEN ad.COLUMN_NAME IN ('PROYECTO_ID', 'FECHA_IMPLE', 'PROYECTO_DE_IMPLEMENTACIÓN', 'FECHA_IMPLEMENTACIÓN') THEN 'GESTIÓN' 
    WHEN ad.COLUMN_NAME IN ('OBSERVACION', 'OBSERVACIONES', 'COMENTARIOS', 'DESCRIPCION', 'DETALLE', 'VALOR', 'MOSTRAR', 'GRUPO_CABLES') THEN 'DOCUMENTACIÓN' 
        WHEN ad.COLUMN_NAME IN ('TX_EN_DBM', 'RX_EN_DBM') THEN 'SEÑAL_ÓPTICA' 
        WHEN ad.COLUMN_NAME IN ('CERTIFICACIÓN', 'ABS_LONGITUD', 'UNIDAD_MEDIDA', 'CANTIDAD_DE_PELOS', 'LT', 'CONECTOR') THEN 'FIBRA_ÓPTICA' 
        WHEN ad.COLUMN_NAME IN ('INTERFAZ_A_ID', 'INTERFAZ_B_ID', 'ENLACE_ID', 'ENLACE_WAN_ID', 'GRUPO_RED', 'ENLACE_LOGICO_ID', 'TRAMO_ID', 'SERVICIO_ID') THEN 'CONECTIVIDAD_LÓGICA' 
        ELSE 'OTROS' 
    END as CATEGORIA_CAMPO, 
 
    -- Información contextual del registro 
    CASE  
        WHEN ad.TABLE_NAME = 'SGT_SITIOS' THEN  
            COALESCE( 
                (SELECT s.NOMBRE FROM SGT_SITIOS s WHERE s.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Sitio ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_EQUIPOS' THEN  
            COALESCE( 
                (SELECT e.NOMBRE FROM SGT_EQUIPOS e WHERE e.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Equipo ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_INTERFACES' THEN  
            COALESCE( 
                (SELECT i.NOMBRE FROM SGT_INTERFACES i WHERE i.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Interface ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_ENLACES_FO' THEN  
            COALESCE( 
                (SELECT ef.NOMBRE FROM SGT_ENLACES_FO ef WHERE ef.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Enlace FO ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_ENLACES_TRAMOS' THEN  
            COALESCE( 
                (SELECT et.NOMBRE FROM SGT_ENLACES_TRAMOS et WHERE et.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Enlace Tramo ID: ' || ad.PK_VALUE 
            ) 
       /* WHEN ad.TABLE_NAME = 'SGT_ENLACES_LOGICOS' THEN  
            COALESCE( 
                (SELECT el.NOMBRE FROM SGT_ENLACES_LOGICOS el WHERE el.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Enlace Lógico ID: ' || ad.PK_VALUE 
            )*/ 
        WHEN ad.TABLE_NAME = 'SGT_SERVICIOS' THEN  
            COALESCE( 
                (SELECT s.NOMBRE FROM SGT_SERVICIOS s WHERE s.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Servicio ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_RACKS' THEN  
            COALESCE( 
                (SELECT r.NOMBRE FROM SGT_RACKS r WHERE r.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Rack ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_ZONAS' THEN  
            COALESCE( 
                (SELECT z.NOMBRE FROM SGT_ZONAS z WHERE z.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Zona ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_TIPO_INTERFAZ' THEN  
            COALESCE( 
                (SELECT ti.NOMBRE FROM SGT_TIPO_INTERFAZ ti WHERE ti.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Tipo Interfaz ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_TIPO_EQUIPOS' THEN  
            COALESCE( 
                (SELECT te.NOMBRE FROM SGT_TIPO_EQUIPOS te WHERE te.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Tipo Equipo ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_TIPO_CABLE' THEN  
            COALESCE( 
                (SELECT tc.NOMBRE FROM SGT_TIPO_CABLE tc WHERE tc.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Tipo Cable ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_SALAS' THEN  
            COALESCE( 
                (SELECT s.NOMBRE FROM SGT_SALAS s WHERE s.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Sala ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_DEPTO' THEN  
            COALESCE( 
                (SELECT d.NOMBRE FROM SGT_DEPTO d WHERE d.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Departamento ID: ' || ad.PK_VALUE 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_CIUDAD' THEN  
            COALESCE( 
                (SELECT c.NOMBRE FROM SGT_CIUDAD c WHERE c.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Ciudad ID: ' || ad.PK_VALUE 
            ) 
        /*WHEN ad.TABLE_NAME = 'SGT_ENLACE_LOGICO_TRAMO' THEN  
            'Relación Enlace-Tramo ID: ' || ad.PK_VALUE || 
            COALESCE( 
                ' (EL:' || (SELECT elt.ENLACE_LOGICO_ID FROM SGT_ENLACE_LOGICO_TRAMO elt WHERE elt.ID = TO_NUMBER(ad.PK_VALUE)) || 
                ' - TR:' || (SELECT elt.TRAMO_ID FROM SGT_ENLACE_LOGICO_TRAMO elt WHERE elt.ID = TO_NUMBER(ad.PK_VALUE)) || ')', 
                '' 
            )*/ 
        WHEN ad.TABLE_NAME = 'SGT_CONEXIONES_SERVICIO' THEN  
            'Conexión Servicio ID: ' || ad.PK_VALUE || 
            COALESCE( 
                ' (SRV:' || (SELECT cs.SERVICIO_ID FROM SGT_CONEXIONES_SERVICIO cs WHERE cs.ID = TO_NUMBER(ad.PK_VALUE)) || 
                ' - ENL_TRAMO:' || (SELECT cs.ENLACE_TRAMO_ID FROM SGT_CONEXIONES_SERVICIO cs WHERE cs.ID = TO_NUMBER(ad.PK_VALUE)) || ')', 
                '' 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_ENLACES_WAN_SERVICIO' THEN  
            'Relación Servicio-Enlace WAN ID: ' || ad.PK_VALUE || 
            COALESCE( 
                ' (SRV:' || (SELECT ews.SERVICIO_ID FROM SGT_ENLACES_WAN_SERVICIO ews WHERE ews.ID = TO_NUMBER(ad.PK_VALUE)) || 
                ' - ENL:' || (SELECT ews.ENLACE_ID FROM SGT_ENLACES_WAN_SERVICIO ews WHERE ews.ID = TO_NUMBER(ad.PK_VALUE)) || ')', 
                '' 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_SITIOS_ENLACE_WAN' THEN  
            'Relación Sitio-Enlace WAN ID: ' || ad.PK_VALUE || 
            COALESCE( 
                ' (SITIO:' || (SELECT sew.SITIO_ID FROM SGT_SITIOS_ENLACE_WAN sew WHERE sew.ID = TO_NUMBER(ad.PK_VALUE)) || 
                ' - ENL_WAN:' || (SELECT sew.ENLACE_WAN_ID FROM SGT_SITIOS_ENLACE_WAN sew WHERE sew.ID = TO_NUMBER(ad.PK_VALUE)) || ')', 
                '' 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_CONEXIONES_ENLACE_WAN' THEN  
            'Conexión Enlace WAN ID: ' || ad.PK_VALUE || 
            COALESCE( 
                ' (ENL_TRAMO:' || (SELECT cew.ENLACE_TRAMO_ID FROM SGT_CONEXIONES_ENLACE_WAN cew WHERE cew.ID = TO_NUMBER(ad.PK_VALUE)) || 
                ' - ENL_WAN:' || (SELECT cew.ENLACE_WAN_ID FROM SGT_CONEXIONES_ENLACE_WAN cew WHERE cew.ID = TO_NUMBER(ad.PK_VALUE)) || ')', 
                '' 
            ) 
        WHEN ad.TABLE_NAME = 'SGT_SITIOS_SERVICIO' THEN  
            'Relación Sitio-Servicio ID: ' || ad.PK_VALUE || 
            COALESCE( 
                ' (SITIO:' || (SELECT sss.SITIO_ID FROM SGT_SITIOS_SERVICIO sss WHERE sss.ID = TO_NUMBER(ad.PK_VALUE)) || 
                ' - SRV:' || (SELECT sss.SERVICIO_ID FROM SGT_SITIOS_SERVICIO sss WHERE sss.ID = TO_NUMBER(ad.PK_VALUE)) || ')', 
                '' 
            ) 
        ELSE 'Registro ID: ' || ad.PK_VALUE 
    END as NOMBRE_REGISTRO 
 
FROM AUDIT_MASTER am 
JOIN AUDIT_DETAIL ad ON am.AUDIT_ID = ad.AUDIT_ID 
ORDER BY am.TIMESTAMP DESC, ad.COLUMN_NAME;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CONEXIONES_GENERAL_V2" ("SERV_ID", "SERVICIO", "NIVEL_DE_PRIORIDAD", "EQ_ID", "EQ", "IFACE_ID", "IFACE", "EQ_B_ID", "EQ_B", "IFACE_B_ID", "IFACE_B", "CONN_ID", "TIPO_CONEXION", "FO_ID", "FO_NOMBRE", "SEQ", "WAN_ID", "WAN", "SEQ_WAN") AS 
  SELECT  
    serv.id                AS SERV_ID, 
    serv.nombre            AS SERVICIO, 
    serv.nivel_de_prioridad, 
    
    et.equipo_a_id         AS EQ_ID, 
    eq_a.nombre            AS EQ, 
    
    et.interfaz_a_id       AS IFACE_ID, 
    iface_a.nombre         AS IFACE,  
    
    et.equipo_b_id         AS EQ_B_ID, 
    eq_b.nombre            AS EQ_B, 
    
    et.interfaz_b_id       AS IFACE_B_ID, 
    iface_b.nombre         AS IFACE_B, 
    
    et.id                  AS CONN_ID, 
    et.tipo_conexion,  
    
    fo.id                  AS FO_ID, 
    fo.nombre              AS FO_NOMBRE,  
    
    conexionesServ.seq,
    
    conexionesWan.enlace_wan_id  AS WAN_ID, 
    wan.nombre                   AS WAN,
    conexionesWan.secuencia      as SEQ_WAN  

FROM sgt_enlaces_tramos et

LEFT JOIN sgt_conexiones_servicio conexionesServ 
    ON conexionesServ.enlace_tramo_id = et.id 

LEFT JOIN sgt_servicios serv  
    ON serv.id = conexionesServ.servicio_id 

LEFT JOIN SGT_CONEXIONES_ENLACE_WAN conexionesWan 
    ON conexionesWan.enlace_tramo_id = et.id  

LEFT JOIN sgt_enlaces_wan wan 
    ON wan.id = conexionesWan.enlace_wan_id 

JOIN sgt_interfaces iface_a 
    ON iface_a.id = et.interfaz_a_id 

JOIN sgt_interfaces iface_b 
    ON iface_b.id = et.interfaz_b_id 

JOIN sgt_equipos eq_a 
    ON eq_a.id = et.equipo_a_id 

JOIN sgt_equipos eq_b 
    ON eq_b.id = et.equipo_b_id 

LEFT JOIN sgt_enlaces_fo fo 
    ON fo.equipo_id_a = et.equipo_a_id 
   AND fo.equipo_id_b = et.equipo_b_id   

ORDER BY serv.id, et.id, conexionesServ.seq;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SERVICIOS" ("SERVICIO", "NIVEL_DE_PRIORIDAD", "SITIOS", "WAN", "EQUIPO", "INTERFACE", "FO", "SEQ", "WAN_SEQ") AS 
  Select ss.nombre servicio, ss.nivel_de_prioridad , s.siglas, null as wan , equipos.nombre Equipo, iface.nombre Interface, null as fo, es.seq, null as wan_seq 

from

sgt_equipos_servicio es


join sgt_equipos equipos on equipos.id = es.equipo_a_id
left join sgt_interfaces iface on iface.id = es.interfaz_a_id
left join sgt_sitios s on s.id = equipos.sitio_id
left join sgt_servicios ss on ss.id = es.servicio_id

union 

select ss.nombre Servicio, ss.nivel_de_prioridad , s.siglas, wan.nombre , equipos.nombre equipo, iface.nombre Interface, null as fo, es.seq, ew.seq 

from

sgt_equipos_wan ew

join sgt_enlaces_wan wan on wan.id = ew.wan_id
join sgt_equipos_servicio es on es.wan_id = ew.wan_id
join sgt_equipos equipos on equipos.id = ew.equipo_a_id
left join sgt_interfaces iface on iface.id = ew.interfaz_a_id
left join sgt_sitios s on s.id = equipos.sitio_id
left join sgt_servicios ss on ss.id = es.servicio_id

order by Servicio, seq, wan_seq;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SITIOS_EQUIPOS" ("SITIO_ID", "EQUIPO_ID") AS 
  select ss.id sitio_id, e.id equipo_id
from 
sgt_equipos e
 inner join sgt_racks r on e.rack_id = r.id
 inner join sgt_salas s on r.sala_id = s.id
 inner join sgt_sitios ss on s.sitio_id = ss.id;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SITIOS_GPS" ("ID", "ZONA_ID", "ZONA", "DEPARTAMENTO", "CIUDAD", "SIGLAS", "TIPO_SITIO", "LAT", "LON", "URL") AS 
  SELECT  s."ID", z.id, z.nombre,d.nombre, c.nombre ,s."SIGLAS", s.tipo_de_sitio, (LATITUD), (LONGITUD), "UBICACIÓN" 
  FROM  sgt_sitios s
  left JOIN SGT_CIUDAD c on  s.ciudad_id = c.id
  left join sgt_depto d on  c.depto_id = d.id
  join sgt_zonas z on s.zona_id = z.id;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TRAMOS_NOMBRES" ("ID", "SITIO_A", "SITIO_A_ID", "EQUIPO_A", "EQUIPO_A_ID", "IFACE_A_ID", "INTERFAZ_A", "ETIQUETA_A", "SITIO_B", "SITIO_B_ID", "EQUIPO_B", "EQUIPO_B_ID", "IFACE_B_ID", "INTERFAZ_B", "ETIQUETA_B", "TIPO_CONEXION", "ENLACE_ID") AS 
  SELECT  
    et.id, 
    -- Lado A 
    sitio_a.siglas, 
    sitio_a.id, 
    eq_a.nombre AS equipo_a,
    eq_a.id as equipo_a_id, 
    inter_a.id as IFACE_A_ID,
    inter_a.nombre AS interfaz_a, 
    inter_a.etiqueta as etiqueta_a,
    -- Lado B 
    sitio_b.siglas, 
    sitio_b.id, 
    eq_b.nombre AS equipo_b,
    eq_b.id as equipo_b_id, 
    inter_B.id as IFACE_B_ID,
    inter_b.nombre AS interfaz_b, 
    inter_b.etiqueta as etiqueta_b,
    et.tipo_conexion as tipo_conexion, 
    et.enlace_id as enlace_id 
FROM  
    sgt_enlaces_tramos et 
 
    INNER JOIN sgt_equipos eq_a ON et.equipo_a_id = eq_a.id 
    INNER JOIN sgt_interfaces inter_a ON et.interfaz_a_id = inter_a.id 
    inner join sgt_racks racks_a on eq_a.rack_id = racks_a.id 
    INNER JOIN sgt_salas salas_a on  racks_a.sala_id = salas_a.id 
    INNER JOIN sgt_sitios sitio_a on salas_a.sitio_id = sitio_a.id 
 
    INNER JOIN sgt_equipos eq_b ON et.equipo_b_id = eq_b.id 
    INNER JOIN sgt_interfaces inter_b ON et.interfaz_b_id = inter_b.id 
    inner join sgt_racks racks_b on eq_b.rack_id = racks_b.id 
    INNER JOIN sgt_salas salas_b on racks_b.sala_id = salas_b.id 
    inner join sgt_sitios sitio_b on  salas_b.sitio_id = sitio_b.id 
    order by et.id;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ZONAS_VISTA_GENERAL" ("Z_ID", "Z_NOMBRE", "SITIO_ID", "SITIO_NOMBRE", "SITIO_SIGLAS", "SALA_ID", "SALA_NOMBRE", "SALA_SIGLAS", "RACK_ID", "RACK_NOMBRE", "EQUIPO_ID", "EQUIPO_NOMBRE", "TIPO_EQUIPO_ID", "TIPO_EQUIPO_NOMBRE") AS 
  select z.id, z.nombre, s.id, s.nombre, s.siglas ,
  sa.id, sa.nombre, sa.siglas,
  ra.id, ra.nombre,
  e.id, e.nombre,
  te.id, te.nombre
  from sgt_zonas z
  inner join sgt_sitios s on z.id = s.zona_id
  INNER JOIN SGT_SALAS sa on s.id = sa.sitio_id
  INNER JOIN SGT_RACKS ra on sa.id = ra.sala_id
  INNER JOIN SGT_EQUIPOS e on ra.id = e.rack_id
  inner join sgt_tipo_equipos te on te.id = e.tipo_equipo_id
  WHERE z.parent_id is not null; 