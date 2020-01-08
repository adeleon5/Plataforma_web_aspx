<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Menu.aspx.vb" Inherits="EasySapWeb.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
       <ContentTemplate>
           <div>
               <asp:LinkButton ID="BTNOUT" runat="server" Cssclass="w3-btn w3-white w3-border w3-border-red w3-round-large w3-text-black" Text="Salir del Sistema" OnClientClick="return confirm('Salir del Sistema?');"></asp:LinkButton>               
           </div>
          

 <div class="w3-display-container w3-content" style="max-width:700px" >
<%--    <div class="w3-card-4">--%>

            <header class="w3-container w3-dark-grey">
              <h3>Menu principal</h3>
            </header>
            <br />
            <div class="w3-container">
               <asp:Literal ID="L01" runat="server"></asp:Literal>
               <br />
               <asp:TreeView ID="tv0" runat="server" ExpandDepth="2" ForeColor="black" HoverNodeStyle-CssClass="w3-yellow">
               </asp:TreeView>
               <asp:Timer ID="T0" runat="server" Interval="5000" Enabled="true"  ></asp:Timer>
            </div>
<%--    </div>   --%>    
</div>



       </ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>
