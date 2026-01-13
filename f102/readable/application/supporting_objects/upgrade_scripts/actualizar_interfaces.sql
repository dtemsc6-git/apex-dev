alter table "WKSP_DTESC"."SGT_INTERFACES" drop column "MODO";
alter table "WKSP_DTESC"."SGT_INTERFACES" drop column "DUPLEX";
alter table "WKSP_DTESC"."SGT_INTERFACES" drop column "NUMERO_SERIE";
alter table "WKSP_DTESC"."SGT_INTERFACES" drop column "HW_VERSION";
alter table "WKSP_DTESC"."SGT_INTERFACES" drop column "SW_VERSION";
alter table "WKSP_DTESC"."SGT_INTERFACES" add ("VELOCIDAD_MPBS" NUMBER);

ALTER TABLE sgt_interfaces 
DROP CONSTRAINT SGT_INTERFACES_ESTADO_CK;

--Crear nuevamente el constraint con el nuevo conjunto de valores permitidos
ALTER TABLE sgt_interfaces 
ADD CONSTRAINT SGT_INTERFACES_ESTADO_CK 
CHECK (estado IN ('NA', 'UP', 'DOWN')) ENABLE;

alter table SGT_INTERFACES
DROP CONSTRAINT "SGT_INTERFACES_EQUIPO_UNIQUE";
alter table "SGT_INTERFACES" add constraint
"SGT_INTERFACES_EQUIPO_UNIQUE" unique ( "EQUIPO_ID", "NOMBRE" );
