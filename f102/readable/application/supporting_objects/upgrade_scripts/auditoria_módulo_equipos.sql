
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