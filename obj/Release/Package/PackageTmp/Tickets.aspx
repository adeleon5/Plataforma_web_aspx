<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Tickets.aspx.vb" Inherits="EasySapWeb.Tickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server">
        <ContentTemplate>
            <asp:Panel ID="P0" runat="server" Visible="true">
                <div class="MenuBar">
                    <a href="Menu.aspx" target="_self" class="TopMenu">Regresar</a>
                </div>
                <br />
                <h1 class="h1azul">Mis Tickets</h1>
                <br /><br />
                <asp:GridView ID="GVTCK" runat="server" CssClass="grid-view" 
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate"  
                >                
                </asp:GridView>
                <br />
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNADDTCK" runat="server" CssClass="TopMenu" Text="Agregar Ticket"></asp:LinkButton>
                </div>
            </asp:Panel>
            <br />
            <asp:Panel ID="P1" runat="server" Visible="false" >
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNBCKTCK" runat="server" CssClass="TopMenu" Text="Regresar" ></asp:LinkButton>
                </div>
                <br />
                <asp:Literal ID="LADD" runat="server"></asp:Literal>
                <div class="form1">
                    <label for="TXTDEP" class="lblblanco">Empresa</label><br />
                    <asp:TextBox ID="TXTEMPRESA" runat="server" CssClass="TextBox1"></asp:TextBox>
                    <label for="TXTDEP" class="lblblanco">Departamento</label><br />
                    <asp:DropDownList ID="TXTDEP" runat="server" CssClass="TextBox1"></asp:DropDownList><br />
                    <label for="TXTREQ" class="lblblanco">Requerimiento</label><br />
                    <asp:TextBox ID="TXTREQ" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="10"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="LBLERR01" runat="server" CssClass="ERRM"></asp:Label>
                    <div class="MenuBar">
                        <asp:LinkButton ID="BTNSND01" RUNAT="server" CssClass="TopMenu" Text="Enviar" OnClientClick="return confirm('Enviar Ticket?');"></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="BTNCAN01" RUNAT="server" CssClass="TopMenu" Text="Cancelar" OnClientClick="return confirm('Descartar los Cambios?');"></asp:LinkButton>
                    </div>
                    
                </div>
            </asp:Panel>
            <asp:Panel ID="P2" runat="server" Visible="false" >
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNBCK02" runat="server" CssClass="TopMenu" Text="Regresar"></asp:LinkButton>
                </div>
                <br />
                <asp:Literal ID="LVIEW" runat="server"></asp:Literal>
                <br />
                <asp:Panel ID="P3" runat="server" CssClass="Pop" Visible="false">
                    <label for="TXTRES" class="lblazul">Responder</label><br />
                    <asp:TextBox ID="TXTRES" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="10"></asp:TextBox><br />
                    <div class="MenuBar" >
                        <asp:LinkButton ID="BTNSNDRESP" runat="server" CssClass="TopMenu" Text="Enviar"></asp:LinkButton>
                    </div>
                    <br />
                    <br />
                    <hr />
                    <br />
                    <asp:Panel ID="P4" runat="server" >
                        <div class="MenuBar">
                            <asp:LinkButton ID="BTNCLOSE" runat="server" CssClass="TopMenu" Text="Cerrar Ticket"></asp:LinkButton>
                        </div>
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="P5" runat="server" Visible="false" CssClass="Pop" >
                        <h3 class="h3azul">Calificación de Servicio</h3>
                        <label for="TXTCAL" class="lblazul">Calificación</label><br />
                        <asp:DropDownList ID="TXTCAL" runat="server" CssClass="TextBox1">
                            <asp:ListItem Value="1" Text="Excelente"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Muy Bueno"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Regular"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Malo"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Pésimo"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <div class="MenuBar">
                            <asp:LinkButton ID="BTNCANCLOSE" runat="server" CssClass="TopMenuSmall"  Text="Cancelar"></asp:LinkButton>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="BTNCLOSETCK" runat="server" CssClass="TopMenuSmall" Text="Cerrar"></asp:LinkButton>
                        </div>
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
