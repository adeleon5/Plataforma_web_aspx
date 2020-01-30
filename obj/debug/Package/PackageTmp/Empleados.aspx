<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Empleados.aspx.vb" Inherits="EasySapWeb.Empleados" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
     <asp:DropDownList ID="DDLAREA" runat="server" CssClass="w3-input w3-border w3-light-grey w3-round" AutoPostBack="true"></asp:DropDownList>
     <asp:SqlDataSource ID="SQLEMPLEADO" runat="server" ConnectionString="<%$ ConnectionStrings:EASYIDB01 %>" SelectCommand="SELECT [IdEmpleado], [PNombre], [SNombre], [PApellido], [SApellido], [Sexo], [Estado], [IdArea], [No_telefono_empresarial], [No_telefono_personal], [Numeral_empresarial], [Cuenta_correo_empresarial], [Cuenta_correo_personal], [Padre] FROM [GN_EMPLEADO] WHERE ([IdArea] = @IdArea)" DeleteCommand="DELETE FROM [GN_EMPLEADO] WHERE [IdEmpleado] = @IdEmpleado" InsertCommand="INSERT INTO [GN_EMPLEADO] ([PNombre], [SNombre], [PApellido], [SApellido], [Sexo], [Estado], [IdArea], [No_telefono_empresarial], [No_telefono_personal], [Numeral_empresarial], [Cuenta_correo_empresarial], [Cuenta_correo_personal], [Padre]) VALUES (@PNombre, @SNombre, @PApellido, @SApellido, @Sexo, @Estado, @IdArea, @No_telefono_empresarial, @No_telefono_personal, @Numeral_empresarial, @Cuenta_correo_empresarial, @Cuenta_correo_personal, @Padre)" UpdateCommand="UPDATE [GN_EMPLEADO] SET [PNombre] = @PNombre, [SNombre] = @SNombre, [PApellido] = @PApellido, [SApellido] = @SApellido, [Sexo] = @Sexo, [Estado] = @Estado, [IdArea] = @IdArea, [No_telefono_empresarial] = @No_telefono_empresarial, [No_telefono_personal] = @No_telefono_personal, [Numeral_empresarial] = @Numeral_empresarial, [Cuenta_correo_empresarial] = @Cuenta_correo_empresarial, [Cuenta_correo_personal] = @Cuenta_correo_personal, [Padre] = @Padre WHERE [IdEmpleado] = @IdEmpleado">
        <DeleteParameters>
            <asp:Parameter Name="IdEmpleado" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PNombre" Type="String" />
            <asp:Parameter Name="SNombre" Type="String" />
            <asp:Parameter Name="PApellido" Type="String" />
            <asp:Parameter Name="SApellido" Type="String" />
            <asp:Parameter Name="Sexo" Type="String" />
            <asp:Parameter Name="Estado" Type="Boolean" />
            <asp:Parameter Name="IdArea" Type="Int32" />
            <asp:Parameter Name="No_telefono_empresarial" Type="String" />
            <asp:Parameter Name="No_telefono_personal" Type="String" />
            <asp:Parameter Name="Numeral_empresarial" Type="String" />
            <asp:Parameter Name="Cuenta_correo_empresarial" Type="String" />
            <asp:Parameter Name="Cuenta_correo_personal" Type="String" />
            <asp:Parameter Name="Padre" Type="Int32" />
        </InsertParameters>
         <SelectParameters>
             <asp:ControlParameter ControlID="DDLAREA" DefaultValue="3" Name="IdArea" PropertyName="SelectedValue" Type="Int32" />
         </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PNombre" Type="String" />
            <asp:Parameter Name="SNombre" Type="String" />
            <asp:Parameter Name="PApellido" Type="String" />
            <asp:Parameter Name="SApellido" Type="String" />
            <asp:Parameter Name="Sexo" Type="String" />
            <asp:Parameter Name="Estado" Type="Boolean" />
            <asp:Parameter Name="IdArea" Type="Int32" />
            <asp:Parameter Name="No_telefono_empresarial" Type="String" />
            <asp:Parameter Name="No_telefono_personal" Type="String" />
            <asp:Parameter Name="Numeral_empresarial" Type="String" />
            <asp:Parameter Name="Cuenta_correo_empresarial" Type="String" />
            <asp:Parameter Name="Cuenta_correo_personal" Type="String" />
            <asp:Parameter Name="Padre" Type="Int32" />
            <asp:Parameter Name="IdEmpleado" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="w3-container">
     <asp:SqlDataSource ID="SQLTIPO" runat="server" ConnectionString="<%$ ConnectionStrings:EASYIDB01 %>" SelectCommand="SELECT [IdArea], [NombreArea] FROM [GN_AREA]">
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SQLENCARGADO" runat="server" ConnectionString="<%$ ConnectionStrings:EASYIDB01 %>" SelectCommand="SELECT [IdArea], [NombreArea] FROM [GN_AREA]">
    </asp:SqlDataSource>
    <asp:Panel ID="PANELEMPLEADO" runat="server" Visible="True">
        <div class="w3-row w3-padding-16 w3-responsive">
        <asp:GridView 
            ID="GVEMPLEADO" 
            runat="server" 
            CssClass="w3-table-all w3-small"  HeaderStyle-CssClass="header w3-centered" RowStyle-CssClass="rows"
            AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SQLEMPLEADO" DataKeyNames="IdEmpleado">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="IdEmpleado" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="IdEmpleado" />
                <asp:BoundField DataField="PNombre" HeaderText="Primer nombre" SortExpression="PNombre" />
                <asp:BoundField DataField="SNombre" HeaderText="Segundo nombre" SortExpression="SNombre" />
                <asp:BoundField DataField="PApellido" HeaderText="Primer apellido" SortExpression="PApellido" />
                <asp:BoundField DataField="SApellido" HeaderText="Segundo apellido" SortExpression="SApellido" />
                <asp:TemplateField HeaderText="Sexo"><ItemTemplate><asp:DropDownList ID="DDLSEXO" runat="server" AppendDataBoundItems="True" SelectedValue='<%# Bind("Sexo", "{0}") %>'> 
                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                    <asp:ListItem Value="F">Femenino</asp:ListItem>
                    </asp:DropDownList></ItemTemplate></asp:TemplateField>
                <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo" visible="false" />
                <asp:BoundField DataField="IdArea" HeaderText="IdArea" SortExpression="IdArea" Visible="false" />
                <asp:BoundField DataField="No_telefono_empresarial" HeaderText="No_telefono_empresarial" SortExpression="No_telefono_empresarial" />
                <asp:BoundField DataField="No_telefono_personal" HeaderText="No_telefono_personal" SortExpression="No_telefono_personal" />
                <asp:BoundField DataField="Numeral_empresarial" HeaderText="Numeral_empresarial" SortExpression="Numeral_empresarial" />
                <asp:BoundField DataField="Cuenta_correo_empresarial" HeaderText="Cuenta_correo_empresarial" SortExpression="Cuenta_correo_empresarial" />
                <asp:BoundField DataField="Cuenta_correo_personal" HeaderText="Cuenta_correo_personal" SortExpression="Cuenta_correo_personal" />
                <asp:CheckBoxField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                <asp:BoundField DataField="Padre" HeaderText="Padre" SortExpression="Padre" />
                <asp:TemplateField HeaderText="Rol">
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLTIPOEMPLEADO" runat="server" AppendDataBoundItems="True" DataSourceID="SQLTIPO" DataTextField="NombreArea" DataValueField="IdArea" SelectedValue='<%# Bind("IdArea", "{0}") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
              </Columns>
            <HeaderStyle CssClass="header w3-centered"></HeaderStyle>
                        <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" /> 
            <RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>    
    </div>
    </asp:Panel>
</div> 
</asp:Content>
