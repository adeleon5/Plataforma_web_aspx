<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Directorio.aspx.vb" Inherits="EasySapWeb.Directorio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:Panel ID="P0" runat="server" Visible="true" >
                <div class="MenuBar">
                    <a href="Menu.aspx" target="_self" class="TopMenu">REGRESAR</a>
                </div>
                <h1>DIRECTORIO TELEFONICO</h1>
                <div class="form1" >
                     <table class="t01" id="T0" runat="server"  >
                        <tr>
                            <td>FILTRO</td>
                            <td><asp:DropDownList ID="TXTFLT" runat="server" CssClass="TextBox1"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>REFERENCIA</td>
                            <td><asp:TextBox ID="TXTREF" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                        </tr>
                           <tr>
                            <td></td>
                        </tr>
                    </table>                                                               
                    <br />
                    <div class="MenuBar">
                        <asp:LinkButton ID="BTNBSC" CssClass="TopMenu" Text="BUSCAR" runat="server" ></asp:LinkButton>
                    </div>
                </div>
                <br /><br />
                <asp:GridView ID="GVREP" runat="server" CssClass="grid-view" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate"  
                    >                
                </asp:GridView>
                <br /><br />
                   <div class="MenuBar">
                        <asp:LinkButton ID="BTNRUN" CssClass="TopMenu" Text="AGREGAR" runat="server" ></asp:LinkButton>
                </div>
                <br /><br />
                <div class="Centrado" >
                    <asp:ImageButton ID="BTNEXPORT" runat="server" ImageUrl="~/images/Excel.gif" Width="35" />
                </div>
                <br /><br />
            </asp:Panel>
            <br /><br />
             <asp:Panel ID="P1" runat="server" Visible="false">
                <asp:TabContainer ID="TC01" runat="server" CssClass="ajax__tab_blueGrad-theme">
                    <asp:TabPanel ID="TP0" runat="server" HeaderText="DATOS LABORALES"><ContentTemplate><asp:Literal ID="LMOD" runat="server" ></asp:Literal><br />
                        <table class="t01">
                            <tr>
                                <td>NOMBRE</td>
                            </tr>
                            <tr>
                                <td><asp:TextBox ID="TXTNOM" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>DEPARTAMENTO</td>
                            </tr>
                            <tr>
                                <td><asp:TextBox ID="TXTDEPTO" runat="server" CssClass="TextBox1"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>CORREO</td>
                            </tr>
                            <tr>
                                <td><asp:TextBox ID="TXTCRO" runat="server" CssClass="TextBox1" ></asp:TextBox></td>
                            </tr>
                        </table>
                        <br />
                        <asp:Label ID="LBLERR01" runat="server" CssClass="ERRM" ></asp:Label>
                        <br />
                        <asp:GridView ID="GVEMP" runat="server" CssClass="grid-view" 
                                Caption="EMPRESAS ASIGNADAS AL DEPARTAMENTO" 
                                AutoGenerateColumns="False"><AlternatingRowStyle CssClass="alternate" /><RowStyle CssClass="normal" /></asp:GridView><br /><br /><asp:GridView ID="GVTEL" runat="server" CssClass="grid-view" 
                                Caption="TELEFONOS LABORALES" 
                                AutoGenerateColumns="False"><AlternatingRowStyle CssClass="alternate" /><RowStyle CssClass="normal" /></asp:GridView>
                        <br /><br />
                        <div class="MenuBar">
                           <asp:LinkButton ID="BTNRGS" runat="server" CssClass="TopMenu" Text="REGRESAR" OnClientClick ="return confirm('Regresará al Menú?');"></asp:LinkButton>
                        </div><br /><br /></ContentTemplate></asp:TabPanel>
                    <asp:TabPanel ID="TP1" runat="server" HeaderText="DATOS PERSONALES"><ContentTemplate><asp:GridView ID="GVTELPER" runat="server" CssClass="grid-view" 
                                Caption="TELEFONOS PERSONALES"
                                AllowPaging="False" AllowSorting="False" 
                                AutoGenerateColumns="False"
                                RowStyle-CssClass="normal"
                                AlternatingRowStyle-CssClass="alternate"  
                                ></asp:GridView></ContentTemplate></asp:TabPanel>
                    <asp:TabPanel ID="TP2" runat="server" HeaderText="DATOS EQUIPO DE COMPUTO"><ContentTemplate><asp:GridView ID="GVEQCOM" runat="server" CssClass="grid-view" 
                                Caption="EQUIPO DE COMPUTO"
                                AllowPaging="False" AllowSorting="False" 
                                AutoGenerateColumns="False"
                                RowStyle-CssClass="normal"
                                AlternatingRowStyle-CssClass="alternate"  
                                ></asp:GridView></ContentTemplate></asp:TabPanel>
                </asp:TabContainer>
                </asp:Panel>
                <asp:Panel ID="P2" runat="server" CssClass="Pop" Visible="FALSE">
                <br /><br />
               
                 <h1>DATOS DE USUARIO&nbsp;</h1>
                <label>NOMBRE 1</label>
                   <asp:TextBox ID="TXTNOM1" runat="server" CssClass="TextBox1" ></asp:TextBox>
                   <br />
                <label>NOMBRE 2</label>
                   <asp:TextBox ID="TXTNOM2" runat="server" CssClass="TextBox1" ></asp:TextBox>
                   <br />
                <label>NOMBRE 3</label>
                   <asp:TextBox ID="TXTNOM3" runat="server" CssClass="TextBox1" ></asp:TextBox>
                   <br />
                <label>APELLIDO 1</label>
                   <asp:TextBox ID="TXTAPE1" runat="server" CssClass="TextBox1" ></asp:TextBox>
                   <br />
                <label>APELLIDO 2</label>
                   <asp:TextBox ID="TXTAPE2" runat="server" CssClass="TextBox1" ></asp:TextBox>
                   <br />
                <label>APELLIDO DE CASADA</label>
                   <asp:TextBox ID="TXTDCSD" runat="server" CssClass="TextBox1" ></asp:TextBox>
                   <br />
                <label>CORREO LABORAL</label>
                   <asp:TextBox ID="TXTCOR" runat="server" CssClass="TextBox1" ></asp:TextBox>
                <label>DEPARTAMENTO</label>
                   <asp:DropDownList ID="TXTDEP" runat="server" CssClass="TextBox1" ></asp:DropDownList>
                   <br />
                <label>EMPRESA O EMPRESAS</label>
                   <asp:DropDownList ID="TXTEMP" runat="server" CssClass="TextBox1"></asp:DropDownList>
                   <br />
                <label>TIPO DE LINEA</label>
                   <asp:TextBox ID="TXTTLN" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                <label>NUMERO</label>
                   <asp:TextBox ID="TXTNUM" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                <label>PROVEEDOR</label>
                   <asp:DropDownList ID="TXTPROV" runat="server" CssClass="TextBox1"></asp:DropDownList>
                   <br />
                <label>TIPO DE EXTENSION</label>
                   <asp:TextBox ID="TXTTIP" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                <label>NUMERO</label>   
                    <asp:TextBox ID="TXTNUM1" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                <label>DIRECCION</label>
                   <asp:TextBox ID="TXTDRC" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                <label>GENERO</label>
                   <asp:DropDownList ID="TXTGNR" runat="server" CssClass="TextBox1"></asp:DropDownList>
                   <br />
                <label>FECHA NACIMIENTO</label>
                   <asp:TextBox ID="TXTFN" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox>
                   <br />
                <label>FECHA INGRESO</label>
                   <asp:TextBox ID="TXTFI" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox>
                   <br />
                <label>FECHA SALIDA</label>
                   <asp:TextBox ID="TXTFS" runat="server" CssClass="TextBox1" TextMode="Date" ></asp:TextBox>
                   <br />
                <label>ESTATUS</label>
                   <asp:DropDownList ID="TXTSTT" runat="server" CssClass="TextBox1"></asp:DropDownList>
                   <br />
                <label>IP ASIGNADA</label>
                   <asp:TextBox ID="TXTIP" runat="server" CssClass="TextBox1"></asp:TextBox>
                   <br />
                <label>TIPO DE SANGRE</label>
                   <asp:DropDownList ID="TXTTS" runat="server" CssClass="TextBox1"></asp:DropDownList>
                   <br />
                <label>DONANTE</label>
                   <asp:DropDownList ID="TXTDNT" runat="server" CssClass="TextBox1"></asp:DropDownList>
                   <br />
                <label>ALERGIAS</label>
                   <asp:TextBox ID="TXTALGS" runat="server" CssClass="TextBox1" TextMode="MultiLine" Rows="5"></asp:TextBox>
                 <br /><br />
                   <asp:Label ID="Label1" runat="server" CssClass="ERRM" ></asp:Label>
                <div class="MenuBar">
                     <asp:LinkButton ID="BTNGRD" runat="server" CssClass="TopMenu" Text="GUARDAR" OnClientClick ="return confirm('Guardar cambios?');"></asp:LinkButton>
                     <asp:LinkButton ID="BTNBACK" runat="server" CssClass="TopMenu" Text="REGRESAR" OnClientClick ="return confirm('Regresará al Menú?');"></asp:LinkButton>
                </div>
           
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
