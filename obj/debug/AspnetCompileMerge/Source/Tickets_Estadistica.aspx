<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Tickets_Estadistica.aspx.vb" Inherits="EasySapWeb.Tickets_Estadistica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
<asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
            </div>
            <h1>Herramientas de Sistemas</h1>
            <div class="form1" >
                <table class="t01" id="T0" runat="server"  >
                    <tr>
                        <td>REPORTE</td>
                        <td><asp:DropDownList ID="TXTREP" runat="server" CssClass="TextBox1" Autofocus AutoPostBack ="true"  ></asp:DropDownList></td>
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
                        <td>DEPTO</td>
                        <td><asp:DropDownList ID="TXTDEP" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>ESTADO</td>
                        <td><asp:DropDownList ID="TXTEST" runat="server" CssClass="TextBox1">
                            <asp:ListItem Value="3" Text="TODOS"></asp:ListItem>
                            <asp:ListItem Value="0" Text="ABIERTO"></asp:ListItem>
                            <asp:ListItem Value="1" Text="CERRADO"></asp:ListItem>
                            </asp:DropDownList></td>
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
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
