<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Rpt_Super_Tdas.aspx.vb" Inherits="EasySapWeb.Rpt_Super_Tdas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
     <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:Panel ID="P0" runat="server" Visible="true" >
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
            </div>
            <h1>REPORTES DE SUPERVISORES DE TIENDAS</h1>
            <div class="form1" >
                <table class="t01" id="T0" runat="server"  >
                    <tr>
                        <td>REPORTE</td>
                        <td><asp:DropDownList ID="TXTREP" runat="server" CssClass="TextBox1" AutoPostBack="true"></asp:DropDownList></td>
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
                        <td><asp:DropDownList ID="TXTSPVS" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>PERIODO</td>
                        <td><asp:DropDownList ID="TXTPRD" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>BOGEGA</td>
                        <td><asp:DropDownList ID="TXTBOD" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList></td>
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
             <br />
            <asp:Panel ID="P1" runat="server" CssClass="Pop" Visible="FALSE" Height="398px" Width="496px">
                <h1>INGRESO DE JUSTIFICACION&nbsp;</h1>
                   <h3>(Solo para uso de Supervisores)</h3>
                <label>TIENDA</label>
                   <asp:TextBox ID="TXTTND" runat="server" CssClass="TextBox1" Enabled="False" ></asp:TextBox>
                   <br />
               <label>NOMBRE DE VENDEDOR</label>
                   <asp:TextBox ID="TXTVND" runat="server" CssClass="TextBox1" Enabled="False" ></asp:TextBox>
                   <br />
                <label>FECHA</label>
                   <asp:TextBox ID="TXTFCH" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox>
                   <br />
                 <label>TIEMPO DE RETRASO</label>
                   <asp:TextBox ID="TXTRETRASO" runat="server" CssClass="TextBox1" Enabled="False"></asp:TextBox>
                   <br />
                <label>JUSTIFICACION</label>
                <asp:TextBox ID="TXTJUS" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="3"></asp:TextBox><br />
                <br />
                 <asp:TextBox ID="TXTCOD" runat="server" CssClass="TextBox1" Enabled="False"  Visible="FALSE"></asp:TextBox>
                   <br />
                <asp:Label ID="LBLERR" runat="server" CssClass="ERRM"></asp:Label><br />
                   <div class="MenuBar">
                       <br />
                     <asp:LinkButton ID="BTNGRD" runat="server" CssClass="TopMenu" Text="AGREGAR" ></asp:LinkButton>
                     <asp:LinkButton ID="BTNBACK" runat="server" CssClass="TopMenu" Text="REGRESAR" OnClientClick ="return confirm('Regresará al Menú?');"></asp:LinkButton>
                </div>
           <br />
                <br />
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
