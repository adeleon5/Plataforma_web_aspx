<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Calendario_Tiendas.aspx.vb" Inherits="EasySapWeb.Calendario_Tiendas"  %>
<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
    <style type="text/css">
	body{
		background-repeat:no-repeat;
		font-family: Trebuchet MS, Lucida Sans Unicode, Arial, sans-serif;
		margin:0px;
		}
	#ad{
		padding-top:220px;
		padding-left:10px;
	}
	    .auto-style1
        {
            height: 29px;
        }
	</style>
	<link type="text/css" rel="stylesheet" href="dhtmlgoodies_calendar.css?random=20051112" media="screen" />
	<script type="text/javascript" src="dhtmlgoodies_calendar.js?random=20060118"></script>
   </asp:Content> 

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

    <asp:UpdatePanel ID="UP0" runat="server" >
        <ContentTemplate>
            <asp:Panel ID="P0" runat="server" Visible="true" >
                <h1>CALENDARIO DE TIENDAS</h1>
            <div class="MenuBar">
                <a href="Menu.aspx" target="_self" class="TopMenu">Menú</a>
                <asp:LinkButton ID="BTNGENERAR" CssClass="TopMenu" Text="GENERAR CALENDARIO" runat="server" Height="16px" Width="142px" Visible="false" ></asp:LinkButton>
                <asp:LinkButton ID="BTNNEW" CssClass="TopMenu" Text="AGREGAR VENDEDOR" runat="server" Height="16px" Width="140px" ></asp:LinkButton>
            </div>
            <br /> 
               <div class="form1">
                <asp:DropDownList ID="TXTSUPER" runat="server" CssClass="TextBox1" AutoPostBack="true" Visible="false" ></asp:DropDownList>
                <asp:DropDownList ID="TXTSEMANA" runat="server" CssClass="TextBox1" Visible="FALSE"></asp:DropDownList>
                <label for="TXTTIENDAS">TIENDAS</label>
                <asp:DropDownList ID="TXTTIENDAS" runat="server" CssClass="TextBox1" AutoPostBack="true" ></asp:DropDownList>
                </div>
                <asp:Label ID="LBLERR7" runat="server" CssClass="ERRM"></asp:Label><br />
                <asp:Label ID="LBLERR9" runat="server" CssClass="ERRM"></asp:Label><br />
                <asp:Label ID="LBLERR8" runat="server" CssClass="ERRM"></asp:Label>
            <br />
                 <asp:Label runat="server" ID="LBLCALENDARIO"></asp:Label>
                 <asp:Label runat="server" ID="LBLCALENDARIO1"></asp:Label>
                 <br />
         <%--******************************************INICIA EL GRIDVIEW**************************************************** --%>
               <asp:GridView ID="GVREP0" runat="server"  Width = "300px"
                    AutoGenerateColumns = "False" Font-Names = "Arial"
                    Font-Size = "8pt" 
                    onrowediting="EditCustomer"
                    onrowupdating="UpdateCustomer"  
                    onrowcancelingedit="CancelEdit" 
                    OnRowDeleted="DeleteCustomer"
                    CellPadding="4" 
                    AllowSorting="True" 
                    HorizontalAlign="Center" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" >
         <%--******************************************INICIAN LOS BOTONES**************************************************** --%>
                    <Columns>
                        <asp:CommandField  
                            ShowEditButton="True" 
                            ButtonType="Image" 
                            CancelImageUrl="~/images/CANCEL.gif"  
                            EditImageUrl="~/images/EDIT.gif" 
                            UpdateImageUrl="~/images/UPD.gif" 
                            HeaderText="Editar" 
                            HeaderStyle-BackColor="Red" 
                            ItemStyle-BorderColor="Red" 
                            ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1px">
                        <HeaderStyle BackColor="Red" />
                        <ItemStyle BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:CommandField>
                      <asp:TemplateField HeaderStyle-BackColor="Red" 
                            ItemStyle-BorderColor="Red" 
                            ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1px">
                        <ItemTemplate>
                             <input type="image" src="images/cale.ico" value="Clic" onclick="displayCalendarSelectBox1( false, false, this)"/>
                     </ItemTemplate>
                          <HeaderStyle BackColor="Red" />
                          <ItemStyle BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-BackColor="Red" 
                            ItemStyle-BorderColor="Red" 
                            ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server"
                                CommandArgument = '<%# Eval("CODIGO")%>'
                             OnClientClick = "return confirm('Esta seguro de borrar lo datos?')"
                            Text = "ELIMINAR" OnClick = "DeleteCustomer"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle BackColor="Red" />
                        <ItemStyle BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:TemplateField>
         <%--******************************************INICIAN LAS COLUMNAS**************************************************** --%>
                   <asp:TemplateField HeaderText="COD" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn">
                            <ItemTemplate>
                                <asp:Label ID="TXTCOD" runat="server" Text='<%# Eval("CODIGO")%>'></asp:Label>
                            </ItemTemplate>
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTCOD1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <HeaderStyle CssClass="hideGridColumn" />
                            <ItemStyle CssClass="hideGridColumn" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="TDA" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn">
                            <ItemTemplate>
                                <asp:Label ID="TXTTDA" runat="server" Text='<%# Eval("TIENDA")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTTDA1" runat="server" Width="40px"
                                Text='<%# Eval("TIENDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                           <%-- <FooterTemplate>
                                <asp:TextBox ID="TXTTDA1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <HeaderStyle CssClass="hideGridColumn" />
                            <ItemStyle CssClass="hideGridColumn" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SMN">
                            <ItemTemplate>
                                <asp:Label ID="TXTSMN" runat="server" Text='<%# Eval("SEMANA")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTSMN1" runat="server" Width="40px"
                                Text='<%# Eval("SEMANA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                           <%-- <FooterTemplate>
                                <asp:TextBox ID="TXTTDA1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="VDR">
                            <ItemTemplate>
                                <asp:Label ID="TXTVDR" runat="server" Text='<%# Eval("VENDEDOR")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTVDR1" runat="server" Width="40px"
                                Text='<%# Eval("VENDEDOR")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTVDR1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="NOMBRE">
                            <ItemTemplate>
                                <asp:Label ID="TXTNOM" runat="server" Text='<%# Eval("NOMBRE")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTNOM1" runat="server" Width="40px"
                                Text='<%# Eval("NOMBRE")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTNOM1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="D_E"  HeaderStyle-BackColor="Green" ItemStyle-BorderColor="Green" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTDE1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTDE1" runat="server" Width="40px"
                                Text='<%# Eval("DOMINGO_ENTRADA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTDE" runat="server" Text='<%# Eval("DOMINGO_ENTRADA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="D_S" HeaderStyle-BackColor="orange" ItemStyle-BorderColor="orange" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                           <%-- <FooterTemplate>
                                <asp:TextBox ID="TXTDS1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTDS1" runat="server" Width="40px"
                                Text='<%# Eval("DOMINGO_SALIDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTDS" runat="server" Text='<%# Eval("DOMINGO_SALIDA")%>'></asp:Label>
                            </ItemTemplate>
                           <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="D_H" HeaderStyle-BackColor="#99ccff" ItemStyle-BorderColor="#99ccff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<EditItemTemplate>
                            <asp:TextBox ID="TXTDH1" runat="server"
                                Text='<%# Eval("DOMINGO_HORAS")%>'></asp:TextBox>
                            </EditItemTemplate> --%>
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTDH1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="TXTDH" runat="server" Text='<%# Eval("DOMINGO_HORAS")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" Font-Bold="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="L_E"  HeaderStyle-BackColor="Green" ItemStyle-BorderColor="Green" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTLE1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTLE1" runat="server" Width="40px"
                                Text='<%# Eval("LUNES_ENTRADA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTLE" runat="server" Text='<%# Eval("LUNES_ENTRADA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="L_S"  HeaderStyle-BackColor="orange" ItemStyle-BorderColor="orange" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTLS1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTLS1" runat="server" Width="40px"
                                Text='<%# Eval("LUNES_SALIDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTLS" runat="server" Text='<%# Eval("LUNES_SALIDA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="L_H" HeaderStyle-BackColor="#99ccff" ItemStyle-BorderColor="#99ccff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                           <%-- <EditItemTemplate>
                            <asp:TextBox ID="TXTLH1" runat="server"
                                Text='<%# Eval("LUNES_HORAS")%>'></asp:TextBox>
                            </EditItemTemplate> --%>
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTLH1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="TXTLH" runat="server" Text='<%# Eval("LUNES_HORAS")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" Font-Bold="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="M_E"  HeaderStyle-BackColor="Green" ItemStyle-BorderColor="Green" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTME1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTME1" runat="server" Width="40px"
                                Text='<%# Eval("MARTES_ENTRADA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTME" runat="server" Text='<%# Eval("MARTES_ENTRADA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="M_S" HeaderStyle-BackColor="orange" ItemStyle-BorderColor="orange" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTMS1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTMS1" runat="server" Width="40px"
                                Text='<%# Eval("MARTES_SALIDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTMS" runat="server" Text='<%# Eval("MARTES_SALIDA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="M_H" HeaderStyle-BackColor="#99ccff" ItemStyle-BorderColor="#99ccff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                           <%-- <EditItemTemplate>
                            <asp:TextBox ID="TXTMH1" runat="server"
                                Text='<%# Eval("MARTES_HORAS")%>'></asp:TextBox>
                            </EditItemTemplate> --%>
                           <%-- <FooterTemplate>
                                <asp:TextBox ID="TXTMH1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="TXTMH" runat="server" Text='<%# Eval("MARTES_HORAS")%>'></asp:Label>
                            </ItemTemplate>
                           <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" Font-Bold="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MI_E"  HeaderStyle-BackColor="Green" ItemStyle-BorderColor="Green" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTMIE1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTMIE1" runat="server" Width="40px"
                                Text='<%# Eval("MIERCOLES_ENTRADA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTMIE" runat="server" Text='<%# Eval("MIERCOLES_ENTRADA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MI_S" HeaderStyle-BackColor="orange" ItemStyle-BorderColor="orange" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                          <%--  <FooterTemplate>
                                <asp:TextBox ID="TXTMIS1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTMIS1" runat="server" Width="40px"
                                Text='<%# Eval("MIERCOLES_SALIDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTMIS" runat="server" Text='<%# Eval("MIERCOLES_SALIDA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MI_H" HeaderStyle-BackColor="#99ccff" ItemStyle-BorderColor="#99ccff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                          <%--  <EditItemTemplate>
                            <asp:TextBox ID="TXTMIH1" runat="server"
                                Text='<%# Eval("MIERCOLES_HORAS")%>'></asp:TextBox>
                            </EditItemTemplate> --%>
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTMIH1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="TXTMIH" runat="server" Text='<%# Eval("MIERCOLES_HORAS")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" Font-Bold="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="J_E"  HeaderStyle-BackColor="Green" ItemStyle-BorderColor="Green" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTJE1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTJE1" runat="server" Width="40px"
                                Text='<%# Eval("JUEVES_ENTRADA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTJE" runat="server" Text='<%# Eval("JUEVES_ENTRADA")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="J_S" HeaderStyle-BackColor="orange" ItemStyle-BorderColor="orange" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTJS1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTJS1" runat="server" Width="40px"
                                Text='<%# Eval("JUEVES_SALIDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTJS" runat="server" Text='<%# Eval("JUEVES_SALIDA")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="J_H" HeaderStyle-BackColor="#99ccff" ItemStyle-BorderColor="#99ccff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                           <%-- <EditItemTemplate>
                            <asp:TextBox ID="TXTJH1" runat="server"
                                Text='<%# Eval("JUEVES_HORAS")%>'></asp:TextBox>
                            </EditItemTemplate> --%>
                           <%-- <FooterTemplate>
                                <asp:TextBox ID="TXTJH1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="TXTJH" runat="server" Text='<%# Eval("JUEVES_HORAS")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" Font-Bold="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="V_E"  HeaderStyle-BackColor="Green" ItemStyle-BorderColor="Green" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                           <%-- <FooterTemplate>
                                <asp:TextBox ID="TXTVE1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTVE1" runat="server" Width="40px"
                                Text='<%# Eval("VIERNES_ENTRADA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTVE" runat="server" Text='<%# Eval("VIERNES_ENTRADA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="V_S" HeaderStyle-BackColor="orange" ItemStyle-BorderColor="orange" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTVS1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTVS1" runat="server" Width="40px"
                                Text='<%# Eval("VIERNES_SALIDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTVS" runat="server" Text='<%# Eval("VIERNES_SALIDA")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="V_H" HeaderStyle-BackColor="#99ccff" ItemStyle-BorderColor="#99ccff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                           <%-- <EditItemTemplate>
                            <asp:TextBox ID="TXTVH1" runat="server"
                                Text='<%# Eval("VIERNES_HORAS")%>'></asp:TextBox>
                            </EditItemTemplate> --%>
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTVH1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="TXTVH" runat="server" Text='<%# Eval("VIERNES_HORAS")%>'></asp:Label>
                            </ItemTemplate>
                           <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" Font-Bold="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="S_E"  HeaderStyle-BackColor="Green" ItemStyle-BorderColor="Green" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                           <%-- <FooterTemplate>
                                <asp:TextBox ID="TXTSE1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTSE1" runat="server" Width="40px"
                                Text='<%# Eval("SABADO_ENTRADA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTSE" runat="server" Text='<%# Eval("SABADO_ENTRADA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="S_S" HeaderStyle-BackColor="orange" ItemStyle-BorderColor="orange" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTSS1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <EditItemTemplate>
                            <asp:TextBox ID="TXTSS1" runat="server" Width="40px"
                                Text='<%# Eval("SABADO_SALIDA")%>'></asp:TextBox>
                            </EditItemTemplate> 
                            <ItemTemplate>
                                <asp:Label ID="TXTSS" runat="server" Text='<%# Eval("SABADO_SALIDA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#66CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="S_H" HeaderStyle-BackColor="#99ccff" ItemStyle-BorderColor="#99ccff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <%--<EditItemTemplate>
                            <asp:TextBox ID="TXTSH1" runat="server"
                                Text='<%# Eval("SABADO_HORAS")%>'></asp:TextBox>
                            </EditItemTemplate> --%>
                            <%--<FooterTemplate>
                                <asp:TextBox ID="TXTSH1" runat="server" MaxLength="5" Width="40px"></asp:TextBox>
                            </FooterTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="TXTSH" runat="server" Text='<%# Eval("SABADO_HORAS")%>'></asp:Label>
                            </ItemTemplate>
                           <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" />
                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" Font-Bold="True" />
                        </asp:TemplateField>

                     <asp:TemplateField HeaderText="H_S" HeaderStyle-BackColor="#cc99ff" ItemStyle-BorderColor="#cc99ff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <ItemTemplate>
                                <asp:Label ID="TXTHS" runat="server" Text='<%# Eval("HORAS_SEMANA")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#33CC33" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BackColor="#99FF99" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="H_L" HeaderStyle-BackColor="#cc99ff" ItemStyle-BorderColor="#cc99ff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <ItemTemplate>
                                <asp:Label ID="TXTHL" runat="server" Text='<%# Eval("HORAS_LEY")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#33CC33" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BackColor="#99FF99" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="H_A" HeaderStyle-BackColor="#cc99ff" ItemStyle-BorderColor="#cc99ff" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <ItemTemplate>
                                <asp:Label ID="TXTHA" runat="server" Text='<%# Eval("HORAS_ALMUERZO")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#33CC33" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                            <ItemStyle BackColor="#99FF99" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="Black" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="H_E" HeaderStyle-BackColor="#33cccc" ItemStyle-BorderColor="#33cccc" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                            <ItemTemplate>
                                <asp:Label ID="TXTHE" runat="server" Text='<%# Eval("HORAS_EXTRAS")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="Yellow" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="Black" />
                            <ItemStyle BackColor="#FFFF99" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="Red" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            <br />
            <asp:GridView ID="GVREP" runat="server" AlternatingRowStyle-CssClass="alternate" AutoGenerateColumns="False" CssClass="grid-view3" RowStyle-CssClass="normal">
                    <AlternatingRowStyle CssClass="alternate" />
                    <RowStyle CssClass="normal" />
                </asp:GridView>
                <br />
                 <div class="Centrado" >
                <asp:ImageButton ID="BTNEXPORT" runat="server" ImageUrl="~/images/Excel.gif" Width="35" />
            </div>
            </asp:Panel>
            <asp:Panel ID="P2" runat="server" Visible="false">
           <h1>INGRESAR VENDEDOR NUEVO EN LAS SEMANAS DEL MES </h1>
            <div class="form1" >
                <table class="T01" id="T1" runat="server"  >
                    <tr>
                        <td>BUSQUEDA</td>
                        <td><asp:TextBox  ID="TXTBUSQUEDA" runat="server" CssClass="TextBox1"  AutoPostBack ="true"  ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>VENDEDOR</td>
                        <td><asp:DropDownList ID="TXTVENDEDOR" runat="server" CssClass="TextBox1"  AutoPostBack ="true"></asp:DropDownList></td>
                    </tr>
                      <tr>
                        <td>TIENDA</td>
                        <td><asp:DropDownList ID="TXTTIENDA" runat="server" CssClass="TextBox1"  AutoPostBack ="true" ></asp:DropDownList></td>
                    </tr>
                      <tr>
                        <td>SUPERVISOR</td>
                        <td><asp:DropDownList ID="TXTSUPERVISOR" runat="server" CssClass="TextBox1"  AutoPostBack ="true" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>SEMANAS </td>
                        <td><asp:DropDownList ID="DPDSMN" runat="server" CssClass="TextBox1"  AutoPostBack ="true" ></asp:DropDownList></td>
                    </tr>  
                </table>                                
                <br />
                <asp:Label ID="LBLERR1" runat="server" CssClass="ERRM"></asp:Label>
                <br />
                <br />
                <div class="MenuBar">
                    <asp:LinkButton ID="BTNBACK1" CssClass="TopMenu" Text="REGRESAR" runat="server" Height="18px" Width="140px" ></asp:LinkButton>
                    <asp:LinkButton ID="BTNADD" CssClass="TopMenu" Text="AGREGAR" runat="server" Height="18px" Width="140px" ></asp:LinkButton>
               </div>
            <br />
            </asp:Panel>
             </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID = "GVREP0" />
        <asp:PostBackTrigger ControlID="BTNEXPORT" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
