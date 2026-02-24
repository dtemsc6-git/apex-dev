rem 
rem 'Modificar equipos'
rem
--alter table "SGT_EQUIPOS" modify ("SITIO_ID" NUMBER not null);
--alter table "SGT_EQUIPOS" modify ("RACK_ID" NUMBER not null);
--alter table "SGT_EQUIPOS" modify ("ALTURA_U" NUMBER not null);
--alter table "SGT_EQUIPOS" modify ("NOMBRE" VARCHAR2(60 BYTE) not null);
--alter table "SGT_EQUIPOS" modify ("TIPO_EQUIPO_ID" NUMBER not null);
alter table "SGT_EQUIPOS" modify ("TIPO_RED" VARCHAR2(50 BYTE) not null);
alter table "SGT_EQUIPOS" modify ("ESTADO" VARCHAR2(50 BYTE) not null);