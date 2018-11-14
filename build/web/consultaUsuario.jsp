<%-- 
    Document   : consultaCamiones
    Created on : 10/11/2018, 15:45:24
    Author     : t4nk
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getSession().getAttribute("usuarios");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos2.css">
        <title>Consultar Usuarios</title>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>
    <body>
        <br><br><br><br>
        <h1>Mostrar todos los usuarios:</h1>
        <img src = "images/10.png" align="middle" width="300" height="300"/>
        <br><br>
    <center>
        <table border width="90%" style="font-size:18px; text-align: center">
            <tr>
                <td><strong>ID</strong></td>
                <td><strong>NOMBRE</strong></td>
                <td><strong>APELLIDO</strong></td>
            </tr>
            <%
                for (int i = 0; i < usuarios.size(); i++) {
                    out.println("<tr>"
                            + "<td>" + usuarios.get(i).getId() + "</td>"
                            + "<td>" + usuarios.get(i).getNombre() + "</td>"
                            + "<td>" + usuarios.get(i).getApellido() + "</td></tr>");
                }
            %>
        </table>
    </center>
    <br><br>
</body>
</html>
