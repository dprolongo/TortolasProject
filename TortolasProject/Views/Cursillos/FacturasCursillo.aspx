<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Facturas cursillo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Facturas Cursillo</h2>
<input type='hidden' id='idCursillo' value='<%= Model %>' />
<div id='facturasGrid'>
</div>
<input type="button" class="k-button" id="atras" value="A Cursillos"  />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CssContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="../../Scripts/jsactions/Eventos/facturaCursillo.js" type="text/javascript"></script>
</asp:Content>
