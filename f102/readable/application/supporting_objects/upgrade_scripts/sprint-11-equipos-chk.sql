rem
rem 'Actualizar estructura de la tabla SGT_EQUIPOS'
rem

ALTER TABLE SGT_EQUIPOS DROP CONSTRAINT CHK_ESTADOS_VALUES;

ALTER TABLE SGT_EQUIPOS ADD CONSTRAINT CHK_ESTADOS_VALUES
CHECK (estado IN ('Utilizado', 'No utilizado / Apagado', 'Desconocido', 'Baja', 'Planificado')) ENABLE;