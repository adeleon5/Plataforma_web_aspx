<%@ Page Title="Marcaje de Entrada / Salida Emergente" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="SUP_MARCAJE.aspx.vb" Inherits="EasySapWeb.SUP_MARCAJE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP01" runat="server">
        <ContentTemplate>
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Regresar</a>
            </div>
            <h1>Marcaje de Huella emergente para tiendas</h1>
            <h3>(Solo para uso de Supervisores)</h3>
            <div class="Pop">
                <label for="TXTTDA">TIENDA</label>
                <asp:DropDownList ID="TXTTDA" runat="server" CssClass="TextBox1" ></asp:DropDownList><br /><br />
                <label for="TXTVND">VENDEDOR</label>
                <asp:DropDownList ID="TXTVND" runat="server" CssClass="TextBox1" ></asp:DropDownList><br /><br />
                <label for="TXTCOD">CODIGO (si no está en el listado anterior)</label>
                <asp:TextBox runat="server" ID="TXTCOD" CssClass="TextBox1" ></asp:TextBox><br /><br /><br />
                <label for="TXTNOT">JUSTIFICACION</label>
                <asp:TextBox ID="TXTJUS" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="3"></asp:TextBox><br /><br />
                <asp:Label ID="LBLERR" runat="server" CssClass="ERRM"></asp:Label><br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNENVIAR" CssClass="TopMenu" Text="MARCAR" runat="server" OnClientClick="return confirm('Realizar el Marcaje?');"></asp:LinkButton>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
