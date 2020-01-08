<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Consumo_repuesto_flotilla.aspx.vb" Inherits="EasySapWeb.Consumo_respuesto_flotilla" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <div class="container">
        <div class="w3-row">
            <!--- *********************************** FORMULARIO DE HOJA DE SERVICIO ****************************** --->
            <asp:Panel ID="P1" runat="server" Visible="true">
                <h1 class="h1">CONSUMO DE PARTES E INSUMOS PARA TALLER Y FLOTILLA&nbsp;</h1>
                <div class="w3-card-4">
                    <header class="w3-container w3-blue">
                        <h3>DATOS GENERALES</h3>
                    </header>
                    <br />
                    <div class="w3-container">
                        <asp:Literal ID="L01" runat="server" Visible="true"></asp:Literal>
                        <br />
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Serie de documento</label>
                                <asp:DropDownList ID="DDLSERIEDOCTO" runat="server" CssClass="form-control" Autofocus="true"></asp:DropDownList>
                            </div>
                            <div class="col-sm-6">
                                <label>No. de Documento</label>
                                <asp:TextBox ID="TXTNODOCTO" runat="server" CssClass="form-control"  TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Cliente</label>
                                 <asp:DropDownList ID="DDLCLIENTE" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="col-sm-6">
                                <label>Fecha de Documento</label>
                                <asp:TextBox ID="TXTFECHADOCUMENTO" runat="server" Autofocus="true" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Equipo</label>
                                <asp:TextBox ID="TXTEQUIPO" runat="server" Autofocus="true" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <label>Serie</label>
                                <asp:TextBox ID="TXTSERIE" runat="server" Autofocus="true" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <label>Horometro</label>
                                <asp:TextBox ID="TXTHOROMETROCRF" runat="server" Autofocus="true" CssClass="form-control"  TextMode="Number" ></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Técnico de SN</label>
                                <asp:TextBox ID="TXTTECNICOSN" runat="server" Autofocus="true" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label>Centro de distribución</label>
                                <asp:DropDownList ID="DDLCD" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                <div class="w3-card-4">
                    <header class="w3-container w3-blue">
                        <h3>DATOS ESPECIFICOS</h3>
                    </header>
                    <div class="w3-container">
                        <%--INICIO PANEL P1_1 ES EL DE BUSQUEDA DE PARTES--%>
                        <asp:Panel ID="P1_1" runat="server" Visible="false">
                            <h3>BUSQUEDA DE PARTES</h3>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h4>Tipo de consulta</h4>
                                    <asp:DropDownList ID="DDLTIPOCONSULTA" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div> 
                                <div class="col-sm-6"> 
                                    <h4>Dato de busqueda</h4>
                                    <asp:TextBox ID="TXTDATOBUSQUEDA" runat="server" CssClass="form-control" placeholder="Buscar.."></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <br /><br />
                                        <button type="button" class="w3-button w3-block w3-red" runat="server" id="BTNBUSCARPARTE">Buscar</button>
                                </div>
                            </div>
                            <br />
                             <div class="table-responsive">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:GridView 
                                            ID="GVPARTE" 
                                            runat="server" 
                                            CssClass="table table-striped table-bordered table-hover re"
                                            AllowPaging="true" 
                                            AllowSorting="true" 
                                            AutoGenerateColumns="False"
                                            PageSize="10">
                                            <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" />      
                                            </asp:GridView>
                                        </div>
                                        <div class="w3-col w3-container w3-mobile" style="width:100%; display:none"  >
                                            <div class="w3-display-container">
                                                <div class="w3-padding w3-display-middle">
                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Excel.gif" Width="35px" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </asp:Panel>
                        <%--FIN PANEL P1_1 ES EL DE BUSQUEDA DE PARTES--%>
                        <br />
                        <%--INICIO PANEL P1_2 ES EL DETALLE DEL FORMULARIO DONDE VAN LAS PARTES QUE SE ESTAN USANDO--%>
                        <asp:Panel ID="P1_2" runat="server" Visible="true">
                            <p><asp:LinkButton ID="BTNHABILITARBUSQUEDA" runat="server" class="w3-button w3-white w3-border" Text="BUSCAR PARTES E INSUMOS"> BUSCAR PARTES E INSUMOS<i class="w3-margin-left glyphicon glyphicon-search"></i></asp:LinkButton></p>
                            <div class="table-responsive">
                               <asp:GridView ID="GVCONSUMOPARTES" 
                                    runat="server" 
                                    AutoGenerateColumns="False" 
                                    DataKeyNames="Id" 
                                    DataSourceID="SQLCONSUMOPARTES" 
                                    AllowPaging="True" 
                                    AllowSorting="True"
                                    CssClass="table table-bordered bs-table">
                                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                           <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                           <asp:BoundField DataField="DocEntry" HeaderText="DocEntry" SortExpression="DocEntry" Visible="False" />
                                           <asp:BoundField DataField="LineId" HeaderText="LineId" SortExpression="LineId" Visible="False" />
                                           <asp:BoundField DataField="NoParte" HeaderText="NoParte" SortExpression="NoParte" ReadOnly="True" />
                                           <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" ReadOnly="True" />
                                           <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                                           <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" ReadOnly="True" />
                                           <asp:BoundField DataField="NoArticuloSAP" HeaderText="NoArticuloSAP" SortExpression="NoArticuloSAP" Visible="False" />
                                           <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" Visible="False" />
                                       </Columns>
                                    <EditRowStyle BackColor="#ffffcc" />
                                    <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
                                    <emptydatatemplate>
                                        ¡No hay datos para mostrar!  
                                    </emptydatatemplate>     
                                </asp:GridView>
                                <asp:SqlDataSource ID="SQLCONSUMOPARTES" runat="server" ConnectionString="<%$ ConnectionStrings:interfaceConnectionString %>" 
                                    SelectCommand="SELECT * FROM [SAP_TEMP_CRF1] WHERE (([DocEntry] = @DocEntry) AND ([usuario] = @usuario))" 
                                    DeleteCommand="DELETE FROM [SAP_TEMP_CRF1] WHERE [Id] = @original_Id" 
                                    OldValuesParameterFormatString="original_{0}"
                                    UpdateCommand="UPDATE [SAP_TEMP_CRF1] SET [Cantidad] = @Cantidad WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [SAP_TEMP_CRF1] ([DocEntry], [LineId], [NoParte], [Descripcion], [Cantidad], [stock], [NoArticuloSAP], [usuario]) VALUES (@DocEntry, @LineId, @NoParte, @Descripcion, @Cantidad, @stock, @NoArticuloSAP, @usuario)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_Id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DocEntry" Type="Int32" />
                                        <asp:Parameter Name="LineId" Type="Int32" />
                                        <asp:Parameter Name="NoParte" Type="String" />
                                        <asp:Parameter Name="Descripcion" Type="String" />
                                        <asp:Parameter Name="Cantidad" Type="Decimal" />
                                        <asp:Parameter Name="stock" Type="Decimal" />
                                        <asp:Parameter Name="NoArticuloSAP" Type="String" />
                                        <asp:Parameter Name="usuario" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TXTNODOCTO" Name="DocEntry" PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="usuario" SessionField="UCO" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DocEntry" Type="Int32" />
                                        <asp:Parameter Name="LineId" Type="Int32" />
                                        <asp:Parameter Name="NoParte" Type="String" />
                                        <asp:Parameter Name="Descripcion" Type="String" />
                                        <asp:Parameter Name="Cantidad" Type="Decimal" />
                                        <asp:Parameter Name="stock" Type="Decimal" />
                                        <asp:Parameter Name="NoArticuloSAP" Type="String" />
                                        <asp:Parameter Name="usuario" Type="Int32" />
                                        <asp:Parameter Name="original_Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                           </div>
                        </asp:Panel>
                        <%--FIN PANEL P1_2 ES EL DETALLE DEL FORMULARIO DONDE VAN LAS PARTES QUE SE ESTAN USANDO--%>
                    </div>
                    <div class="w3-container">
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:LinkButton ID="BTNADD" runat="server" class="w3-button w3-block w3-green" Text="Guardar"></asp:LinkButton>
                            </div>
                            <div class="col-sm-6">
                                <asp:LinkButton ID="BTNCANHS" runat="server" class="w3-button w3-block w3-red" OnClientClick="return confirm('Cancelar Cambios?');" Text="Cancelar"></asp:LinkButton>
                            </div>
                        </div>  
                        <br /> 
                    </div>
                </div>
            </asp:Panel>
            <!--- *********************************** FIN FORMULARIO DE HOJA DE SERVICIO ****************************** --->
        </div>
    </div>
</asp:Content>
