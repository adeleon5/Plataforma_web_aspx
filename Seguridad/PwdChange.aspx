<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="PwdChange.aspx.vb" Inherits="EasySapWeb.PwdChange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="Centrado">
                <h2 class="h1azul">Cambio de Contraseña</h2>
            </div>
            <br />
            <div class="form1">
                <table style="width:100%;">
                    <tr><td class="lblblanco">Contraseña Actual</td><td><asp:TextBox ID="TXTOLDPWD" runat="server" TextMode="Password" CssClass="TextBox1" Autofocus="true" ></asp:TextBox></td></tr>
                    <tr><td class="lblblanco">Contraseña Nueva</td><td><asp:TextBox ID="TXTNEWPWD" runat="server" TextMode="Password" CssClass="TextBox1"></asp:TextBox></td></tr>
                    <tr><td class="lblblanco">Confirmar Contraseña Nueva</td><td><asp:TextBox ID="TXTNEWPW2" runat="server" TextMode="Password" CssClass="TextBox1"></asp:TextBox></td></tr>
                    <tr><td colspan="2"><asp:Label ID="LBLERR" runat="server" CssClass="ERRM"></asp:Label></td></tr>
                </table>
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNSAVE" runat="server" CssClass="TopMenu" Text="Guardar" ></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="BTNCANC" runat="server" CssClass="TopMenu" Text="Cancelar"></asp:LinkButton>
                </div>
            </div>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
