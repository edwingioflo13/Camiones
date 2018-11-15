<%-- 
    Document   : eliminarAlmacen
    Created on : 13-nov-2018, 22:52:35
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
        <title>Eliminar Almacen</title>
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
        <h1>Ingrese la id del almacen que desea eliminar:</h1>
        <img src = "images/6.png" align="middle" width="400" height="300"/>
        <br><br><br>
    <center>
        <form name="eliminar" action="eliminar_almacen.do" method="POST"><table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="txtId" placeholder="00123" onkeypress="return Numeros(event)"></td>
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


