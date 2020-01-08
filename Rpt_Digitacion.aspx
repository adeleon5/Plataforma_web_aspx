<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Rpt_Digitacion.aspx.vb" Inherits="EasySapWeb.Rpt_Digitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server">
        <ContentTemplate>
        <div class="w3-container w3-row-padding w3-content">
            <div class="w3-col s12 w3-padding w3-mobile">
                <div class="w3-card-4">
                    <header class="w3-container w3-yellow">
                      <h3>GESTIÓNO DE REPORTES DE TIENDAS</h3>
                    </header>
                    <div class="w3-container w3-padding">
                      <p>
                      <label class="w3-text-black"><b>Reporte</b></label>
                      <asp:DropDownList ID="DDLREPORTE" runat="server" CssClass="w3-input w3-border w3-light-grey w3-round" AutoPostBack="False" ></asp:DropDownList>
                        </p>
                        <p>
                            <label class="w3-text-black">
                            <b>Empresa</b></label>
                            <asp:DropDownList ID="DDLEMPRESA" runat="server" AutoPostBack="true" CssClass="w3-input w3-border w3-light-grey w3-round">
                            </asp:DropDownList>
                        </p>
                        <p>
                            <label class="w3-text-black">
                            <b>Tienda</b></label>
                            <asp:DropDownList ID="DDLTIENDA" runat="server" CssClass="w3-input w3-border w3-light-grey w3-round">
                            </asp:DropDownList>
                        </p>
                        <p>
                            <label class="w3-text-black">
                            <b>Fecha</b></label>
                            <asp:TextBox ID="TXTFECHADOCTO" runat="server" CssClass="w3-input w3-border w3-light-gray w3-round" TextMode="Date"></asp:TextBox>
                        </p>
                    </div>
                    <footer class="w3-row w3-padding">
                            <div class="w3-col s6">
                                <asp:LinkButton ID="BTNGO" runat="server" CssClass="w3-btn w3-block w3-black w3-hover-blue-gray w3-round" Text="Generar"></asp:LinkButton>
                            </div>
                            <div class="w3-col s6">
                                <a class="w3-btn w3-block w3-hover-blue-gray w3-red w3-round w3-text-white" href="Dashboard.aspx">Regresar</a>
                            </div>
                        </footer>
                </div>
            </div>
        </div>
        <div class="w3-container w3-row-padding w3-responsive" style="overflow-y:scroll; min-height:300px">
            <asp:Panel runat="server" ID="P_IMAGENES">
                <asp:GridView ID="GVREP" runat="server" Width="100%" CssClass="w3-table-all w3-small" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate">                
                </asp:GridView>
            </asp:Panel>
            <br />
            <asp:Panel runat="server" ID="P_DOCTOENCA" Visible="false">
                <asp:GridView ID="GVDOCTOENCA" runat="server" Width="100%" CssClass="w3-table-all w3-small" 
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate"  
                >                
                </asp:GridView>
            </asp:Panel>
            <br />
            <asp:Panel runat="server" ID="P_DOCTODETA" Visible="false">
                <asp:GridView ID="GVDOCTODETA" runat="server" Width="100%" CssClass="w3-table-all w3-small" 
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate">                
                </asp:GridView>
            </asp:Panel>
            <br /><br />
            <div class="Centrado" style="display:none" >
                <asp:ImageButton ID="BTNEXPORT" runat="server" ImageUrl="~/images/Excel.gif" Width="35" />
            </div>
        </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
