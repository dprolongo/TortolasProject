<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="PedidosCerradosTitle" ContentPlaceHolderID="TitleContent" runat="server">
    PedidosCerrados
</asp:Content>

<asp:Content ID="PedidosCerradosMain" ContentPlaceHolderID="MainContent" runat="server">

<div id="PedidosCerradosGrid"></div>

</asp:Content>

<asp:Content ID="PedidosCerradosCss" ContentPlaceHolderID="CssContent" runat="server">
</asp:Content>

<asp:Content ID="PedidosCerradosScript" ContentPlaceHolderID="ScriptContent" runat="server">
<script src="<%: Url.Content("~/Scripts/jsactions/Pedidos/pedidosCerrados.js") %>" type="text/javascript"></script>
</asp:Content>
