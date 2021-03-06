<%-- 
    Document   : modificarAlmacen
    Created on : 13-nov-2018, 22:55:12
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
        <title>Modificar Almacen</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarAlmacen.jsp';
            }
        </script>
    </head>
    <body>
        <br><br><br><br>
        <h1>Ingrese los nuevos datos del almacen que desea modificar:</h1>
        <img src = "images/6.png" align="middle" width="400" height="300"/>
        <br><br><br>
    <center>
        <form name="modificar" action="modificar_almacen.do" method="POST">
       <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="txtId" placeholder="001" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre" placeholder="Supermaxi" onkeypress="return validaLetras(event)"></td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><input type="text" name="txtTelefono" placeholder="0996393405" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><input type="text" name="txtDireccion" placeholder="Sangolqui" onkeypress="return validaLetras(event)"></td>
                </tr>
              
            </table>
            <br>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Modificar...">
        </form>
    </center>

</body>
</html>
