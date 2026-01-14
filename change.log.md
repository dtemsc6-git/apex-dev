Control de cambios de la App antes del commit
2026-01-13
LOV EQUIPO.ESTADO: Agregado valores de acuerdo al DER 
DL_EQUIPOS: P6: Agregado platilla XLS para descarga.
SGT_UBICAR_RACK: P37: Cambio de textos de Front a FRONT, Back a BACK para respetar valores de la db
Agregar Interfaces a Multiples Equipos: P60: Agregado plantilla XLS para descarga
Scripts de Actualización de la db.

2026-01-12

cambios en las siguientes vistas:

SGT_LST_SALAS: P4

++centrado de las columnas, 
--se eliminan columnas innecesarias, 
++Renombrado de label para columnas

FORM_SALAS: P5

++Forma de mostrar Popups de LOV, 
--Se elimina el campo depto 
++Se agrega esa info al Popup de Ciudad.
++Cambio en los labels de algunos campos.

Dataloader Equipos: P6

Corrección de errores de tipeo, 
++aumento de la cantidad de 100 a 200 kb para Archivos, 
++se agregó la capacidad de seleccionar la pagina a ser cargada en db. 
--se elimina sub equipo de los datos a subir. 
--Se elimina las conversiones de mayúsculas a minúsculas.

SGT_LST_INTERFACES: P8

++Se ordenan mejor los campos.
++Se alinea al centro los encabezados.
++se pone la paginación en la parte superior. 
++Mejoras en el boton Importar XLS.

SGT_LST_RACKS:P11

++Se ordenan mejor los campos, 
++Se alinea al centro los encabezados, 
++Se pone la paginación en la parte superior.

SGT_FORM_RACKS:

++Se cambian algunos labels de los campos, 
++Mejor organización de los campos.

SGT_LIST_EQUIPOS: p_13

++Se ordenan mejor los campos
++Se alinea al centro los encabezados
++Se pone la paginación en la parte superior. 
++Se cambia de tabla a SQL Query, 
++Se agrega las columnas {full name, la columna acciones}, 
--se eliminan las columnas innecesarias. 
++otras mejoras menores.

SGT_FORM_EQUIPO: P14

++Región: HISTORIAL_CLASSIC_REPORT
--Se eliminan datos no utilizados que estaban ocultos.
++Se renombra algunos labels de campos.
++Mejora en los textos de ayuda para algunos campos.

SGT_LST_SITIOS: P25

++Modificación SQL Query para mostrar en el listado el Nombre del Depto.
++Orden de las columnas 
++Alineación

SGT_FORM_SITIOS: P26

++Se agrega el contenedor para mostrar el Árbol de componentes por SITIO
++Se muestran los campos lat/lon con formato decimal
++Se cambió el nombre de la región de SGT_FORM_SITIOS a SITIO

SGT_FORM_ENLACES_FO: P27

++Cambios en los textos de Ayuda de los campos.
++Cambios en los Labels para los campos.

DL_INTERFACE: P28

++Corregido error al seleccionar hoja diferente a la Sheet1
--Eliminado campos: {MODO,DUPLEX,MAC_ADDRESS,NUMERO_SERIE,HW_VERSION,SW_VERSION}
++Cambios en la Query para mostrar la previsualización.

equipos_interface_d: P29

++Cantidad de líneas por vista de 72 a 30

SGT_FROM_INTERFACES: P30

++Campo Velocidad
++Nombre Requerido
--Se Eliminan varios campos: {MODO,DUPLEX,MAC_ADDRESS,NUMERO_SERIE,HW_VERSION,SW_VERSION}
++Cambios en los textos de Ayuda de los campos.
++Cambios en los Labels para los campos.
--En el proceso PL/SQL que guarda los datos en db se eliminan los campos: {MODO,DUPLEX,MAC_ADDRESS,NUMERO_SERIE,HW_VERSION,SW_VERSION}

SGT_LST_ENLACES_LOGICOS: P34

++se pone la paginación en la parte superior.

SGT_LST_ENLACES_FO_2: P36

++Source se cambia de table a SQL Query: para poder filtrar por los títulos de sitio y equipo, no estaba funcionando.
++se pone la paginación en la parte superior.
++Se alinea al centro los encabezados.
++Botón Grilla Editable.

SGT_LST_ENLACE_TRAMOS_FO: P39

++se pone la paginación en la parte superior.
++Se alinea al centro los encabezados.
++Botón Grilla Editable.

IG_EQUIPOS: P44

++Se cambia la query del source para mostrar los datos de sub tipo equipo en base al tipo de equipo seleccionado
++Querys en la grilla para setear datos el los campos en base con LOV dependientes de otros campos.
--Eliminado campo sub tipo equipo.
--No se logro validar aún la posición del equipo en base al rack seleccionado.

IG_ENLACES_FO: P45

++Se alinea al centro los encabezados.
++Cambio en los Labels.
++Cambios en los textos de Ayuda de los campos.

Auditoría General del Sistema: P46

--Eliminación de campos en SQL Query del Interactive Report.
++Agregado nuevos campos en SQL Query del Interactive Report.
++Botón de Acción en la vista de auditoria
++Nuevos campos y remoción de campos antiguos.

MAPA_SITIOS: P47

++Se alinea al centro los encabezados.
++Cambio en los Labels.

Grilla Interfaces: P49

++authorization-scheme
++Se alinea al centro los encabezados.
++Cambio en los Labels.
--Se eliminan campos: {NUMERO_SERIE, HW_VERSION, SW_VERSION }
++Se agrega campo {VELOCIDAD_MBPS}

PRUEBA_SERVICIOS: P410

++Se alinea al centro los encabezados.
++Cambio en los Labels.

Nuevas paginas

Interfaces L2: P48
Conexiones V2: P55
Cargar Interfaces L2: P56
Interfaces L3: p57
Admin IP's: P59
Agregar Interfaces a Múltiples Equipos: P60 es un DL
Importar Interfaces L3: P61
Importar IP admin: P62
Detalle de Transacción: P101