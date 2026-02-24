Rem
Rem  modificar_sgt_sitios
Rem
/*
Script para modificar la tabla: sgt_sitios
Se necesita modificar el tipo de datos de los campos latitud y longitud
Se necesita actualizar los datos a formato decimal
Se necesita renombrar los viejos campos 
Se necesita renombrar los nuevos campos 
Se necesita restringir los valores de los campos.
*/

ALTER TABLE sgt_sitios ADD lat NUMBER(9,6);
ALTER TABLE sgt_sitios ADD lon NUMBER(9,6);
update sgt_sitios set lat=SEXAGESIMAL_TO_DECIMAL(latitud), lon=SEXAGESIMAL_TO_DECIMAL(longitud);
ALTER TABLE sgt_sitios RENAME COLUMN latitud TO latitud_old;
ALTER TABLE sgt_sitios RENAME COLUMN longitud TO longitud_old;
ALTER TABLE sgt_sitios RENAME COLUMN lat TO latitud;
ALTER TABLE sgt_sitios RENAME COLUMN lon TO longitud;
ALTER TABLE "SGT_SITIOS" ADD CONSTRAINT "SGT_SITIOS_LATITUD_CHK"  CHECK ( "LATITUD" between -90 and 90  ) ENABLE;
ALTER TABLE "SGT_SITIOS" ADD CONSTRAINT "SGT_SITIOS_LONGITUD_CHK" CHECK ( "LONGITUD" BETWEEN -180 AND 180 ) ENABLE;

Rem
Rem  modificar_sgt_racks
Rem
/*
Se necesita modificar el tipo de datos del campo sgt_racks.altura_u
Ahora esta como varchar2(50), se necesita que sea number(2)
Se necesita agregar un constraint para validar que los datos puedan ser valores de 1 a 60

*/
ALTER TABLE sgt_racks ADD altura_u_tmp NUMBER(2);
--Actualizar datos:
UPDATE sgt_racks SET altura_u_tmp = TO_NUMBER(altura_u);
--Drop del campo sin uso:
ALTER TABLE sgt_racks DROP COLUMN altura_u;
--Renombrar el nuevo campo
ALTER TABLE sgt_racks RENAME COLUMN altura_u_tmp TO altura_u;
--Activar el constraint
ALTER TABLE sgt_racks ADD CONSTRAINT sgt_racks_altura_u_ck CHECK (altura_u BETWEEN 1 AND 60);

