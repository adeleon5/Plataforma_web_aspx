<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Firma_Orden_Servicio.aspx.vb" Inherits="EasySapWeb.Firma_Orden_Servicio" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>SP WEB</title>
    <link rel="shortcut icon" type="image/x-icon" href="/sp.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="HandheldFriendly" content="True"/>
    <meta name="MobileOptimized" content="320"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" /> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>

    <style>
        #canvas {
            border: solid black 1px;
        }
    </style>

    <script>
        window.take = function () {
            html2canvas(document.getElementById("more"), {
                onrendered: function (canvas) {
                    //document.getElementById('imgprueba').src = canvas.toDataURL("image/png");
                    var img = canvas.toDataURL("image/png");
                    var doc = new jspdf('p', 'pt', 'a4');
                    doc.addImage(img, 'JPEG', 0, 60, 0, 0);
                    doc.save('Test.pdf');
                    alert("Documento generado");
                }
            })
        }
</script>
</head>

<body onbeforeunload="startup();prepareCanvas();" onunload="startup();prepareCanvas();" onload="startup();prepareCanvas();">

<form id="form1" runat="server">
<asp:UpdatePanel id="UPFIRMA" runat="server" UpdateMode="Conditional" >
    <ContentTemplate>
<asp:HiddenField ID="firma" runat="server" />
<asp:HiddenField ID="firma1" runat="server" />
<asp:HiddenField ID="firma2" runat="server" />
<asp:HiddenField ID="HFParametro" runat="server" />
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<!-- Header -->
<asp:Panel ID="PMENU" runat="server" Visible="false">
    <nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
      <a href="javascript:void(0)" onclick="w3_close()"
      class="w3-bar-item w3-button">Cerrar panel Menu</a>
      <a href="Menu.aspx" onclick="w3_close()" class="w3-bar-item w3-button">Regresar al menú</a>
      <a href="Orden_Servicio.aspx" onclick="w3_close()" class="w3-bar-item w3-button">Regresar a programación</a>
      <a href="https://partner.crown.com" target="_blank" onclick="w3_close()" class="w3-bar-item w3-button">Crown</a>
      <a href="https://webstore.sistemasyproyectos.com/" target="_blank" onclick="w3_close()" class="w3-bar-item w3-button">Tienda Online SYP</a>
    </nav>
</asp:Panel>

<!-- Top menu -->
<header class="w3-container w3-red w3-center" id="myHeader">
  <div class="w3-red w3-xlarge" style="max-width:99%;margin:auto">
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
    <div class="w3-right w3-padding-16">| Plataforma Web Empresarial</div>
    <div class="w3-center w3-padding-16">SISTEMAS Y PROYECTOS, S.A.</div>
  </div>
</header>

<div class="w3-content w3-padding-16">
<div class="w3-row">
<div class="w3-card-4">
<div id="more">
<header class="w3-container w3-blue-gray">
  <h2>COMPROBANTE DE CLIENTE</h2>
</header>
    <br />
    <div class="w3-container">
        <div class="w3-row">
            <div class="col-sm-12">
                <asp:Literal runat="server" ID="L01LLAMADA"></asp:Literal>
            </div>
        </div>
        <div class="w3-row">
            <div class="col-sm-12">
                <asp:Literal runat="server" ID="L01MENSAJE"></asp:Literal>
            </div>
        </div>
        <div class="w3-row w3-padding-16">
            <div class="col-sm-4">
                <img alt="Técnico" id="img" width="200" height="200" src="~/images/SquarWithe.JPG" runat="server"  />
                <div class="w3-content">
                    <input class="w3-input w3-center" type="text" placeholder="Técnico" readonly="true" />
                </div>
            </div>
            <div class="col-sm-4">
                <img alt="Cliente 1" id="img1" width="200" height="200" src="~/images/SquarWithe.JPG" runat="server"   />
                <div class="w3-content">
                    <input class="w3-input w3-center" type="text" placeholder="Cliente No.1" readonly="true" />
                </div>
            </div>
            <div class="col-sm-4">
                <img alt="Cliente 2" id="img2" width="200" height="200" src="~/images/SquarWithe.JPG" runat="server"  />
                <div class="w3-content">
                    <input class="w3-input w3-center" type="text" placeholder="Cliente No.2" readonly="true" />
                </div>
            </div>
        </div>
    </div>
</div>
            </div>
    </div>
