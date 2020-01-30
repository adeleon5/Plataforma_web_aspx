<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Bitacora.aspx.vb" Inherits="EasySapWeb.Bitacora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <asp:UpdatePanel ID="UP0" runat="server">
        <ContentTemplate>
            <div class="w3-container">
                <asp:HiddenField ID="HF01" runat="server" Visible="true" />
                <asp:Panel ID="P0" runat="server" >
                    <div class="w3-container w3-padding-16">
                        <div class="w3-card w3-content w3-row">
                            <header class="w3-container w3-yellow w3-padding">
                                <h3>BITÁCORA DE ACTIVIDADES</h3>
                            </header>
                            <div class="w3-container">
                                <h4>Del </h4><asp:TextBox ID="TXTDEL" runat="server" CssClass="w3-input w3-border w3-round w3-white" TextMode="Date"  AUTOFOCUS="true"></asp:TextBox>
                                <h4>Al </h4><asp:TextBox ID="TXTAL" runat="server" CssClass="w3-input w3-border w3-round w3-white" TextMode="Date"  ></asp:TextBox>
                            </div>
                            <footer class="w3-container w3-padding">
                                <asp:LinkButton ID="BTNFLT" runat="server" CssClass="w3-button  w3-red w3-hover-blue-gray w3-round w3-right" Text="MOSTRAR ACTIVIDADES"></asp:LinkButton>
                            </footer>
                        </div>
                    </div>
                    <div class="w3-container w3-row w3-padding w3-responsive">
                    <h3 class="w3-left">LISTA DE ACTIVIDADES</h3>
                        <div class="w3-col s12">
                            <asp:GridView ID="GVBIT" runat="server" CssClass="w3-table-all w3-small" 
                            AllowPaging="False" AllowSorting="False" 
                            AutoGenerateColumns="False"
                            RowStyle-CssClass="normal"
                            AlternatingRowStyle-CssClass="alternate">                
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="w3-row w3-padding" >
                        <div runat="server" id="ADDNEW" onclick="document.getElementById('id03').style.display='block'" class="w3-button w3-right w3-red w3-hover-blue-gray w3-round" style="display:block">Agregar nueva actividad</div>
                    </div>
                </asp:Panel>
                <div id="id03" class="w3-modal">
                    <div class="w3-modal-content">
                        <header class="w3-container w3-yellow"> 
                        <span onclick="document.getElementById('id03').style.display='none'" 
                        class="w3-button w3-display-topright">&times;</span>
                        <h4>NUEVA ACTIVIDAD</h4>
                        </header>
                        <div class="w3-container">
                        <div class="w3-row">
                            <table>
                            <td><div class="w3-col s12 w3-padding">
                                <asp:DropDownList runat="server" ID="DDLEMPRESABITACORA" CssClass="w3-input w3-border w3-white w3-round" AutoPostBack="true"> </asp:DropDownList>
                            </div></td>
                            <td><div class="w3-col s12 w3-padding">
                                <asp:DropDownList runat="server" ID="DDLTIENDABITACORA" CssClass="w3-input w3-border w3-white w3-round" AutoPostBack="true"> </asp:DropDownList>
                            </div></td>
                            <td><div class="w3-col s12 w3-padding">
                                <asp:DropDownList runat="server" ID="DDLEMPLEADOBITACORA" CssClass="w3-input w3-border w3-white w3-round" AutoPostBack="true"> </asp:DropDownList>
                            </div></td>
                             </table>
                            <div class="w3-col s12 w3-padding">
                                <asp:DropDownList runat="server" ID="DDLCATALOGOBITACORA" CssClass="w3-input w3-border w3-white w3-round"> </asp:DropDownList>
                            </div>
                            <div class="w3-col s12 w3-padding">
                                <asp:TextBox ID="TXTSOL" runat="server" CssClass="w3-input w3-border w3-white w3-round" Enabled="true" PlaceHolder="TÍTULO"></asp:TextBox>
                            </div>
                            <div class="w3-col s12 w3-padding">
                                <asp:TextBox ID="TXTDES" runat="server" CssClass="w3-input w3-border w3-white w3-round" TextMode="MultiLine" Rows="10" PlaceHolder="CONCEPTO" ></asp:TextBox>
                            </div>
                            
                        </div>
                        </div>
                        <footer class="w3-container w3-yellow w3-padding">
                            <asp:LinkButton ID="BTNADDACT" runat="server" CssClass="w3-button w3-round w3-red w3-hover-blue-gray w3-right w3-mobile" Text="Guardar" OnClientClick="return confirm('Está seguro de guardar los cambios?');"></asp:LinkButton>
                        </footer>
                    </div>
                </div>
                <asp:Panel ID="P2" runat="server" Visible="false">
                    <div class="w3-container">
                        <h2>LOG DE ACTIVIDADES</h2>
                            <div class="w3-panel w3-card-4 w3-white">
                                <div class="w3-row">
                                    <div class="w3-col s6">
                                        <p class=" w3-large w3-serif">
                                            <i class="fa fa-quote-right w3-xxlarge w3-text-red"></i>
                                        </p>
                                    </div>
                                </div>
                                <h4><asp:Literal ID="LTESTADO" runat="server"></asp:Literal></h4>
                                <div class="w3-row">
                                    <div class="w3-col s2 w3-mobile">
                                        <div runat="server" id="CLOSEACT" onclick="document.getElementById('id02').style.display='block'" class="w3-button w3-red w3-hover-blue-gray w3-round" style="display:none" >Cerrar árbol de actividades</div>
                                    </div>
                                </div>
                                <hr />
                                <asp:Literal ID="L02" runat="server"></asp:Literal>
                            </div>
                        <div class="w3-row w3-mobile">
                            <div class="w3-col s6  w3-right">
                                <div runat="server" id="ADDSEG" onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-right w3-red w3-hover-blue-gray w3-round" style="display:none">Añadir</div>
                            </div>
                            <div class="w3-col s6  w3-left">
                                <div class="w3-row">
                                    <asp:LinkButton ID="BTNCANCELARSEGUIMIENTO" runat="server" CssClass="w3-button w3-round w3-blue-gray w3-hover-yellow" Text="< Regresar" OnClientClick="return confirm('Cancelar Cambios?');"></asp:LinkButton>
                                    
                                </div>
                            </div>
                        </div>
                        <div id="id01" class="w3-modal">
                            <div class="w3-modal-content">
                              <header class="w3-container w3-yellow"> 
                                <span onclick="document.getElementById('id01').style.display='none'" 
                                class="w3-button w3-display-topright">&times;</span>
                                <h4>AGREGAR SEGUIMIENTO A LA ACTIVIDAD NO.<asp:Literal ID="LTNOACTIVIDAD" runat="server"></asp:Literal></h4>
                              </header>
                              <div class="w3-container">
                                <div class="w3-row">
                                    <div class="w3-col s12 w3-padding">
                                        <asp:TextBox ID="TXTSOL1" runat="server" CssClass="w3-input w3-border w3-white w3-round" Autofocus="true" Enabled="true" ></asp:TextBox>
                                    </div>
                                    <div class="w3-col s12 w3-padding">
                                        <asp:TextBox ID="TXTDESC1" runat="server" CssClass="w3-input w3-border w3-white w3-round" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                    </div>
                                </div>
                              </div>
                              <footer class="w3-container w3-yellow w3-padding">
                                <asp:LinkButton ID="BTNPROCESARSEGUIMIENTO" runat="server" CssClass="w3-button w3-round w3-red w3-hover-blue-gray w3-right" Text="Añadir seguimiento"></asp:LinkButton>
                              </footer>
                            </div>
                        </div>
                        <div id="id02" class="w3-modal">
                            <div class="w3-modal-content">
                              <header class="w3-container w3-yellow"> 
                                <span onclick="document.getElementById('id02').style.display='none'" 
                                class="w3-button w3-display-topright">&times;</span>
                                <h4>CERRAR ÁRBOL DE ACTIVIDADES | ACTIVIDAD PRINCIPAL NO.<asp:Literal ID="LTNOACTIVIDAD_" runat="server"></asp:Literal></h4>
                              </header>
                              <div class="w3-container">
                                <div class="w3-row">
                                    <div class="w3-col s12 w3-padding">
                                        <asp:TextBox ID="TXTCOMENTCIERRE" runat="server" CssClass="w3-input w3-border w3-white w3-round" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                    </div>
                                </div>
                              </div>
                              <footer class="w3-container w3-yellow w3-padding">
                                <asp:LinkButton ID="BTNCERRARACTIVIDAD" runat="server" CssClass="w3-button w3-round w3-red w3-hover-blue-gray" Text="Cerrar actividad" OnClientClick="return confirm('Cerrar la actividad?');" Visible="true" ></asp:LinkButton>
                              </footer>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
              </div>     
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>