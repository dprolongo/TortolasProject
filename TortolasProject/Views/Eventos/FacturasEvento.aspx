<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Guid>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Facturas evento
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Facturas Evento</h2>
<input type='hidden' id='idEventoOficial' value='<%= Model %>' />
<div id='facturasGrid'>
</div>
<input type="button" class="k-button" id="atras" value="A Eventos"  />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CssContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="../../Scripts/jsactions/Eventos/facturaEvento.js" type="text/javascript"></script>

</asp:Content>
