<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Area.aspx.vb" Inherits="EasySapWeb.Area" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
     <asp:UpdatePanel ID="UP0" runat="server" >
    <ContentTemplate>
    <div class="card text-center">
    <div class="card-header">
        <h1 class="h3 mb-0 text-gray-800">Gestion de áreas</h1>
    </div>
    <div class="card-body">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="TXTNOMBREAREA">Nombre de área</label>
                    <asp:TextBox runat="server" ID="TXTNOMBREAREA" CssClass="form-control form-control-user" placeholder="Nombre de área"></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="DDLENCARGADOAREA">Nombre de encargado</label>
                    <asp:DropDownList runat="server" ID="DDLENCARGADOAREA" CssClass="form-control form-control-user"></asp:DropDownList>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="DDLDEPTO">Pertenece a departamento</label>
                    <asp:DropDownList runat="server" ID="DDLDEPTO" CssClass="form-control form-control-user" placeholder="Pertenece a departamento"></asp:DropDownList>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNGUARDAAREA" CssClass="btn btn-facebook btn-user btn-block">
                        <i class="fa fa-check fa-fw"></i> Guardar
                    </asp:LinkButton>
                </div>
                <div class="col-md-6">
                    <asp:LinkButton runat="server" ID="BTNCANCELAAREA" CssClass="btn btn-danger btn-user btn-block">
                        <i class="fa fa-ban fa-fw"></i> Cancelar
                    </asp:LinkButton>
                </div>
            </div>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block text-dark">

            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Áreas existentes</h1>
                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generar reporte</a>
            </div>

            <asp:GridView ID="GVAREA" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" 
            AutoGenerateColumns="False" 
            DataKeyNames="IdArea" 
            EmptyDataText="No hay datos para mostrar." DataSourceID="SQLDSAREA">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="IdArea" HeaderText="IdArea" InsertVisible="False" ReadOnly="True" SortExpression="IdArea" />
                <asp:BoundField DataField="NombreArea" HeaderText="NombreArea" SortExpression="NombreArea" />
                <asp:BoundField DataField="EncargadoArea" HeaderText="EncargadoArea" SortExpression="EncargadoArea" />
                <asp:BoundField DataField="IdDepto" HeaderText="IdDepto" SortExpression="IdDepto" />
            </Columns>
            </asp:GridView> 
        </form>
    </div>
    <asp:SqlDataSource ID="SQLDSAREA" runat="server" ConnectionString="<%$ ConnectionStrings:DB_WEB_PUBLICA %>" DeleteCommand="DELETE FROM [GN_AREA] WHERE [IdArea] = @IdArea" InsertCommand="INSERT INTO [GN_AREA] ([NombreArea], [EncargadoArea], [IdDepto]) VALUES (@NombreArea, @EncargadoArea, @IdDepto)" SelectCommand="SELECT [IdArea], [NombreArea], [EncargadoArea], [IdDepto] FROM [GN_AREA]" UpdateCommand="UPDATE [GN_AREA] SET [NombreArea] = @NombreArea, [EncargadoArea] = @EncargadoArea, [IdDepto] = @IdDepto WHERE [IdArea] = @IdArea">
        <DeleteParameters>
            <asp:Parameter Name="IdArea" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NombreArea" Type="String" />
            <asp:Parameter Name="EncargadoArea" Type="Int32" />
            <asp:Parameter Name="IdDepto" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NombreArea" Type="String" />
            <asp:Parameter Name="EncargadoArea" Type="Int32" />
            <asp:Parameter Name="IdDepto" Type="Int32" />
            <asp:Parameter Name="IdArea" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
