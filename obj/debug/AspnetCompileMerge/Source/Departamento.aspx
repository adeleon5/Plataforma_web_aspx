<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Departamento.aspx.vb" Inherits="EasySapWeb.Departamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
    <ContentTemplate>
    <div class="card text-center">
    <div class="card-header">
        <h1 class="h3 mb-0 text-gray-800">Gestion de departamento</h1>
    </div>
    <div class="card-body">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="TXTNOMBREDEP">Nombre de departamento</label>
                    <asp:TextBox runat="server" ID="TXTNOMBREDEP" CssClass="form-control form-control-user" placeholder="Nombre de departamento"></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="DDLENCARGADODEP">Nombre de encargado</label>
                    <asp:DropDownList runat="server" ID="DDLENCARGADODEP" CssClass="form-control form-control-user"></asp:DropDownList>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="DDLEMPRESA">Pertenece a empresa</label>
                    <asp:DropDownList runat="server" ID="DDLEMPRESA" CssClass="form-control form-control-user" placeholder="Pertenece a empresa"></asp:DropDownList>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNGUARDADEP" CssClass="btn btn-facebook btn-user btn-block">
                        <i class="fa fa-check fa-fw"></i> Guardar
                    </asp:LinkButton>
                </div>
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNCANCELARDEP" CssClass="btn btn-danger btn-user btn-block">
                        <i class="fa fa-ban fa-fw"></i> Cancelar
                    </asp:LinkButton>
                </div>
            </div>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block text-dark">

            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Departamentos existentes</h1>
                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generar reporte</a>
            </div>

            <asp:GridView ID="GVDEPARTAMENTOS" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" 
            AutoGenerateColumns="False" 
            DataKeyNames="IdDepartamento" 
            EmptyDataText="No hay datos para mostrar." DataSourceID="SQLDSDEPARTAMENTOS">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="IdDepartamento" HeaderText="IdDepartamento" InsertVisible="False" ReadOnly="True" SortExpression="IdDepartamento" />
                <asp:BoundField DataField="NombreDepto" HeaderText="NombreDepto" SortExpression="NombreDepto" />
                <asp:BoundField DataField="EncargadoDepto" HeaderText="EncargadoDepto" SortExpression="EncargadoDepto" />
                <asp:BoundField DataField="IdEmpresa" HeaderText="IdEmpresa" SortExpression="IdEmpresa" />
            </Columns>
            </asp:GridView> 
        </form>
    </div>
    <asp:SqlDataSource ID="SQLDSDEPARTAMENTOS" runat="server" ConnectionString="<%$ ConnectionStrings:DB_WEB_PUBLICA %>" DeleteCommand="DELETE FROM [GN_DEPARTAMENTO] WHERE [IdDepartamento] = @IdDepartamento" InsertCommand="INSERT INTO [GN_DEPARTAMENTO] ([NombreDepto], [EncargadoDepto], [IdEmpresa]) VALUES (@NombreDepto, @EncargadoDepto, @IdEmpresa)" SelectCommand="SELECT [IdDepartamento], [NombreDepto], [EncargadoDepto], [IdEmpresa] FROM [GN_DEPARTAMENTO]" UpdateCommand="UPDATE [GN_DEPARTAMENTO] SET [NombreDepto] = @NombreDepto, [EncargadoDepto] = @EncargadoDepto, [IdEmpresa] = @IdEmpresa WHERE [IdDepartamento] = @IdDepartamento">
        <DeleteParameters>
            <asp:Parameter Name="IdDepartamento" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NombreDepto" Type="String" />
            <asp:Parameter Name="EncargadoDepto" Type="Int32" />
            <asp:Parameter Name="IdEmpresa" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NombreDepto" Type="String" />
            <asp:Parameter Name="EncargadoDepto" Type="Int32" />
            <asp:Parameter Name="IdEmpresa" Type="Int32" />
            <asp:Parameter Name="IdDepartamento" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
