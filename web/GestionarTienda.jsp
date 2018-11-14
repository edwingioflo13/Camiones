<%-- 
    Document   : GestionarTienda
    Created on : 14-nov-2018, 9:09:23
    Author     : DIEGO ACOSTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos1.css">
        <title>Gestionar Tiendas</title>
        <script>
            function regresar()
            {
                window.location = 'inicio.jsp';
            }
            function consultar()
            {
                window.location = 'consultarTienda.jsp';
            }
            function registrar()
            {
                window.location = 'registrarTienda.jsp';
            }
            function eliminar()
            {
                window.location = 'eliminarTienda.jsp';
            }
            function modificar()
            {
                window.location = 'modificarAlmacen.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Gestionar Almacenes</h1>
        <img src = "images/6.png" align="middle" width="500" height="300"/>
        <br><br>
        <button type="button" class=button onclick="registrar()">Registrar</button>
        <br><br>
        <button type="button" class=button onclick="consultar()">Consultar</button>
        <br><br>
        <button type="button" class=button onclick="modificar()">Modificar</button>
        <br><br>
        <button type="button" class=button onclick="eliminar()">Eliminar</button>
        <br><br>
        <button type="button" class=button onclick="regresar()">Regresar</button>
    </body>
</html>
