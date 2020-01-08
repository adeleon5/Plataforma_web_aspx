<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Orden_Servicio.aspx.vb" Inherits="EasySapWeb.REP_PLANTA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HS01" runat="server" />
            <div>
                <a href="Menu.aspx" target="_self" class="w3-btn w3-white w3-border w3-border-red w3-round-large w3-text-black">Regresar al menú</a>
            </div>
            <!--- *********************************** ENCABEZADO DE LA PAGINA GRID Y CONSULTA ****************************** --->
             <div class="w3-container">
                 <div class="w3-row">
                      <asp:Panel ID="P0" runat="server" Visible="true" >
                        <h1>ORDENES DE SERVICIO PROGRAMADAS</h1>
                         <div class="w3-col w3-container" style="width:100%">
                             <div class="w3-half w3-row-padding w3-mobile">
                                <h3 class="w3-text-black">Del</h3>
                                <asp:TextBox ID="TXTFDEL" runat="server" CssClass="w3-input w3-border" TextMode="Date" ></asp:TextBox>
                             </div>
                             <div class="w3-half w3-row-padding w3-mobile">
                                 <h3 class="w3-text-black">Al</h3>
                                 <asp:TextBox ID="TXTFAL" runat="server" CssClass="w3-input w3-border" TextMode="Date" ></asp:TextBox>
                             </div>
                            <div class="w3-row-padding w3-mobile">
                             <br />
                                <asp:LinkButton ID="BTNGO"  class="w3-green w3-button w3-hover-light-green w3-mobile" style="width:100%" Text="EJECUTAR" runat="server" ></asp:LinkButton>
                            </div>
                            <br />
                         </div>
                        <div class="w3-row w3-container w3-mobile">
                            <div class="w3-col w3-container" style="width:100%">
                                <asp:GridView 
                                    ID="GVREP" 
                                    runat="server" 
                                    CssClass="table table-striped table-bordered table-hover re"
                                    AllowPaging="true" 
                                    AllowSorting="true" 
                                    AutoGenerateColumns="False"
                                    PageSize="10">
                                   <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" /> 
                                </asp:GridView>
                            </div>
                            <div class="w3-col w3-container w3-mobile" style="width:100%; display:none"  >
                                <div class="w3-display-container">
                                    <div class="w3-padding w3-display-middle">
                                        <asp:ImageButton ID="BTNEXPORT" runat="server" ImageUrl="~/images/Excel.gif" Width="35px" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                 </div>
                 <div class="w3-row">
                      <!--- *********************************** FORMULARIO DE HOJA DE SERVICIO ****************************** --->
                      <asp:Panel ID="P1" runat="server" Visible="FALSE">
                          <h1 class="h1">ORDEN DE SERVICIO TÉCNICO&nbsp;</h1>
                            <div class="w3-card-4">
                                <header class="w3-container w3-dark-grey">
                                  <h3>DATOS GENERALES</h3>
                                </header>
                                <br />
                                <div class="w3-container">
                                    <asp:Literal ID="L01" runat="server" Visible="true"></asp:Literal>
                                </div>
                                <br />
                            </div>
                            <div class="w3-card-4">
                                <header class="w3-container w3-dark-grey">
                                  <h3>DATOS ESPECIFICOS</h3>
                                </header>
                                <br />
                                <div class="w3-container">
                                    <label>
                                      HOROMETRO</label>
                                      <asp:TextBox ID="TXTHORO" runat="server" Autofocus="true" CssClass="w3-input" TextMode="Number"></asp:TextBox>
                                      <br />
                                      <label>
                                      DESCRIPCIÓN DEL PROBLEMA</label>
                                      <asp:TextBox ID="TXTDP" runat="server" CssClass="w3-input" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                      <br />
                                      <label>
                                      DIAGNOSTICO TÉCNICO</label>
                                      <asp:TextBox ID="TXTDT" runat="server" CssClass="w3-input" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                      <br />
                                      <label>
                                      SERVICIO EFECTUADO</label>
                                      <asp:TextBox ID="TXTSE" runat="server" CssClass="w3-input" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                      <br />
                                      <label>
                                      NOTA DE SEGURIDAD</label>
                                      <asp:TextBox ID="TXTNS" runat="server" CssClass="w3-input" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                      <br />
                                      <br />
                                      <label>
                                      Formato 24 horas Ejemplo --18:00-- o 09:00</label>
                                      <br />
                                      <label>
                                      TRASLADO SALIDA</label>
                                      <asp:TextBox ID="TXTTSALIDA" runat="server" Autofocus="true" CssClass="w3-input" onkeyup="mascara(this,':',new Array(2,2) ,true)"></asp:TextBox>
                                      <br />
                                      <label>
                                      TRASLADO LLEGADA</label>
                                      <asp:TextBox ID="TXTTLLEGADA" runat="server" Autofocus="true" CssClass="w3-input" onkeyup="mascara(this,':',new Array(2,2) ,true)"></asp:TextBox>
                                      <br />
                                      <label>
                                      SERVICIO INICIO</label>
                                      <asp:TextBox ID="TXTSINICIO" runat="server" Autofocus="true" CssClass="w3-input" onkeyup="mascara(this,':',new Array(2,2) ,true)"></asp:TextBox>
                                      <br />
                                      <label>
                                      SERVICIO FIN</label>
                                      <asp:TextBox ID="TXTSFINAL" runat="server" Autofocus="true" CssClass="w3-input" onkeyup="mascara(this,':',new Array(2,2) ,true)"></asp:TextBox>
                                      <br />
                                      <br />
                                      <asp:Label ID="LBLERRM01" runat="server" CssClass="w3-text-red"></asp:Label>
                                </div>
                                    <asp:LinkButton ID="BTNADDHS" runat="server" class="w3-button w3-block w3-dark-grey" Text="Guardar"></asp:LinkButton>
                                    <asp:LinkButton ID="BTNCANHS" runat="server" class="w3-button w3-block w3-dark-grey" OnClientClick="return confirm('Cancelar Cambios?');" Text="Cancelar"></asp:LinkButton>
                                    <asp:LinkButton ID="BTNFIRMA" runat="server" class="w3-button w3-block w3-dark-grey" Text="Firmar"></asp:LinkButton>
                            </div>
                      </asp:Panel>
                      <!--- *********************************** FIN FORMULARIO DE HOJA DE SERVICIO ****************************** --->
                 </div>
             </div>
           
            </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
