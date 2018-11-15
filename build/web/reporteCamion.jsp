<%-- 
    Document   : RegistroCamiones
    Created on : 10/11/2018, 15:36:09
    Author     : t4nk
--%>
<%@page import="modelo.Camion"%>
<%@page import="controlador.camion.RegistroCamiones"%>
<%@page import="controlador.tienda.RegistroTienda"%>
<%@page import="controlador.almacen.RegistroAlmacen"%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Almacen"%>
<%@page import="modelo.Tienda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Reporte de Camiones</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>

    <br><br><br><br>
    <h1>Reporte de Camiones</h1>
    <img src = "images/2.png" align="middle" width="400" height="300"/>
    <br><br><br>
    <center>
        <form action="reporte_camion.do" method="post">


            <input type="submit" value="Generar Reporte">
            <br><br><br>
            <p><strong>${message}</strong></p>
            <br>
        </form>
    </center>
    <br><br>
</html>
