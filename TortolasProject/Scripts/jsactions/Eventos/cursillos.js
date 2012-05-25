﻿var maxacompa;
var idCursillo = null;
var TotalParticipantesGeneral;
var PlazasLibresGeneral;

$(document).ready(function () {

    var datasource = new kendo.data.DataSource
    ({
        transport:
        {
            read:
            {
                url: "Cursillos/LeerTodos",
                datatype: "json",
                type: "POST"
            }
        },
        schema:
        {
            model:
            {
                id: "idCursillo"
            }
        }
    });
    var tablacursillo = $("#Cursillostabla").kendoGrid({
        dataSource: datasource,
        toolbar: kendo.template($("#templateToolbarCursillo").html()),
        sorteable: true,
        pageable: true,
        selectable: true,
        filtreable: true,
        columns: [
                    {
                        field: "Titulo",
                        title: "Titulo",
                        filterable: {
                            extra: false, //do not show extra filters
                            operators: { // redefine the string operators
                                string: {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                        }
                    },
                    {
                        field: "Lugar",
                        title: "Lugar",
                        filterable: {
                            extra: false, //do not show extra filters
                            operators: { // redefine the string operators
                                string: {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                        }
                    },
                    {
                        field: "Tematica",
                        title: "Temática",
                        filterable: {
                            extra: false, //do not show extra filters
                            operators: { // redefine the string operators
                                string: {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                        }
                    },
                    {
                        field: "FechaRealizacion",
                        title: "Fecha",
                        filterable: {
                            extra: false, //do not show extra filters
                            operators: { // redefine the string operators
                                string: {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                        }
                    },
                    {
                        field: "Plazas",
                        title: "Plazas",
                        filterable: {
                            extra: false, //do not show extra filters
                            operators: { // redefine the string operators
                                string: {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                        }
                    },
                    {
                        title: "Herramientas",
                        width: "200px",
                        command: [{ text: "Editar", className: "botonEditarFila" }, { text: "Eliminar", className: "botonEliminarFila"}]
                    }
            ],
        detailTemplate: kendo.template($("#template").html()),
        detailInit: inicializarDetalles
    });

    //............................................VENTANAS POP-UP...............................................

    var windowEditar = $("#VentanaEditar").kendoWindow
    ({
        title: "Editar",
        modal: true,
        visible: false,
        resizable: false
    }).data("kendoWindow");

    var windowInscripcion = $("#VentanaInscripcion").kendoWindow
    ({
        title: "Inscripcion",
        modal: true,
        visible: false,
        resizable: false
    }).data("kendoWindow");

    //...........................FUNCIONES............................

    $("#editor").kendoEditor();

    var valoresComboPrioridad = [{ texto: "No", valor: false }, { texto: "Si", valor: true}];

    $("#DescuentoSocios").kendoDropDownList({
        dataTextField: "texto",
        dataValueField: "valor",
        index: 0,
        dataSource: valoresComboPrioridad
    });

    $("#Acompanantes").kendoNumericTextBox({
        min: 1,
        max: maxacompa,
        step: 1,
        format: "0"
    });
    $("#Acompanantes").hide();

    $("#AcompanantesDropdown").kendoDropDownList({
        dataTextField: "texto",
        dataValueField: "valor",
        dataSource: valoresComboPrioridad,
        select: function (e) {
            var numacompa = this.dataItem(e.item.index());
            if (numacompa.valor == true) {
                $("#NumeroAcompa").show();
                $("#Acompanantes").kendoNumericTextBox
                ({
                    min: 1,
                    max: maxacompa,
                    step: 1,
                    format: "0"
                });
            }
            else {
                $("#acompaWrapper").empty();
                $("#acompaWrapper").html('<div id="NumeroAcompa"><label> Número de acompañantes: </label><input id="Acompanantes" /></div>');
                $("#AcompanantesDropdown").data("kendoDropDownList").select(0);
                $("#NumeroAcompa").val(0);
                $("#NumeroAcompa").hide();
            }
        }
    });
    $("#NumeroAcompa").hide();

    $(".requerido").change(function () {

        if ($(this).val() == "") {
            $(this).addClass("k-invalid");
        }
        else {
            $(this).removeClass("k-invalid");
        }
    });

    $("#FechaRealizacion").kendoDatePicker({

        format: "dd/MM/yyyy"
    });


    $("#FechaAperturaInscrip").kendoDatePicker({

        format: "dd/MM/yyyy"
    });


    $("#FechaLimiteInscrip").kendoDatePicker({

        format: "dd/MM/yyyy"
    });

    $("#botonCrearCursillo").live("click", function () {

        $.ajax({
            url: "Cursillos/cargarVistaCrearCursillo",
            type: "POST",
            success: function (data) {
                $("#Cursillostabla").hide();
                $("#FormularioCreacion").html(data);
                $("#FormularioCreacion").show();
                $("#editor").kendoEditor();
                $("#Monitor").kendoDropDownList
                ({
                    dataSource: new kendo.data.DataSource
                    ({
                        transport:
                        {
                            read:
                            {
                                url: "Cursillos/leerMonitores",
                                type: "POST",
                                async: false
                            }
                        }
                    }),
                    dataTextField: "Nombre",
                    dataValueField: "idMonitor"

                });

                $("#Monitor").hide();

                $("#checkboxMonitor").change(function () {

                    $("#capaMonitor").toggle();
                });

                $(".requerido").change(function () {

                    if ($(this).val() == "") {
                        $(this).addClass("k-invalid");
                    }
                    else {
                        $(this).removeClass("k-invalid");
                    }
                });

                $("#FechaRealizacion").kendoDatePicker({

                    format: "dd/MM/yyyy"
                });
                $("#FechaAperturaInscrip").kendoDatePicker({

                    format: "dd/MM/yyyy"
                });
                $("#FechaLimiteInscrip").kendoDatePicker({

                    format: "dd/MM/yyyy"
                });

                var valoresComboPrioridad = [
                        { texto: "Si", valor: true },
                        { texto: "No", valor: false }

                    ];

                $("#DescuentoSocios").kendoDropDownList({
                    dataTextField: "texto",
                    dataValueField: "valor",
                    dataSource: valoresComboPrioridad
                });
            }

        });

    });

    $(".botonEditarFila").live("click", function () {

        var fila = $("#Cursillostabla").find("tbody tr.k-state-selected");
        var filajson = $("#Cursillostabla").data("kendoGrid").dataItem(fila).toJSON();
        idCursillo = datasource.getByUid(fila.attr("data-uid")).idCursillo;

        $("#Titulo").val(filajson.Titulo);
        $("#Lugar").val(filajson.Lugar);
        $("#Tematica").val(filajson.Tematica);
        $("#ConocimientosPrevios").val(filajson.ConocimientosPrevios);
        $("#FechaRealizacion").data("kendoDatePicker").value(filajson.FechaRealizacion);
        $("#FechaAperturaInscrip").data("kendoDatePicker").value(filajson.FechaAperturaInscripcion);
        $("#FechaLimiteInscrip").data("kendoDatePicker").value(filajson.FechaLimiteInscripcion);
        $("#Plazas").val(filajson.Plazas);
        $("#Precio").val(filajson.Precio);
        $("#NumAcompa").val(filajson.NumAcompa);

        $("#DescuentoSocios").data("kendoDropDownList").value((filajson.DescuentoSocios));
        $("#editor").data("kendoEditor").value((filajson.Actividad));

        windowEditar.center();
        windowEditar.open();
    });

    $("#BotonCancelarVentanaEditar").live("click", function () {
        windowEditar.close();
        $("#Cursillostabla").show();
    });

    $("#BotonCancelarInscripcion").live("click", function () {
        windowInscripcion.close();
        $("#Cursillostabla").show();
    });

    $("#BotonCancelarFormularioCrear").live("click", function () {
        $("#FormularioCreacion").hide();
        $("#Cursillostabla").show();
    });

    $("#BotonAceptarFormularioCrear").live("click", function () {
        if (comprobarNecesarios("FormularioCrear")) {

            var datos = {};
            datos["TituloUpdate"] = $("#Titulo").val();
            datos["LugarUpdate"] = $("#Lugar").val();
            datos["TematicaUpdate"] = $("#Tematica").val();
            datos["ConocimientosPreviosUpdate"] = $("#ConocimientosPrevios").val();
            datos["FechaRealizacionUpdate"] = $("#FechaRealizacion").val();
            datos["FechaAperturaInscripUpdate"] = $("#FechaAperturaInscrip").val();
            datos["FechaLimiteInscripUpdate"] = $("#FechaLimiteInscrip").val();
            datos["PlazasUpdate"] = $("#Plazas").val();
            datos["NumAcompaUpdate"] = $("#NumAcompa").val();
            datos["PrecioUpdate"] = $("#Precio").val();
            datos["DescuentoSociosUpdate"] = $("#DescuentoSocios").val();
            datos["ActividadUpdate"] = $("#editor").data("kendoEditor").value();
            if ($("#checkboxMonitor").attr("checked") == "checked")
                datos["MonitorUpdate"] = $("#Monitor").data("kendoDropDownList").value();
            else
                datos["MonitorUpdate"] = "";

            $.ajax(
            {
                url: "Cursillos/CreateCursillo",
                type: "POST",
                data: datos,
                success: function () {
                    datasource.read();
                    $("#FormularioCreacion").hide();
                    $("#Cursillostabla").show();
                }
            });
        }
        else {
            alert("Campos requeridos vacíos");
        }
    });

    $("#BotonAceptarInscripcion").click(function () {
        var datos = {};

        datos["numacompa"] = 0;
        if ($("#AcompanantesDropdown").data("kendoDropDownList").value()) {
            datos["numacompa"] = $("#Acompanantes").val();
        }

        var nuevosParticipantes = null;
        if (datos["numacompa"] == "") {
            nuevosParticipantes = 0;
            datos["numacompa"] = 0;
        }
        else {
            nuevosParticipantes = datos["numacompa"];
        }

        if (PlazasLibresGeneral >= nuevosParticipantes) {
            datos["idCursillo"] = idCursillo;
            $.ajax
            ({
                url: "Cursillos/InscripcionCursillo",
                type: "POST",
                data: datos,
                success: function () {
                    datasource.read();
                    windowInscripcion.close();
                }
            });
        }
        else {
            alert("No quedan plazas libres suficientes \n Plazas libres: " + PlazasLibresGeneral);
        }
    });

    $("#BotonAceptarVentanaEditar").click(function () {
        if (comprobarNecesarios("VentanaEditar")) {
            var datos = {};

            datos["TituloUpdate"] = $("#Titulo").val();
            datos["LugarUpdate"] = $("#Lugar").val();
            datos["TematicaUpdate"] = $("#Tematica").val();
            datos["ConocimientosPreviosUpdate"] = $("#ConocimientosPreviosTematica").val();
            datos["FechaRealizacionUpdate"] = $("#FechaRealizacion").val();
            datos["FechaAperturaInscripUpdate"] = $("#FechaAperturaInscrip").val();
            datos["FechaLimiteInscripUpdate"] = $("#FechaLimiteInscrip").val();
            datos["PlazasUpdate"] = $("#Plazas").val();
            datos["NumAcompaUpdate"] = $("#NumAcompa").val();
            datos["PrecioUpdate"] = $("#Precio").val();
            datos["DescuentoSociosUpdate"] = $("#DescuentoSocios").val();
            datos["ActividadUpdate"] = $("#editor").data("kendoEditor").value();
            datos["idCursillo"] = idCursillo;

            $.ajax(
            {
                url: "Cursillos/UpdateCursillo",
                type: "POST",
                data: datos,
                success: function () {
                    datasource.read();
                    windowEditar.close();
                }
            });
        }
        else {
            alert("Campos requeridos vacíos");
        }
    });


    function inicializarDetalles(e) {

        var detailRow = e.detailRow;

        detailRow.find(".detallesCursillosPestanas").kendoTabStrip({
            animation: {
                open: { effects: "fadeIn" }
            }
        });


        var participantes = new kendo.data.DataSource
        ({
            transport:
            {
                read:
                {
                    url: "../Cursillos/participantesDeCursillo",
                    datype: "json",
                    type: "POST",
                    data: { idCursillo: e.data.idCursillo }
                }
            },
            schema:
            {
                model:
                {
                    id: "idUsuario",
                    fields:
                    {
                        Nombre: {},
                        Apellidos: {},
                        NumAcompa: {}
                    }
                }
            }
        });

        var tablaParticipantes = $(".Participantes").kendoGrid
        ({
            dataSource: participantes,
            sorteable: true,
            pageable: true,
            selectable: true,
            filterable: true,
            columns:
            [
                {
                    field: "Nombre",
                    title: "Nombre",
                    filterable:
                    {
                        extra: false, //do not show extra filters
                        operators:
                            { // redefine the string operators
                                string:
                                {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                    }
                },
                {
                    field: "Apellidos",
                    title: "Apellidos",
                    filterable:
                    {
                        extra: false, //do not show extra filters
                        operators:
                            { // redefine the string operators
                                string:
                                {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                    }
                },
                {
                    field: "NumAcompa",
                    title: "Num Acompañantes",
                    filterable:
                    {
                        extra: false, //do not show extra filters
                        operators:
                            { // redefine the string operators
                                string:
                                {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                    }
                },
                {
                    field: "PrecioPorGrupo",
                    title: "Precio del grupo",
                    filterable:
                    {
                        extra: false, //do not show extra filters
                        operators:
                            { // redefine the string operators
                                string:
                                {
                                    eq: "Es igual a..",
                                    neq: "No es igual a...",
                                    startswith: "Empieza por...",
                                    contains: "Contiene"
                                }
                            }
                    }
                }
            ]
        });
    }

    $("#botonFacturas").live("click", function () {

        var fila = $("#Cursillostabla").data("kendoGrid").select();
        var filaJson = $("#Cursillostabla").data("kendoGrid").dataItem(fila).toJSON(); // La pasamos a JSON

        var Cursillo = datasource.getByUid(fila.attr("data-uid"));

        location.replace("../Cursillos/cargarVistaFacturasCursillo/" + Cursillo.idCursillo);
    });

    $("#botonInscripcion").live("click", function () {

        var fila = $("#Cursillostabla").data("kendoGrid").select();
        var filaJson = $("#Cursillostabla").data("kendoGrid").dataItem(fila).toJSON(); // La pasamos a JSON

        var Cursillo = datasource.getByUid(fila.attr("data-uid"));
        var Titulo = Cursillo.Titulo;
        idCursillo = Cursillo.idCursillo;
        var Precio = Cursillo.Precio;
        maxacompa = Cursillo.NumAcompa;
        var inscripcionExistente;
        TotalParticipantesGeneral = Cursillo.TotalParticipantes;
        PlazasLibresGeneral = Cursillo.PlazasLibres;

        if (PlazasLibresGeneral > 0) {
            $.ajax
            ({
                url: "Cursillos/comprobarInscrip",
                type: "POST",
                data: { idCursillo: idCursillo },
                async: false,
                success: function (data) {
                    inscripcionExistente = data;
                }
            });
            if (inscripcionExistente == "False") {
                $("#TituloCursilloInscripcion").text(Titulo);
                $("#PrecioCursilloInscripcion").text(Precio);

                $("#acompaWrapper").empty();
                $("#acompaWrapper").html('<div id="NumeroAcompa"><label> Número de acompañantes: </label><input id="Acompanantes" /></div>');
                $("#AcompanantesDropdown").data("kendoDropDownList").select(0);

                $("#Acompanantes").kendoNumericTextBox
            ({
                min: 1,
                max: maxacompa,
                step: 1,
                format: "0"
            });

                $("#NumeroAcompa").hide();

                windowInscripcion.center();
                windowInscripcion.open();
            }
            else {
                alert("Ya está inscrito a este Cursillo")
            }
        }
        else {
            alert("No quedan plazas libres en este cursillo")
        }
    });

    $(".botonEliminarFila").live("click", function () {

        var fila = $("#Cursillostabla").data("kendoGrid").select(); // Cogemos la fila seleccionada
        var filaJson = $("#Cursillostabla").data("kendoGrid").dataItem(fila).toJSON(); // La pasamos a JSON

        var idCursillo = datasource.getByUid(fila.attr("data-uid")).idCursillo;

        $.ajax({
            url: "Cursillos/eliminarCursillo",
            type: "POST",
            data: { idCursillo: idCursillo },
            success: function () {
                datasource.read();
            }
        });
    });

    setTimeout(cargarEtiqueta, 1000);
    function cargarEtiqueta() {
        $("#botonInscripcion").qtip({
            content: {
                text: "Seleccione un Evento y haga click para Inscribirse"
            },
            position: {
                my: "top left"
            }
        });

        $("#botonFacturas").qtip({
            content: {
                text: "Seleccione un Cursillo y haga click para ver la Factura asociada"
            },
            position: {
                my: "top left"
            }
        });
    }
});

function comprobarNecesarios(formulario) {
    var noHayErrores = true;
    $("#" + formulario + " .requerido").each(function (index) {
        if ($(this).val() == "") {
            $(this).addClass("k-invalid");
            noHayErrores = false;
        }
    });
    return noHayErrores;
}