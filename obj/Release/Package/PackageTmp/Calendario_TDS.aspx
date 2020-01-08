<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Calendario_TDS.aspx.vb" Inherits="EasySapWeb.Calendario_TDS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Regresar al Menú</a>
            </div>
            <h1>CALENDARIO DE TIENDAS</h1>
            <div class="form1" >
                
                 <h1>INGRESO DE HORARIOS&nbsp;</h1>
                <label>TIENDA</label>
                   <asp:DropDownList ID="TXTTDA" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList>
                   <br />
                <label>NOMBRE DE VENDEDOR</label>
                  <asp:DropDownList ID="TXTNV" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList>
                   <br />
                <label>SUPERVISOR</label>
                   <asp:DropDownList ID="TXTSPR" runat="server" CssClass="TextBox1"  AutoPostBack ="true" Enabled="False"  ></asp:DropDownList>
                   <br />
               <label>HORA ENTRADA</label>
                   <asp:TextBox ID="TXTHE" runat="server" CssClass="TextBox1" TextMode="Time" ></asp:TextBox>
                   <br />
                <label>HORA SALIDA</label>
                   <asp:TextBox ID="TXTHS" runat="server" CssClass="TextBox1" TextMode="Time" ></asp:TextBox>
                   <br />
               <asp:Label ID="LBLERR" runat="server" CssClass="ERRM"></asp:Label><br />
                <br />   
                 <br />
                </div>
            <br />
              <asp:GridView ID="GVREP" runat="server" CssClass="grid-view3"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate" AutoGenerateColumns="False">                
                <AlternatingRowStyle CssClass="alternate" />
                <RowStyle CssClass="normal" />
            </asp:GridView> 
            <br />
            <div class="MenuBar">
              <asp:LinkButton ID="BTNGRD" runat="server" CssClass="TopMenu" Text="GUARDAR" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
