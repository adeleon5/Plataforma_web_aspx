<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Carga_Venta.aspx.vb" Inherits="EasySapWeb.Carga_Venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server">
        <ContentTemplate>
    <div class="container  w3-padding-16">
        <div class="w3-content w3-row w3-card-4">
            <header class="w3-yellow w3-container w3-padding">
                <h3>DATOS GENERALES DE LA CARGA</h3>
            </header>
            <div class="w3-container">
                <h4>NO. DOCTO</h4><asp:TextBox runat="server" ID="TXTNODOCTOCARGA" CssClass="w3-input w3-round w3-border"></asp:TextBox>
                <h4>EMPRESA</h4><asp:DropDownList runat="server" ID="DDLEMPRESACARGA" CssClass="w3-input w3-round w3-border"></asp:DropDownList>
                <h4>FECHA DE CARGA</h4><asp:TextBox runat="server" ID="TXTFECHACARGA" CssClass="w3-input w3-round w3-border" Enabled="false"></asp:TextBox>
                <h4>COMENTARIO</h4><asp:TextBox runat="server" ID="TXTCOMENTARIOCARGA" CssClass="w3-input w3-round w3-border" TextMode="MultiLine" Rows="3"></asp:TextBox>
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="w3-input w3-border w3-round w3-padding" />
            </div>
            <footer class="w3-container w3-padding">
                <asp:Button ID="btnImport" runat="server" Text="Importar datos" CssClass="w3-button w3-round w3-red w3-hover-dark-gray w3-right" OnClientClick="return confirm('Esta seguro de procesar los datos?');" />
            </footer>
        </div>
        <div class="w3-row w3-padding" style="display:none">
            <!--- *********************************** FORMULARIO PARA LA TOMA DE DATOS DE LA FLOTILLA ****************************** --->
            <asp:Panel ID="P1" runat="server" Visible="true">
                <div class="w3-card-4">
                    <header class="w3-container w3-blue">
                        <h3>CARGAR ARCHIVO</h3>
                    </header>
                    <br />
                    <div class="w3-container">
                        
                        <hr />
                        <asp:Button ID="BTNPLANTILLA" runat="server" Text="Descargar Plantilla" CssClass="w3-button w3-block w3-blue-gray" />
                        <br />
                        
                        <br />
                        <asp:Button ID="BTNPROCESAR" runat="server" Text="Procesar Datos" CssClass="w3-button w3-block w3-dark-grey" OnClientClick="return confirm('Esta seguro de procesar los datos?');" />
                    </div>
                    <br />
                </div>
                <asp:Panel ID="PCARGA" runat="server" Visible="true">
                <div class="w3-card-4">
                <header class="w3-container w3-blue">
                    <h3>CUADRE DIARIO DE VENTAS</h3>
                </header>
                <br />
                <div class="w3-container">
                    <div class="table-responsive" style="overflow:scroll; height:1000px">
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GVCERTIFICADOR" runat="server" CssClass="table table-striped table-bordered table-hover re" >
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </asp:Panel>
               <%-- *************** GRID DE DESCARGA **************--%>
                <asp:Panel ID="PDESCARGA" runat="server" Visible="false">
                    <asp:GridView 
                        ID="GVVENTA" 
                        runat="server" 
                        CssClass="table table-striped table-bordered table-hover re"
                        AutoGenerateColumns="False">    
                    </asp:GridView>
                </asp:Panel>
            </asp:Panel>
        </div>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
