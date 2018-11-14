<%-- 
    Document   : inicio
    Created on : 10/11/2018, 15:25:02
    Author     : t4nk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="estilos.css" />
        <title>Bienvenido</title>
        <script>
            function llamarGC()
            {
                window.location='GestionarCamiones.jsp';
            }
            function llamarGA()
            {
                window.location='GestionarAlmacen.jsp';
            }
            function llamarGT()
            {
                window.location='GestionarTienda.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Empresa de camiones</h1>
        <img src = "images/logistica.png" align="middle" width="400" height="300"/>
        <br><br>
        <button type="button" class=button onclick="llamarGC()">Gestionar Camiones</button>
        <br>
        <button type="button" class=button onclick="llamarGA()">Gestionar Almacenes</button>
        <br>
        <button type="button" class=button onclick="llamarGT()">Gestionar Tiendas</button>
    </body>
</html>
