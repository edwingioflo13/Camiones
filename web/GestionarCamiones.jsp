<%-- 
    Document   : GestionarCamiones
    Created on : 10/11/2018, 15:29:20
    Author     : t4nk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos1.css">
        <title>Gestionar Camiones</title>
        <script>
            function regresar()
            {
                window.location = 'inicio.jsp';
            }
            function consultar()
            {
                window.location = '/Camiones/consultar_camiones.do';
            }
            function registrar()
            {
                window.location = 'RegistroCamiones.jsp';
            }
            function eliminar()
            {
                window.location = 'EliminarCamiones.jsp';
            }
            function modificar()
            {
                window.location = 'ModificarCamiones.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Gestionar Camiones</h1>
        <img src = "images/1.png" align="middle" width="500" height="300"/>
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
