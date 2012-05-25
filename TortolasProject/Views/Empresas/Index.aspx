<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="EmpresasIndexCss" ContentPlaceHolderID="CssContent" runat="server">
    <link href="../../Content/Empresas/EmpresasNav.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Empresas/EmpresasNew.css" rel="stylesheet" type="text/css" /> 
    <link href="../../Content/Empresas/FormatoTexto.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="EmpresasIndexScript" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Empresas/EmpresasNav.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Empresas/EmpresasIndex.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Empresas/NuevaEmpresa.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Asociaciones/Asociaciones.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Proveedores/Proveedores.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Patrocinadores/Patrocinadores.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Convenios/Convenios.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsactions/Empresas/Contratos/Contratos.js") %>" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="EmpresasIndexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Gestión de Empresas
</asp:Content>

<asp:Content ID="EmpresasIndexMain" ContentPlaceHolderID="MainContent" runat="server">
     <div id="EmpresasNavegador" class="k-widget">
        <ul>
            <li id="EmpresasNav" class="k-state-active">
                Empresas
            </li>
            <li id="AsociacionesNav">
                Asociaciones
            </li>
            <li id="ProveedoresNav">
                Proveedores
            </li>
            <li id="PatrocinadoresNav">
                Patrocinadores
            </li>  
            <li id="ConveniosNav">
                Convenios
            </li>  
            <li id="ContratosNav">
                Contratos
            </li>  
        </ul> 
        <div class="pestana" id="empresas">
            <img src="../../Content/images/empresas.png"  /> <!--Fuente: Calibri, size: 24-->
            <div id="EmpresasGrid">
            
            </div>
            <br />
            <div id="EmpresasHerramientasContent">
                <input type="button" value="Nueva Empresa" id="BotonNuevaEmpresa" class="k-button" />
            </div>
        </div>
        <div class="pestana" id="asociaciones">
            <img src="../../Content/images/asociaciones.jpg"  /> <!--Fuente: Calibri, size: 24-->
            <div id="AsociacionesGrid">
            
            </div>
            <br />
            <div id="AsociacionesHerramientasContent">
                <input type="button" value="Nueva Asociación" id="BotonNuevaAsociacion" class="k-button" />
            </div>
        </div>
        <div class="pestana" id="proveedores">
            <img src="../../Content/images/proveedores.jpg"  /> <!--Fuente: Calibri, size: 24-->
            <div id="ProveedoresGrid">
            
            </div>
            <br />
            <div id="ProveedorHerramientasContent">
                <input type="button" value="Nueva Proveedor" id="BotonNuevoProveedor" class="k-button" />
            </div>
        </div> 
        <div class="pestana" id="patrocinadores">
            <img src="../../Content/images/patrocinador.jpg"  /> <!--Fuente: Calibri, size: 24-->
            <div id="PatrocinadoresGrid">
            
            </div>
            <script type="text/x-kendo-template" id="detallepublicidad">
                <img src="../../Content/images/publicidad.jpg"  /> <!--Fuente: Calibri, size: 24-->
                <div class="PublicidadGrid" id="PubliGrid_#= idPatrocinador #">
                </div>
                <br />
                <input type="button" value="Nuevo Elemento Publicitario" class="k-button BotonNuevaPublicidad" patrocinador="#= idPatrocinador #" />
            </script>
            <br />
            <div id="PatrocinadorHerramientasContent">
                <input type="button" value="Nueva Patrocinador" id="BotonNuevoPatrocinador" class="k-button" />
            </div>
        </div> 
        <div class="pestana" id="convenios">
            <img src="../../Content/images/convenios.jpg"  /> <!--Fuente: Calibri, size: 24-->
            <div id="ConveniosGrid">
            
            </div>
            <br />
            <div id="ConveniosHerramientasContent">
                <input type="button" value="Nueva Convenio" id="BotonNuevoConvenio" class="k-button" />
            </div>
        </div>
        <div class="pestana" id="contratos">
            <img src="../../Content/images/contrato.jpg"  /> <!--Fuente: Calibri, size: 24-->
            <div id="ContratosGrid">
            
            </div>
            <br />
            <div id="ContratosHerramientasContent">
                <input type="button" value="Nuevo Contrato" id="BotonNuevoContrato" class="k-button" />
            </div>
        </div>
          
    </div> 
    <br />

    <div id="VentanaEditar">
        <b><h5>Datos Empresa</h5></b>
        <br />
        <label for="nombreempresa">Nombre: </label><input type="text" id="nombreempresa" class=" CuadroTexto k-textbox requerido" /><br />
        <label for="cif">CIF: </label><input type="text" id="cif" class=" CuadroTexto k-textbox requerido" /><br />
        <label for="localidad">Localidad: </label><input type="text" id="localidad" class=" CuadroTexto k-textbox" /><br />
        <label for="direccionweb">Dirección Web: </label><input type="text" id="direccionweb" class=" CuadroTexto k-textbox" /><br />
        <label for="telefonodecontacto">Teléfono de Contacto: </label><input type="text" id="telefonodecontacto" class=" CuadroTexto k-textbox requerido" /><br />
        <label for="email">E-Mail: </label><input type="text" id="email-c" class=" CuadroTexto k-textbox" /><br />
        <center>
            <div hidden="hidden" id="MensajeErrorEmpresaEditar" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEditar" class="k-button VisibilidadBotonAceptarEditar" />
            <input type="button" value="Confirmar" id="BotonAceptarVentanaEliminar" class="k-button VisibilidadBotonAceptarEliminar" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEditar" class="k-button" />           
        </center>
    </div>

    <div id="VentanaCrearEmpresa" class="ComprobarNulos">
        <h5>Datos Empresa</h5>
        <label for="nombreempresa">Nombre: </label><input type="text" id="newnombreempresa" class="k-textbox requerido" /><br />
        <label for="cif">CIF: </label><input type="text" id="newcif" class="k-textbox requerido" /><br />
        <h5>Datos Contacto</h5>
        <label for="localidad">Localidad: </label><input type="text" id="newlocalidad0" class=" k-textbox" /><br />
        <select id="newlocalidad">
            <option value="AF">Afganistán</option> 
                      <option value="AL">Albania</option> 
                      <option value="DE">Alemania</option> 
                      <option value="AD">Andorra</option> 
                      <option value="AO">Angola</option> 
                      <option value="AI">Anguilla</option> 
                      <option value="AQ">Antártida</option> 
                      <option value="AG">Antigua y Barbuda</option> 
                      <option value="AN">Antillas Holandesas</option> 
                      <option value="SA">Arabia Saudí</option> 
                      <option value="DZ">Argelia</option> 
                      <option value="AR">Argentina</option> 
                      <option value="AM">Armenia</option> 
                      <option value="AW">Aruba</option> 
                      <option value="AU">Australia</option> 
                      <option value="AT">Austria</option>  
                      <option value="AZ">Azerbaiyán</option>  
                      <option value="BS">Bahamas</option>  
                      <option value="BH">Bahrein</option>  
                      <option value="BD">Bangladesh</option>  
                      <option value="BB">Barbados</option>  
                      <option value="BE">Bélgica</option>  
                      <option value="BZ">Belice</option>  
                      <option value="BJ">Benin</option>  
                      <option value="BM">Bermudas</option>  
                      <option value="BY">Bielorrusia</option>  
                      <option value="MM">Birmania</option>  
                      <option value="BO">Bolivia</option>  
                      <option value="BA">Bosnia y Herzegovina</option>  
                      <option value="BW">Botswana</option>  
                      <option value="BR">Brasil</option>  
                      <option value="BN">Brunei</option>  
                      <option value="BG">Bulgaria</option>  
                      <option value="BF">Burkina Faso</option>  
                      <option value="BI">Burundi</option>  
                      <option value="BT">Bután</option>  
                      <option value="CV">Cabo Verde</option>  
                      <option value="KH">Camboya</option>  
                      <option value="CM">Camerún</option>  
                      <option value="CA">Canadá</option>  
                      <option value="TD">Chad</option>  
                      <option value="CL">Chile</option>  
                      <option value="CN">China</option>  
                      <option value="CY">Chipre</option>  
                      <option value="VA">Ciudad del Vaticano (Santa Sede)</option>  
                      <option value="CO">Colombia</option>  
                      <option value="KM">Comores</option>  
                      <option value="CG">Congo</option>  
                      <option value="CD">Congo, República Democrática del</option>  
                      <option value="KR">Corea</option>  
                      <option value="KP">Corea del Norte</option>  
                      <option value="CI">Costa de Marfíl</option>  
                      <option value="CR">Costa Rica</option>  
                      <option value="HR">Croacia (Hrvatska)</option>  
                      <option value="CU">Cuba</option>  
                      <option value="DK">Dinamarca</option>  
                      <option value="DJ">Djibouti</option>  
                      <option value="DM">Dominica</option>  
                      <option value="EC">Ecuador</option>  
                      <option value="EG">Egipto</option>  
                      <option value="SV">El Salvador</option>  
                      <option value="AE">Emiratos Árabes Unidos</option>  
                      <option value="ER">Eritrea</option>  
                      <option value="SI">Eslovenia</option>  
                      <option value="ES" selected>España</option>  
                      <option value="US">Estados Unidos</option>  
                      <option value="EE">Estonia</option>  
                      <option value="ET">Etiopía</option>  
                      <option value="FJ">Fiji</option>  
                      <option value="PH">Filipinas</option>  
                      <option value="FI">Finlandia</option>  
                      <option value="FR">Francia</option>  
                      <option value="GA">Gabón</option>  
                      <option value="GM">Gambia</option>  
                      <option value="GE">Georgia</option>  
                      <option value="GH">Ghana</option>  
                      <option value="GI">Gibraltar</option>  
                      <option value="GD">Granada</option>  
                      <option value="GR">Grecia</option>  
                      <option value="GL">Groenlandia</option>  
                      <option value="GP">Guadalupe</option>  
                      <option value="GU">Guam</option>  
                      <option value="GT">Guatemala</option>  
                      <option value="GY">Guayana</option>  
                      <option value="GF">Guayana Francesa</option>  
                      <option value="GN">Guinea</option>  
                      <option value="GQ">Guinea Ecuatorial</option>  
                      <option value="GW">Guinea-Bissau</option>  
                      <option value="HT">Haití</option>  
                      <option value="HN">Honduras</option>  
                      <option value="HU">Hungría</option>  
                      <option value="IN">India</option>  
                      <option value="ID">Indonesia</option>  
                      <option value="IQ">Irak</option>  
                      <option value="IR">Irán</option>  
                      <option value="IE">Irlanda</option>  
                      <option value="BV">Isla Bouvet</option>  
                      <option value="CX">Isla de Christmas</option>  
                      <option value="IS">Islandia</option>  
                      <option value="KY">Islas Caimán</option>  
                      <option value="CK">Islas Cook</option>  
                      <option value="CC">Islas de Cocos o Keeling</option>  
                      <option value="FO">Islas Faroe</option>  
                      <option value="HM">Islas Heard y McDonald</option>  
                      <option value="FK">Islas Malvinas</option>  
                      <option value="MP">Islas Marianas del Norte</option>  
                      <option value="MH">Islas Marshall</option>  
                      <option value="UM">Islas menores de Estados Unidos</option>  
                      <option value="PW">Islas Palau</option>  
                      <option value="SB">Islas Salomón</option>  
                      <option value="SJ">Islas Svalbard y Jan Mayen</option>  
                      <option value="TK">Islas Tokelau</option>  
                      <option value="TC">Islas Turks y Caicos</option>  
                      <option value="VI">Islas Vírgenes (EE.UU.)</option>  
                      <option value="VG">Islas Vírgenes (Reino Unido)</option>  
                      <option value="WF">Islas Wallis y Futuna</option>  
                      <option value="IL">Israel</option>  
                      <option value="IT">Italia</option>  
                      <option value="JM">Jamaica</option>  
                      <option value="JP">Japón</option>  
                      <option value="JO">Jordania</option>  
                      <option value="KZ">Kazajistán</option>  
                      <option value="KE">Kenia</option>  
                      <option value="KG">Kirguizistán</option>  
                      <option value="KI">Kiribati</option>  
                      <option value="KW">Kuwait</option>  
                      <option value="LA">Laos</option>  
                      <option value="LS">Lesotho</option>  
                      <option value="LV">Letonia</option>  
                      <option value="LB">Líbano</option>  
                      <option value="LR">Liberia</option>  
                      <option value="LY">Libia</option>  
                      <option value="LI">Liechtenstein</option>  
                      <option value="LT">Lituania</option>  
                      <option value="LU">Luxemburgo</option>  
                      <option value="MK">Macedonia, Ex-República Yugoslava de</option>  
                      <option value="MG">Madagascar</option>  
                      <option value="MY">Malasia</option>  
                      <option value="MW">Malawi</option>  
                      <option value="MV">Maldivas</option>  
                      <option value="ML">Malí</option>  
                      <option value="MT">Malta</option>  
                      <option value="MA">Marruecos</option>  
                      <option value="MQ">Martinica</option>  
                      <option value="MU">Mauricio</option>  
                      <option value="MR">Mauritania</option>  
                      <option value="YT">Mayotte</option>  
                      <option value="MX">México</option>  
                      <option value="FM">Micronesia</option>  
                      <option value="MD">Moldavia</option>  
                      <option value="MC">Mónaco</option>  
                      <option value="MN">Mongolia</option>  
                      <option value="MS">Montserrat</option>  
                      <option value="MZ">Mozambique</option>  
                      <option value="NA">Namibia</option>  
                      <option value="NR">Nauru</option>  
                      <option value="NP">Nepal</option>  
                      <option value="NI">Nicaragua</option>  
                      <option value="NE">Níger</option>  
                      <option value="NG">Nigeria</option>  
                      <option value="NU">Niue</option>  
                      <option value="NF">Norfolk</option>  
                      <option value="NO">Noruega</option>  
                      <option value="NC">Nueva Caledonia</option>  
                      <option value="NZ">Nueva Zelanda</option>  
                      <option value="OM">Omán</option>  
                      <option value="NL">Países Bajos</option>  
                      <option value="PA">Panamá</option>  
                      <option value="PG">Papúa Nueva Guinea</option>  
                      <option value="PK">Paquistán</option>  
                      <option value="PY">Paraguay</option>  
                      <option value="PE">Perú</option>  
                      <option value="PN">Pitcairn</option>  
                      <option value="PF">Polinesia Francesa</option>  
                      <option value="PL">Polonia</option>  
                      <option value="PT">Portugal</option>  
                      <option value="PR">Puerto Rico</option>  
                      <option value="QA">Qatar</option>  
                      <option value="UK">Reino Unido</option>  
                      <option value="CF">República Centroafricana</option>  
                      <option value="CZ">República Checa</option>  
                      <option value="ZA">República de Sudáfrica</option>  
                      <option value="DO">República Dominicana</option>  
                      <option value="SK">República Eslovaca</option>  
                      <option value="RE">Reunión</option>  
                      <option value="RW">Ruanda</option>  
                      <option value="RO">Rumania</option>  
                      <option value="RU">Rusia</option>  
                      <option value="EH">Sahara Occidental</option>  
                      <option value="KN">Saint Kitts y Nevis</option>  
                      <option value="WS">Samoa</option>  
                      <option value="AS">Samoa Americana</option>  
                      <option value="SM">San Marino</option>  
                      <option value="VC">San Vicente y Granadinas</option>  
                      <option value="SH">Santa Helena</option>  
                      <option value="LC">Santa Lucía</option>  
                      <option value="ST">Santo Tomé y Príncipe</option>  
                      <option value="SN">Senegal</option>  
                      <option value="SC">Seychelles</option>  
                      <option value="SL">Sierra Leona</option>  
                      <option value="SG">Singapur</option>  
                      <option value="SY">Siria</option>  
                      <option value="SO">Somalia</option>  
                      <option value="LK">Sri Lanka</option>  
                      <option value="PM">St. Pierre y Miquelon</option>  
                      <option value="SZ">Suazilandia</option>  
                      <option value="SD">Sudán</option>  
                      <option value="SE">Suecia</option>  
                      <option value="CH">Suiza</option>  
                      <option value="SR">Surinam</option>  
                      <option value="TH">Tailandia</option>  
                      <option value="TW">Taiwán</option>  
                      <option value="TZ">Tanzania</option>  
                      <option value="TJ">Tayikistán</option>  
                      <option value="TF">Territorios franceses del Sur</option>  
                      <option value="TP">Timor Oriental</option>  
                      <option value="TG">Togo</option>  
                      <option value="TO">Tonga</option>  
                      <option value="TT">Trinidad y Tobago</option>  
                      <option value="TN">Túnez</option>  
                      <option value="TM">Turkmenistán</option>  
                      <option value="TR">Turquía</option>  
                      <option value="TV">Tuvalu</option>  
                      <option value="UA">Ucrania</option>  
                      <option value="UG">Uganda</option>  
                      <option value="UY">Uruguay</option>  
                      <option value="UZ">Uzbekistán</option>  
                      <option value="VU">Vanuatu</option>  
                      <option value="VE">Venezuela</option>  
                      <option value="VN">Vietnam</option>  
                      <option value="YE">Yemen</option>  
                      <option value="YU">Yugoslavia</option>  
                      <option value="ZM">Zambia</option>  
                      <option value="ZW">Zimbabue</option>
        </select><br />
        <label for="direccionweb">Dirección Web: </label><input type="text" id="newdireccionweb" class=" k-textbox" /><br />
        <label for="telefonodecontacto">Teléfono de Contacto: </label><input type="text" id="newtelefonodecontacto" class=" k-textbox requerido" /><br />
        <label for="email">E-Mail: </label><input type="text" id="newemail-c" class=" k-textbox" /><br />
        <center>
            <div id="NuevaEmpresaHerramientasContent">
                <div hidden="hidden" id="MensajeErrorEmpresas" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
                </div>
                <input type="button" value="Confirmar" id="BotonConfirmarNuevaEmpresa" class="k-button" />
                <input type="button" value="Cancelar" id="BotonCancelarNuevaEmpresa" class="k-button FuncionBotonCancelarProveedores" />
            </div>
        </center>
    </div>

    <div id="VentanaEditarAsociacion" class="ComprobarNulosAsociaciones">
        <b><h5>Datos Asociacion</h5></b>
        <br />
        <label for="nombreempresaasociacion">Nombre: </label><input type="text" id="nombreempresaasociacion" class=" CuadroTexto NoModificable nombreempresaasociacion k-textbox requerido" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifremoto" class=" CuadroTexto NoModificable cifremoto k-textbox requerido" /> <input type="button" value="Vincular Empresa" id="BotonVincularEmpresaDesdeAsociacion" class="k-button VisibilidadBotonVincularEmpresa" /><br />
        <label for="direccion">Dirección: </label><input type="text" id="direccion" class=" CuadroTexto k-textbox" /><br />
        <label for="tematica">Temática: </label><input type="text" id="tematica" class=" CuadroTexto k-textbox" /><br />
        <label for="telefono" class="VisibilidadTelefonodeContacto">Teléfono de Contacto: </label><input type="text" id="telefonoremoto" class=" CuadroTexto VisibilidadTelefonodeContacto NoModificable k-textbox requerido" /><br />
        <hr />

        <div id="DatosNuevaEmpresaRemota" class="VisibilidadDatosNuevaEmpresaRemota">
            <b><h5>Datos Empresa Asociada</h5></b>
            <br />
            <label for="localidad">Localidad: </label><input type="text" id="localidadremota" class=" CuadroTexto localidadremota k-textbox" /><br />
            <label for="direccionweb">Dirección Web: </label><input type="text" id="dirwebremota" class=" CuadroTexto dirwebremota k-textbox" /><br />
            <label for="telefonodecontacto">Teléfono de Contacto: </label><input type="text" id="telefonoremoto2" class=" CuadroTexto telefonoremoto2 k-textbox requerido" /><br />
            <label for="email">E-Mail: </label><input type="text" id="emailremoto" class=" CuadroTexto emailremoto k-textbox" /><br />
        </div>

        <center>
            <div hidden="hidden" id="MensajeErrorAsociaciones" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEditarAsociacion" class="k-button VisibilidadBotonAceptarEditar" />
            <input type="button" value="Confirmar" id="BotonAceptarVentanaEliminarAsociacion" class="k-button VisibilidadBotonAceptarEliminar" />
            <input type="button" value="Crear" id="BotonAceptarVentanaCrearAsociacion" class="k-button VisibilidadBotonAceptarCrear" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEditarAsociacion" class="k-button" />           
        </center>

        
    </div>

    <div id="VentanaEditarProveedor">
        <b><h5>Datos Proveedor</h5></b>
        <br />
        <label for="nombreempresaproveedor">Nombre: </label><input type="text" id="nombreempresaproveedor" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifproveedor" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="direccion">Dirección Física: </label><input type="text" id="dirfisica" class=" CuadroTexto k-textbox" /><br />
        <label for="mercado">Mercado: </label><input type="text" id="mercado" class=" CuadroTexto k-textbox" /><br />
        <label for="codigopostal">Código Postal: </label><input type="text" id="codigopostal" class=" CuadroTexto VisibilidadTelefonodeContacto k-textbox" /><br />
        <br />
        <hr />
        <br />


        <center>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEditarProveedor" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEditarProveedor" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaEliminarProveedor">
        <b><h5>Datos Proveedor</h5></b>
        <br />
        <label for="nombreempresaproveedor">Nombre: </label><input type="text" id="nombreempresaproveedoreliminar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifproveedoreliminar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="direccion">Dirección Física: </label><input type="text" id="direccionproveedoreliminar" class=" CuadroTexto k-textbox" /><br />
        <label for="mercado">Mercado: </label><input type="text" id="mercadoproveedoreliminar" class=" CuadroTexto k-textbox" /><br />
        <label for="codigopostal">Código Postal: </label><input type="text" id="codigopostalproveedoreliminar" class=" CuadroTexto VisibilidadTelefonodeContacto k-textbox" /><br />
        <br />
        <hr />
        <br />


        <center>
            <input type="button" value="Eliminar" id="BotonAceptarVentanaEliminarProveedor" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEliminarProveedor" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaCrearProveedor" class="ComprobarNulosProveedores">
        <b><h5>Datos Proveedor</h5></b>
        <br />
        <label for="nombreempresaproveedor">Nombre: </label><input type="text" id="nuevoproveedornombre" class=" CuadroTexto NoModificable nombreempresaasociacion k-textbox requerido" /><br />
        <label for="cif">CIF: </label><input type="text" id="nuevoproveedorcif" class=" CuadroTexto NoModificable cifremoto k-textbox requerido" /> <input type="button" value="Vincular Empresa" id="BotonVincularEmpresaDesdeProveedor" class="k-button" /><br />
        <label for="direccion">Dirección Física: </label><input type="text" id="nuevoproveedordir" class=" CuadroTexto k-textbox" /><br />
        <label for="mercado">Mercado: </label><input type="text" id="nuevoproveedormercado" class=" CuadroTexto k-textbox" /><br />
        <label for="codigopostal">Código Postal: </label><input type="text" id="nuevoproveedorcpostal" class=" CuadroTexto k-textbox" /><br />
        <label for="telefono" class="VisibilidadTelefonodeContacto">Teléfono de Contacto: </label><input type="text" id="nuevoproveedortlf" class=" CuadroTexto VisibilidadTelefonodeContacto NoModificable k-textbox requerido" /><br />
        <br />
        <hr />
        <br />
        
        <div id="DatosNuevaEmpresaRemota2" class="VisibilidadDatosNuevaEmpresaRemota">
            <b><h5>Datos Empresa Asociada</h5></b>
            <br />
            <label for="localidad">Localidad: </label><input type="text" id="nuevoproveedorlocalidad" class=" CuadroTexto localidadremota k-textbox" /><br />
            <label for="direccionweb">Dirección Web: </label><input type="text" id="nuevoproveedorweb" class=" CuadroTexto dirwebremota k-textbox" /><br />
            <label for="telefonodecontacto">Teléfono de Contacto: </label><input type="text" id="telefonoempresa" class=" CuadroTexto telefonoremoto2 k-textbox requerido" /><br />
            <label for="email">E-Mail: </label><input type="text" id="nuevoproveedoremail" class=" CuadroTexto emailremoto k-textbox" /><br />
        </div>

        <center>
            <div hidden="hidden" id="MensajeErrorProveedores" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Crear" id="BotonAceptarVentanaCrearProveedor" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaCrearProveedor" class="k-button FuncionBotonCancelarProveedores" />          
        </center>
    </div>

    <div id="VentanaEditarPatrocinador">
        <b><h5>Datos Patrocinador</h5></b>
        <br />
        <label for="nombreempresapatrocinadoreditar">Nombre: </label><input type="text" id="nombreempresapatrocinadoreditar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifpatrocinadoreditar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="localizacion">Localización Publicidad: </label><input type="text" id="locpatrocinadoreditar" class=" CuadroTexto k-textbox" /><br />
        <br />
        <hr />
        <br />
        <center>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEditarpatrocinador" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEditarpatrocinador" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaEliminarPatrocinador">
        <b><h5>Datos Patrocinador</h5></b>
        <br />
        <label for="nombreempresaproveedor">Nombre: </label><input type="text" id="nombrepatrocinadoreliminar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifpatrocinadoreliinar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="localizacion">Localización Publicidad: </label><input type="text" id="lopatrocinadoreliminar" class=" CuadroTexto k-textbox" /><br />
        <br />
        <hr />
        <br />


        <center>
            <input type="button" value="Eliminar" id="BotonAceptarVentanaEliminarPatrocinador" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEliminarPatrocinador" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaCrearPatrocinador" class="ComprobarNulosPatrocinadores">
        <b><h5>Datos Patrocinador</h5></b>
        <br />
        <label for="nombreempresaproveedor">Nombre: </label><input type="text" id="nombrepatrocinadornuevo" class=" CuadroTexto NoModificable nombreempresaasociacion k-textbox requerido" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifpatrocinadornuevo" class=" CuadroTexto NoModificable cifremoto k-textbox requerido" /> <input type="button" value="Vincular Empresa" id="BotonVincularEmpresaDesdePatrocinador" class="k-button" /><br />
        <label for="loc">Localización Publicidad: </label><input type="text" id="locpatrocinadornuevo" class=" CuadroTexto k-textbox" /><br />
        <label for="telefono" class="VisibilidadTelefonodeContacto">Teléfono de Contacto: </label><input type="text" id="tlfpatrocinadornuevo" class=" CuadroTexto VisibilidadTelefonodeContacto NoModificable k-textbox requerido" /><br />
        <br />
        <hr />
        <br />
        
        <div id="DatosNuevaEmpresaRemota3" class="VisibilidadDatosNuevaEmpresaRemota">
            <b><h5>Datos Empresa Asociada</h5></b>
            <br />
            <label for="localidad">Localidad: </label><input type="text" id="patrocinadorlocalidadremoto" class=" CuadroTexto localidadremota k-textbox" /><br />
            <label for="direccionweb">Dirección Web: </label><input type="text" id="patrocinadorwebremoto" class=" CuadroTexto dirwebremota k-textbox" /><br />
            <label for="telefonodecontacto">Teléfono de Contacto: </label><input type="text" id="patrocinadortflremoto" class=" CuadroTexto telefonoremoto2 k-textbox" /><br />
            <label for="email">E-Mail: </label><input type="text" id="patrocinadoremailremoto" class=" CuadroTexto emailremoto k-textbox" /><br />
        </div>

        <center>
            <div hidden="hidden" id="MensajeErrorPatrocinadores" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Crear" id="BotonAceptarVentanaCrearPatrocinador" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaCrearPatrocinador" class="k-button FuncionBotonCancelarProveedores" />          
        </center>
    </div>

    <div id="VentanaEditarPublicidad">
        <b><h5>Datos Elemento Publicitario</h5></b>
        <br />
        <label for="loca">Localización: </label><input type="text" id="locpublicidadeditar" class="locpublicidadeditar CuadroTexto NoModificable k-textbox" /><br />
        <label for="carac">Características: </label><input type="text" id="caracpublicidadeditar" class="caracpublicidadeditar CuadroTexto NoModificable k-textbox" /><br />
        <br />
        <hr />
        <br />
        <center>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEditarPublicidad" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEditarPublicidad" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaCrearPublicidad" class="ComprobarNulosPublicidad">
        <b><h5>Datos Elemento Publicitario</h5></b>
        <br />
        <label for="loca">Localización: </label><input type="text" id="locapublicidadcrear" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="carac">Características: </label><input type="text" id="carapublicidadcrear" class=" CuadroTexto NoModificable k-textbox" /><br />
        <br />
        <hr />
        <br />
        <center>
            <div hidden="hidden" id="MensajeErrorPublicidad" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaCrearPublicidad" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaCrearPublicidad" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaEliminarPublicidad">
        <b><h5>Datos Elemento Publicitario</h5></b>
        <br />
        <label for="loca">Localización: </label><input type="text" id="locapublicidadeliminar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="carac">Características: </label><input type="text" id="caracteristicapublicidadeliminar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <br />
        <hr />
        <br />
        <center>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEliminarPublicidad" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEliminarPublicidad" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaEditarConvenio">
        <b><h5>Datos Convenio</h5></b>
        <br />
        <label for="nombreempresaconvenioeditar">Nombre: </label><input type="text" id="nombreempresaconvenioeditar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifempresaconvenio" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="desc">Descripción Oferta: </label><input type="text" id="descconvenioeditar" class=" CuadroTexto k-textbox" /><br />
        <br />
        <hr />
        <br />
        <center>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEditarConvenio" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEditarConvenio" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>
    
    <div id="VentanaEliminarConvenio">
        <b><h5>Datos Convenio</h5></b>
        <br />
        <label for="nombreempresaconvenioeditar">Nombre: </label><input type="text" id="nombreempresaconvenioeliminar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifempresaconvenioeliminar" class=" CuadroTexto NoModificable k-textbox" /><br />
        <label for="desc">Descripción Oferta: </label><input type="text" id="descripcionconvenioeliminar" class=" CuadroTexto k-textbox" /><br />
        <br />
        <hr />
        <br />


        <center>
            <input type="button" value="Eliminar" id="BotonAceptarVentanaEliminarConvenio" class="k-button" />
            <input type="button" value="Cancelar" id="BotoncancelarVentanaEliminarConvenio" class="k-button FuncionBotonCancelarProveedores" />    
        </center>
    </div>

    <div id="VentanaCrearConvenio" class="ComprobarNulosConvenio">
        <b><h5>Datos Convenio</h5></b>
        <br />
        <label for="nombreempresaproveedor">Nombre: </label><input type="text" id="nombreempresaconveniocrear" class=" CuadroTexto NoModificable requerido nombreempresaasociacion k-textbox" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifconveniocrear" class=" CuadroTexto NoModificable cifremoto k-textbox requerido" /> <input type="button" value="Vincular Empresa" id="BotonVincularEmpresaDesdeConvenio" class="k-button" /><br />
        <label for="descripcion">Descripción: </label><input type="text" id="descripcionconveniocrear" class=" CuadroTexto k-textbox" /><br />
        <label for="telefono" class="VisibilidadTelefonodeContacto">Teléfono de Contacto: </label><input type="text" id="tlfconveniocrear" class=" CuadroTexto requerido VisibilidadTelefonodeContacto NoModificable k-textbox" /><br />
        <br />
        <hr />
        <br />
        
        <div id="Div2" class="VisibilidadDatosNuevaEmpresaRemota">
            <b><h5>Datos Empresa Asociada</h5></b>
            <br />
            <label for="localidad">Localidad: </label><input type="text" id="locempresaremotaconveniocrear" class=" CuadroTexto localidadremota k-textbox" /><br />
            <label for="direccionweb">Dirección Web: </label><input type="text" id="webempresaremotaconveniocrear" class=" CuadroTexto dirwebremota k-textbox" /><br />
            <label for="telefonodecontacto">Teléfono de Contacto: </label><input type="text" id="tlfempresaremotaconveniocrear" class=" CuadroTexto requerido telefonoremoto2 k-textbox" /><br />
            <label for="email">E-Mail: </label><input type="text" id="emailempresaremotaconveniocrear" class=" CuadroTexto emailremoto k-textbox" /><br />
        </div>

        <center>
            <div hidden="hidden" id="MensajeErrorConvenios" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Crear" id="BotonAceptarVentanaCrearConvenio" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaCrearConvenio" class="k-button FuncionBotonCancelarProveedores" />          
        </center>
    </div>

    <div id="VentanaEditarContrato" class="ComprobarNulosContratosEditar">
        <h5>Datos Empresa</h5>
        <label for="nombreempresacontratoeditar">Nombre: </label><input type="text" id="nombreempresacontratoeditar" class=" CuadroTexto k-textbox nombreempresaasociacion NoModificable" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifcontratoeditar" class=" CuadroTexto k-textbox cifremoto NoModificable" /><br />
        <input type="button" value="Cambiar Empresa" id="CambiarEmpresaContratoEditar" class="k-button" />
        <hr />
        <h5>Datos Responsable</h5>
        <label for="juntadirevtiva">Junta Directiva Asociada: </label><input type="text" id="jdirectivacontratoeditar" class=" CuadroTexto k-textbox NoModificable nombrejuntadirectivaremota" /><br />
        <input type="button" value="Cambiar Responsable" id="CambiarJuntaDirectivaContratoEditar" class="k-button VincularJuntaDirectivaContrato" />
        <hr />
        <h5>Datos Contrato</h5>
        <label for="FechaCreacion">Fecha Creación: </label><input type="text" id="fechacreacioncontratoeditar" class=" CuadroTexto k-textbox datapickerfechacrearcion requerido" /><br />
        <label for="FechaCaducidad">Fecha Expiración: </label><input type="text" id="fechacaducidadcontratoeditar" class=" CuadroTexto k-textbox datapickerfechacaducidad" /><br />
        <h5>Descripción Legal</h5>
        <textarea id="descripcionlegalcontratoeditar" rows="10" cols="38"></textarea><br />
        <label for="Importe">Importe: </label><input type="text" id="importecontraroeditar" class=" CuadroTexto k-textbox numerictextboximporte" /><br />
        <br />
        <hr />
        <br />
        <center>
            <div hidden="hidden" id="MensajeErrorContratoEditar" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEditarContrato" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEditarContrato" class="k-button FuncionBotonCancelarProveedores" />
        </center>
    </div>

    <div id="VentanaEliminarContrato">
        <h5>Datos Empresa</h5>
        <label for="nombreempresacontratoeditar">Nombre: </label><input type="text" id="nombreempresacontratoeliminar" class=" CuadroTexto k-textbox nombreempresaasociacion" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifcontratoeliminar" class=" CuadroTexto k-textbox cifremoto" /><br />
        <hr />
        <h5>Datos Responsable</h5>
        <label for="juntadirevtiva">Junta Directiva Asociada: </label><input type="text" id="juntadirectivacontratoeliminar" class=" CuadroTexto k-textbox" /><br />
        <hr />
        <h5>Datos Contrato</h5>
        <label for="FechaCreacion">Fecha Creación: </label><input type="text" id="fechacreacioncontratoeliminar" class=" CuadroTexto k-textbox" /><br />
        <label for="FechaCaducidad">Fecha Expiración: </label><input type="text" id="fechacaducidadcontratoeliminar" class=" CuadroTexto k-textbox" /><br />
        <h5>Descripción Legal</h5>
        <textarea id="descripcioncontratoeliminar" rows="10" cols="38" readonly="readonly"></textarea>
        <br />
        <label for="Importe">Importe: </label><input type="text" id="importecontratoeliminar" class=" CuadroTexto k-textbox" /><br />
        <br />
        <hr />
        <br />
        <center>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaEliminarContrato" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaEliminarContrato" class="k-button FuncionBotonCancelarProveedores" />
        </center>
    </div>

    <div id="VentanaCrearContrato" class="ComprobarNulosContratosCrear">
        <h5>Datos Empresa</h5>
        <label for="nombreempresacontratoeditar">Nombre: </label><input type="text" id="nombreempresacontratocrear" class=" CuadroTexto requerido k-textbox nombreempresaasociacion" /><br />
        <label for="cif">CIF: </label><input type="text" id="cifempresacontratocrear" class=" CuadroTexto k-textbox cifremoto requerido" /><br />
        <input type="button" value="Escoger Empresa" id="BotonElegirEmpresaRemotaDesdeContrato" class="k-button" />
        <hr />
        <h5>Datos Responsable</h5>
        <label for="juntadirevtiva">Junta Directiva Asociada: </label><input type="text" id="juntadirectivacontratocrear" class=" CuadroTexto k-textbox nombrejuntadirectivaremota requerido" /><br />
        <input type="button" value="Escoger Responsable" id="BotonElegirJuntaDirectivaDesdeContrato" class="k-button VincularJuntaDirectivaContrato" />
        <hr />
        <h5>Datos Contrato</h5>
        <label for="FechaCreacion">Fecha Creación: </label><input type="text" id="fechacreacioncontratocrear" class=" CuadroTexto k-textbox datapickerfechacrearcion" /><br />
        <label for="FechaCaducidad">Fecha Expiración: </label><input type="text" id="fechacaducidadcontratocrear" class=" CuadroTexto k-textbox requerido datapickerfechacaducidad" /><br />
        <h5>Descripción Legal</h5>
        <textarea id="descripcioncontratocrear" rows="10" cols="38" disable="true"></textarea>
        <br />
        <label for="Importe">Importe: </label><input type="text" id="importecontratocrear" class=" CuadroTexto k-textbox numerictextboximporte" /><br />
        <br />
        <hr />
        <br />
        <center>
            <div hidden="hidden" id="MensajeErrorContratoCrear" class="FormatoMensajeError">
                    <p>Datos nulos o erroneos</p>
            </div>
            <input type="button" value="Aceptar" id="BotonAceptarVentanaCrearContrato" class="k-button" />
            <input type="button" value="Cancelar" id="BotonCancelarVentanaCrearContrato" class="k-button FuncionBotonCancelarProveedores" />
        </center>
    </div>

    <div id="NuevaEmpresaFormulario" >
    
    </div>

    <div id="VentanaEmpresasRemota">
        <div id="EmpresasGridRemoto" class="VisibilidadGridEmpresasRemota">
    
        </div>
    </div>
    
    <div id="VentanaJuntaDirectivaRemota">
        <div id="JuntaDirectivaGridRemoto" class="VisibilidadGridJuntaDirectivaRemota">
    
        </div>
    </div>

    <div id="DropDownListEmpresasNacionalidad">
    </div>

    
    
</asp:Content>