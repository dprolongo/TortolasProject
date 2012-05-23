<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="FacturasIndexCss" ContentPlaceHolderID="CssContent" runat="server">
    <link href="../../Content/Facturas/facturasNav.css" rel="stylesheet" type="text/css" /> 
    <link href="../../Content/Facturas/facturasIndex.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="FacturasIndexScript" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jsactions/Facturas/facturasNav.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Facturas/facturasIndex.js") %>" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="FacturasIndexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Gestión de facturas
</asp:Content>

<asp:Content ID="FacturasIndexMain" ContentPlaceHolderID="MainContent" runat="server">
    <%Html.RenderPartial("facturasNav"); %>    

    <div id="facturaContainer">
        <div id="FacturasGrid"></div>        
    </div>

    <div id='filtrosVentana'>
                    <div id='relacionesTab'>
                        <ul>
                            <li class="k-state-active">General</li>
                            <li>Usuarios</li>
                            <li>Eventos</li>
                            <li>Cursillos</li>
                            <li>Pedidos globales</li>
                            <li>Pedidos usuario</li>
                            <li>Empresas</li>
                            <li>Proveedores</li>
                            <li>Contratos</li>
                        </ul>
                        <div id='generalDiv'>
                            Opciones generales
                        </div>
                        <div id='usuariosFacturaDiv'>
                            <div id='usuariosFacturaGrid'></div>                        
                        </div>
                        <div id='eventosFacturaDiv'>
                            <div id='eventosFacturaGrid'></div>
                        </div>
                        <div id='cursillosFacturaDiv'>
                            <div id='cursillosFacturaGrid'></div>
                        </div>
                        <div id='pedidosGlobalesDiv'>
                            <div id='pedidosGlobalesGrid'></div>
                        </div>
                        <div id='pedidosUsuarioDiv'>
                            <div id='pedidosUsuarioGrid'></div>
                        </div>
                        <div id='empresasDiv'>
                            <div id='empresasGrid'></div>
                        </div>
                        <div id='proveedoresDiv'>
                            <div id='proveedoresGrid'></div>
                        </div>
                        <div id='contratosDiv'>
                            <div id='contratosGrid'></div>
                        </div>
                    </div>  
                    <div id='filtrarButton' class='k-button'>Filtrar</div>              
                
    </div>

    <script type="text/x-kendo-template" id="toolbarTemplate">
                <div class="toolbar">
                    <div class='k-button k-button-icontext'><%: Html.ActionLink("Nueva factura", "nuevaFactura", "Facturas") %></div>
                    <div class='ingresosButton k-button k-button-icontext'>Ingresos</div>
                    <div class='gastosButton k-button k-button-icontext'>Gastos</div>
                    <div class='pendientesButton k-button k-button-icontext'>Sólo pendientes</div>
                    <div class='ventanaFiltrosButton k-button k-button-icontext'>Más filtros</div>
                    <div class='pageSizeDropDownContainer'>
                        <label class="pagesize-label" for="pageSizeDropDown"></label>
                        <div class='pageSizeDropDown'></div>
                    </div>
                    <div class='limpiarButton k-button k-button-icontext'>Quitar filtros</div>
                </div>
    </script>
</asp:Content>

