<%-- 
    Document   : RegistroCamiones
    Created on : 10/11/2018, 15:36:09
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
        <title>Registrar Camiones</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>

    <br><br><br><br>
    <h1>Registro de camiones:</h1>
    <img src = "images/2.png" align="middle" width="400" height="300"/>
    <br><br><br>
    <center>
        <form action="registro_camiones.do" method="post">
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
            <input type="submit" value="Registrar...">
        </form>
    </center>
    <br><br>
   <%-- <button type="button" class=button onclick="regresar()">Regresar</button> --%>

</html>
