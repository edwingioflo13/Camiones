<%-- 
    Document   : EliminarCamiones
    Created on : 10/11/2018, 17:38:51
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
        <title>Eliminar Camiones</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>
    <body>
        <br><br><br><br>
        <h1>Ingrese el código del camión que desea eliminar:</h1>

        <img src = "images/2.png" align="middle" width="400" height="300"/>
        <br><br><br>
    <center>
        <form name="eliminar" action="elimina_camiones.do" method="POST"><table>
                <tr>
                    <td>Placa:</td>
                    <td><input type="text" name="txtPlaca" placeholder="PYI0889" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
            </table>
            <br>
            <p><strong>${message}</strong>
            </p><br>
            <input type="submit" value="Eliminar" />
        </form>
    </center>
    <br><br>
    
</body>
</html>

