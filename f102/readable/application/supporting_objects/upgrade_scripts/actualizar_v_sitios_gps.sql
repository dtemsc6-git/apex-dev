  rem
  rem 'Eliminar la vista actual de SITIOS_GPS'
  rem

  drop view "V_SITIOS_GPS" ;
  
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SITIOS_GPS" ("ID", "ZONA_ID", "ZONA", "DEPARTAMENTO", "CIUDAD", "SIGLAS", "TIPO_SITIO", "LAT", "LON", "URL") AS 
  SELECT  s."ID", z.id, z.nombre,d.nombre, c.nombre ,s."SIGLAS", s.tipo_de_sitio, (LATITUD), (LONGITUD), "UBICACIÓN" 
  FROM  sgt_sitios s
  left JOIN SGT_CIUDAD c on  s.ciudad_id = c.id
  left join sgt_depto d on  c.depto_id = d.id
  join sgt_zonas z on s.zona_id = z.id;