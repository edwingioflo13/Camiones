<%-- 
    Document   : consultaCamiones
    Created on : 10/11/2018, 15:45:24
    Author     : t4nk
--%>

<%@page import="modelo.Camion"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Camion> camiones = (ArrayList<Camion>) request.getSession().getAttribute("camiones");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Consultar Camiones</title>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>
    <body>
        <h1>Mostrar todos los camiones:</h1>
        <img src = "images/3.png" align="middle" width="300" height="200"/>
        <br><br>
    <center>
        <table border width="90%" style="font-size:18px; text-align: center">
            <tr>
                <td><strong>PLACA</strong></td>
                <td><strong>VOLUMEN</strong></td>
                <td><strong>PESO</strong></td>
                <td><strong>ESTADO</strong></td>
            </tr>


            <%
                for (int i = 0; i < camiones.size(); i++) {
                    out.println("<tr>"
                            + "<td>" + camiones.get(i).getPlaca() + "</td>"
                            + "<td>" + camiones.get(i).getVolumen() + "</td>"
                            + "<td>" + camiones.get(i).getPeso() + "</td>"
                            + "<td>" + camiones.get(i).getEstado() + "</td></tr>");
                }
            %>
        </table>
    </center>
    <br><br>
    <button type="button" class=button onclick="regresar()">Regresar</button>
</body>
</html>
