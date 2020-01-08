<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Orden_Servicio.aspx.vb" Inherits="EasySapWeb.REP_PLANTA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:UpdatePanel ID="UP0" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HS01" runat="server" />
            <div class="w3-row">
              <div class="w3-col m12 w3-padding-16">
                <!--- *********************************** PANEL DE LA LISTA DE LLAMADAS DE SERVICIO CREADAS ****************************** --->
                <asp:Panel ID="P0" runat="server" Visible="true" >
                <div class="w3-content w3-padding-small">
                    <div class="w3-row w3-center">
                        <div class="w3-panel w3-blue-gray col-sm-12">
                            <h3>ORDENES DE SERVICIO PROGRAMADAS</h3>
                        </div>
                    </div>
                    <div class="w3-row w3-padding-small">
                        <div class="w3-col m4 w3-padding-small">
                            <h4 class="w3-text-black w3-left">Del</h4>
                            <asp:TextBox ID="TXTFDEL" runat="server" CssClass="form-control" TextMode="Date" ></asp:TextBox>
                        </div>
                        <div class="w3-col m4 w3-padding-small">
                            <h4 class="w3-text-black w3-left">Al</h4>
                            <asp:TextBox ID="TXTFAL" runat="server" CssClass="form-control" TextMode="Date" ></asp:TextBox>
                        </div>
                        <div class="w3-col m4 w3-padding-small">
                            <br /><br />
                            <p><asp:LinkButton ID="BTNGO"  Cssclass="w3-btn w3-black w3-hover-dark-gray w3-large w3-block" runat="server"> BUSCAR</asp:LinkButton></p>
                        </div>
                    </div> 
                </div>
                <div class="w3-content">
                    <div class="w3-row">
                        <div class="w3-responsive">
                            <div class="col-sm-12">
                                <asp:GridView 
                                    ID="GVREP" 
                                    runat="server" 
                                    CssClass="table table-striped table-bordered table-hover table-condensed w3-small"
                                    AllowPaging="true" 
                                    AllowSorting="true" 
                                    AutoGenerateColumns="False"
                                    PageSize="10">
                                    <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" /> 
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="w3-row w3-content" style="width:100%; display:none"  >
                            <div class="w3-padding-16">
                                <asp:ImageButton ID="BTNEXPORT" runat="server" ImageUrl="~/images/Excel.gif" Width="35px" />
                            </div>
                        </div>
                    </div>
                </div>
                </asp:Panel>
             </div>
            </div>

            <%--********** PANEL DE FUNCIONES ( BOTONES ) PARA HABILITAR LOS PANELES DE CHECK, FORMULARIO Y NOTA DE SEGURIDAD **********--%>
            <div class="w3-row">
                <div class="w3-col m12 w3-padding-16">
                    <asp:Panel ID="PFUNCIONES" runat="server" Visible="false">
                          <div class="w3-content    ">
                                  <div class="w3-row w3-center">
                                    <div class="w3-panel w3-blue-gray col-sm-12">
                                        <h3>ORDEN DE SERVICIO TÉCNICO</h3>
                                    </div>
                                  </div>
                                <div class="w3-card-4">
                                    <header class="w3-container w3-blue-grey w3-center">
                                        <h3>DATOS GENERALES</h3>
                                    </header>
                                    <br />
                                    <div class="w3-container">
                                        <asp:Literal ID="L01" runat="server" Visible="true"></asp:Literal>
                                    </div>
                                    <br />
                                    <footer>
                                        <asp:LinkButton ID="BTNCHECK" runat="server" Cssclass="w3-button w3-block w3-black w3-hover-dark-gray" Text="Registro de Check"></asp:LinkButton>
                                        <asp:LinkButton ID="BTNFORMULARIO" runat="server" Cssclass="w3-button w3-block w3-black w3-hover-dark-gray" Text="Llenar formulario de servicio"></asp:LinkButton>
                                        <asp:LinkButton ID="BTNNS" runat="server" Cssclass="w3-button w3-block w3-black w3-hover-dark-gray" Text="Nota de seguridad"></asp:LinkButton>
                                        <asp:LinkButton ID="BTNFIRMA" runat="server" Cssclass="w3-button w3-block w3-black w3-hover-dark-gray" Text="Firmar orden de servicio"></asp:LinkButton>
                                        <asp:LinkButton ID="BTNLISTALLAMADAS" runat="server" Cssclass="w3-button w3-block w3-red w3-hover-dark-gray" Text="Regresar a programación"></asp:LinkButton>
                                    </footer>
                                </div>  
                          </div>
                     </asp:Panel>
                </div>
            </div> 
            <div class="w3-row">
                <div class="w3-col m12 w3-padding-16">
                     <%--**************** PANEL DE ----> MARCAJE <---- Y LOCALIZACION REAL EN BASE A COORDENADAS **************--%>
                        <asp:Panel ID="PMARCAJE" runat="server" Visible="false">
                        <div class="w3-content">
                              <div class="w3-row">
                                 <div class="w3-card-4">
                                <!----- hiddenField captura coordenadas de localizacion segun funcion java ------>
                                <asp:HiddenField ID="HFLatitud" runat="server" />
                                <asp:HiddenField ID="HFLongitud" runat="server" />
                                <asp:HiddenField ID="HFRango" runat="server" />
                                <asp:HiddenField ID="HFDIRECCION" runat="server" />
                                <!----- Fin hiddenField captura coordenadas de localizacion segun funcion java ------>
                                <header class="w3-container w3-blue-gray">
                                    <h3>REALIZE SU REGISTRO</h3>
                                </header>
                                <br />
                                    <div class="w3-container">
                                        <div class="w3-row ">
                                                <div class="w3-col m3 w3-padding-small">
                                                    <h4>Asunto</h4>
                                                    <asp:DropDownList ID="DdlAsunto" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="descripción" DataValueField="descripción">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:UTILS %>" SelectCommand="SELECT * FROM [Asunto_marcaje_tecnico]"></asp:SqlDataSource>
                                                </div> 
                                                <div class="w3-col m7 w3-padding-small"> 
                                                    <h4>Comentario Check-In</h4>
                                                    <asp:TextBox ID="txtComentario" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="w3-col m2 w3-padding-small">
                                                    <br /><br />
                                                    <button type="button" class="w3-button w3-red w3-hover-dark-gray w3-block" runat="server" id="BTNCHECKIN">Check-In</button>
                                                </div>
                                        </div>
                                        <br />
                                     <div class="table-responsive">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <asp:GridView 
                                                ID="GVMARCAJE" 
                                                runat="server" 
                                                CssClass="table table-striped table-bordered table-hover table-condensed w3-small"
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
                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Excel.gif" Width="35px" />
                                                    </div>
                                                </div>
                                            </div>
                                         </div>
                                      </div>
                                    <!---- inicio de objetos para check-out---->
                                    <asp:HiddenField ID="HFIDMARCAJE" runat="server" />
                                    <asp:Panel ID="P1_1" runat="server" Visible="FALSE">
                                        <div class="row">
                                            <div class="col-sm-10"> 
                                                <h4>Comentario Check-Out</h4>
                                                <asp:TextBox ID="TxtComentarioCheckOut" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                <br /><br />
                                                    <button type="button" class="w3-button w3-black w3-hover-dark-grey w3-block" runat="server" id="BTNCHECKOUT">Check-Out</button>
                                            </div>
                                        </div>
                                        <br />
                                    </asp:Panel>
                                    <br />
                                    <asp:Label ID="Label1" runat="server" CssClass="w3-text-red"></asp:Label>
                                    <!---- fin de objetos para check-out---->
                                    </div>
                                </div>
                            </div>
                        </div>
                        </asp:Panel>

                        <!--- *********************************** FORMULARIO DE HOJA DE SERVICIO ****************************** --->
                        <asp:Panel ID="P1" runat="server" Visible="FALSE">
                            <div class="w3-content">
                              <div class="w3-row">
                                 <div class="w3-card-4">
                                    <header class="w3-container w3-blue-grey">
                                        <h3>DATOS ESPECIFICOS</h3>
                                    </header>
                                    <br />
                                    <div class="w3-container">
                                        <label>
                                            HOROMETRO</label>
                                            <asp:TextBox ID="TXTHORO" runat="server" CssClass="w3-input" TextMode="Number"></asp:TextBox>
                                            <br />
                                            <label>
                                            DESCRIPCIÓN DEL PROBLEMA</label>
                                            <asp:TextBox ID="TXTDP" runat="server" CssClass="w3-input" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            <br />
                                            <label>
                                            DIAGNOSTICO TÉCNICO</label>
                                            <asp:TextBox ID="TXTDT" runat="server" CssClass="w3-input" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            <br />
                                            <label>
                                            SERVICIO EFECTUADO</label>
                                            <asp:TextBox ID="TXTSE" runat="server" CssClass="w3-input" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="LBLERRM01" runat="server" CssClass="w3-text-red"></asp:Label>
                                    </div>
                                        <asp:LinkButton ID="BTNADDHS" runat="server" Cssclass="w3-button w3-block w3-black w3-hover-dark-gray" Text="Guardar"></asp:LinkButton>
                                        <asp:LinkButton ID="BTNCANHS" runat="server" Cssclass="w3-button w3-block w3-red w3-hover-dark-grey" OnClientClick="return confirm('Cancelar Cambios?');" Text="Cancelar"></asp:LinkButton>
                                </div>
                             </div>
                            </div>
                        </asp:Panel>
                        <!--- *************************************************************** FIN FORMULARIO DE HOJA DE SERVICIO ********************************************************************** --->
                 
                        <%-- ************************************** PANEL PARA LA NOTA DE SEGURIDAD Y BUSQUEDA DE REPUESTOS PARA AGREGAR A LA NOTA DE SEGURIDAD *************************************** --%>
                        <asp:Panel ID ="PNOTASEGURIDAD" runat="server" Visible="false">
                            <div class="w3-content">
                              <div class="w3-row">
                                 <div class="w3-card-4">
                                <%--INICIA EL PANEL DE BUSQUEDA--%>
                                <asp:Panel id="PNS_BUSCAR" runat="server" Visible="false"> 
                                    <header class="w3-container w3-blue-gray">
                                        <h3>BUSQUEDA DE PARTES</h3>
                                    </header>
                                    <br />
                                    <div class="w3-content">
                                        <div class="w3-row w3-padding-16">
                                            <div class="col-sm-4">
                                                <h4>Tipo de consulta</h4>
                                                <asp:DropDownList ID="DDPTIPOCONSULTA" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div> 
                                            <div class="col-sm-8"> 
                                                <h4>Dato de busqueda</h4>
                                                <asp:TextBox ID="TXTDATOBUSQUEDA" runat="server" CssClass="form-control" placeholder="Buscar.."></asp:TextBox>
                                            </div
                                        </div>              
                                        <div class="w3-row w3-padding-small">
                                            <div class="col-sm-12 w3-padding-16">
                                                <div class="table-responsive">
                                                <asp:GridView 
                                                ID="GVPARTE" 
                                                runat="server" 
                                                CssClass="table table-striped table-bordered table-hover table-condensed w3-small"
                                                AllowPaging="true" 
                                                AllowSorting="true" 
                                                AutoGenerateColumns="False"
                                                PageSize="10">
                                                <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" /> 
                                                </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w3-row">
                                            <div class="col-sm-6">
                                                    <button type="button" class="w3-button w3-block w3-blue-grey w3-hover-dark-gray" runat="server" id="BTNBUSCARPARTE">Buscar</button>
                                            </div>
                                            <div class="col-sm-6">
                                                    <button type="button" class="w3-button w3-block w3-hover-dark-grey w3-red" runat="server" id="BTNBUSCARPARTECANCELAR">Cancelar</button>
                                            </div>
                                        </div>
                                        <div class="w3-row w3-content" style=" display:none "  >
                                            <div class="w3-padding-16">
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Excel.gif" Width="35px" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <%--FINALIZA EL PANEL DE BUSQUEDA--%>
                    
                                <%--INICIA EL PANEL DEL LISTADO DE REPUESTOS PARA LA NOTA DE SEGURIDAD--%>
                                <asp:Panel ID="PNS_LISTAPARTES" runat="server" Visible="true">
                                    <header class="w3-container w3-blue-gray">
                                        <h3>NOTA Y PARTES</h3>
                                    </header>
                                    <br />
                                    <div class="w3-container">
                                        <div class="w3-row">
                                            <div class="col-sm-10"> 
                                                <asp:TextBox ID="TXTNOTASEGURIDAD" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine" placeholder="Escribir nota de seguridad"></asp:TextBox>
                                                <br />
                                            </div>
                                            <div class="col-sm-2 w3-left"> 
                                                <p><asp:LinkButton ID="BTNHABILITATXTNOTASEGURIDAD" runat="server" Cssclass="w3-button w3-hover-white w3-xxlarge glyphicon glyphicon-pencil"></asp:LinkButton></p>
                                            </div>
                                        </div>

                                        
                                        <div class="col-sm-12"> 
                                            <div class="table-responsive">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                        <asp:SqlDataSource ID="SQLADAPPRUEBA" runat="server" ConnectionString="<%$ ConnectionStrings:UTILS %>" SelectCommand="SELECT * FROM [NOTA_SEGURIDAD_SUGERIDOS] WHERE ([id_llamada] = @id_llamada)" DeleteCommand="DELETE FROM [NOTA_SEGURIDAD_SUGERIDOS] WHERE [id] = @id" InsertCommand="INSERT INTO [NOTA_SEGURIDAD_SUGERIDOS] ([itemcode], [itemname], [codigo_parte], [onhand], [id_llamada], [indicador]) VALUES (@itemcode, @itemname, @codigo_parte, @onhand, @id_llamada, @indicador)" UpdateCommand="UPDATE [NOTA_SEGURIDAD_SUGERIDOS] SET [Quantity] = @Quantity WHERE [id] = @id">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="id" Type="Int32" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="itemcode" Type="String" />
                                                                <asp:Parameter Name="itemname" Type="String" />
                                                                <asp:Parameter Name="codigo_parte" Type="String" />
                                                                <asp:Parameter Name="onhand" Type="Decimal" />
                                                                <asp:Parameter Name="id_llamada" Type="Int32" />
                                                                <asp:Parameter Name="indicador" Type="Boolean" />
                                                            </InsertParameters>
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="HS01" Name="id_llamada" PropertyName="Value" Type="Int32" />
                                                            </SelectParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="itemcode" Type="String" />
                                                                <asp:Parameter Name="itemname" Type="String" />
                                                                <asp:Parameter Name="codigo_parte" Type="String" />
                                                                <asp:Parameter Name="onhand" Type="Decimal" />
                                                                <asp:Parameter Name="id_llamada" Type="Int32" />
                                                                <asp:Parameter Name="indicador" Type="Boolean" />
                                                                <asp:Parameter Name="Quantity" Type="Decimal" />
                                                                <asp:Parameter Name="id" Type="Int32" />
                                                            </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                        <asp:GridView 
                                                        ID="GVSUGERIDO" 
                                                        runat="server" 
                                                        CssClass="table table-striped table-bordered table-hover table-condensed w3-small"
                                                        AllowPaging="True" 
                                                        AllowSorting="True" 
                                                        AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLADAPPRUEBA">
                                                            <Columns>
                                                                <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/CANCEL.gif" CancelText="" DeleteImageUrl="~/images/DEL.gif" DeleteText="" EditImageUrl="~/images/EDIT.gif" EditText="" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/images/UPD.gif" UpdateText="" />
                                                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                                                <asp:BoundField DataField="itemcode" HeaderText="Código" SortExpression="itemcode" ReadOnly="True" />
                                                                <asp:BoundField DataField="itemname" HeaderText="Descripción" SortExpression="itemname" ReadOnly="True" />
                                                                <asp:BoundField DataField="codigo_parte" HeaderText="Código de parte" SortExpression="codigo_parte" ReadOnly="True" />
                                                                <asp:BoundField DataField="onhand" HeaderText="onhand" SortExpression="onhand" ReadOnly="True" Visible="False" />
                                                                <asp:BoundField DataField="id_llamada" HeaderText="id_llamada" SortExpression="id_llamada" ReadOnly="True" Visible="False" />
                                                                <asp:CheckBoxField DataField="indicador" HeaderText="indicador" SortExpression="indicador" ReadOnly="True" Visible="False" />
                                                                <asp:BoundField DataField="Quantity" HeaderText="Cantidad Sugerida" SortExpression="Quantity" />
                                                            </Columns>
                                                        <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" /> 
                                                        </asp:GridView>
                                                    </div>
                                                    <div class="w3-col w3-container w3-mobile" style="width:100%; display:none"  >
                                                        <div class="w3-display-container">
                                                            <div class="w3-padding w3-display-middle">
                                                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/Excel.gif" Width="35px" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>  
                                        <footer class="w3-padding-16">                                        
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <asp:LinkButton ID="BTNACTIVARBUSQUEDA" runat="server" Cssclass="w3-button w3-block w3-hover-dark-grey w3-black"> BUSCAR PARTES E INSUMOS</asp:LinkButton>
                                                </div>
                                                <div class="col-sm-12">
                                                    <button type="button" class="w3-button w3-block w3-hover-dark-grey w3-blue-gray" runat="server" id="BTNGUARDARNOTASEGURIDAD">GUARDAR NOTA DE SEGURIDAD</button>
                                                </div>
                                                <div class="col-sm-12">
                                                    <button type="button" class="w3-button w3-block w3-hover-dark-grey w3-blue-gray" runat="server" id="BTNACTUALIZARNOTASEGURIDAD" visible="false">ACTUALIZAR NOTA DE SEGURIDAD</button>
                                                </div>
                                                <div class="col-sm-12">
                                                    <button type="button" class="w3-button w3-block w3-hover-dark-grey w3-red" runat="server" id="BTNCANCELARNOTASEGURIDAD">CANCELAR</button>
                                                </div>
                                            </div>
                                        </footer>           

                                    </div>
                                </asp:Panel>
                                <%--FINALIZA EL PANEL DEL LISTADO DE REPUESTOS PARA LA NOTA DE SEGURIDAD--%>
                            </div>
                           </div>
                          </div>
                        </asp:Panel>  
                 </div>
            </div>
       </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>

