<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Login.aspx.vb" Inherits="EasySapWeb.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="form1">
        <h1 class="h1blanco">Iniciar Sesión&nbsp;</h1>
        <label for="TXTUSR" class="lblblanco">Usuario</label>
        <asp:TextBox runat="server"  ID="TXTUSR" CssClass="TextBox1" TextMode="SingleLine" autofocus="true" ></asp:TextBox>
        <label for="TXTPWD" class="lblblanco">Constraseña</label>
        <asp:TextBox runat="server"  ID="TXTPWD" CssClass="TextBox1" TextMode="Password" AutoPostBack ="true"></asp:TextBox><br />
        <asp:CheckBox runat="server" Text="Recordar en este equipo"  CssClass="lblblanco"/><br />
        <asp:Label runat="server" ID="ERRMSG" CssClass="ERRM"></asp:Label>
        <br />
        <asp:LinkButton ID="BTNLOGIN" Text="Ingresar" runat="server" CssClass="TopMenu"></asp:LinkButton>
        <br /><br />
    </div>
</asp:Content>
