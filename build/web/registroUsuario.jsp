<%-- 
    Document   : RegistroCamiones
    Created on : 10/11/2018, 15:36:09
    Author     : t4nk
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/Camiones/images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="/Camiones/estilos2.css">
        <title>Registrar Usuario</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>

    <br><br><br><br>
    <h1>Registro de Usuario:</h1>
    <img src = "images/10.png" align="middle" width="300" height="300"/>
    <br><br>
    <center>
        <form action="registro_usuario.do" method="post">
            <table>

                <tr>
                    <td>ID:</td>
                    <td><input type="text" name="txtId" placeholder="egflores5" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>

                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="txtPass"></td>
                </tr>

                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre" placeholder="Edwin" onkeypress="return validaLetras(event)"></td>
                </tr>

                <tr>
                    <td>Apellido:</td>
                    <td><input type="text" name="txtApellido" placeholder="Flores" onkeypress="return validaLetras(event)"></td>
                </tr>
            </table>
            <br>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Registrar...">
        </form>
    </center>
    <br><br>

</html>
