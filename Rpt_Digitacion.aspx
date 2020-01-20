<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Rpt_Digitacion.aspx.vb" Inherits="EasySapWeb.Rpt_Digitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
<asp:Button runat="server" ID="btnpanelopciones" CssClass="w3-button w3-black" Text="Ver panel de opciones"/>
<asp:panel runat="server" id="id01" Visible="false">
<div class="w3-container w3-row-padding w3-content">
    <div class="w3-col s12 w3-padding w3-mobile">
        <div class="w3-card-4">
            <header class="w3-container w3-yellow">
                <asp:LinkButton runat="server" id="SP01" CssClass="w3-button" Text="X"></asp:LinkButton>
                <h3>GESTIÓNO DE REPORTES DE TIENDAS</h3>
            </header>
            <div class="w3-container w3-padding">
                <p>
                <label class="w3-text-black"><b>Reporte</b></label>
                <asp:DropDownList ID="DDLREPORTE" runat="server" CssClass="w3-input w3-border w3-light-grey w3-round" AutoPostBack="False" ></asp:DropDownList>
                </p>
                <p>
                    <label class="w3-text-black">
                    <b>Empresa</b></label>
                    <asp:DropDownList ID="DDLEMPRESA" runat="server" AutoPostBack="true" CssClass="w3-input w3-border w3-light-grey w3-round">
                    </asp:DropDownList>
                </p>
                <p>
                    <label class="w3-text-black">
                    <b>Tienda</b></label>
                    <asp:DropDownList ID="DDLTIENDA" runat="server" CssClass="w3-input w3-border w3-light-grey w3-round">
                    </asp:DropDownList>
                </p>
                <p>
                    <label class="w3-text-black">
                    <b>Fecha</b></label>
                    <asp:TextBox ID="TXTFECHADOCTO" runat="server" CssClass="w3-input w3-border w3-light-gray w3-round" TextMode="Date"></asp:TextBox>
                </p>
            </div>
            <footer class="w3-row w3-padding">
                    <div class="w3-col s6">
                        <asp:LinkButton ID="BTNGO" runat="server" CssClass="w3-btn w3-block w3-black w3-hover-blue-gray w3-round" Text="Generar"></asp:LinkButton>
                    </div>
                    <div class="w3-col s6">
                        <a class="w3-btn w3-block w3-hover-blue-gray w3-red w3-round w3-text-white" href="Dashboard.aspx">Regresar</a>
                    </div>
                </footer>
        </div>
    </div>
</div>
</asp:panel>
<div class="w3-container w3-row-padding w3-responsive" style="overflow-y:scroll; min-height:300px">
    <asp:Panel runat="server" ID="P_IMAGENES">
        <div class="w3-row">
            <a onclick="myFunction()">Rotar 90 grados derecha</a>
            <div id="divImg" class="w3-col s12">
                <asp:Image runat="server" ID="IMGDOCTO_" alt="Lights" style="width:100%" CssClass="w3-animate-zoom"/>
            </div>
            <div class="w3-col s12">
                <asp:GridView ID="GVREP" runat="server" Width="100%" CssClass="w3-table-all w3-small" 
                    AllowPaging="False" AllowSorting="False" 
                    AutoGenerateColumns="False"
                    RowStyle-CssClass="normal"
                    AlternatingRowStyle-CssClass="alternate">                
                </asp:GridView>
            </div>
        </div>
    </asp:Panel>
    <br />
            
    <br />
    <asp:Panel runat="server" ID="P_DOCTODETA" Visible="false">
        <asp:GridView ID="GVDOCTODETA" runat="server" Width="100%" CssClass="w3-table-all w3-small" 
        AllowPaging="False" AllowSorting="False" 
        AutoGenerateColumns="False"
        RowStyle-CssClass="normal"
        AlternatingRowStyle-CssClass="alternate">                
        </asp:GridView>
    </asp:Panel>
</div>


    <div class="w3-container">
  <h2>Tabs in a Grid</h2>

  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openCity(event, 'Envio');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Envios de Pollo</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'Paris');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Paris</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Tokyo</div>
    </a>
  </div>

  <div id="Envio" class="w3-container city" style="display:none">
    <h2>Envios de Avícola Guadalupe</h2>
        <asp:Panel runat="server" ID="P_DOCTOENCA" Visible="false">
            <asp:GridView ID="GVDOCTOENCA" runat="server" Width="100%" CssClass="w3-table-all w3-small" 
            AllowPaging="False" AllowSorting="False" 
            AutoGenerateColumns="False"
            RowStyle-CssClass="normal"
            AlternatingRowStyle-CssClass="alternate"  
            >                
            </asp:GridView>
        </asp:Panel>
  </div>

  <div id="Paris" class="w3-container city" style="display:none">
    <h2>Paris</h2>
    <p>Paris is the capital of France.</p> 
  </div>

  <div id="Tokyo" class="w3-container city" style="display:none">
    <h2>Tokyo</h2>
    <p>Tokyo is the capital of Japan.</p>
  </div>
</div>
<script>
    function myFunction() {
        // Code for Safari
        document.getElementById("divImg").style.WebkitTransform = "rotate(90deg)";
        // Code for IE9
        document.getElementById("divImg").style.msTransform = "rotate(90deg)";
        // Standard syntax
        document.getElementById("divImg").style.transform = "rotate(90deg)";
    }
</script>
</asp:Content>
