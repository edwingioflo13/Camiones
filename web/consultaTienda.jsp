<%-- 
    Document   : consultaTienda
    Created on : 14-nov-2018, 11:21:28
    Author     : DIEGO ACOSTA
--%>

<%@page import="modelo.Tienda"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Tienda> tienda = (ArrayList<Tienda>) request.getSession().getAttribute("tienda");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Consultar Tienda</title>
        <script>
            function regresar()
            {
                window.location = 'GestionarTienda.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Mostrar todas las Tiendas:</h1>
        <img src = "images/3.png" align="middle" width="300" height="200"/>
        <br><br>
    <center>
        <table border width="90%" style="font-size:18px; text-align: center">
            <tr>
                <td><strong>ID</strong></td>
                <td><strong>NOMBRE</strong></td>
                <td><strong>TELEFONO</strong></td>
                <td><strong>DIRECCION</strong></td>
            </tr>


            <%
                for (int i = 0; i < tienda.size(); i++) {
                    out.println("<tr>"
                            + "<td>" + tienda.get(i).getId() + "</td>"
                            + "<td>" + tienda.get(i).getNombre() + "</td>"
                            + "<td>" + tienda.get(i).getTelefono() + "</td>"
                            + "<td>" + tienda.get(i).getDireccion() + "</td></tr>");
                }
            %>
        </table>
    </center>
    <br><br>
   <%--  <button type="button" class=button onclick="regresar()">Regresar</button> --%>
</body>
</html>
