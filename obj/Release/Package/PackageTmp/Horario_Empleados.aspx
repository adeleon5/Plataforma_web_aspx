<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Horario_Empleados.aspx.vb" Inherits="EasySapWeb.Horario_Empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">REGRESAR AL MENÚ</a>
            </div>
                <br />
                 <h1>INGRESO DE HORARIOS POR DIA&nbsp;</h1>
                <br />
               <div class="form1" >
               <h1>INGRESE HORARIOS!</h1>
               <label>DEPARTAMENTOS</label>
                   <asp:DropDownList ID="TXTDEP" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList>
                   <br />
               <label>SECCION</label>
                   <asp:DropDownList ID="TXTSCN" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList>
                   <br />
               <label>EMPLEADO</label>
                   <asp:DropDownList ID="TXTEPD" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:DropDownList>
                   <br />
               <label>HORA ENTRADA</label>
                   <asp:TextBox ID="TXTHEM" runat="server" CssClass="TextBox1" TextMode="Time" ></asp:TextBox>
                   <br />
                <label>HORA SALIDA</label>
                   <asp:TextBox ID="TXTHSM" runat="server" CssClass="TextBox1" TextMode="Time" ></asp:TextBox>
                   <br />
                <label>HORAS PROYECTADAS POR DIA</label>
                   <asp:TextBox ID="TXTHPD" runat="server" CssClass="TextBox1" TextMode="Number"></asp:TextBox>
                   <br />
               <asp:Label ID="LBLERR1" runat="server" CssClass="ERRM"></asp:Label><br />
                <br />  
                <div class="MenuBar">

                    <asp:CheckBox ID="CHKLUN" runat="server" Text="LUNES" AutoPostBack="true" />
                    &nbsp;<asp:CheckBox ID="CHKMAR" runat="server" Text="MARTES" AutoPostBack="true"/>
                    &nbsp;<asp:CheckBox ID="CHKMIR" runat="server" Text="MIERCOLES"  AutoPostBack="true"/>
                    &nbsp;<asp:CheckBox ID="CHKJUE" runat="server" Text="JUEVES"  AutoPostBack="true"/>
               </div>  
                   <br />
                <div class="MenuBar">
                    &nbsp;<asp:CheckBox ID="CHKVIE" runat="server" Text="VIERNES" AutoPostBack="true" />
                    &nbsp;<asp:CheckBox ID="CHKSAB" runat="server" Text="SABADO" AutoPostBack="true"/>
                    &nbsp;<asp:CheckBox ID="CHKDOM" runat="server" Text="DOMINGO" AutoPostBack="true" />
                </div>  
                   <br />
                <div class="MenuBar">
                 <asp:LinkButton ID="BTNACT" runat="server" CssClass="TopMenu" Text="LIMPIAR DATOS" OnClientClick ="return confirm('Se Actualizaran los campos?');"></asp:LinkButton>
                 </div>
                 <br />
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