</div>
    </ContentTemplate>
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="BTNGENPDF" />
</Triggers>
</asp:UpdatePanel> 
<div class="w3-content w3-padding-16">
    <div class="w3-row">
        <div class="w3-card-4">
                <button id="BTNHABILITAFIRMA" runat="server" class="w3-button w3-block w3-blue-gray w3-hover-dark-gray">FIRMAR</button>
                <asp:Button runat="server" ID="BTNENVIARCORREO" Text="ENVIAR CORREO" CssClass="w3-button w3-blue-gray w3-block w3-hover-dark-gray " Visible="false" />
                <button id="BTNGENPDF" runat="server" onclick="take()" class="w3-button w3-block w3-blue-gray w3-hover-dark-gray">GENERAR PDF</button>
                <asp:Button runat="server" ID="BTNFIRMA" Text="CERRAR" CssClass="w3-button w3-block w3-red w3-hover-dark-gray" />
        </div>
    </div>
</div>
<asp:Panel ID="PFIRMA" runat="server" Visible="false">
<div class="w3-content w3-padding-16">
    <div class="w3-row">
        <div class="w3-card-4">
            <div class="col-sm-5" >
                <canvas id="canvas" width="300" height="300" runat="server" >
                    Lo siento, su navegador no soporta el área de firma (canvas).
                </canvas>
            </div>
            <div class="col-sm-7">
                <select name="entidad" id="entidad" class="w3-button w3-block w3-red w3-hover-dark-gray">
                <option selected="selected">Seleccionar Entidad</option>
                <option value="img">Técnico</option> 
                <option value="img1">Cliente 1</option> 
                <option value="img2">Cliente 2</option>                     
                </select>
                <input type="button" id="enviar" value="ASIGNAR FIRMA" class="w3-button w3-block w3-blue-gray w3-hover-dark-gray" runat="server" onclick="imagen();" />
                <input type="button" id="borrador" runat="server"  value="LIMPIAR ÁREA DE FIRMA" class="w3-button w3-block w3-blue-gray w3-hover-dark-gray" />
                <button id="BTNCERRARFIRMA" runat="server" class="w3-button w3-block w3-red w3-hover-dark-gray" style="display:none" >Cerrar panel de firma</button>
            </div> 
        </div>
    </div>
</div>
</asp:Panel>

</form>
</body>

