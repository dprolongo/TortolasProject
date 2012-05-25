

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

                    
            <center>
                <img src="../../Content/images/titulobienvenida.png" /><br />
                <img src="../../Content/images/titulocaptacion.png" />
            </center>
                       
             <p style="margin:10px 5px 10px 5px">
                <h2>A continuacion le mostraremos una serie de gráficas de los ultimos tres años sobre datos de la Asociacion.</h2>                       
                <br /><br />
             </p>
            <div id="graficas">
                <ul>
                    <li>Calculadora</li>
                    <li>Altas</li>
                    <li>Socios</li>
                    <li>Eventos</li>
                    <li>Pedidos</li>                    
                </ul>
                <div id="pestanaCalculadora">
                
                </div>
                <div id="pestanaAltas">                 
                        
                        <div id="graficaAltas"></div>
                 </div>
                 <div id="pestanaNumeroSocios">
                 <br /><br />
                            <p style="margin:20px 0px 10px 30px" id="numeroDeSocios" ><b>Numero de Socios actuales:  <b></p>
                            <div id="graficaNumeroSocio"></div>
                 </div>
                 <div id="pestanaEventos">
                 
                 </div>                                               
                 <div id="pestanaPedidos">
                 
                 </div>
              </div>          
                                             

</asp:Content>
