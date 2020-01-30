<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Actualizar_Fecha_Promo.aspx.vb" Inherits="EasySapWeb.Actualizar_Fecha_Promo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
       <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
     <asp:Panel ID="P0" runat="server" Visible="true" >
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
            </div>
            <h1>REPORTES CATALOGO EL SALVADOR</h1>
            <div class="form1" >
                <table class="t01" id="T0" runat="server"  >
                   
                     <tr>
                        <td>DEL</td>
                        <td><asp:TextBox ID="TXTDEL" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>AL</td>
                        <td><asp:TextBox ID="TXTAL" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                    </tr>
                    
                </table>                                
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNRUN" CssClass="TopMenu" Text="EJECUTAR" runat="server" ></asp:LinkButton>
                     <asp:LinkButton ID="BTNENC" CssClass="TopMenu" Text="BORRA ENC" runat="server" Width="110px"></asp:LinkButton>
                <asp:LinkButton ID="BTNDET" CssClass="TopMenu" Text="BORRA DET" runat="server" Width="110px"></asp:LinkButton>
                </div>
            </div>
            <br />
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
                <h1>Modificación De Encabezado Promo</h1>
                   <h3>(Solo para uso de Operaciones)</h3>
                ID DE PROMOCIÓN
                   <asp:TextBox ID="TXTPROMO" runat="server" CssClass="TextBox1" Enabled="False" ></asp:TextBox>
                   <br />
                DESCRIPCIÓN
                   <asp:TextBox ID="TXTDESCRIP" runat="server" CssClass="TextBox1" ></asp:TextBox>
                   <br />
                INICIO
                   <asp:TextBox ID="TXTINICIO" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                FINAL
                   <asp:TextBox ID="TXTFINAL" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                TIPO&nbsp;&nbsp;
                   <asp:TextBox ID="TXTTIPO" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                DESCUENTO
                   <asp:TextBox ID="TXTDESCUENTO" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                ASOCIADO
                   <asp:TextBox ID="TXTASOC" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                   <br />
                <asp:Label ID="LBLERR" runat="server" CssClass="ERRM"></asp:Label><br />
                   <div class="MenuBar">
                       <br />
                     <asp:LinkButton ID="BTNGRD" runat="server" CssClass="TopMenu" Text="AGREGAR" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
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
