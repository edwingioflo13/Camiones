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
        <link rel="stylesheet" href="estilos2.css">
        <title>Consultar Tienda</title>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>
    <body>
        <br><br><br><br>
        <h1>Mostrar todas las tiendas:</h1>
        <img src = "images/12.png" align="middle" width="400" height="300"/>
        <br><br>
    <center>
        <table border width="90%" style="font-size:18px; text-align: center">
            <tr>
                <td><strong>CEDULA</strong></td>
                <td><strong>NOMBRE</strong></td>
                <td><strong>APELLIDO</strong></td>
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
</body>
</html>
