<%@ Page Title="Procesos de Digitación" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Proceso_Digitacion.aspx.vb" Inherits="EasySapWeb.Proceso_Digitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

       <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:Timer ID="TMR90" runat="server" Interval="25000">
                </asp:Timer>
           
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
            </div>
            <h1>Proceso de Digitación</h1>
            <div class="form1" >
                <table class="t01" id="T0" runat="server"  >
                    <tr>
                        <td>Procesos</td>
                        <td><asp:DropDownList ID="TXTREP" runat="server" CssClass="TextBox1" Autofocus="TRUE" AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Transaccion</td>
                        <td><asp:DropDownList ID="TXTTRANSACCION" runat="server" CssClass="TextBox1" Autofocus="TRUE" AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Tipo de Cierre</td>
                        <td><asp:DropDownList ID="TXTTIPO" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Tienda</td>
                        <td><asp:DropDownList ID="TXTTDA" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Documento</td>
                        <td><asp:TextBox ID="TXTDOC" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Del</td>
                        <td><asp:TextBox ID="TXTDEL" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Al</td>
                        <td><asp:TextBox ID="TXTAL" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox></td>
                    </tr>
                </table>                                
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNRUN" CssClass="TopMenu" Text="Ejecutar" runat="server" ></asp:LinkButton>
                    <asp:LinkButton ID="BTNINSTRUCCION" runat="server" CssClass="TopMenu" Text="Generar Instrucción" Width="169px"></asp:LinkButton>
                    <asp:Literal ID="LTLGENERA" runat="server"></asp:Literal>
                </div>
                <br />
                <div class="MenuBar">
                    <asp:Literal ID="LTL01" runat="server"></asp:Literal>
                </div>
            </div>
            <br />
              <%--**********************************************************COMIENZO DEL PANEL P0******************************************************--%>
             <asp:Panel ID="P0" Visible="true" runat="server" >
                <asp:GridView ID="GVREP" runat="server" CssClass="grid-view" 
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate"  
                >                
            </asp:GridView>
            </asp:Panel>
                <br />
  <%--**********************************************************COMIENZO DEL PANEL P1B******************************************************--%>
             <asp:Panel ID="P1B" Visible="true" runat="server" >
            <asp:GridView ID="GVFP" runat="server" CssClass="grid-view" 
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate"  
                >                
            </asp:GridView>
            <br />
                <div class="MenuBar" >
                        <asp:LinkButton ID="BTNADD" runat="server" CssClass="TopMenu" Text="Agregar Forma de Pago" Visible="false"></asp:LinkButton>
                        
                </div>
            <br />
            </asp:Panel>
             <%--**********************************************************COMIENZO DEL PANEL P1A******************************************************--%>
            <asp:Panel ID="P1A" runat="server" Visible="false">
                <div class="Pop" >
                    <h3>Codigo de Pago</h3>
                    <asp:Label ID="LBLCODPAGO1" runat="server" Text="CODPAGO"></asp:Label>&nbsp
                    <asp:Label ID="LBLCODTIPO1" runat="server" Text="CODTIPO"  Visible="FALSE"></asp:Label>
                    <br />
                    <hr />
                    <h2>Eliminar Forma de Pago</h2>
                    <table class="t01">
                         <tr>      
                            <td>Tipo de Pago:&nbsp;<asp:TextBox ID="TXTDESCRIPT" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>      
                            <td>Documento:&nbsp;<asp:TextBox ID="TXTDOCTO" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>      
                            <td>Autorización:&nbsp;<asp:TextBox ID="TXTAUTORI" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox></td>
                        </tr>
                         <tr>      
                            <td>Monto:&nbsp;<asp:TextBox ID="TXTMONTOPAGO" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>      
                            <td>Justificación:&nbsp;<asp:TextBox ID="TXTJUS0" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="3"></asp:TextBox></td>
                        </tr>
                    </table>
                    <br />
                    <div class="MenuBar" >
                        <asp:LinkButton ID="BTNELIMINAR" runat="server" CssClass="TopMenu" Text="Eliminar" OnClientClick="return confirm('Eliminar forma de pago?');"></asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="BTNCANCEL" runat="server" CssClass="TopMenu" Text="Cancelar" ></asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>
            <br />
            <%--**********************************************************COMIENZO DEL PANEL P1******************************************************--%>
            <asp:Panel ID="P1" runat="server" Visible="false">
                <div class="Pop" >
                    <h3>Codigo de Pago</h3>
                    <asp:Label ID="LBLCODPAGO" runat="server" Text="CODPAGO"></asp:Label>&nbsp
                    <br />
                    <hr />
                    <h2>Agregar Forma de Pago</h2>
                    <table class="t01">
                        <tr>
                            <td>Tipo de Pago&nbsp;<asp:DropDownList ID="TXTFPAGOS" runat="server" CssClass="TextBox1" Autofocus="TRUE" AutoPostBack ="true"  ></asp:DropDownList></td>
                        </tr>
                         <tr>      
                            <td>Documento:&nbsp;<asp:TextBox ID="TXTDOCTOPAGO" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                        </tr>
                        <tr>      
                            <td>Autorización:&nbsp;<asp:TextBox ID="TXTAUTORIZACION" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Monto:&nbsp;<asp:TextBox ID="TXTMONTO" runat="server" CssClass="TextBox1" TextMode="Number"></asp:TextBox></td>
                        </tr>
                        <tr>      
                            <td>Justificación:&nbsp;<asp:TextBox ID="TXTJUS" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="3"></asp:TextBox></td>
                        </tr>
                    </table>
                    <br />
                    <div class="MenuBar" >
                        <asp:LinkButton ID="BTNGO1" runat="server" CssClass="TopMenu" Text="Proceder" OnClientClick="return confirm('Ejecutar el cambio?');"></asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="BTNCA1" runat="server" CssClass="TopMenu" Text="Cancelar" ></asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>
           <%--**********************************************************COMIENZO DEL PANEL P2******************************************************--%>
            <br />
            <asp:Panel ID="P2" runat="server" Visible="false">
                <div class="Pop" >
                    <h2>Modificar o Eliminar Depositos Monetarios</h2>
                    <h3>No. de Movimiento</h3>
                    <asp:Literal ID="LMOD" runat="server" ></asp:Literal>
                    <asp:Label ID="LBLBOLETAORIGINAL" runat="server" Visible="False" Enabled="False"></asp:Label>
                    <asp:Label ID="LBLFECHACORTE" runat="server" Visible="False" Enabled="False"></asp:Label>
                    <asp:Label ID="LBLFECHAINGRESO" runat="server" Visible="False" Enabled="False"></asp:Label>
                <br />
                <br />
                <table class="t01">
                    <tr>
                        <td>BANCO NUEVO</td>
                        <td><asp:DropDownList ID="TXTMODBAN" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>BOLETA</td>
                        <td><asp:TextBox ID="TXTMODBOL" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>MONTO</td>
                        <td><asp:TextBox ID="TXTMODMON" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>FECHA CORTE</td>
                        <td><asp:TextBox ID="TXTFECHADEPOSITO" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>OBSERVACION</td>
                        <td><asp:TextBox ID="TXTOBSERDEPOSITO" runat="server" CssClass="TextBox1" TextMode="Multiline" Rows="5" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>RAZON</td>
                        <td><asp:TextBox ID="TXTMODRAZ" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LBLERR01" runat="server" CssClass="ERRM" ></asp:Label>
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNCHNG" runat="server" CssClass="TopMenu" Text="Modificar" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNELIMINARDEPO" runat="server" CssClass="TopMenu" Text="Eliminar" OnClientClick ="return confirm('Confirmar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNCANC" runat="server" CssClass="TopMenu" Text="Cancelar" OnClientClick ="return confirm('Descartar cambios?');"></asp:LinkButton>
                </div>
                </div>
            </asp:Panel>
            <%--**********************************************************COMIENZO DEL PANEL P3******************************************************--%>
            <br />
            <asp:Panel ID="P3" runat="server" Visible="false">
                <div class="Pop" >
                    <h2>Modificar Cierres de POS</h2>
                    <asp:Literal ID="LTLMODCORTES" runat="server" ></asp:Literal>
                    <asp:Label ID="GLB_TTR_ID" runat="server" Enabled="False" Visible="False"></asp:Label>
                    <asp:Label ID="FECHA" runat="server" Enabled="False" Visible="False"></asp:Label>
                    <asp:Label ID="FECHA_CORTE" runat="server" Enabled="False" Visible="False"></asp:Label>
                    <asp:Label ID="NODOCUMENTO" runat="server" Enabled="False" Visible="False"></asp:Label>
                <br />
                <br />
                <table class="t01">
                    <tr>
                        <td>CIERRE</td>
                        <td><asp:DropDownList ID="TXTBNCPOS" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>BOLETA</td>
                        <td><asp:TextBox ID="TXTBLTPOS" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>MONTO</td>
                        <td><asp:TextBox ID="TXTMNTPOS" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>FECHA CORTE</td>
                        <td><asp:TextBox ID="TXTFCPOS" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>OBSERVACION</td>
                        <td><asp:TextBox ID="TXTOBSERPOS" runat="server" CssClass="TextBox1" TextMode="Multiline" Rows="5" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>RAZON</td>
                        <td><asp:TextBox ID="TXTRZNPOS" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="ERRM" ></asp:Label>
                <div class="MenuBar">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="TopMenu" Text="Modificar" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="TopMenu" Text="Eliminar" OnClientClick ="return confirm('Confirmar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="TopMenu" Text="Cancelar" OnClientClick ="return confirm('Descartar cambios?');"></asp:LinkButton>
                </div>
                </div>
            </asp:Panel>
             <%--**********************************************************COMIENZO DEL PANEL P4******************************************************--%>
            <br />
            <asp:Panel ID="P4" runat="server" Visible="false">
                <div class="Pop" >
                    <h2>Ingreso de Cierres de POS</h2>
                    <asp:Literal ID="Literal2" runat="server" ></asp:Literal>
                <br />
                <br />
                <table class="t01">
                    <tr>
                        <td>BANCO</td>
                        <td><asp:DropDownList ID="TXTBNCI" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>DOCUMENTO</td>
                        <td><asp:TextBox ID="TXTDCMTI" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>MONTO</td>
                        <td><asp:TextBox ID="TXTMNTI" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                    </tr>
                       <tr>
                        <td>BODEGA</td>
                        <td><asp:TextBox ID="TXTBDGI" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>FECHA CORTE</td>
                        <td><asp:TextBox ID="TXTFCI" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>OBSERVACIONES</td>
                        <td><asp:TextBox ID="TXTRZNI" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="Label2" runat="server" CssClass="ERRM" ></asp:Label>
                <div class="MenuBar">
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="TopMenu" Text="Guardar" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="TopMenu" Text="Cancelar" OnClientClick ="return confirm('Descartar cambios?');"></asp:LinkButton>
                </div>
                </div>
            </asp:Panel>
                 <%--**********************************************************COMIENZO DEL PANEL P5******************************************************--%>
            <br />
            <asp:Panel ID="P5" runat="server" Visible="false">
                <div class="Pop" >
                    <h2>Cambiar Vendedor de Factura</h2>
                    <asp:Literal ID="Literal1" runat="server" ></asp:Literal>
                <br />
                <br />
                <table class="t01">
                    <tr>
                        <td>VENDEDOR NUEVO</td>
                    </tr>
                    <tr>
                       <td><asp:TextBox ID="TXTVNDNUEVO" runat="server" CssClass="TextBox1" AutoPostBack="true"></asp:TextBox></td>
                     </tr>
                     <tr>
                        <td>NOMBRE VENDEDOR</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTVNDNOMBRE" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>VENDEDOR ORIGINAL</td>
                    </tr>
                    <tr>
                         <td><asp:TextBox ID="TXTVNDORIGINAL" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>OBSERVACION</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTOBSERVND" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNMODVND" runat="server" CssClass="TopMenu" Text="Procesar" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNCANCELVND" runat="server" CssClass="TopMenu" Text="Cancelar" OnClientClick ="return confirm('Descartar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNBUSCAR" runat="server" CssClass="TopMenu" Text="Buscar"></asp:LinkButton>
                </div>
                </div>
            </asp:Panel>
                   <%--**********************************************************COMIENZO DEL PANEL P6******************************************************--%>
            <br />
            <asp:Panel ID="P6" runat="server" Visible="false">
                <div class="Pop" >
                    <h2>Modificar Factura Manual</h2>
                    <asp:Literal ID="Literal3" runat="server" ></asp:Literal>
                <br />
                <br />
                <table class="t01">
                    <tr>
                        <td>FACTURA</td>
                    </tr>
                    <tr>
                       <td><asp:TextBox ID="TXTFACMANUAL" runat="server" CssClass="TextBox1" Enabled="false"></asp:TextBox></td>
                     </tr>
                     <tr>
                        <td>FECHA</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTFACFECHA" runat="server" CssClass="TextBox1" Enabled="true"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>FECHA DE FACTURA</td>
                    </tr>
                    <tr>
                         <td><asp:TextBox ID="TXTFECHAFAC" runat="server" CssClass="TextBox1" Enabled="true"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>HORA DE FACTURA</td>
                    </tr>
                    <tr>
                         <td><asp:TextBox ID="TXTHORAFAC" runat="server" CssClass="TextBox1" Enabled="true"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>MONTO</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTFACMONTO" runat="server" CssClass="TextBox1" Enabled="true"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>OBSERVACION</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTFACOBSER" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNFACMOD" runat="server" CssClass="TopMenu" Text="Procesar" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNFACCANCEL" runat="server" CssClass="TopMenu" Text="Cancelar" OnClientClick ="return confirm('Descartar cambios?');"></asp:LinkButton>
                </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>
