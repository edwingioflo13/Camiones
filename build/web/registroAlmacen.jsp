<%-- 
    Document   : registroAlmacen
    Created on : 13/11/2018, 20:37:48
    Author     : t4nk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <h1>Registro de Almaces:</h1>
        <img src = "images/2.png" align="middle" width="400" height="300"/>
        <br><br><br>
    <center>
        <form action="registro_almacenes.do" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="txtId" placeholder="C001" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre" placeholder="PYI0899" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><input type="text" name="txtTelefono" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><input type="text" name="txtDIreccion" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
              
            </table>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Registrar...">
        </form>
    </center>
    <br><br>
    <button type="button" class=button onclick="regresar()">Regresar</button>
</body>
</html>
