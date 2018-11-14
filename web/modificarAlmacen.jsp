<%-- 
    Document   : modificarAlmacen
    Created on : 13-nov-2018, 22:55:12
    Author     : DIEGO ACOSTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Registrar Almacenes</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionaAlmacen.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Ingrese los nuevos datos del almacen que desea modificar:</h1>
        <img src = "images/4.png" align="middle" width="200" height="200"/>
        <br><br><br>
    <center>
        <form name="modificar" action="modifica_almacen.do" method="POST">
            <table>
                <tr>
                    <td>Código:</td>
                    <td><input type="text" name="txtId" placeholder="C001" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
                <tr>
                    <td>Placa:</td>
                    <td><input type="text" name="txtNombre" placeholder="PYI0899" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
                <tr>
                    <td>Volumen:</td>
                    <td><input type="text" name="txtTelefono" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Peso:</td>
                    <td><input type="text" name="txtDireccion" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
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

