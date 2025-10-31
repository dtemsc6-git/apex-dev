function visualizar_conexiones(apiData, modoVista) {


    console.log(apiData.data); // Acceder a los datos
    console.log(modoVista);
    const nodes = [];
    const edges = [];

    const nodoMap = new Map();

    // Iterar sobre cada conexión en los datos
    apiData.data.forEach(connection => {

        if (!nodoMap.has(connection.ORIGEN_ID)) {
            nodoMap.set(connection.ORIGEN_ID, true);
            nodes.push({
                id: connection.ORIGEN_ID,
                label: connection.ORIGEN,
                group: "interfaz",
                shape: "box", // Forma para interfaces
                color: "#FF9900"
            });
        }
        if (!nodoMap.has(connection.DESTINO_ID)) {
            nodoMap.set(connection.DESTINO_ID, true);
            nodes.push({
                id: connection.DESTINO_ID,
                label: connection.DESTINO,
                group: "interfaz",
                shape: "box", // Forma para interfaces
                color: "#FF9900"
            });

            // Crear edge entre INTERFAZ_A e INTERFAZ_B (conexión P2P)
            edges.push({
                from: connection.ORIGEN_ID,
                to: connection.DESTINO_ID,
                arrows: "to", // Flecha indica dirección
                label: connection.TIPO_CONEXION, // Etiqueta del tipo de conexión
                color: "#848484" // Color de la línea
            });
        }





        /*if (!interfaceMap.has(connection.INTERFAZ_A_ID)) {
            interfaceMap.set(connection.INTERFAZ_A_ID, true);
            nodes.push({
                id: connection.INTERFAZ_A_ID,
                label: connection.EQUIPO_A + "\n" + connection.INTERFAZ_A,
                group: "interfaz",
                shape: "box", // Forma para interfaces
                color: "#FF9900"
            });
        }
        // Procesar INTERFAZ_B como hijo de EQUIPO_B
        if (!interfaceMap.has(connection.INTERFAZ_B_ID)) {
            interfaceMap.set(connection.INTERFAZ_B_ID, true);
            nodes.push({
                id: connection.INTERFAZ_B_ID,
                label: connection.EQUIPO_B + "\n" + connection.INTERFAZ_B,
                group: "interfaz",
                shape: "box",
                color: "#FF9900"
            }); 
            */
        // Crear edge entre INTERFAZ_B y su EQUIPO_B
        /*edges.push({
            from: connection.INTERFAZ_B_ID,
            to: connection.EQUIPO_B_ID,
            arrows: "to",
            length: 100
        });
    }*/

    });
    // Ahora `nodes` y `edges` están listos para usar en vis.js

    //Si se pide mostrar sitios cargar los nodos con los sitios 
    var data = { nodes: nodes, edges: edges };

    var container = document.getElementById("network");
    var network = new vis.Network(container, data, {
        layout: { hierarchical: { enabled: true, direction: modoVista }, },
        physics: { enabled: false, solver: "forceAtlas2Based" }
    });



}

/*apex.server.process(
    'GET_CONEXIONES', { pageItems: '#P400_SERVICIO_ID' },
    {
        success: function (apiData) {
        },
        error: function (pError) {
            console.error('Error:', pError);
        }
    }
);*/