<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Cargas.aspx.vb" Inherits="EasySapWeb.Cargas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
             <div class="MenuBar" >
                 <a href="Menu.aspx" class="TopMenu" target="_self"  >Regresar</a>
             </div>
            <div class="Centrado" >
                <h1>PROCESOS DE CARGA DE PLANTILLAS</h1>
            </div>
            <br />
            <br />
            <div class="form1">
                <table class="t01">
                    <caption>Parámetros</caption>
                    <tr><td>Proceso</td><td><asp:DropDownList ID="TXTPROC" runat="server" CssClass="TextBox1" AutoPostBack="true" Autofocus ></asp:DropDownList></td></tr>
                    <tr><td>Plantilla</td><td><asp:Literal ID="LDOWNLOAD" runat="server" Text=""></asp:Literal></td></tr>
                    <tr><td>Subir Archivo</td><td><asp:FileUpload ID="FU0" runat="server" AllowMultiple="false" /></td></tr>
                    <tr><td colspan="2"><asp:Label ID="LBLERR" runat="server" CssClass="ERRM"></asp:Label></td></tr>
                    <tr><td>Cargar</td><td><asp:LinkButton ID="BTNUPL" runat="server" CssClass="TopMenu" Text="Cargar"></asp:LinkButton></td></tr>
                </table>
            </div>
            <br /><br />
            <asp:GridView ID="GVRES" runat="server" CssClass="grid-view" 
                AllowPaging="False" AllowSorting="False" 
                AutoGenerateColumns="False"
                RowStyle-CssClass="normal"
                AlternatingRowStyle-CssClass="alternate"  
                >                
                </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNUPL" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
