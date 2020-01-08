<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Menu.aspx.vb" Inherits="EasySapWeb.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
   <asp:UpdatePanel ID="UP0" runat="server" >
       <ContentTemplate>
           <div class="MenuBar" >
               <asp:LinkButton ID="BTNOUT" runat="server" CssClass="TopMenu" Text="Salir del Sistema" OnClientClick="return confirm('Salir del Sistema?');"></asp:LinkButton>               
           </div>
           <br /><br />
           <div class="Pop">
               <asp:Literal ID="L01" runat="server"></asp:Literal>
               <br />
               <asp:TreeView ID="tv0" runat="server" ExpandDepth="2" ForeColor="White" Font-Names="calibri light">
               </asp:TreeView>
           </div>
           <asp:Timer ID="T0" runat="server" Interval="5000" Enabled="true"  ></asp:Timer>
       </ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>
