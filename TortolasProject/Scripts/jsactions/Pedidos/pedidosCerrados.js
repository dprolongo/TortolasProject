var PedidosCerrados;

$(document).ready(function () {

    PedidosCerrados = $("#PedidosCerradosGrid").kendoGrid({
        selectable: true,
        detailTemplate: kendo.template($("#templateDetailPedidosCerrados").html()),
        detailInit: inicializarTabla,
        columns: [
                  {
                      field: "nombre",
                      title: "Nombre"
                  },
                  {
                      field: "estado",
                      title: "Fecha Límite"
                  },
                   {
                       field: "descuento",
                       title: "Descuento"
                   },
                  {
                      field: "total",
                      title: "Total"
                  }],
        dataSource: {
            transport: {
                read: {
                    url: "Pedidos/leerTodos",
                    dataType: "json",
                    type: "POST"
                }
            },
            schema:
                {
                    model:
                       {
                           id: "idPedidoGlobal"
                       }
                }
        }
    }).data("kendoGrid");

});