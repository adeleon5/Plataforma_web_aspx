<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Ayuda.aspx.vb" Inherits="EasySapWeb.Ayuda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
     <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
            </div>
            <h1>Tutoriales de Ayuda</h1>
            <div class="form1" >
                <table class="t01" id="T0" runat="server"  >
                    <tr>
                        <td>BUSCAR</td>
                        <td><asp:TextBox ID="TXTBUS" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
               </table>                                
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNRUN" CssClass="TopMenu" Text="BUSCAR" runat="server" ></asp:LinkButton>
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
           <asp:Literal ID="LIT01" runat="server">

           </asp:Literal>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
