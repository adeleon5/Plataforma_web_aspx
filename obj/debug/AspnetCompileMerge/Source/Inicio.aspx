<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Inicio.aspx.vb" Inherits="EasySapWeb.Inicio" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="script" runat="server">
    <%--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
          <%=TablaCharts()%>
        data.addRows([
          <%=TablaChartsRows%>
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
      }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <!--Div that will hold the pie chart-->
<div id = "table_div"> </div>

<div class="w3-container w3-row w3-center w3-padding" style="display:block">
    <div class="w3-col s12">
        <asp:DropDownList runat="server" ID="DDLEMPRESAS" AutoPostBack="true" type="text" class="w3-input w3-border w3-round w3-hover-yellow" placeholder="Seleccionat..." ></asp:DropDownList>
    </div>  
    <div class="w3-col s12">
        <asp:TextBox runat="server" ID="TXTREQUEST" class="w3-input w3-border w3-round w3-hover-yellow" TextMode="MultiLine" Rows="15"></asp:TextBox>
    </div> 
</div>

<div class="w3-content w3-row" style="display:block">
    <div class="w3-col s12">
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="reportes\rptInicio.rpt">
            </Report>
        </CR:CrystalReportSource>
        <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" ToolPanelView="None" />
    </div>
</div>

<%--<asp:Panel ID="PDESCARGA" runat="server" Visible="true">
    <asp:GridView 
        ID="GVINICIO" 
        runat="server" 
        CssClass="table table-striped table-bordered table-hover re"
        AutoGenerateColumns="False">    
    </asp:GridView>
</asp:Panel>--%>

</asp:Content>
