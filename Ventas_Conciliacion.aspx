<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Ventas_Conciliacion.aspx.vb" Inherits="EasySapWeb.Ventas_Conciliacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <asp:SqlDataSource ID="SQLDETCONCILIACION" runat="server" ConnectionString="<%$ ConnectionStrings:EASYIDB %>" SelectCommand="SELECT [IdDetConciliacion], [IdConciliacion], [IdSucursal], [Nombre], [Establecimiento], [VentasPOS], [VentasCD], [ResultadoCD], [UsrRevisa], [FechaUltimaRevision] FROM [VENTAS_D_CONCILIACION_INTERNA_POS_CD]" DeleteCommand="DELETE FROM [VENTAS_D_CONCILIACION_INTERNA_POS_CD] WHERE [IdDetConciliacion] = @IdDetConciliacion" InsertCommand="INSERT INTO [VENTAS_D_CONCILIACION_INTERNA_POS_CD] ([IdConciliacion], [IdSucursal], [Nombre], [Establecimiento], [VentasPOS], [VentasCD], [ResultadoCD], [UsrRevisa], [FechaUltimaRevision]) VALUES (@IdConciliacion, @IdSucursal, @Nombre, @Establecimiento, @VentasPOS, @VentasCD, @ResultadoCD, @UsrRevisa, @FechaUltimaRevision)" UpdateCommand="UPDATE [VENTAS_D_CONCILIACION_INTERNA_POS_CD] SET [IdConciliacion] = @IdConciliacion, [IdSucursal] = @IdSucursal, [Nombre] = @Nombre, [Establecimiento] = @Establecimiento, [VentasPOS] = @VentasPOS, [VentasCD] = @VentasCD, [ResultadoCD] = @ResultadoCD, [UsrRevisa] = @UsrRevisa, [FechaUltimaRevision] = @FechaUltimaRevision WHERE [IdDetConciliacion] = @IdDetConciliacion">
        <DeleteParameters>
            <asp:Parameter Name="IdDetConciliacion" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdConciliacion" Type="Int32" />
            <asp:Parameter Name="IdSucursal" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Establecimiento" Type="String" />
            <asp:Parameter Name="VentasPOS" Type="Decimal" />
            <asp:Parameter Name="VentasCD" Type="Decimal" />
            <asp:Parameter Name="ResultadoCD" Type="Decimal" />
            <asp:Parameter Name="UsrRevisa" Type="Int32" />
            <asp:Parameter Name="FechaUltimaRevision" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IdConciliacion" Type="Int32" />
            <asp:Parameter Name="IdSucursal" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Establecimiento" Type="String" />
            <asp:Parameter Name="VentasPOS" Type="Decimal" />
            <asp:Parameter Name="VentasCD" Type="Decimal" />
            <asp:Parameter Name="ResultadoCD" Type="Decimal" />
            <asp:Parameter Name="UsrRevisa" Type="Int32" />
            <asp:Parameter Name="FechaUltimaRevision" Type="DateTime" />
            <asp:Parameter Name="IdDetConciliacion" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="w3-container">
    <asp:Panel ID="PANELORDENCOMPRA" runat="server" Visible="True">
        <div class="w3-row w3-padding-16">
        <asp:GridView 
            ID="GVDETCONCILIACION" 
            runat="server" 
            CssClass="table table-bordered table-condensed w3-small" HeaderStyle-CssClass="header w3-centered" RowStyle-CssClass="rows"
            AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SQLDETCONCILIACION" DataKeyNames="IdDetConciliacion">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="IdDetConciliacion" HeaderText="IdDetConciliacion" InsertVisible="False" ReadOnly="True" SortExpression="IdDetConciliacion" />
                <asp:BoundField DataField="IdConciliacion" HeaderText="IdConciliacion" SortExpression="IdConciliacion" />
                <asp:BoundField DataField="IdSucursal" HeaderText="IdSucursal" SortExpression="IdSucursal" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Establecimiento" HeaderText="Establecimiento" SortExpression="Establecimiento" />
                <asp:BoundField DataField="VentasPOS" HeaderText="VentasPOS" SortExpression="VentasPOS" />
                <asp:BoundField DataField="VentasCD" HeaderText="VentasCD" SortExpression="VentasCD" />
                <asp:BoundField DataField="ResultadoCD" HeaderText="ResultadoCD" SortExpression="ResultadoCD" />
                <asp:BoundField DataField="UsrRevisa" HeaderText="UsrRevisa" SortExpression="UsrRevisa" />
                <asp:BoundField DataField="FechaUltimaRevision" HeaderText="FechaUltimaRevision" SortExpression="FechaUltimaRevision" />
            </Columns>
            <HeaderStyle CssClass="header w3-centered"></HeaderStyle>
                        <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" /> 
            <RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>
    </div>
    </asp:Panel>
</div>   
</asp:Content>
