<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Firma_Orden_Servicio.aspx.vb" Inherits="EasySapWeb.Firma_Orden_Servicio" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>SP WEB</title>
    <link rel="shortcut icon" type="image/x-icon" href="/sp.ico" />
	<meta name="keywords" content="sypsa, SYPSA, Sistemas y proyectos,plataforma sypsa"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="HandheldFriendly" content="True"/>
    <meta name="MobileOptimized" content="320"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" /> 
    <style>
        #canvas {
            border: solid black 1px;
        }
    </style>
</head>
<body onbeforeunload="startup();prepareCanvas();" onunload="startup();prepareCanvas();" onload="startup();prepareCanvas();">
<form id="form1" runat="server">
<div class="container">
  <h2>COMPROBANTE DE CLIENTE</h2>
    <div class="w3-row">
        <div class="w3-col w3-mobile w3-light-gray w3-padding-large" style="width:70%">
          <asp:Literal runat="server" ID="L01LLAMADA"></asp:Literal>
          <asp:Literal runat="server" ID="L01MENSAJE"></asp:Literal>
          <asp:HiddenField ID="firma" runat="server" />
          <asp:HiddenField ID="firma1" runat="server" />
          <asp:HiddenField ID="firma2" runat="server" />
          <asp:HiddenField ID="HFParametro" runat="server" />
              <br/>
              <img alt="Técnico" id="img" width="200" height="200" src="image" runat="server"  />
              <img alt="Cliente 1" id="img1" width="200" height="200" src="image" runat="server"  />
              <img alt="Cliente 2" id="img2" width="200" height="200" src="image" runat="server"  />
              <br />
             <br />
                <asp:Button runat="server" ID="btnFirma" Text="Cerrar" CssClass="w3-button w3-block w3-dark-gray w3-left-align" />
                <asp:Button runat="server" ID="Button1" Text="Enviar por correo" CssClass="w3-button w3-block w3-dark-gray w3-left-align" />
                <asp:Button runat="server" ID="Button2" Text="Generar PDF" CssClass="w3-button w3-block w3-dark-gray w3-left-align" />
        </div>
        <div class="w3-col w3-mobile w3-padding-small" style="width:30%">
            <div class="container" >
                <canvas id="canvas" width="300" height="300" runat="server">
                    Lo siento, su navegador no soporta el área de firma (canvas).
                </canvas> 
            </div>
            <div class="w3-container ">
                    <select name="entidad" id="entidad" class="w3-button w3-block w3-dark-gray">
                    <option selected="selected">Seleccionar Entidad</option>
                    <option value="img">Técnico</option> 
                    <option value="img1">Cliente 1</option> 
                    <option value="img2">Cliente 2</option>                     
                    </select>
                    <input type="button" id="enviar" value="ASIGNAR FIRMA" class="w3-button w3-block w3-dark-gray w3-left-align" runat="server" onclick="imagen();" />
                    <input type="button" id="borrador" value="LIMPIAR ÁREA DE FIRMA" class="w3-button w3-block w3-dark-gray w3-left-align" />
            </div> 
        </div>
    </div>
</div>
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
</script>
</html>
