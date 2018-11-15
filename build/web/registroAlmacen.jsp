<%-- 
    Document   : registroAlmacen
    Created on : 13/11/2018, 20:37:48
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

        <title>Registrar Almacen</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarAlmacenes.jsp';
            }
        </script>
    </head>
    <body>
        <br><br><br><br>
        <h1>Registro de Almacenes:</h1>
        <img src = "images/6.png" align="middle" width="400" height="300"/>
        <br><br><br>
    <center>
        <form action="registro_almacen.do" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="txtId" placeholder="001" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre" placeholder="Micomisariato" onkeypress="return validaLetras(event)"></td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><input type="text" name="txtTelefono" placeholder="0983513314" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><input type="text" name="txtDireccion" placeholder="El Ejido" onkeypress="return validaLetras(event)"></td>
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
