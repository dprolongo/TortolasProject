<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<TortolasProject.Models.tbFactura>" %>

<div id='facturaContainer' >
        <div id='facturaHeader'>
           
            <div id='relacionDiv'><% Response.Write(Model.idRelacion);  %></div>
     

            <div id='fechaFacturaDiv' class='leftContent'>
                Fecha
                <div id='fechaFacturaLabel'>
                <%
                       Response.Write(Model.Fecha.ToShortDateString());                                
                %>
                </div> 
            </div>

            <div id='conceptoFacturaDiv' class='leftContent'>
                Concepto  
                <div id='conceptoFacturaLabel'>
                <%
                    Response.Write(Model.Concepto);                   
                %>
                </div>
            </div>
            <div id='responsableFacturaDiv' class='rightContent'>
                <% Response.Write(Model.ResponsableName); %>
            </div>
            <div id='estadoFacturaDiv' class='rightContent'>                
                <div id='estadoFacturaLabel'>
                <% Response.Write(Model.EstadoName); %></div>
            </div>
        </div>
        
        <div id='facturaLineasFacturaGrid' class='k-grid'>
           <table>
            <tr>
                <th class='k-header'>Concepto</th>
                <th class='k-header'>Unidades</th>
                <th class='k-header'>Precio unitario</th>
                <th class='k-header'>Total</th>
            </tr>
        <% foreach (TortolasProject.Models.tbLineaFactura linea in Model.LineasFactura)
            {
        %>
            <tr>
                <td class='k-grid-content'><%= linea.Descripcion %></td>  
                <td class='k-grid-content'><%= linea.Unidades %></td> 
                <td class='k-grid-content'><%= linea.PrecioUnitario %></td> 
                <td class='k-grid-content'><%= linea.Total %></td> 
            </tr> 
        <% } %>           
           </table>
        </div>
        

        <div id='totalFacturaDiv' class='rightContent'>
                <div id='baseImponibleLabel'>Base imponible</div>
                <div id='baseImponibleNumero'><% Response.Write(Model.BaseImponible); %></div>
                <div id='ivaLabel'>IVA</div>
                <div id='ivaNumero'>18%</div>
                <div id='totalFacturaLabel'>
                    Total
                </div>
                <div id='totalFacturaNumero'>
                <% Response.Write(Model.Total); %>
                    
                </div>
        </div>
</div>

