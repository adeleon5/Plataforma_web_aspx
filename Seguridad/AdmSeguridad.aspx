<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="AdmSeguridad.aspx.vb" Inherits="EasySapWeb.AdmSeguridad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:HiddenField ID="HF01" runat="server" />
            <h1 class="h1azul">Seguridad</h1>
            <br />
            <asp:Panel ID="P0" runat="server" Visible="true">
            <br />
                <div class="MenuBar" >
                    <a href="Menu.aspx" class="TopMenu">Regresar</a>
                    <asp:LinkButton ID="BTNADDUSR" runat="server" Text="Agregar Usuario" CssClass="TopMenu"></asp:LinkButton>
                    <asp:LinkButton ID="BTNADDMNU" runat="server" Text="Editar Menú" CssClass="TopMenu"></asp:LinkButton>
                    <asp:LinkButton ID="BTNEDIPER" runat="server" Text="Editar Perfiles" CssClass="TopMenu"></asp:LinkButton>
                </div>
             <br />
                <h1 class="h1azul">Usuarios</h1>
                <asp:GridView ID="GVUSR" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    DataKeyNames="Codigo"
                    >                
                </asp:GridView>
                <br />
            </asp:Panel>   
            <asp:Panel ID="P1" runat="server" Visible="false">
                <h1 class="h1azul">Datos Generales</h1>
                <asp:Literal ID="LP1" runat="server"></asp:Literal>
                <asp:GridView ID="GVEDUS" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    >                
                </asp:GridView>
                <br /><br />
                <asp:TabContainer ID="TC01" runat="server" CssClass="ajax__tab_blueGrad-theme">
                    <asp:TabPanel ID="TP0" runat="server" HeaderText="Propiedades Extendidas">
                        <ContentTemplate>
                            <asp:GridView ID="GVPRE" runat="server" CssClass="grid-view" 
                                Caption="PROPIEDADES EXTENDIDAS"
                                AllowPaging="False" AllowSorting="False" 
                                AutoGenerateColumns="False"
                                RowStyle-CssClass="normal"
                                AlternatingRowStyle-CssClass="alternate"  
                                >                
                            </asp:GridView>
                            <br /><br />
                            <div class="form1">
                                <br />
                                <h2>Agregar Propiedad Extendida</h2>
                                <label for="TXTPENOM">Nombre</label>
                                <asp:TextBox ID="TXTPENOM" runat="server" CssClass="TextBox1" TextMode="SingleLine" ></asp:TextBox><br /><br />
                                <label for="TXTPETIP">Tipo</label>
                                <asp:DropDownList ID="TXTPETIP" runat="server" CssClass="TextBox1" >
                                    <asp:ListItem Value="E">Entero</asp:ListItem>
                                    <asp:ListItem Value="T">Texto</asp:ListItem>
                                    <asp:ListItem Value="F">Fecha</asp:ListItem>
                                    <asp:ListItem Value="B">Si/No</asp:ListItem>
                                </asp:DropDownList><br /><br />
                                <label for="TXTPEVAL">Valores (separados por ,)</label>
                                <asp:TextBox ID="TXTPEVAL" runat="server" CssClass="TextBox1" TextMode="SingleLine" ></asp:TextBox><br /><br />
                                <div class="MenuBar" >
                                    <asp:Button ID="BTNADDPE" runat="server" Text="Agregar" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TP1" runat="server" HeaderText="Perfiles de Acceso">
                        <ContentTemplate>
                            <asp:GridView ID="GVPERUS" runat="server" CssClass="grid-view" 
                                Caption="PERFILES"
                                AllowPaging="False" AllowSorting="False" 
                                AutoGenerateColumns="False"
                                RowStyle-CssClass="normal"
                                AlternatingRowStyle-CssClass="alternate"  
                                >                
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
                <br /><br />
                <div class="MenuBar" >
                    <asp:LinkButton ID="BTNBCKP1" runat="server" CssClass="TopMenu" Text="Regresar" OnClientClick="return confirm('Salir de edición de usuario?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNSAVUS" runat="server" CssClass="TopMenu" Text="Guardar" OnClientClick="return confirm('Guardar los cambios?');"></asp:LinkButton>
                    <asp:LinkButton ID="BTNRESTA" runat="server" CssClass="TopMenu" Text="Renovar PWD" OnClientClick="return confirm('Reestablecer Contraseña?');" ></asp:LinkButton>
                </div>
            </asp:Panel>
            <asp:Panel ID="PP01" runat="server" CssClass="Pop" Visible="false" >
                <asp:HiddenField ID="HFPUP" runat="server"  />
                <table style="width:100%;">
                     <caption>MODIFICAR VALOR DE <asp:Label ID="LBLVALOR" runat="server"></asp:Label></caption>
                    <tr><td>Valor</td><td><asp:TextBox ID="TXTVAL" runat="server" CssClass="TextBox1" autofocus="true"></asp:TextBox>
                        <asp:DropDownList ID="TXTSEL" runat="server" CssClass="TopMenu" AUTOFOCUS="false"></asp:DropDownList>
                                      </td></tr>
                </table>
                <br /><br />
                <div style="text-align:center;">
                    <asp:Button ID="BTNOKPOPUP" Text="ACEPTAR" runat="server" />&nbsp;&nbsp;<asp:Button ID="BTNCANCELPOPUP" runat="server" Text="CANCELAR" CausesValidation="False" />
                </div>
            </asp:Panel>    
            <asp:Panel ID="PP02" runat="server" CssClass="Pop" Visible="false" >
                <asp:HiddenField ID="HF02" runat="server" />
                <table style="width:100%">
                    <caption>USUARIO NUEVO</caption>
                    <tr>
                        <td>NOMBRE</td><td><asp:TextBox ID="TXTNOM" runat="server" CssClass="TextBox1" AUTOFOCUS="True" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>EMAIL</td><td><asp:TextBox ID="TXTEMA" runat="server" TextMode="Email" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Label ID="LBLERRMNW" runat="server" CssClass="ERRM"></asp:Label></td>
                    </tr>
                </table>
                <br />
                <br />
                <div class="Centrado">
                    <asp:Button ID="BTNSAVNEW" runat="server" Text="Guardar" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BTNCANNEW" runat="server" Text="Cancelar" OnClientClick="return confirm('Cancelar los cambios?');" CausesValidation="False" />
                </div>
            </asp:Panel>
            <asp:Panel ID="PP03" runat="server" CssClass="Pop" Visible="false" >
                <asp:HiddenField ID="HFPADRE" runat="server"  />
                <h2>MENU</h2>
                <asp:Label ID="LBLNODO" runat="server" Text="NODO"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GVMENU" runat="server" CssClass="grid-view" 
                    Caption="USUARIOS"
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    DataKeyNames="Codigo"
                    >                
                </asp:GridView>             
                <br /><br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNMNUANT" runat="server" CssClass="TopMenu" Text="Anterior" ></asp:LinkButton>
                    <asp:LinkButton ID="BTNMNUADD" runat="server" CssClass="TopMenu" Text="Agregar"></asp:LinkButton>
                    <asp:LinkButton ID="BTNMNUCAN" runat="server" CssClass="TopMenu" Text="Cancelar"></asp:LinkButton>
                </div>   
            </asp:Panel>
            <asp:Panel ID="PP04" runat="server" Visible="false" CssClass="Pop" >
                <h2>Agregar Pantalla / Carpeta</h2>
                <label for="TXTPANT">Nombre Pantalla (ej abc.aspx)</label>
                <asp:TextBox ID="TXTPANTN" runat="server" CssClass="TextBox1" AUTOFOCUS="true" ToolTip="Deje en blanco si va a agregar una Carpeta"></asp:TextBox>
                <br />
                <label for="TXTPANTD">Descripción</label>
                <asp:TextBox ID="TXTPANTD" runat="server" CssClass="TextBox1"></asp:TextBox>
                <br /><br />
                <asp:Label ID="LBLNMERR" runat="server" CssClass="ERRM"></asp:Label>
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNADDMENU" runat="server" CssClass="TopMenu" Text="Guardar"></asp:LinkButton>
                    <asp:LinkButton ID="BTNCANMENU" runat="server" CssClass="TopMenu" Text="Cancelar"></asp:LinkButton>
                </div>
            </asp:Panel>
            <asp:Panel ID="P2" runat="server" Visible="false" >
                <asp:Panel ID="P2_1" runat="server" Visible="true">
                    <div class="MenuBar">
                        <asp:LinkButton ID="BTNBCKPER" runat="server" CssClass="TopMenu" Text="Regresar"></asp:LinkButton>
                    </div>
                    <asp:GridView ID="GVPER" runat="server" CssClass="grid-view" 
                        Caption="Perfiles"
                        AllowPaging="False" AllowSorting="False" 
                        AutoGenerateColumns="False"
                        RowStyle-CssClass="normal"
                        AlternatingRowStyle-CssClass="alternate" 
                        >                
                    </asp:GridView>
                    <br />
                    <br />
                    <div class="MenuBar">
                        <asp:LinkButton ID="BTNADDPER" runat="server" CssClass="TopMenu" Text="Agregar Perfil"></asp:LinkButton>
                    </div>
                </asp:Panel>
                <asp:Panel ID="P2_2" Visible="false" runat="server">
                    <h1 class="h1azul">Agregar Perfil</h1>
                    <div class="form1">
                        <label for ="TXTNOMPER">Nombre Perfil</label>
                        <asp:TextBox ID="TXTNOMPER" runat="server" CssClass="TextBox1" AUTOFOCUS="true"></asp:TextBox>
                        <br /><br />
                        <label for = "TXTDESPER">Descripción</label>
                        <asp:TextBox ID="TXTDESPER" runat="server" CssClass="TextBox1"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="LBLERR22" runat="server" CssClass="ERRM"></asp:Label>
                    </div>
                    <div class="MenuBar">
                        <asp:LinkButton ID="BTNREP22" runat="server" CssClass="TopMenu" Text="Guardar"></asp:LinkButton>
                        <asp:LinkButton ID="BTNREP23" runat="server" CssClass="TopMenu" Text="Cancelar" ></asp:LinkButton>
                    </div>
                    <br /><br />
                </asp:Panel>
                <asp:Panel ID="P2_3" runat="server" Visible="false">
                    <br />
                    <asp:Literal ID="LP2_3" runat="server"></asp:Literal>
                    <asp:GridView ID="GVACC" runat="server" CssClass="grid-view" 
                        Caption="Perfiles"
                        AllowPaging="False" AllowSorting="False" 
                        AutoGenerateColumns="False"
                        RowStyle-CssClass="normal"
                        AlternatingRowStyle-CssClass="alternate" 
                        >                
                    </asp:GridView>
                    <br /><br />
                    <asp:Label ID="LBLERR23" runat="server" CssClass="ERRM"></asp:Label>
                    <div class="MenuBar" >
                        <asp:LinkButton ID="BTNBCKP23" runat="server" CssClass="TopMenu" Text="Regresar"></asp:LinkButton>
                        <asp:LinkButton ID="BTNDELP23" runat="server" CssClass="TopMenu" Text="Eliminar" OnClientClick="return confirm('Eliminar el perfil?');"></asp:LinkButton>
                    </div>
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