<%--********************* INICIA EL CODIGO DE LA API GOOGLE MAPS PARA RECUPERAR DIRECCION EN BASE A COORDENADAS ********************--%>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1lvMhf3k1IQWGU3e_l5W5HYQVFlsG2Hk"></script>
<script type="text/javascript">

    function obtener() { navigator.geolocation.getCurrentPosition(mostrar, gestionarErrores); }

    function mostrar(posicion) {

        document.getElementById("<%=HFLatitud.ClientID%>").value = posicion.coords.latitude;
        document.getElementById("<%=HFLongitud.ClientID%>").value = posicion.coords.longitude;
        document.getElementById("<%=HFRango.ClientID%>").value = posicion.coords.accuracy;

        var lat = posicion.coords.latitude;
        var lon = posicion.coords.longitude;

        var latlng = new google.maps.LatLng(lat, lon);

        geocoder = new google.maps.Geocoder();
        geocoder.geocode({ "latLng": latlng }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var address0 = results[0]['formatted_address'];
                var address1 = results[1]['formatted_address'];
                var address2 = results[2]['formatted_address'];

                document.getElementById("<%=HFDIRECCION.ClientID%>").value = address0 +' '+address1+' '+address2;
                //alert(address);
            } else {
                document.getElementById("<%=HFDIRECCION.ClientID%>").value = status;
                //alert(status);
            }
        });
               
    }

    function gestionarErrores(error) {

        alert('Error: ' + error.code + ' ' + error.message + '\n\nPor favor compruebe que está conectado ' +

            'a internet y habilite la opción permitir compartir ubicación física');

    }
</script>

</asp:Content>
