var idCursillo;
$(document).ready(function () {
    idCursillo = $("#idCursillo").val();

    var facturasdatasource = new kendo.data.DataSource
    ({
        transport:
        {
            read:
            {
                url: "../../Facturas/leerFacturasByCursillo",
                datype: "json",
                type: "POST",
                data: { idCursillo: idCursillo }
            }
        },
        schema:
        {
            model:
            {
                id: "idFactura"
            }
        }
    });
    $("#atras").click(function () {
        location.replace('../../Cursillos/');
    });
    var tablaFacturas = $("#facturasGrid").kendoGrid
    ({
        dataSource: facturasdatasource,
        sorteable: true,
        pageable: true,
        selectable: true,
        filterable: true,
        columns:
        [
            {
                field: "NumFactura",
                title: "Número factura",
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
                field: "Fecha",
                title: "Fecha",
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
                field: "Concepto",
                title: "Concepto",
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
                field: "Total",
                title: "Total",
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
                field: "EstadoName",
                title: "Estado",
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
                 title: "Herramientas",
                 width: "200px",
                 command: [{ text: "Establecer Pagado", className: "botonEstablecerPagado"}]
             }
        ]
    });
    $("#facturasGrid .k-grid-content tr").live("dblclick", function () {
        // Obtenemos la UID de la fila creada por KENDO
        var uid = $(this).attr("data-uid");

        // Obtenemos la fila
        var fila = facturasdatasource.getByUid(uid);

        // Llamamos a la función para ver los detalles de la factura
        leerFactura(fila.idFactura);
    });

    $("#facturasGrid").delegate(".botonEstablecerPagado", "click", function (e) {
        e.preventDefault();

        var factura = $("#facturasGrid").data("kendoGrid").dataItem($(this).closest("tr"));
        console.log("La factura es:" + factura.idFactura);
        $.ajax
        ({
            url: "../../../Cursillos/establecerCursilloPagado",
            type: "POST",
            data: { idFactura: factura.idFactura },
            success: function () {
                $("#facturasGrid").data("kendoGrid").dataSource.read();
                alert("La factura ha cambiado su estado a PAGADA");

            },
            async: false
        });


    });
});

function leerFactura(idFactura) {

    var url = "../../Facturas/leerFactura/" + idFactura;
    location.replace(url);
}