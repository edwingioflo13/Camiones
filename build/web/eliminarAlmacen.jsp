<%-- 
    Document   : eliminarAlmacen
    Created on : 13-nov-2018, 22:52:35
    Author     : DIEGO ACOSTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Eliminar Almacenes</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarAlmacen.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Ingrese el código del almacen que desea eliminar:</h1>

        <img src = "images/5.png" align="middle" width="200" height="200"/>
        <br><br><br>
    <center>
        <form name="eliminar" action="eliminar_almacen.do" method="POST"><table>
                <tr>
                    <td>Código:</td>
                    <td><input type="text" name="txtId" placeholder="C001" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
            </table>
            <p><strong>${message}</strong>
            </p><br>
            <input type="submit" value="Eliminar" />
        </form>
    </center>
    <br><br>
    
    <br><br>
    <button type="button" class=button onclick="regresar()">Regresar</button>
</body>
</html>

