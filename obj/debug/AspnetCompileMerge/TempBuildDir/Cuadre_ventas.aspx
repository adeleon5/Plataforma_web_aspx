<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Cuadre_ventas.aspx.vb" Inherits="EasySapWeb.Cuadre_ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
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
                <asp:FileUpload ID="FileUpload2" runat="server" CssClass="w3-input w3-border w3-round w3-padding" />
            </div>
            <footer class="w3-container w3-padding">
                <asp:Button ID="BTNENCABEZADO" runat="server" Text="Importar datos" CssClass="w3-button w3-round w3-red w3-hover-dark-gray w3-right" OnClientClick="return confirm('Esta seguro de procesar los datos?');" />
            </footer>
        </div>
    </div>
    <hr />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="btnImport" runat="server" Text="Import" OnClick="ImportCSV" />
    
</asp:Content>