<script type="text/javascript">
    /////////// firma movil ////////////////////////////////////////////////////////////////////////////
    var ongoingTouches = new Array;

    function colorForTouch(touch) {
        var id = touch.identifier;
        id = id.toString(16); // make it a hex digit
        return "#000000";
    }

    function ongoingTouchIndexById(idToFind) {
        for (var i = 0; i < ongoingTouches.length; i++) {
            var id = ongoingTouches[i].identifier;

            if (id == idToFind) {
                return i;
            }
        }
        return -1;    // not found
    }

    function handleStart(evt) {
        evt.preventDefault();
        var el = document.getElementById("canvas");
        var ctx = el.getContext("2d");
        var Limites = el.getBoundingClientRect(); // obtenemos los limites del canvas
        var touches = evt.changedTouches;

        

        for (var i = 0; i < touches.length; i++) {
            ongoingTouches.push(touches[i]);
            var color = colorForTouch(touches[i]);
            ctx.fillStyle = color;
            //alert("handleStart " + touches[i].pageX.toString() + ' ' + Limites.left.toString());
            ctx.fillRect(touches[i].clientX-Limites.left, touches[i].clientY - Limites.top, 1.5, 1.5); //-2 //touches[i].pageX - Limites.left, touches[i].pageY - Limites.top
        }
    }

    function handleMove(evt) {
        evt.preventDefault();
        var el = document.getElementById("canvas");
        var ctx = el.getContext("2d");
        var Limites = el.getBoundingClientRect(); // obtenemos los limites del canvas
        var touches = evt.changedTouches;
        //alert("Move");
        ctx.lineWidth = 1.5;

        for (var i = 0; i < touches.length; i++) {
            var color = colorForTouch(touches[i]);
            var idx = ongoingTouchIndexById(touches[i].identifier);

            ctx.fillStyle = color;
            ctx.beginPath();
            //alert("handleMove " + touches[i].clientX.toString() + ' ' + Limites.left.toString());
            ctx.moveTo(ongoingTouches[idx].clientX-Limites.left, ongoingTouches[idx].clientY-Limites.top);
            ctx.lineTo(touches[i].clientX-Limites.left, touches[i].clientY-Limites.top);
            ctx.closePath();
            ctx.stroke();
            ongoingTouches.splice(idx, 1, touches[i]);  // swap in the new touch record
        }
    }

    function handleEnd(evt) {
        evt.preventDefault();
        var el = document.getElementById("canvas");
        var ctx = el.getContext("2d");
        var touches = evt.changedTouches;

        ctx.lineWidth = 1.5;

        for (var i = 0; i < touches.length; i++) {
            var color = colorForTouch(touches[i]);
            var idx = ongoingTouchIndexById(touches[i].identifier);

            ctx.fillStyle = color;
            ctx.beginPath();
            ctx.moveTo(ongoingTouches[i].pageX, ongoingTouches[i].pageY);
            ctx.lineTo(touches[i].pageX, touches[i].pageY);
            ongoingTouches.splice(i, 1);  // remove it; we're done
        }
    }

    function handleCancel(evt) {
        evt.preventDefault();
        var touches = evt.changedTouches;

        for (var i = 0; i < touches.length; i++) {
            ongoingTouches.splice(i, 1);  // remove it; we're done
        }
    }


    function startup() {
        var el = document.getElementById("canvas");
        el.addEventListener("touchstart", handleStart, false);
        el.addEventListener("touchend", handleEnd, false);
        el.addEventListener("touchcancel", handleCancel, false);
        el.addEventListener("touchleave", handleEnd, false);
        el.addEventListener("touchmove", handleMove, false);
    }


    /////////// firma PC ////////////////////////////////////////////////////////////////////////////
    var miLienzo; // el canvas
    var contexto; // el contexto
    var canvasLimites; // los margenes del canvas
    var flagPaint = false; // nos dice si pintar o no
    var actualPos; // la posición actual donde hice click

    function prepareCanvas() {
        miLienzo = document.getElementById("canvas");
        contexto = miLienzo.getContext("2d"); // obtenemos el contexto ( dibujar en 2d)
        canvasLimites = miLienzo.getBoundingClientRect(); // obtenemos los limites del canvas

        miLienzo.addEventListener('mousedown', cambiarEstado, false);
        miLienzo.addEventListener('mouseup', cambiarEstado, false);
        miLienzo.addEventListener('mousemove', pintarLinea, false);

        borrador = document.getElementById("borrador");
        borrador.addEventListener('click', erase, false);

        //enviar = document.getElementById("enviar");
        //enviar.addEventListener('click', imagen, false);
        
    }

    function cambiarEstado() {
        flagPaint = !flagPaint;
        actualPos = obtenerCoordenadas(event);
    }

    function pintarLinea(event) {
        if (flagPaint) {
            var coordenadas = obtenerCoordenadas(event);
            contexto.beginPath(); // comenzamos a dibujar
            contexto.moveTo(actualPos.x, actualPos.y); // ubicamos el cursor en la posicion (10,10)
            contexto.lineTo(coordenadas.x, coordenadas.y);
            actualPos = {
                x: coordenadas.x,
                y: coordenadas.y
            };
            contexto.strokeStyle = "#000"; // color de la linea
            contexto.stroke(); // dibujamos la linea
        }
    }

    function obtenerCoordenadas(event) {
        var posX;
        var posY;

        if (event.pageX || event.pageY) {
            posX = event.pageX - canvasLimites.left;
            posY = event.pageY - canvasLimites.top;
        } else {
            posX = event.clientX - canvasLimites.left;
            posY = event.clientY - canvasLimites.top;
        }

        return {
            x: posX,
            y: posY
        };
    }
    function erase() {
        contexto.clearRect(0, 0, miLienzo.width, miLienzo.height);
    }

    var selEntidad = document.getElementById("entidad");

    selEntidad.addEventListener("change", function (event) {
        var msj = this.value.toString()
        //alert(msj);
        var Param = document.getElementById('<%= HFParametro.ClientID %>');
       Param.value = msj;
    });

    

    function imagen() {
        var canvas = document.getElementById("canvas");
        var url = canvas.toDataURL();

        var parametro = document.getElementById('<%= HFParametro.ClientID %>');
        var p = parametro.value.toString();

        var firma = document.getElementById('<%= firma.ClientID %>');
        var firma1 = document.getElementById('<%= firma1.ClientID %>');
        var firma2 = document.getElementById('<%= firma2.ClientID %>');

        if (p == "img") {
            firma.value = url;
        } else if (p == "img1") {
            firma1.value = url;
        } else {
            firma2.value = url;
        }
        
        //alert(p);
        document.getElementById(p).src = url;
    }

    /////codigo para el header o encabezado de la pagina
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
    }

</script>


</html>
