<%-- 
    Document   : RegistroCamiones
    Created on : 10/11/2018, 15:36:09
    Author     : t4nk
--%>
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
        <title>Despacho Pedidos</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>

    <br><br><br><br>
    <h1>Ingrese el numero de guia del pedidos ha despachar</h1>
    <img src = "images/13.png" align="middle" width="400" height="300"/>
    <br><br><br>
    <center>
        <form action="despacho_pedido.do" method="post">
            <table>

                <tr>
                    <td>Guia:</td>
                    <td><input type="text" name="txtId" placeholder="00" onkeypress="return validaNumero(event)"></td>
                </tr>
            </table>
            <br>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Despachar...">
        </form>
    </center>
    <br><br>
    <%-- <button type="button" class=button onclick="regresar()">Regresar</button> --%>

</html>
