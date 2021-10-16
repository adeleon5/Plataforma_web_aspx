<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="AdmSeguridad.aspx.vb" Inherits="EasySapWeb.AdmSeguridad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="w3-container"> 
                <asp:HiddenField ID="HF01" runat="server" />
                <h2>Administración de Seguridad</h2>               
                <hr>
                <asp:Panel runat="server" ID="P0">
                <div class="w3-container">
                        <div class="w3-container">
                            <div class="w3-bar w3-row">
                                <div class=" w3-col 4">
                                    <button class="w3-bar-item w3-button w3-red w3-mobile" style="width:33.33%"><asp:LinkButton ID="BTNADDUSR" runat="server" Text="Agregar Usuario" cssclass="w3-text-white" ></asp:LinkButton></button>
                                </div>
                                <div class=" w3-col 4">
                                    <button class="w3-bar-item w3-button w3-red w3-mobile" style="width:33.33%"> <asp:LinkButton ID="BTNADDMNU" runat="server" Text="Editar Menú" class="w3-text-white"></asp:LinkButton></button>
                                </div>
                                <div class=" w3-col 4">
                                    <button class="w3-bar-item w3-button w3-red w3-mobile" style="width:33.33%"> <asp:LinkButton ID="BTNEDIPER" runat="server" Text="Editar Perfiles" class="w3-text-white"></asp:LinkButton></button>
                                </div> 
                            </div>
                         </div>
                      <br />
                        <h1 >Usuarios</h1>
                        <asp:GridView ID="GVUSR" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
                            AllowPaging="False" AllowSorting="False" 
                            AutoGenerateColumns="False" 
                            DataKeyNames="Codigo" 
                            EmptyDataText="There are no data records to display.">        
                          </asp:GridView>  
                        <br />
                </div>
                    </asp:Panel>
            </div>
  
<%--INICIA PANEL NO 1 PARA GESTIONAR PROPIEDADES EXTENDIDAS Y ASIGNAR PERFIL DE ACCESO--%>
<asp:Panel ID="P1" runat="server" Visible="false">
<div class="w3-container">
    <div class="w3-row">
        <div class="w3-half w3-container w3-mobile" >
           <h2>Datos Generales</h2>
            <asp:Literal ID="LP1" runat="server"></asp:Literal>
            <asp:GridView ID="GVEDUS" runat="server"  Width="100%" CssClass="table table-striped table-bordered table-hover"
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False">                
            </asp:GridView>
        </div>
        <div class="w3-half w3-container w3-mobile" >
                <a href="javascript:void(0)" onclick="openCity(event, 'PE');">
                    <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding w3-text-dark-gray">
                        GESTIONAR PROPIEDADES EXTENDIDAS
                    </div>
                </a>
                <a href="javascript:void(0)" onclick="openCity(event, 'PA');">
                    <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding w3-text-dark-gray">
                        ASIGNACIÓN DE PERFIL DE ACCESO
                    </div>
                </a>
                <div id="PE" class="w3-container city" style="display:none">
                    <asp:GridView ID="GVPRE" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" 
                        AllowPaging="False" AllowSorting="False" 
                        AutoGenerateColumns="False">                
                    </asp:GridView>
                    <div>
                     <h3>Agregar Propiedad Extendida</h3>
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
                </div>
            <div id="PA" class="w3-container city" style="display:none">
            <asp:GridView ID="GVPERUS" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False">                
            </asp:GridView>
          </div>
        </div>
    </div>
<div class="w3-container" style="height:25px"> <%--SEPARADOR--%>
</div>
<div class="w3-container">
    <div class="w3-bar">
        <button class="w3-bar-item w3-button w3-red w3-mobile" style="width:33.33%"><asp:LinkButton ID="BTNBCKP1" runat="server" Text="Regresar" cssclass="w3-text-white"  OnClientClick="return confirm('Salir de edición de usuario?');"></asp:LinkButton></button>
        <button class="w3-bar-item w3-button w3-red w3-mobile" style="width:33.33%"><asp:LinkButton ID="BTNSAVUS" runat="server" Text="Guardar" cssclass="w3-text-white"  OnClientClick="return confirm('Guardar los cambios?');"></asp:LinkButton></button>
        <button class="w3-bar-item w3-button w3-red w3-mobile" style="width:33.33%"><asp:LinkButton ID="BTNRESTA" runat="server"  Text="Renovar PWD" cssclass="w3-text-white"  OnClientClick="return confirm('Reestablecer Contraseña?');" ></asp:LinkButton></button>
    </div>
</div>
</div>
</asp:Panel>
<%--FINALIZA PANEL NO 1 PARA GESTIONAR PROPIEDADES EXTENDIDAS Y ASIGNAR PERFIL DE ACCESO--%>

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
                    <caption class="lblblanco">USUARIO NUEVO</caption>
                    <tr>
                        <td class="lblblanco">NOMBRE DE USUARIO</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTNOM" runat="server" CssClass="TextBox1" AUTOFOCUS="True" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="lblblanco">CUENTA DE EMAIL</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTEMA" runat="server" TextMode="Email" CssClass="TextBox1"></asp:TextBox></td>
                    </tr>
                     <tr>
                        <td class="lblblanco">CÓDIGO DE EMPLEADO SAP</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TXTCODEMPSAP" runat="server"  CssClass="TextBox1" AUTOFOCUS="True"></asp:TextBox></td>
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
            <form>
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
            </form>
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
