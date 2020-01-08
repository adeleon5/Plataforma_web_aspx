<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="ConDepTda.aspx.vb" Inherits="EasySapWeb.ConDepTda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
<asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:HiddenField ID="HFPER" runat="server" />
            <asp:Panel ID="P0" runat="server" Visible="true" >
                <div class="MenuBar">
                    <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
                </div>
                <h1>Conciliacion de Depósitos Bancarios Tiendas</h1>
                <div class="form1" >
                    <table class="t01" id="T0" runat="server"  >
                        <tr>
                            <td>BANCO</td>
                            <td><asp:DropDownList ID="TXTBCO" runat="server" CssClass="TextBox1" Autofocus="TRUE" AutoPostBack="true" ></asp:DropDownList></td>
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
                    </table>                                
                    <br />
                    <div class="MenuBar">
                        <asp:LinkButton ID="BTNRUN" CssClass="TopMenu" Text="EJECUTAR" runat="server" ></asp:LinkButton>
                        <asp:LinkButton ID="BTNCERRAR" CssClass="TopMenu" Text="CIERRE CONCILIACION" runat="server" Width="153px" ></asp:LinkButton>
                         <asp:LinkButton ID="BTNCONSCORTE" CssClass="TopMenu" Text="VER CORTE" runat="server" ></asp:LinkButton>
                    </div>
                </div>
                 <asp:Label ID="LBLERR3" runat="server" CssClass="ERRM"></asp:Label>
                <br />
                <br />
                <asp:Literal ID="LDEPS" runat="server" ></asp:Literal>
                <asp:Label ID="LBLERR2" runat="server" CssClass="ERRM"></asp:Label>
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
            <asp:Panel ID="P1" runat="server" CssClass="Pop" Visible="false">
                <asp:Literal ID="LMOD" runat="server" >

                </asp:Literal>
                <br />
                <br />
                <table class="t01">
                    <tr>
                        <td>BANCO</td>
                        <td><asp:DropDownList ID="TXTMODBAN" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>BOLETA</td>
                        <td><asp:TextBox ID="TXTMODBOL" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>MONTO</td>
                        <td><asp:TextBox ID="TXTMODMON" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>RAZON</td>
                        <td><asp:TextBox ID="TXTMODRAZ" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Label ID="LBLERR01" runat="server" CssClass="ERRM" ></asp:Label>
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNCHNG" runat="server" CssClass="TopMenu" Text="Cambiar" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNCANC" runat="server" CssClass="TopMenu" Text="Cancelar" OnClientClick ="return confirm('Descartar cambios?');"></asp:LinkButton>
                </div>
            </asp:Panel>
             <asp:Panel ID="P2" runat="server" Visible="FALSE" >
                <h1>Consultar Corte de POS</h1>
                <div class="form1" >
                    <table class="t01" id="Table1" runat="server"  >
                        <tr>
                            <td>TIENDA</td>
                            <td><asp:DropDownList ID="TXTTIENDACORTE" runat="server" CssClass="TextBox1" ></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>DEL</td>
                            <td><asp:TextBox ID="TXTDEL1" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>AL</td>
                            <td><asp:TextBox ID="TXTAL1" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox></td>
                        </tr>
                   </table>                                
                    <br />
                    <div class="MenuBar">
                       <asp:LinkButton ID="BTNRUN1" CssClass="TopMenu" Text="EJECUTAR" runat="server" ></asp:LinkButton>
                        <asp:LinkButton ID="BTNREG" CssClass="TopMenu" Text="REGRESAR" runat="server" ></asp:LinkButton>
                    </div>
                </div>
               <br />
                <asp:GridView ID="GVREP1" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate" Visible="false" 
                    >                
                </asp:GridView>
                <br />
          </asp:Panel> 
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
