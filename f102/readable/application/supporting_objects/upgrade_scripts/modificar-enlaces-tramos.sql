rem
rem 'Actualizando datos de sg_enlaces_tramos'
rem

alter table "SGT_ENLACES_TRAMOS" modify ("EQUIPO_A_ID" NUMBER not null);
alter table "SGT_ENLACES_TRAMOS" modify ("EQUIPO_B_ID" NUMBER not null);