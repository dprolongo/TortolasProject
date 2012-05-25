﻿$(document).ready(function () {

        var tablaLlamante = null;
        var idPublicidad = null;
        var idPatrocinador = null;
        var datasourcepat = new kendo.data.DataSource
        ({
            transport:
                {
                    read:
                    {
                        url: "Patrocinadores/LeerTodos",
                        datatype: "json",
                        type: "POST"
                    }
                },
            schema:
            {
                model:
                 {
                     id: "idPatrocinador"
                 }
            }
        });

        $("#PatrocinadoresGrid").kendoGrid //Creo el kendo Grid
        ({
            dataSource: datasourcepat,
            selectable: true,
            pageable: true,
            sortable: true,
            filterable: true,
            detailTemplate: kendo.template($("#detallepublicidad").html()),
            detailInit: funciondetallepublicidad,
            columns: [
                {
                    field: "NombrePatrocinador",
                    title: "Nombre"
                },
                {
                    field: "CIFEmpresaPat",
                    title: "CIF"
                },
                {
                    field: "LocalizacionP",
                    title: "Localización Publicidad",
                    filterable: {
                        extra: false, //do not show extra filters
                        operators: { // redefine the string operators
                            string: {
                                eq: "Es igual a...",
                                neq: "No es igual a...",
                                startswith: "Empieza por...",
                                contains: "Contiene"
                            }
                        }
                    }
                },
                {
                    title: "Editar",
                    command: { text: "Editar", className: "botonEditarFilaPatrocinador" }
                },
                {
                    title: "Eliminar",
                    command: { text: "Eliminar", className: "botonEliminarFilaPatrocinador" }
                }
            ]

        });

        function funciondetallepublicidad(e) {
            var datasourcepub = new kendo.data.DataSource
            ({
                transport:
                {
                    read:
                    {
                        url: "Publicidad/LeerTodos",
                        data: { idPat: e.data.idPatrocinador },
                        datatype: "json",
                        type: "POST"
                    },
                },
                schema:
                {
                    model:
                    {
                        id: "idPublicidad"
                    }
                }
            });

            $(".PublicidadGrid").kendoGrid //Creo el kendo Grid
            ({
                dataSource: datasourcepub,
                selectable: true,
                sortable: true,
                filterable: true,
                columns: [
                {
                    field: "Loc",
                    title: "Situación"
                },
                {
                    field: "Caracteristicas",
                    title: "Características"
                },
                {
                    title: "Editar",
                    command: { text: "Editar", className: "botonEditarFilaPublicidad" }
                },
                {
                    title: "Eliminar",
                    command: { text: "Eliminar", className: "botonEliminarFilaPublicidad" }
                }
            ],
            });

            
        }
        //VALIDACION//

        function comprobarNecesarios(formulario){ //Comprueba nulos
        var noHayErrores = true;
        $("."+formulario+" .requerido").each(function(){
            if($(this).val()==""){
                alert($(this));
                $(this).addClass("k-invalid");
                noHayErrores = false;
            }
        });   
        return noHayErrores;    
        }

        // VENTANAS (POP-UP) //

        //Editar//

        var weditarPatrocinador = $("#VentanaEditarPatrocinador")
            .kendoWindow
            ({
                title: "Editar Patrocinador",
                modal: true,
                visible: false,
                resizable: false,
            }).data("kendoWindow");

        // Eliminar //

        var weliminarPatrocinador = $("#VentanaEliminarPatrocinador")
            .kendoWindow
            ({
                title: "Eliminar Patrocinador",
                modal: true,
                visible: false,
                resizable: false,
            }).data("kendoWindow");

        // Crear //

        var wcrearPatrocinador = $("#VentanaCrearPatrocinador")
            .kendoWindow
            ({
                title: "Crear Patrocinador",
                modal: true,
                visible: false,
                resizable: false,
            }).data("kendoWindow");

    

        //VENTANA EDITAJE PUBLICIDAD//

        var weditarPublicidad = $("#VentanaEditarPublicidad")
            .kendoWindow
            ({
                title: "Editar Publicidad",
                modal: true,
                visible: false,
                resizable: false
            }).data("kendoWindow");

        //VENTANA CREACION PUBLICIDAD//

        var wcrearPublicidad = $("#VentanaCrearPublicidad")
            .kendoWindow
            ({
                title: "Crear Publicidad",
                modal: true,
                visible: false,
                resizable: false
            }).data("kendoWindow");

        //VENTANA ELIMINAR PUBLICIDAD//

        var weliminarPublicidad = $("#VentanaEliminarPublicidad")
            .kendoWindow
            ({
                title: "Eliminar Publicidad",
                modal: true,
                visible: false,
                resizable: false
            }).data("kendoWindow");

        // FUNCIONES //

        //Funciones: Botones del GRID//

        //Boton Editar//

        $(".botonEditarFilaPatrocinador").live("click", function () {


            $(".NoModificable").prop('disabled', true); //Bloquea editar los campos

            var fila = $("#PatrocinadoresGrid").find("tbody tr.k-state-selected");

            var filajson = $("#PatrocinadoresGrid").data("kendoGrid").dataItem(fila).toJSON();
            idPatrocinador = datasourcepat.getByUid(fila.attr("data-uid")).idPatrocinador;

            $("#nombreempresapatrocinadoreditar").val(filajson.NombrePatrocinador);
            $("#locpatrocinadoreditar").val(filajson.LocalizacionP);
            $("#cifpatrocinadoreditar").val(filajson.CIFEmpresaPat);

            weditarPatrocinador.center();

            weditarPatrocinador.open();
        });

        //Boton Eliminar//

        $(".botonEliminarFilaPatrocinador").live("click", function () {

            $(".CuadroTexto").prop('disabled', true); //Bloquea editar los campos

            var fila = $("#PatrocinadoresGrid").find("tbody tr.k-state-selected");

            var filajson = $("#PatrocinadoresGrid").data("kendoGrid").dataItem(fila).toJSON();
            idPatrocinador = datasourcepat.getByUid(fila.attr("data-uid")).idPatrocinador;

            $("#nombrepatrocinadoreliminar").val(filajson.NombrePatrocinador);
            $("#lopatrocinadoreliminar").val(filajson.LocalizacionP);
            $("#cifpatrocinadoreliinar").val(filajson.CIFEmpresaPat);


            weliminarPatrocinador.center();

            weliminarPatrocinador.open();
        });

        // Funciones: Botones Ventana Editaje //

        //Boton Cancelar//

        $(".FuncionBotonCancelarProveedores").live("click", function () {

            $(".CuadroTexto").prop('disabled', false); //Bloquea editar los campos
            $(".VisibilidadDatosNuevaEmpresaRemota").hide();

            weditarPatrocinador.close();
            weliminarPatrocinador.close();
            wcrearPatrocinador.close();
            weditarPublicidad.close();
            weliminarPublicidad.close();
            wcrearPublicidad.close();

        });

        //Boton Aceptar//

        $("#BotonAceptarVentanaEditarpatrocinador").live("click", function () {
            var datos = {};
            //Coger datos

            datos["locupdate"] = $("#locpatrocinadoreditar").val();
            datos["idpatrocinador"] = idPatrocinador;
            datos["cifpatrocinadoreditar"] = $("#cifpatrocinadoreditar").val();
            datos["FKCodigoEmpresa"] = idPatrocinador;

            $.ajax(
                {
                    url: "Patrocinadores/UpdatePatrocinador",
                    type: "POST",
                    data: datos,
                    success: function () {
                        $(".CuadroTexto").prop('disabled', false); //Devuelve poder editar los campos en la ventana editar
                        datasourcepat.read();
                        weditarPatrocinador.close();
                    },
                    async: false
                });
        });

        // Funciones: Botones Ventana Eliminar //

        //Boton Aceptar//

        $("#BotonAceptarVentanaEliminarPatrocinador").live("click", function () {

            var datos = {};
            //Coger datos

            datos["idpatrocinador"] = idPatrocinador;

            $.ajax(
                {
                    url: "Patrocinadores/DeletePatrocinador",
                    type: "POST",
                    data: datos,
                    success: function () {
                        $(".CuadroTexto").prop('disabled', false); //Devuelve poder editar los campos en la ventana editar
                        datasourcepat.read();
                        weliminarPatrocinador.close();
                    },
                    async: false
                });

        });

        //Boton Nuevo Patrocinador//

        $("#BotonNuevoPatrocinador").click(function () {

            $(".VisibilidadTelefonodeContacto").show();

            wcrearPatrocinador.center();

            wcrearPatrocinador.open();

        });

        //Funciones: Botones Ventana Crear //

        //Boton Vincular//

        $("#BotonVincularEmpresaDesdePatrocinador").live("click", function () {

            $("#VentanaEmpresasRemota").data("kendoWindow").center();
            $(".VisibilidadGridEmpresasRemota").show(); //Lo muestro
            $("#VentanaEmpresasRemota").data("kendoWindow").open();
        });

        //Boton Crear Patrocinador//

        $("#BotonAceptarVentanaCrearPatrocinador").click(function () {

            var datos = {};
            $("#tlfpatrocinadornuevo").val() == 0;
            if (comprobarNecesarios("ComprobarNulosPatrocinadores")) 
            {
                //Coger datos
                datos["nombreempresa"] = $("#nombrepatrocinadornuevo").val();
                datos["cif"] = $("#cifpatrocinadornuevo").val();
                datos["localizacion"] = $("#locpatrocinadornuevo").val();
                if ($("#tlfpatrocinadornuevo").val() == "") {
                    datos["telefono"] = 0
                }
                else {
                    datos["telefono"] = $("#tlfpatrocinadornuevo").val();
                }
                if ($("#patrocinadortflremoto").val() == "") {
                    datos["telefono2"] = 0
                }
                else {
                    datos["telefono2"] = $("#patrocinadortflremoto").val();
                }

                $.ajax(
                {
                    url: "Patrocinadores/CreatePatrocinador",
                    type: "POST",
                    data: datos,
                    success: function () {

                        $(".VisibilidadDatosNuevaEmpresaRemota").hide();

                        var temp = $("#PatrocinadoresGrid").data("kendoGrid").dataSource;

                        temp.read();

                        wcrearPatrocinador.close();


                    },
                    async: false
                });
            }
            else
            {
                $("#MensajeErrorPatrocinadores").fadeIn(500).fadeOut(3000);
            }
        });

        //Funcionnes: Botones Grid Publicidad//
    
        //Editar//
    
        $(".botonEditarFilaPublicidad").live("click", function () {

            var tabla = $(this).parent().parent().parent().parent().parent().parent().data("kendoGrid"); 
            //Obtengo la tabla usando herencia
            tablaLlamante = tabla;
            var seleccionado = tabla.select();
            var filaJson = tabla.dataItem(seleccionado).toJSON();      // La pasamos a JSON
            var datasourcepu = tabla.dataSource;
            
            idPublicidad = datasourcepu.getByUid(seleccionado.attr("data-uid")).idPublicidad;
            var Carac = datasourcepu.getByUid(seleccionado.attr("data-uid")).Caracteristicas;
            var Loc = datasourcepu.getByUid(seleccionado.attr("data-uid")).Loc;
            $(".locpublicidadeditar").val(Loc);
            $(".caracpublicidadeditar").val(Carac);

            weditarPublicidad.center();

            weditarPublicidad.open();
        });

        //Eliminar//
    
        $(".botonEliminarFilaPublicidad").live("click", function () {

            var tabla = $(this).parent().parent().parent().parent().parent().parent().data("kendoGrid");
            tablaLlamante = tabla;
            var seleccionado = tabla.select();
            var filaJson = tabla.dataItem(seleccionado).toJSON();      // La pasamos a JSON
            var datasourcepu = tabla.dataSource;
            
            idPublicidad = datasourcepu.getByUid(seleccionado.attr("data-uid")).idPublicidad;
            var Carac = datasourcepu.getByUid(seleccionado.attr("data-uid")).Caracteristicas;
            var Loc = datasourcepu.getByUid(seleccionado.attr("data-uid")).Loc;
            $("#locapublicidadeliminar").val(Loc);
            $("#caracteristicapublicidadeliminar").val(Carac);

            weliminarPublicidad.center();

            weliminarPublicidad.open();
        
        });

        //Crear//

        $(".BotonNuevaPublicidad").live("click", function () {
            var idPatrocinadorPadre = $(this).attr("patrocinador"); //Cojo la id del patrocinador
            
            var tablaPadre = $("#PubliGrid_"+idPatrocinadorPadre).data("kendoGrid"); //Cojo el Grid asociado (publicidad)
            tablaLlamante = tablaPadre;
            
            idPatrocinador = idPatrocinadorPadre;
            wcrearPublicidad.center();

            wcrearPublicidad.open();
        });

        //Funciones: Botones Ventana Editar PUBLICIDAD //

        $("#BotonAceptarVentanaEditarPublicidad").live("click", function () {
            var datos = {};

            datos["locupdate"] = $("#locpublicidadeditar").val();
            datos["idpublicidad"] = idPublicidad;
            datos["caracpublicidadeditar"] = $("#caracpublicidadeditar").val();
            
            $.ajax(
                {
                    url: "Publicidad/updatePublicidad",
                    type: "POST",
                    data: datos,
                    success: function () {
                        $(".CuadroTexto").prop('disabled', false); //Devuelve poder editar los campos en la ventana editar
                        tablaLlamante.dataSource.read();
                        weditarPublicidad.close();
                    },
                    async: false
                });
        });

        // Funciones: Botones Ventana Eliminar PUBLICIDAD//

        //Boton Aceptar//

        $("#BotonAceptarVentanaEliminarPublicidad").live("click", function () {

            var datos = {};
            //Coger datos

            datos["idpublicidad"] = idPublicidad;

            $.ajax(
                {
                    url: "Publicidad/DeletePublicidad",
                    type: "POST",
                    data: datos,
                    success: function () {
                        $(".CuadroTexto").prop('disabled', false); //Devuelve poder editar los campos en la ventana editar
                        tablaLlamante.dataSource.read();
                        weliminarPublicidad.close();
                    },
                    async: false
                });

        });

        //Funciones: Botones Ventana Crear PUBLICIDAD //

        $("#BotonAceptarVentanaCrearPublicidad").live("click", function () {
            var datos = {};

            alert(idPatrocinador);
            datos["locpublicidad"] = $("#locapublicidadcrear").val();
            datos["caracpublicidad"] = $("#carapublicidadcrear").val();
            datos["idpatrocinador"] = idPatrocinador;
            
            $.ajax(
                {
                    url: "Publicidad/CreatePublicidad",
                    type: "POST",
                    data: datos,
                    success: function () {
                        $(".CuadroTexto").prop('disabled', false); //Devuelve poder editar los campos en la ventana editar
                        tablaLlamante.dataSource.read();
                        wcrearPublicidad.close();
                    },
                    async: false
                });
        });

});