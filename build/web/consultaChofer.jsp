<%-- 
    Document   : consultaCamiones
    Created on : 10/11/2018, 15:45:24
    Author     : t4nk
--%>

<%@page import="modelo.Chofer"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Chofer> choferes = (ArrayList<Chofer>) request.getSession().getAttribute("choferes");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos2.css">
        <title>Consultar Choferes</title>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>
    <body>
        <br><br><br>
        <h1>Mostrar todos los choferes:</h1>
        <img src = "images/3.png" align="middle" width="300" height="200"/>
        <br><br>
    <center>
        <table border width="90%" style="font-size:18px; text-align: center">
            <tr>
                <td><strong>CEDULA</strong></td>
                <td><strong>NOMBRE</strong></td>
                <td><strong>APELLIDO</strong></td>
                <td><strong>DIRECCION</strong></td>
                <td><strong>LICENCIA</strong></td>
                <td><strong>SUELDO</strong></td>
            </tr>


            <%
                for (int i = 0; i < choferes.size(); i++) {
                    out.println("<tr>"
                            + "<td>" + choferes.get(i).getCedula() + "</td>"
                            + "<td>" + choferes.get(i).getNombre() + "</td>"
                            + "<td>" + choferes.get(i).getApellido() + "</td>"
                            + "<td>" + choferes.get(i).getDireccion() + "</td>"
                            + "<td>" + choferes.get(i).getLicencia() + "</td>"
                            + "<td>" + choferes.get(i).getSueldo() + "</td></tr>");
                }
            %>
        </table>
    </center>
    <br><br>
</body>
</html>
