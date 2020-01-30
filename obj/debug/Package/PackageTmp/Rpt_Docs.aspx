<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Rpt_Docs.aspx.vb" Inherits="EasySapWeb.Rpt_Docs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:Panel ID="P0" runat="server" Visible="true">
                <div class="MenuBar">
                    <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
                </div>
                <h1>Documentos Tiendas</h1>
                <div class="form1" >
                    <table class="t01" id="T0" runat="server"  >
                        <tr>
                            <td>REPORTE</td>
                            <td><asp:DropDownList ID="TXTREP" runat="server" CssClass="TextBox1" Autofocus="TRUE" AutoPostBack ="true"  ></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>TIENDA</td>
                            <td><asp:DropDownList ID="TXTTDA" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
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
                            <td>TIPO DOCUMENTO</td>
                            <td><asp:DropDownList ID="TXTTDOC" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>NUMERO DOC</td>
                            <td><asp:TextBox ID="TXTNUMDOC" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>PERIODO</td>
                            <td><asp:DropDownList ID="TXTPRD" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
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
            <asp:Panel ID="P1" runat="server" Visible="false">
                <asp:LinkButton ID="BTNBCK01" runat="server" CssClass="TopMenu" Text="Regresar"></asp:LinkButton>
                <br /><br />
                <h1>Detalle Documento</h1>
                <asp:Literal ID="LDET"  runat="server" ></asp:Literal>
                <asp:GridView ID="GVDET" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    >                
                </asp:GridView>
                <br /><br />
                <div class="Centrado" >
                    <asp:ImageButton ID="BTNEXP2" runat="server" ImageUrl="~/images/Excel.gif" Width="35" />
                </div>
            </asp:Panel>
            <asp:Panel ID="P2" runat="server" Visible="false">
                <asp:LinkButton ID="BTNBACK" runat="server" CssClass="TopMenu" Text="Regresar"></asp:LinkButton>
                <br /><br />
                <h1>Detalle De Facturas</h1>
                <asp:Literal ID="LDET1"  runat="server" ></asp:Literal>
                <asp:GridView ID="GVDET1" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    >                
                </asp:GridView>
                <br /><br />
                <div class="Centrado" >
                    <asp:ImageButton ID="BTNEXP3" runat="server" ImageUrl="~/images/Excel.gif" Width="35" />
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
            <asp:PostBackTrigger ControlID="BTNEXP2" />
            <asp:PostBackTrigger ControlID="BTNEXP3" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
