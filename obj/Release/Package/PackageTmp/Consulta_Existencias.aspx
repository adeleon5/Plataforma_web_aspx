<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Consulta_Existencias.aspx.vb" Inherits="EasySapWeb.Consulta_Existencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Regresar al Menú</a>
            </div>
            <h1>CONSULTA DE EXISTENCIAS EN CATALOGO</h1>
            <div class="form1" >
                <h2>PRODUCTO A CONSULTAR</h2>
                <table class="t01" id="T0" runat="server"  >
                    <tr>
                        <td>PERIODO</td>
                        <td><asp:DropDownList ID="TXTPRD" runat="server" CssClass="TextBox1"  AutoPostBack ="true" Enabled="false" TabIndex="10"></asp:DropDownList></td>
                    </tr>
                     <tr>
                        <td>BODEGA</td>
                        <td><asp:DropDownList ID="TXTBOD" runat="server" CssClass="TextBox1"  AutoPostBack ="true" TabIndex="20" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>ESTILO</td>
                        <td><asp:TextBox ID="TXTEST" runat="server" CssClass="TextBox1"  TabIndex="30" MaxLength="6" TextMode="Search" AutoPostBack="true"></asp:TextBox></td>
                    </tr>
               </table>                                
                  <br />
               <div class="MenuBar">
                 <asp:LinkButton ID="BTNCONSUL" runat="server" CssClass="TopMenu" Text="CONSULTAR"></asp:LinkButton>
                   <asp:LinkButton ID="BTNACT" runat="server" CssClass="TopMenu" Text="ACTUALIZAR"></asp:LinkButton>
                </div>
                <br />
              <asp:Label ID="LBLERR" runat="server" CssClass="ERRM"></asp:Label><br />
            <br />  
             </div>
             <br />
             <asp:GridView ID="GVREP" runat="server" CssClass="grid-view"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate" AutoGenerateColumns="False">                
                <AlternatingRowStyle CssClass="alternate" />
                <RowStyle CssClass="normal" />
            </asp:GridView> 
            <br />
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
