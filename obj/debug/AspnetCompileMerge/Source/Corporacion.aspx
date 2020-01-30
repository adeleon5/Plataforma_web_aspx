<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Corporacion.aspx.vb" Inherits="EasySapWeb.Corporacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server" >
    <ContentTemplate>
        

<div class="card text-center">
    <div class="card-header">
        <h1 class="h3 mb-0 text-gray-800">Gestion de corporaciones</h1>
    </div>
    <div class="card-body">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="TXTNOMBRECORP">Nombre de Corporación</label>
                    <asp:TextBox runat="server" ID="TXTNOMBRECORP" CssClass="form-control form-control-user" placeholder="Nombre de corporación"></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">Razón Social</label>
                    <asp:TextBox runat="server" ID="TXTRAZONSOCIALCORP" CssClass="form-control form-control-user" placeholder="Razón Social"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddress">Dirección</label>
                <asp:TextBox runat="server" ID="TXTDIRECCIONCORP" CssClass="form-control form-control-user" placeholder="Dirección"></asp:TextBox>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputCity">Representante Legal</label>
                    <asp:TextBox runat="server" ID="TXTREPRESENTANTECORP" CssClass="form-control form-control-user" placeholder="Representante Legal"></asp:TextBox>
                </div>
                <div class="form-group col-md-3">
                    <label for="inputState">NIT de Corporación</label>
                    <asp:TextBox runat="server" ID="TXTNITCORP" CssClass="form-control form-control-user" placeholder="NIT de corporación"></asp:TextBox>
                </div>
                <div class="form-group col-md-3">
                    <label for="inputZip">Teléfono</label>
                    <asp:TextBox runat="server" ID="TXTTELEFONOCORP" CssClass="form-control form-control-user" placeholder="Teléfono"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNGUARDARCORPORACION" CssClass="btn btn-facebook btn-user btn-block">
                        <i class="fa fa-check fa-fw"></i> Guardar
                    </asp:LinkButton>
                </div>
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNCANCELARCORPORACION" CssClass="btn btn-danger btn-user btn-block">
                        <i class="fa fa-ban fa-fw"></i> Cancelar
                    </asp:LinkButton>
                </div>
            </div>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block text-dark">

            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Corporaciones existentes</h1>
                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generar reporte</a>
            </div>

            <asp:GridView ID="GVCORPORACION" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" 
            AutoGenerateColumns="False" 
            DataKeyNames="IdCorporacion" 
            EmptyDataText="No hay datos para mostrar." DataSourceID="SQLDSCorporacion">
            <Columns>
                <asp:BoundField DataField="IdCorporacion" HeaderText="IdCorporacion" InsertVisible="False" ReadOnly="True" SortExpression="IdCorporacion" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Razon_Social" HeaderText="Razon_Social" SortExpression="Razon_Social" />
                <asp:BoundField DataField="Nit" HeaderText="Nit" SortExpression="Nit" />
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                <asp:BoundField DataField="Representate_Legal" HeaderText="Representate_Legal" SortExpression="Representate_Legal" />
            </Columns>
            </asp:GridView> 
        </form>
    </div>
    <asp:SqlDataSource ID="SQLDSCorporacion" runat="server" ConnectionString="<%$ ConnectionStrings:DB_WEB_PUBLICA %>" DeleteCommand="DELETE FROM [GN_CORPORACION] WHERE [IdCorporacion] = @IdCorporacion" InsertCommand="INSERT INTO [GN_CORPORACION] ([Nombre], [Razon_Social], [Nit], [Direccion], [Telefono], [Representate_Legal]) VALUES (@Nombre, @Razon_Social, @Nit, @Direccion, @Telefono, @Representate_Legal)" SelectCommand="SELECT [IdCorporacion], [Nombre], [Razon_Social], [Nit], [Direccion], [Telefono], [Representate_Legal] FROM [GN_CORPORACION]" UpdateCommand="UPDATE [GN_CORPORACION] SET [Nombre] = @Nombre, [Razon_Social] = @Razon_Social, [Nit] = @Nit, [Direccion] = @Direccion, [Telefono] = @Telefono, [Representate_Legal] = @Representate_Legal WHERE [IdCorporacion] = @IdCorporacion">
        <DeleteParameters>
            <asp:Parameter Name="IdCorporacion" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Razon_Social" Type="String" />
            <asp:Parameter Name="Nit" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Representate_Legal" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Razon_Social" Type="String" />
            <asp:Parameter Name="Nit" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Representate_Legal" Type="String" />
            <asp:Parameter Name="IdCorporacion" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
