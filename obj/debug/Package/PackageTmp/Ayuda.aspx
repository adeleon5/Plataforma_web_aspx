<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Ayuda.aspx.vb" Inherits="EasySapWeb.Ayuda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
     <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div>
                <a href="Menu.aspx" target="_self" class="w3-btn w3-white w3-border w3-border-red w3-round-large w3-text-black">Regresar al menú</a>
            </div>
            <h1>Tutoriales de Ayuda</h1>
            <div class="w3-container">
                <div class="w3-row">
                    <div class="w3-half w3-container w3-mobile" >
                    <h3>BUSCAR:</h3>
                        <asp:TextBox ID="TXTBUS" runat="server" CssClass="w3-input w3-border"></asp:TextBox>
                         <br />
                        <div class="MenuBar">
                            <asp:LinkButton ID="BTNRUN" class="w3-button w3-block w3-yellow" style="width:100%" Text="BUSCAR" runat="server" ></asp:LinkButton>
                        </div>
                        <br />
                        <asp:GridView ID="GVREP" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" 
                        AllowPaging="False" AllowSorting="False" 
                        AutoGenerateColumns="False"
                        RowStyle-CssClass="normal">                
                    </asp:GridView>
                </div>
                <div class="w3-half w3-container w3-mobile">
                    <asp:Literal ID="LIT01" runat="server">

                    </asp:Literal>
                </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
