<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Encabezado_Promo.aspx.vb" Inherits="EasySapWeb.Encabezado_Promo" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
<asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:Panel ID="P0" Visible="true" runat="server" >
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
            </div>
            <h1>Creación Masiva de Encabezados</h1>
            <div class="form1" >
                <table class="t01" id="T0" runat="server"  >
                    <tr>
                        <td>EMPRESA&nbsp;</td>
                        <td><asp:TextBox ID="TXTEMPRESA" runat="server" CssClass="TextBox1" Autofocus="TRUE" Enabled="False"  ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td >PROMO INICIAL</td>
                        <td ><asp:TextBox ID="TXTPROMOINI" runat="server" CssClass="TextBox1" TextMode="Number" ></asp:TextBox></td>
                    </tr>
                     <tr>
                        <td >PROMO FINAL</td>
                        <td ><asp:TextBox ID="TXTPROMOFIN" runat="server" CssClass="TextBox1" TextMode="Number" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>DESCRIPCIÓN&nbsp;</td>
                        <td><asp:TextBox ID="TXTDESCRIP" runat="server" CssClass="TextBox1" TextMode="MultiLine" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>DEL</td>
                        <td><asp:TextBox ID="TXTDEL" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>AL</td>
                        <td><asp:TextBox ID="TXTAL" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox></td>
                    </tr>
                     <tr>
                        <td>TIPO</td>
                        <td><asp:TextBox ID="TXTTIPO" runat="server" CssClass="TextBox1" TextMode="Number"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>DESCUENTO</td>
                        <td><asp:TextBox ID="TXTDESC" runat="server" CssClass="TextBox1" TextMode="Number"></asp:TextBox></td>
                    </tr>
                </table>                                
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNRUN" CssClass="TopMenu" Text="EJECUTAR" runat="server" ></asp:LinkButton>
                </div>
            </div>
            <br /><br />
            <asp:GridView ID="GVREP" runat="server" CssClass="grid-view" 
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate"  
                >                
            </asp:GridView>
            <br /><br />
            <div class="Centrado" >
                <asp:ImageButton ID="BTNEXPORT" runat="server" ImageUrl="~/images/Excel.gif" Width="35" />
            </div>
            </asp:Panel>
       </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

