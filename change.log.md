#Control de cambios de la App antes del commit
###2026-02-23
Aplicación: Formato de fecha a DD-MON-YYYY
P1: HOME: Corrección en consulta que hacia referencia a campo sub_tipo_equipo que fue eliminado.
P5: SGT_FORM_SALA: Se cambia un label del campo nombre de Detalle/Descripcion -> Nombre y se coloca como requerido, cambios cosmeticos.
P6: DL_EQUIPOS: Cambios en las instrucciones de uso del excel.
P8: SGT_LST_INTERFACES: Se cambia el orden de los campos y se elimina el boton edit.
P12: SGT_FORM_RACKS: Se modifican los limites para permitir altura_u de 1 a 60.
P13: SGT_LST_EQUIPOS: se modifica la consulta sql para mostrar el sub_tipo_equipo.
P14: SGT_FORM_EQUIPO: Se elimina el campo sub_tipo_equipo, que estaba oculto. Se setea los valores de altura_u de 1 a 60, se cambia el LOV para que no muestre campos null. Se modifica los textos de ayuda, se elimina un server side condition para que el botón seleccionar U siempre se muestre.
P25: SGT_LST_SITIOS: Se modifica la consulta para llevar a google maps en base a los datos GPS. Se setea un proceso para que cuando se deplegue la lista de sitios el caracter de separación de decimales sea el punto y no la coma.
P26: SGT_FORM_SITIOS: Se modifica los valores posibles para los campos latitud y longitud, estos valores tambien estan seteados en la base de datos.
P29: equipos_interface_dl: Cambio de titulo, corrección en la consulta para ver tambien cuando las interfaces son null. Cambio en el titulo de los reportes.
P30: SGT_FROM_INTERFACES: LOV: INTERFACES.ESTADO se cambia para que no muestre valores null.
P31: SGT_ENLACES_TRAMOS_DL: Cambio de nombre del titulo de la pagina, cambio del dataloader al que apunta.
P39: GT_LST_ENLACE_TRAMOS_FO: Se cambia el heading del campo Nombre por el texto Observaciones, se agregar el botón importar.
P44: IG_EQUIPOS: Se modifica la consulta para que despliege el "sub_tipo_equipo", y que pueda ser filtrado solo por los valores de "sub_tipo_equipo", se colocan campos (alcualizado_el y sub_tipo) como only query y display only.
P45: IG_ENLACES_FO: Campo (TIPO, Tipo_enlace, ESTADO) se hace que la LOV no nuestre valores nulos. 
P49: Grilla Interfaces: Se cambia el campo ESTADO como Popup LOV, y se centra la columna.
P54: STEP-5: Wizard Servicios Paso 5, Se cambia el proceso: CONSULTAR_NIVEL_PRIORIDAD habia un error en el nombre de la LOV que consultaba.
P55: Conexiones V2: Se cambia la consulta de la Grila para incluir el campo actualizado_el, tambien no estaba desplegando correctamente el sitio_b e interface_b, se corrigio eso. Sitio_B como requerido.
++P58: TIPO INTERFAZ: Cre crea la pagina TIPO INTERFAZ Del tipo Interactive Grid. se crea la entrada en el menu y otros relacionados.
Dataload definitions: CONEXIONES_DL se agrega esta definición para cargar conexiones
Modificaciones del Menu para agregar nuevas entradas.
LOVS: 
--TIPO_EQUIPOS.SUB_TIPO
--SUB_TIPO_EQUIPO
mod:
   EQUIPOS.POSICION
   TIPO_CABLE
   LOV_SGT_RACKS_FILTRADO
   TIPO_ENLACE
   ENLACE_FO.ESTADO
   EQUIPO.ESTADO

###2026-01-13
LOV EQUIPO.ESTADO: Agregado valores de acuerdo al DER 
DL_EQUIPOS: P6: Agregado platilla XLS para descarga.
SGT_UBICAR_RACK: P37: Cambio de textos de Front a FRONT, Back a BACK para respetar valores de la db
Agregar Interfaces a Multiples Equipos: P60: Agregado plantilla XLS para descarga
Scripts de Actualización de la db.

###2026-01-12

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