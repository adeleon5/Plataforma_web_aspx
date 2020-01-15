<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Ventas_Conciliacion.aspx.vb" Inherits="EasySapWeb.Ventas_Conciliacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <asp:SqlDataSource ID="SQLDETCONCILIACION" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ID_INTERNO, ID_PROVEEDOR, NOMBRE_COMERCIAL, FECHA_DOCTO, ESTADO_DOCTO, TOTAL_DOCUMENTO FROM OC_ENCABEZADO_FORMATEADO WHERE (ESTADO_DOCTO = 'C') OR (ESTADO_DOCTO = 'T')">
    </asp:SqlDataSource>
</asp:Content>
