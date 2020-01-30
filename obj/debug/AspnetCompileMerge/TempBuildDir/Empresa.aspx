<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Empresa.aspx.vb" Inherits="EasySapWeb.Empresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
    <ContentTemplate>
<div class="card text-center">
    <div class="card-header">
        <h1 class="h3 mb-0 text-gray-800">Gestion de empresas</h1>
    </div>
    <div class="card-body">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="TXTNOMBRECORP">Nombre de Empresa</label>
                    <asp:TextBox runat="server" ID="TXTNOMBREEMP" CssClass="form-control form-control-user" placeholder="Nombre de empresa"></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">Razón Social</label>
                    <asp:TextBox runat="server" ID="TXTRAZONSOCIALEMP" CssClass="form-control form-control-user" placeholder="Razón social de empresa"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddress">Dirección</label>
                <asp:TextBox runat="server" ID="TXTDIRECCIONEMP" CssClass="form-control form-control-user" placeholder="Dirección"></asp:TextBox>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputCity">Representante Legal</label>
                    <asp:TextBox runat="server" ID="TXTREPRESENTANTEEMP" CssClass="form-control form-control-user" placeholder="Representante Legal"></asp:TextBox>
                </div>
                <div class="form-group col-md-3">
                    <label for="inputState">NIT de Corporación</label>
                    <asp:TextBox runat="server" ID="TXTNITEMP" CssClass="form-control form-control-user" placeholder="NIT de corporación"></asp:TextBox>
                </div>
                <div class="form-group col-md-3">
                    <label for="inputZip">Teléfono</label>
                    <asp:TextBox runat="server" ID="TXTTELEFONOEMP" CssClass="form-control form-control-user" placeholder="Teléfono"></asp:TextBox>
                </div>
            </div>
             <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="inputState">Página Web</label>
                    <asp:TextBox runat="server" ID="TXTPAGINAWEBEMP" CssClass="form-control form-control-user" placeholder="Página Web"></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <label for="inputZip">Correo de la empresa</label>
                    <asp:TextBox runat="server" ID="TXTCORREOEMP" CssClass="form-control form-control-user" placeholder="Cuenta de correo"></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <label for="inputZip">Pertenece a corporación</label>
                    <asp:DropDownList runat="server" ID="DDLCORPORACION" CssClass="form-control form-control-user" placeholder="Corporación"></asp:DropDownList>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNGUARDAREMPRESA" CssClass="btn btn-facebook btn-user btn-block">
                        <i class="fa fa-check fa-fw"></i> Guardar
                    </asp:LinkButton>
                </div>
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNCANCELAREMPRESA" CssClass="btn btn-danger btn-user btn-block">
                        <i class="fa fa-ban fa-fw"></i> Cancelar
                    </asp:LinkButton>
                </div>
            </div>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block text-dark">

            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Empresas existentes</h1>
                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generar reporte</a>
            </div>

            <asp:GridView ID="GVEMPRESAS" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" 
            AutoGenerateColumns="False" 
            DataKeyNames="IdEmpresa" 
            EmptyDataText="No hay datos para mostrar." DataSourceID="SQLDSCorporacion">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="IdEmpresa" HeaderText="IdEmpresa" InsertVisible="False" ReadOnly="True" SortExpression="IdEmpresa" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Razon_Social" HeaderText="Razon_Social" SortExpression="Razon_Social" />
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                <asp:BoundField DataField="Nit" HeaderText="Nit" SortExpression="Nit" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                <asp:BoundField DataField="Representate_Legal" HeaderText="Representate_Legal" SortExpression="Representate_Legal" />
                <asp:BoundField DataField="Pagina_Web" HeaderText="Pagina_Web" SortExpression="Pagina_Web" />
                <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                <asp:BoundField DataField="idCorporacion" HeaderText="idCorporacion" SortExpression="idCorporacion" />
                <asp:BoundField DataField="Nombre_bd" HeaderText="Nombre_bd" SortExpression="Nombre_bd" />
            </Columns>
            </asp:GridView> 
        </form>
    </div>
    <asp:SqlDataSource ID="SQLDSCorporacion" runat="server" ConnectionString="<%$ ConnectionStrings:DB_WEB_PUBLICA %>" DeleteCommand="DELETE FROM [GN_EMPRESA] WHERE [IdEmpresa] = @IdEmpresa" InsertCommand="INSERT INTO [GN_EMPRESA] ([Nombre], [Razon_Social], [Direccion], [Nit], [Telefono], [Representate_Legal], [Pagina_Web], [Correo], [idCorporacion], [Nombre_bd]) VALUES (@Nombre, @Razon_Social, @Direccion, @Nit, @Telefono, @Representate_Legal, @Pagina_Web, @Correo, @idCorporacion, @Nombre_bd)" SelectCommand="SELECT [IdEmpresa], [Nombre], [Razon_Social], [Direccion], [Nit], [Telefono], [Representate_Legal], [Pagina_Web], [Correo], [idCorporacion], [Nombre_bd] FROM [GN_EMPRESA]" UpdateCommand="UPDATE [GN_EMPRESA] SET [Nombre] = @Nombre, [Razon_Social] = @Razon_Social, [Direccion] = @Direccion, [Nit] = @Nit, [Telefono] = @Telefono, [Representate_Legal] = @Representate_Legal, [Pagina_Web] = @Pagina_Web, [Correo] = @Correo, [idCorporacion] = @idCorporacion, [Nombre_bd] = @Nombre_bd WHERE [IdEmpresa] = @IdEmpresa">
        <DeleteParameters>
            <asp:Parameter Name="IdEmpresa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Razon_Social" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Nit" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Representate_Legal" Type="String" />
            <asp:Parameter Name="Pagina_Web" Type="String" />
            <asp:Parameter Name="Correo" Type="String" />
            <asp:Parameter Name="idCorporacion" Type="Int32" />
            <asp:Parameter Name="Nombre_bd" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Razon_Social" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Nit" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Representate_Legal" Type="String" />
            <asp:Parameter Name="Pagina_Web" Type="String" />
            <asp:Parameter Name="Correo" Type="String" />
            <asp:Parameter Name="idCorporacion" Type="Int32" />
            <asp:Parameter Name="Nombre_bd" Type="String" />
            <asp:Parameter Name="IdEmpresa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
