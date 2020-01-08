<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="PwdChange.aspx.vb" Inherits="EasySapWeb.PwdChange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="w3-content" >
                <div class="w3-card-4">
                    <header class="w3-container w3-dark-grey">
                        <h3>Cambio de contraseña</h3>
                    </header>
                    <br />
                    <div class="w3-container">
                        <div class="w3-row w3-padding-16">
                            <label for="TXTPASACT" >Contraseña actual</label>
                            <br />
                            <asp:TextBox ID="TXTOLDPWD" runat="server" TextMode="Password" CssClass="form-control" Autofocus="true" ></asp:TextBox></td>
                            <br />
                            <label for="TXTPWDANT" >Constraseña nueva</label>
                            <br />
                            <asp:TextBox ID="TXTNEWPWD" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <br />
                            <label for="TXTPWDCONF">Confirmar contraseña nueva</label>
                            <br />
                            <asp:TextBox ID="TXTNEWPW2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <br />
                            <asp:Label ID="LBLERR" runat="server" CssClass="w3-text-red"></asp:Label>
                        </div>
                        <div class="w3-row w3-padding-16">
                            <div class="col-sm-6">
                                <asp:LinkButton ID="BTNSAVE" runat="server" CssClass="w3-button w3-hover-dark-gray w3-blue-gray w3-block" Text="Guardar" ></asp:LinkButton>
                            </div>
                            <div class="col-sm-6">
                                <asp:LinkButton ID="BTNCANC" runat="server" CssClass="w3-button w3-hover-dark-gray w3-red w3-block" Text="Cancelar"></asp:LinkButton>
                            </div>
                        </div>
                    </div>  
                </div>       
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
