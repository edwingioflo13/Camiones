<%-- 
    Document   : ModificarCamiones
    Created on : 10/11/2018, 17:14:00
    Author     : t4nk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Modificar Camiones</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Ingrese los nuevos datos del camión que desea modificar:</h1>
        <img src = "images/4.png" align="middle" width="200" height="200"/>
        <br><br><br>
    <center>
        <form name="modificar" action="modifica_camiones.do" method="POST">
            <table>
                <tr>
                    <td>Código:</td>
                    <td><input type="text" name="txtCodigo" placeholder="C001" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
                <tr>
                    <td>Placa:</td>
                    <td><input type="text" name="txtPlaca" placeholder="PYI0899" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
                <tr>
                    <td>Volumen:</td>
                    <td><input type="text" name="txtVolumen" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Peso:</td>
                    <td><input type="text" name="txtPeso" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Estado:</td>
                    <td><input type="text" name="txtEstado" placeholder="activo/inactivo" onkeypress="return validaLetras(event)"></td>
                </tr>

            </table>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Modificar...">
        </form>
    </center>
    <br><br>
    <button type="button" class=button onclick="regresar()">Regresar</button>
</body>
</html>
