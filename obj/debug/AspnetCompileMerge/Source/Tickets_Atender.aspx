<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Tickets_Atender.aspx.vb" Inherits="EasySapWeb.Tickets_Atender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:Panel ID="P0" runat="server" Visible="true" >
                <div class="MenuBar">
                    <a href="Menu.aspx" target="_self" class="TopMenu">Regresar</a>
                </div>
                <br />
                <h1>Atender Tickets Departamento: <asp:Label ID="LBLDEP" runat="server"></asp:Label></h1>
                <br />
                <asp:GridView ID="GVTCK" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    >                
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="P1" runat="server" Visible="false">
                <asp:Literal ID="LVIEW" runat="server"></asp:Literal>
                <br />
                <div class="Pop">
                    <label for="TXTRES">Responder</label><br />
                    <asp:TextBox ID="TXTRES" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="10"></asp:TextBox><br />
                    <div class="MenuBar" >
                        <asp:LinkButton ID="BTNSNDRESP" runat="server" CssClass="TopMenu" Text="Enviar"></asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="BTNCANCEL" runat="server" CssClass="TopMenu" Text="Cancelar"></asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
