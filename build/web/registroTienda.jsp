<%-- 
    Document   : registroTienda
    Created on : 14-nov-2018, 11:02:48
    Author     : DIEGO ACOSTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">

        <title>Registrar Tienda</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarTienda.jsp';
            }
        </script>
    </head>
    <body>

        <h1>Registro de Tiendas:</h1>
        <img src = "images/2.png" align="middle" width="400" height="300"/>
        <br><br><br>
    <center>
        <form action="registro_tienda.do" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="txtId" placeholder="001" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre" placeholder="Donxxxx" onkeypress="return validaLetras(event)"></td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><input type="text" name="txtTelefono" placeholder="02222222" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><input type="text" name="txtDireccion" placeholder="Chillogallo" onkeypress="return validaLetras(event)"></td>
                </tr>
              
            </table>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Registrar...">
        </form>
    </center>
    <br><br>
  <%--   <button type="button" class=button onclick="regresar()">Regresar</button>--%>
</body>
</html>
