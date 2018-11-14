<%-- 
    Document   : consultaAlmacen
    Created on : 13-nov-2018, 20:53:38
    Author     : DIEGO ACOSTA
--%>

<%@page import="modelo.Almacen"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Almacen> almacen = (ArrayList<Almacen>) request.getSession().getAttribute("almacen");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Consultar Almacenes</title>
        <script>
            function regresar()
            {
                window.location = 'GestionarAlmacen.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Mostrar todos los Almacenes:</h1>
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
                for (int i = 0; i < almacen.size(); i++) {
                    out.println("<tr>"
                            + "<td>" + almacen.get(i).getId() + "</td>"
                            + "<td>" + almacen.get(i).getNombre() + "</td>"
                            + "<td>" + almacen.get(i).getTelefono() + "</td>"
                            + "<td>" + almacen.get(i).getDireccion() + "</td></tr>");
                }
            %>
        </table>
    </center>
    <br><br>
    <button type="button" class=button onclick="regresar()">Regresar</button>
</body>
</html>
