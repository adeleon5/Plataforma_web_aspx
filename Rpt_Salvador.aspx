<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Rpt_Salvador.aspx.vb" Inherits="EasySapWeb.Rpt_Salvador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
     <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
             <asp:Panel ID="P0" runat="server" Visible="true">
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
            </div>
            <h1>REPORTES CATALOGO EL SALVADOR</h1>
            <div class="form1" >
                <table class="t01" id="T0" runat="server"  >
                    <tr>
                        <td>REPORTE</td>
                        <td><asp:DropDownList ID="TXTREP" runat="server" CssClass="TextBox1" Autofocus="true" AutoPostBack ="true"  ></asp:DropDownList></td>
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
                        <td>SUPERVISOR</td>
                        <td><asp:DropDownList ID="TXTVDR" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                     <tr>
                        <td>BODEGA</td>
                        <td><asp:DropDownList ID="TXTBOD" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                     <tr>
                        <td>PERIODO</td>
                        <td><asp:DropDownList ID="TXTPRD" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>GENERO</td>
                        <td><asp:DropDownList ID="TXTGNR" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                     <tr>
                        <td>PROVEEDOR</td>
                        <td><asp:DropDownList ID="TXTPVR" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
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
                <h1>Detalle Documentos</h1>
                <asp:Literal ID="LDET"  runat="server" ></asp:Literal>
                <asp:GridView ID="GVDET" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    >                
                </asp:GridView>
                <br />
                <asp:LinkButton ID="BTNBCK2" runat="server" CssClass="TopMenu" Text="Regresar"></asp:LinkButton>
                <br />
                <div class="Centrado" >
                    <asp:ImageButton ID="BTNEXP2" runat="server" ImageUrl="~/images/Excel.gif" Width="35" />
                </div>
                </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
