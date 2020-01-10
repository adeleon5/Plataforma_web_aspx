<%@ Page validateRequest="false" Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MP01.Master" CodeBehind="Dashboard.aspx.vb" Inherits="EasySapWeb.Prueba" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <asp:TextBox runat="server" ID="TXTFECHAINI" TextMode="Date" CssClass="w3-input w3-border w3-light-grey w3-round"></asp:TextBox>
    <asp:DropDownList ID="DDLEMPRESA" runat="server" CssClass="w3-input w3-border w3-light-grey w3-round"></asp:DropDownList>
    <asp:Button runat="server" ID="BTNHF" Text="GENERAR" CssClass="w3-button w3-round w3-red w3-hover-blue-gray w3-left w3-mobile"/>
    <br />
<div class="container">
    <div class="row">
        <div class="w3-content">
          <h3>TABLA DE TIENDAS DE <asp:Label runat="server" ID="lblempresa"></asp:Label> CON VENTAS DE <asp:Label runat="server" ID="lblfecha"></asp:Label></h3>
          <p class="w3-center">Porcentaje de ventas basado en promedio según día <asp:Label runat="server" ID="lbldiasemana"></asp:Label> de la semana</p>
        </div>
        <div class="table-responsive">
            <table id="example" class="table table-striped table-condensed table-hover display" style="width:100%" >
                <thead>
                    <tr>
                        <th>TIENDA</th>
                        <th>NOMBRE</th>
                        <th>ESTABLECIMIENTO</th>
                        <th>PROMEDIO</th>
                        <th>VENTA DEL DIA</th>
                        <th>% DE VENTAS</th>
                        <th>CRITERIOS</th>
                    </tr>
                </thead>
                <tbody id="listado">
                </tbody>
            </table>
        </div>
    </div>
    <hr />
    <div class="row">
         <div class="w3-content">
          <h2>TABLA DE VENTAS POR HORA</h2>
          <p class="w3-center">Muestra las ventas por hora del día en curso</p>
          <input class="w3-input" />
        </div>
        <div class="table-responsive">
            <table id="example_0" class="table table-striped table-condensed table-hover display" style="width:100%" >
                <thead>
                    <tr>
                        <th>TIENDA</th>
                        <th>NOMBRE</th>
                        <th>6</th>
                        <th>7</th>
                        <th>8</th>
                        <th>9</th>
                        <th>10</th>
                        <th>11</th>
                        <th>12</th>
                        <th>13</th>
                        <th>14</th>
                        <th>15</th>
                        <th>16</th>
                        <th>17</th>
                        <th>18</th>
                        <th>19</th>
                        <th>20</th>
                        <th>21</th>
                        <th>22</th>
                    </tr>
                </thead>
                <tbody id="listado_0">
                </tbody>
            </table>
        </div>
    </div>
</div>
       
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css"/>

