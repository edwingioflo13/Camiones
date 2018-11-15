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
                <td><strong>ID</strong></td>
                <td><strong>ALMACEN</strong></td>
                <td><strong>TIENDA</strong></td>
                <td><strong>ID VIAJE</strong></td>
                <td><strong>PESO</strong></td>
                <td><strong>VOLUMEN</strong></td>
                <td><strong>FECHAENVIO</strong></td>
                <td><strong>FECHAENTREGA</strong></td>
                <td><strong>ENVIADO</strong></td>
            </tr>


            <%
                for (int i = 0; i < pedido.size(); i++) {
                    String envio = "NO";
                    if(pedido.get(i).getEntrega() != null){
                        envio = "SI";
                    }
                    out.println("<tr>"
                            + "<td>" + pedido.get(i).getId() + "</td>"
                            + "<td>" + pedido.get(i).getAlmacen().getId() + "-" + pedido.get(i).getAlmacen().getNombre() + "</td>"
                            + "<td>" + pedido.get(i).getTienda().getId() + "-" + pedido.get(i).getTienda().getNombre() + "</td>"
                            + "<td>" + pedido.get(i).getViaje().getId() + "</td>"
                            + "<td>" + pedido.get(i).getPeso() + "</td>"
                            + "<td>" + pedido.get(i).getVolumen() + "</td>"
                            + "<td>" + pedido.get(i).getEnvio() + "</td>"
                            + "<td>" + pedido.get(i).getEntrega() + "</td>"
                            + "<td>" + envio + "</td></tr>");
                }
            %>
        </table>
    </center>
    <br><br>
</body>
</html>
