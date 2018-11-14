<%-- 
    Document   : GestionarAlmacen
    Created on : 13-nov-2018, 22:46:53
    Author     : DIEGO ACOSTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos1.css">
        <title>Gestionar Almacenes</title>
        <script>
            function regresar()
            {
                window.location = 'inicio.jsp';
            }
            function consultar()
            {
                window.location = '/Camiones/consultar_almacenes.do';
            }
            function registrar()
            {
                window.location = 'registroAlmacen.jsp';
            }
            function eliminar()
            {
                window.location = 'eliminarAlmacen.jsp';
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
