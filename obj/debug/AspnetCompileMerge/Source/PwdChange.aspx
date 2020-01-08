<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="PwdChange.aspx.vb" Inherits="EasySapWeb.PwdChange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="w3-display-container w3-content" style="max-width:700px" >
                <div class="w3-card-4">
                    <header class="w3-container w3-dark-grey">
                        <h3>Cambio de contraseña</h3>
                    </header>
                    <br />
                    <div class="w3-container">
                        <label for="TXTPASACT" >Contraseña actual</label>
                        <br />
                        <asp:TextBox ID="TXTOLDPWD" runat="server" TextMode="Password" CssClass="w3-input" Autofocus="true" ></asp:TextBox></td>
                        <br />
                        <label for="TXTPWDANT" >Constraseña nueva</label>
                        <br />
                        <asp:TextBox ID="TXTNEWPWD" runat="server" TextMode="Password" CssClass="w3-input"></asp:TextBox>
                        <br />
                        <label for="TXTPWDCONF">Confirmar contraseña nueva</label>
                        <br />
                        <asp:TextBox ID="TXTNEWPW2" runat="server" TextMode="Password" CssClass="w3-input"></asp:TextBox>
                        <br />
                        <asp:Label ID="LBLERR" runat="server" CssClass="w3-text-red"></asp:Label>
                        <br />
                    </div>
                        <div class="w3-bar">
                           <button class="w3-bar-item w3-button w3-green w3-mobile" style="width:50%"><asp:LinkButton ID="BTNSAVE" runat="server" CssClass="w3-text-white" Text="Guardar" ></asp:LinkButton></button>
                           <button class="w3-bar-item w3-button w3-red w3-mobile" style="width:50%"><asp:LinkButton ID="BTNCANC" runat="server" CssClass="w3-text-white" Text="Cancelar"></asp:LinkButton></button>
                        </div>
                </div>       
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
