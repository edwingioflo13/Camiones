<%-- 
    Document   : RegistroCamiones
    Created on : 10/11/2018, 15:36:09
    Author     : t4nk
--%>
<%@page import="controlador.camion.RegistroCamiones"%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Camion"%>
<%@page import="modelo.Chofer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="estilos2.css">
        <title>Registrar Camiones</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>

    <br><br><br><br>
    <h1>Registro de camiones:</h1>
    <img src = "images/2.png" align="middle" width="400" height="300"/>
    <br><br><br>
    <center>
        <form action="registro_camiones.do" method="post">
            <table>

                <tr>
                    <td>Placa:</td>
                    <td><input type="text" name="txtPlaca" placeholder="PYI0899" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>

                <tr>
                    <td>Chofer:</td>
                    <td><select name="txtChofer" width="100%">
                            <%
                                RegistroCamiones servicio = new RegistroCamiones();
                                ArrayList<Chofer> choferes = servicio.consultaChofer();
                                //ArrayList<Camion> camiones = (ArrayList<Camion>) request.getSession().getAttribute("camiones");
                                for (int i = 0; i < choferes.size(); i++) {
                                    out.println("<option value='" + choferes.get(i).getCedula() + "'>" + choferes.get(i).getNombre() + " " + choferes.get(i).getApellido() + "</option>");
                                }

                            %>   
                        </select></td>
                </tr>


                <tr>
                    <td>Volumen:</td>
                    <td><input type="text" name="txtVolumen" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Peso:</td>
                    <td><input type="text" name="txtPeso" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
                <tr>
                    <td>Estado:</td>
                    <td><select name="txtEstado">

                            <option value='ACTIVO'>ACTIVO</option>;
                            <option value='INACTIVO'>INACTIVO</option>;

                        </select></td>
                </tr>
            </table>
            <br>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Registrar...">
        </form>
    </center>
    <br><br>
    <%-- <button type="button" class=button onclick="regresar()">Regresar</button> --%>

</html>
