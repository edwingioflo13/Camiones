<%-- 
    Document   : consultaPedido
    Created on : 15-nov-2018, 0:58:19
    Author     : DIEGO ACOSTA
--%>

<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Pedido> pedido = (ArrayList<Pedido>) request.getSession().getAttribute("pedido");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos2.css">
        <title>Consultar Pedido</title>
        <script>
            function regresar()
            {
                window.location = 'GestionarPedidos.jsp';
            }
        </script>
    </head>
    <body>
        <br><br><br><br>
        <h1>Mostrar todas los pedidos:</h1>
        <img src = "images/12.png" align="middle" width="400" height="300"/>
        <br><br>
    <center>
        <table border width="90%" style="font-size:18px; text-align: center">
            <tr>
                <td><strong>ID_PEDIDO</strong></td>
                <td><strong>ID_ALMACEN</strong></td>
                <td><strong>ID_TIENDA</strong></td>
                <td><strong>ID_VIAJE</strong></td>
                <td><strong>PESO_PEDIDO</strong></td>
                <td><strong>VOLUMEN_PEDIDO</strong></td>
                <td><strong>FECHAENVIO_PEDIDO</strong></td>
                <td><strong>FECHAENTREGA_PEDIDO</strong></td>
            </tr>


             <%
                for (int i = 0; i < pedido.size(); i++) {
                    out.println("<tr>"
                            + "<td>" + pedido.get(i).getId() + "</td>"
                            + "<td>" + pedido.get(i).getAlmacen() + "</td>"
                            + "<td>" + pedido.get(i).getTienda() + "</td>"
                            + "<td>" + pedido.get(i).getViaje() + "</td>"
                            + "<td>" + pedido.get(i).getPeso() + "</td>"
                            + "<td>" + pedido.get(i).getVolumen() + "</td>"
                            + "<td>" + pedido.get(i).getEnvio() + "</td>"
                            + "<td>" + pedido.get(i).getEntrega() + "</td></tr>");
                }
            %>
        </table>
    </center>
    <br><br>
</body>
</html>
