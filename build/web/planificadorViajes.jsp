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
        <title>Planificador Viajes</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>

    <br><br><br><br>
    <h1>Planificador de viajes</h1>
    <img src = "images/13.png" align="middle" width="400" height="300"/>
    <br><br><br>
    <center>
        <form action="planificar_viaje.do" method="post">
            <table>

                <tr>
                    <td>Almacen(Orig):</td>
                    <td><select name="txtAlmacen" width="100%">
                            <%
                                RegistroAlmacen servicio = new RegistroAlmacen();
                                ArrayList<Almacen> almacenes = servicio.consultaAlmacen();
                                for (int i = 0; i < almacenes.size(); i++) {
                                    out.println("<option value='" + almacenes.get(i).getId() + "'>" + almacenes.get(i).getId() + "-" + almacenes.get(i).getNombre() + "</option>");
                                }
                            %>   
                        </select></td>
                </tr>
                
                <tr>
                    <td>Tienda(Dest):</td>
                    <td><select name="txtTienda" width="100%">
                            <%
                                RegistroTienda servicio1 = new RegistroTienda();
                                ArrayList<Tienda> tiendas = servicio1.consultaTienda();
                                for (int i = 0; i < almacenes.size(); i++) {
                                    out.println("<option value='" + tiendas.get(i).getId() + "'>" + tiendas.get(i).getId() + "-" + tiendas.get(i).getNombre() + "</option>");
                                }
                            %>   
                        </select></td>
                </tr>
                
                <tr>
                    <td>Camion:</td>
                    <td><select name="txtCamion" width="100%">
                            <%
                                RegistroCamiones servicio2 = new RegistroCamiones();
                                ArrayList<Camion> camiones = servicio2.consultaCamiones();
                                for (int i = 0; i < camiones.size(); i++) {
                                    out.println("<option value='" + camiones.get(i).getPlaca() + "'>" + camiones.get(i).getPlaca() + "-" + camiones.get(i).getChofer().getNombre()+ " " + camiones.get(i).getChofer().getApellido()+ "</option>");
                                }
                            %>   
                        </select></td>
                </tr>
                
            </table>
            <br>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Generar Viaje">
        </form>
    </center>
    <br><br>
    <%-- <button type="button" class=button onclick="regresar()">Regresar</button> --%>

</html>