<script>
    var hoy = new Date();
    var dd = hoy.getDate();
    var mm = hoy.getMonth() + 1;
    var yyyy = hoy.getFullYear();
    var fecha = yyyy.toString() + mm.toString() + dd.toString();

    var json = "";
    var json_0 = "";

    var totales = 0;
    var totales_0 = 0;
    var offset = 0;
    var desde = offset;
    var hasta = 0;


    function mostrarLista(desde, hasta) {
        var lista = '';
        for (var i = desde; i < hasta; i++) {
            var fila = '';
            fila += "<tr>";
            fila += "<td>" + json[i].TIENDA + "</td>";
            fila += "<td>" + json[i].TDA_NOMBRE + "</td>";
            fila += "<td>" + json[i].SAT_ESTABLECIMIENTO + "</td>";
            fila += "<td>" + json[i].PROMEDIO + "</td>";
            fila += "<td>" + json[i].VENTADELDIA + "</td>";
            fila += "<td>" + json[i].PORC_VENTAS + "</td>";
            fila += "<td>" + json[i].CRITERIOS + "</td>";
            fila += "</tr>";
            lista += fila;
        }
        $('#listado').html(lista);
    }

    function mostrarLista_0(desde, hasta) {
        var lista = '';
        for (var i = desde; i < hasta; i++) {
            var fila = '';
            fila += "<tr>";
            fila += "<td>" + json_0[i].TIENDA + "</td>";
            fila += "<td>" + json_0[i].TDA_NOMBRE + "</td>";
            fila += "<td>" + json_0[i].SEIS + "</td>";
            fila += "<td>" + json_0[i].SIETE + "</td>";
            fila += "<td>" + json_0[i].OCHO + "</td>";
            fila += "<td>" + json_0[i].NUEVE + "</td>";
            fila += "<td>" + json_0[i].DIEZ + "</td>";
            fila += "<td>" + json_0[i].ONCE + "</td>";
            fila += "<td>" + json_0[i].DOCE + "</td>";
            fila += "<td>" + json_0[i].TRECE + "</td>";
            fila += "<td>" + json_0[i].CATORCE + "</td>";
            fila += "<td>" + json_0[i].QUINCE + "</td>";
            fila += "<td>" + json_0[i].DIEZYSEIS + "</td>";
            fila += "<td>" + json_0[i].DIEZYSIETE + "</td>";
            fila += "<td>" + json_0[i].DIEZYOCHO + "</td>";
            fila += "<td>" + json_0[i].DIEZYNUEVE + "</td>";
            fila += "<td>" + json_0[i].VEINTE + "</td>";
            fila += "<td>" + json_0[i].VEINTEYUNO + "</td>";
            fila += "<td>" + json_0[i].VEINTEYDOS + "</td>";
            fila += "</tr>";
            lista += fila;
        }
        $('#listado_0').html(lista);
    }

    var printCounter = 0;

    function traducirdia(dia) {
        var resultado = "";
        if (dia == "Sunday") { resultado = "Domingo" };
        if (dia == "Monday") { resultado = "Lunes" };
        if (dia == "Tuesday") { resultado = "Martes" };
        if (dia == "Wednesday") { resultado = "Miercoles" };
        if (dia == "Thursday") { resultado = "Jueves" };
        if (dia == "Friday") { resultado = "Viernes" };
        if (dia == "Saturday") { resultado = "Sábado" };
        return resultado;
    }

    function display() {
        document.getElementById('<%=lblempresa.ClientID %>').innerHTML = json[0].NOM_EMPRESA;
        document.getElementById('<%=lbldiasemana.ClientID %>').innerHTML = traducirdia(json[5].DIA_SEMANA);
    };

    function LlenarTabla() {
        mostrarLista(offset, hasta);
        mostrarLista_0(desde, totales_0);
    };

    function Cargar() {
        Inicializar();
        display();
        LlenarTabla();
    }

    function Inicializar() {
        json = <%=GetJasonString("1")%>;
        json_0 = <%=GetJasonString("2")%>;
        totales = json.length;
        totales_0 = json_0.length;
        offset = 0;
        desde = offset;
        hasta = totales;
    }

    $(document).ready(function () {

        $('#example').DataTable({
            dom: 'Bfrtip',
            lengthMenu: [
                [10, 25, 50, -1],
                ['10 rows', '25 rows', '50 rows', 'Show all']
            ],
            buttons: [
                'pageLength', 'copy', {
                    extend: 'excel',
                    messageTop: 'Tabla de ventas con porcentaje sobre promedio, según día de la semana',
                    messageBottom: 'Create by AGL'
                }, {
                    extend: 'pdf',
                    messageTop: 'Tabla de ventas con porcentaje sobre promedio, según día de la semana',
                    messageBottom: 'Create by AGL'
                }, {
                    extend: 'print',
                    messageTop: 'Tabla de ventas con porcentaje sobre promedio, según día de la semana',
                }
            ],
            "language": {
                "lengthMenu": "Ver MENU registros por página",
                "zeroRecords": "No hay registros disponibles",
                "info": "Página PAGE de PAGES",
                "infoEmpty": "No hay registros validos",
                "infoFiltered": "(filtered from MAX total records)"
            }
        });

        $('#example_0').DataTable({
            dom: 'Bfrtip',
            lengthMenu: [
                [10, 25, 50, -1],
                ['10 rows', '25 rows', '50 rows', 'Show all']
            ],
            buttons: [
                'pageLength', 'copy', {
                    extend: 'excel',
                    messageTop: 'Tabla de ventas con porcentaje sobre promedio, según día de la semana',
                    messageBottom: 'Create by AGL'
                }, {
                    extend: 'pdf',
                    messageTop: 'Tabla de ventas con porcentaje sobre promedio, según día de la semana',
                    messageBottom: 'Create by AGL'
                }, {
                    extend: 'print',
                    messageTop: 'Tabla de ventas con porcentaje sobre promedio, según día de la semana',
                }
            ],
            "language": {
                "lengthMenu": "Ver MENU registros por página",
                "zeroRecords": "No hay registros disponibles",
                "info": "Página PAGE de PAGES",
                "infoEmpty": "No hay registros validos",
                "infoFiltered": "(filtered from MAX total records)"
            }
        });
    });

</script>

</asp:Content>