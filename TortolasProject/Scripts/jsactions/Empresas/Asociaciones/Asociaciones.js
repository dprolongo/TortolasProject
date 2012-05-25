﻿$(document).ready(function () {
    
    $(".VisibilidadBotonAceptarCrear").hide(); //Oculta el boton de aceptar de la ventana editar
        $(".VisibilidadBotonVincularEmpresa").hide();

        var idAsociacion = null;
        var datasourceasoc = new kendo.data.DataSource
        ({
            transport:
                {
                    read:
                    {
                        url: "Asociaciones/LeerTodos",
                        datatype: "json",
                        type: "POST"
                    }
                },
            schema:
            {
                model:
                 {
                     id: "idAsociacion"
                 }
            }
        });

        $("#AsociacionesGrid").kendoGrid //Creo el kendo Grid
        ({
            //height: 400,
            dataSource: datasourceasoc,
            selectable: true,
            pageable: true,
            sortable: true,
            filterable: true,
            columns: [
                {
                    field: "NombreAsociacion",
                    title: "Nombre"
                },
                {
                    field: "CIFEmpresa",
                    title: "CIF"
                },
                {
                    field: "Direccion",
                    title: "Direccion",
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
                    field: "Tematica",
                    title: "Tematica"
                },
                {
                    field: "Telefono",
                    title: "Teléfono"
                },
                {
                    title: "Editar",
                    command: { text: "Editar", className: "botonEditarFilaAsociacion" }
                },
                {
                    title: "Eliminar",
                    command: { text: "Eliminar", className: "botonEliminarFilaAsociacion" }
                }
            ]

        });



        var weditarAsociacion = $("#VentanaEditarAsociacion")
            .kendoWindow
            ({
                title: "Asociación",
                modal: true,
                visible: false,
                resizable: false,
            }).data("kendoWindow");

        //VALIDACION//

        function comprobarNecesarios(formulario){ //Comprueba nulos
        var noHayErrores = true;
        $("."+formulario+" .requerido").each(function(){
            if($(this).val()==""){
                alert("NULO");
                $(this).addClass("k-invalid");
                noHayErrores = false;
            }
        });   
        return noHayErrores;    
        }
        
        // FUNCIONES //

        //Funciones: Botones del GRID//

        //Boton Editar//

        $(".botonEditarFilaAsociacion").live("click", function () {

            //alert("Editar!");
            $(".VisibilidadBotonVincularEmpresa").hide();
            $(".VisibilidadDatosNuevaEmpresaRemota").hide(); //Muestro los datos de la empresa asociada
            $(".VisibilidadBotonAceptarEditar").show(); //Oculta el boton de aceptar de la ventana editar
            $(".VisibilidadBotonAceptarEliminar").hide(); //Oculta el boton correspondiente para aceptar en la ventana eliminar
            $(".VisibilidadBotonAceptarCrear").hide(); // Oculta el boton crear
            $(".CuadroTexto").prop('disabled', false); //Bloquea editar los campos
            $(".NoModificable").prop('disabled', true); //Bloquea editar los campos


            var fila = $("#AsociacionesGrid").find("tbody tr.k-state-selected");

            var filajson = $("#AsociacionesGrid").data("kendoGrid").dataItem(fila).toJSON();
            idAsociacion = datasourceasoc.getByUid(fila.attr("data-uid")).idAsociacion;

            $("#nombreempresaasociacion").val(filajson.NombreAsociacion);
            $("#direccion").val(filajson.Direccion);
            $("#tematica").val(filajson.Tematica);
            $("#telefonoremoto").val(filajson.Telefono);
            $("#cifremoto").val(filajson.CIFEmpresa);

            weditarAsociacion.center();

            weditarAsociacion.open();
        });

        //Boton Eliminar//

        $(".botonEliminarFilaAsociacion").live("click", function () {
            //alert("Eliminar!");

            $(".CuadroTexto").prop('disabled', true); //Bloquea editar los campos
            $(".VisibilidadBotonAceptarEditar").hide(); //Oculta el boton de aceptar de la ventana editar
            $(".VisibilidadBotonAceptarEliminar").show(); //Muestra el boton correspondiente para aceptar en la ventana eliminar

            var fila = $("#AsociacionesGrid").find("tbody tr.k-state-selected");

            var filajson = $("#AsociacionesGrid").data("kendoGrid").dataItem(fila).toJSON();
            idAsociacion = datasourceasoc.getByUid(fila.attr("data-uid")).idAsociacion;

            $("#nombreempresaasociacion").val(filajson.NombreAsociacion);
            $("#direccion").val(filajson.Direccion);
            $("#tematica").val(filajson.Tematica);
            $("#telefonoremoto").val(filajson.Telefono);
            $("#cifremoto").val(filajson.CIFEmpresa);


            weditarAsociacion.center();

            weditarAsociacion.open();
        });

        // Funciones: Botones Ventana Editaje //

        //Boton Cancelar//
        $("#BotonCancelarVentanaEditarAsociacion").live("click", function () {

            $(".CuadroTexto").prop('disabled', false); //Bloquea editar los campos

            $(".VisibilidadBotonAceptarEditar").show(); //Muestra el boton de aceptar de la ventana editar
            $(".VisibilidadBotonAceptarEliminar").hide(); //Oculta el boton correspondiente para aceptar en la ventana eliminar
            $(".VisibilidadBotonAceptarCrear").hide();

            $(".VisibilidadDatosNuevaEmpresaRemota").hide(); //Muestro los datos de la empresa asociada
            weditarAsociacion.close();
        });

        //Boton Aceptar//

        $("#BotonAceptarVentanaEditarAsociacion").live("click", function () {
            var datos = {};
            //Coger datos
            datos["nombreasociacion"] = $("#nombreempresaasociacion").val();
            datos["direccionupdate"] = $("#direccion").val();
            datos["tematicaupdate"] = $("#tematica").val();
            datos["idempresa"] = idAsociacion;

            $.ajax(
                {
                    url: "Asociaciones/UpdateAsociacion",
                    type: "POST",
                    data: datos,
                    success: function () {
                        $(".CuadroTexto").prop('disabled', false); //Devuelve poder editar los campos en la ventana editar
                        datasourceasoc.read();
                        weditarAsociacion.close();
                    },
                    async: false
                });
        });

        // Funciones: Botones Ventana Eliminar //

        //Boton Aceptar//

        $("#BotonAceptarVentanaEliminarAsociacion").live("click", function () {

            var datos = {};
            //Coger datos

            datos["idasociacion"] = idAsociacion;

            $.ajax(
            {
                url: "Asociaciones/DeleteAsociacion",
                type: "POST",
                data: datos,
                success: function () {
                    //alert("Estoy dentro del success!");
                    $(".CuadroTexto").prop('disabled', false); //Devuelve poder editar los campos en la ventana editar
                    $(".VisibilidadBotonAceptarEditar").show(); //Oculta el boton de aceptar de la ventana editar
                    $(".VisibilidadBotonAceptarEliminar").hide(); //Muestra el boton correspondiente para aceptar en la ventana eliminar
                    datasourceasoc.read();
                    weditarAsociacion.close();
                    //alert("Ya he terminado!?");
                },
                async: false
            });

        });

        //Boton Nueva Asociacion//

        $("#BotonNuevaAsociacion").click(function () {
            //alert("Crear!");
            $(".VisibilidadBotonAceptarCrear").show();
            $(".VisibilidadBotonAceptarEditar").hide();
            $(".VisibilidadBotonVincularEmpresa").show();
            $(".DatosNuevaEmpresaRemotaDesdeAsociacion").prop('disabled', true); //Bloquea editar los campos

            weditarAsociacion.center();

            weditarAsociacion.open();

        });

        // Ventana Nueva Asociacion //

        //Boton Vincular Empresa//

        $("#BotonVincularEmpresaDesdeAsociacion").live("click", function () {

            $("#VentanaEmpresasRemota").data("kendoWindow").center();
            $(".VisibilidadGridEmpresasRemota").show(); //Lo muestro
            $("#VentanaEmpresasRemota").data("kendoWindow").open();
        });

        //Boton Crear Asociacion//

        $("#BotonAceptarVentanaCrearAsociacion").click(function () {

            var datos = {};
            if ($("#telefonoremoto").val() == "") {
                    datos["telefono"] = 0;
                    $("#telefonoremoto").val("0");
                }
                else {
                    datos["telefono"] = $("#telefonoremoto").val(); 
                }
                if ($("#telefonoremoto2").val() == "") {
                    datos["telefono2"] = 0 ;
                    $("#telefonoremoto2").val("0");
                }
                else {
                    datos["telefono2"] = $("#telefonoremoto2").val(); 
                }


                
            if (comprobarNecesarios("ComprobarNulosAsociaciones")) 
            {
                //Coger datos
                datos["nombreempresa"] = $("#nombreempresaasociacion").val();
                datos["cif"] = $("#cifremoto").val();
                datos["direccion"] = $("#direccion").val();
                datos["tematica"] = $("#tematica").val();
                


                $.ajax(
                {
                    url: "Asociaciones/CreateAsociacion",
                    type: "POST",
                    data: datos,
                    success: function () {
                        var temp = $("#AsociacionesGrid").data("kendoGrid").dataSource;
                        temp.read();
                
                        $("#NuevaEmpresaFormulario2").hide();


                        weditarAsociacion.close();
                    },
                    async: false
                });
            }
            else
            {
                $("#MensajeErrorAsociaciones").fadeIn(500).fadeOut(3000);
            }
        });
    


    
});