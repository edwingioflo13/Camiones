<%-- 
    Document   : RegistroCamiones
    Created on : 10/11/2018, 15:36:09
    Author     : t4nk
--%>
<%@page import="controlador.chofer.RegistroChofer"%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Camion"%>
<%@page import="modelo.Chofer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/templates/menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/Camiones/images/icono.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="/Camiones/estilos2.css">
        <title>Registrar Chofer</title>
        <script src="validaciones.js"></script>
        <script>
            function regresar()
            {
                window.location = 'GestionarCamiones.jsp';
            }
        </script>
    </head>

    <br><br><br><br>
    <h1>Registro de Choferes:</h1>
    <img src = "images/7.png" align="middle" width="300" height="300"/>
    <br><br>
    <center>
        <form action="registro_chofer.do" method="post">
            <table>

                <tr>
                    <td>Cedula:</td>
                    <td><input type="text" name="txtCedula" placeholder="1900481357" onkeypress="return validaNumero(event)"></td>
                </tr>

                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre" placeholder="Edwin" onkeypress="return validaLetras(event)"></td>
                </tr>
                
                <tr>
                    <td>Apellido:</td>
                    <td><input type="text" name="txtApellido" placeholder="0.00" onkeypress="return validaLetras(event)"></td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><input type="text" name="txtDireccion" placeholder="0.00" onkeypress="return validaLetrasyNumeros(event)"></td>
                </tr>
                <tr>
                    <td>Licencia:</td>
                    <td><select name="txtLicencia">
                            <option value='A'>A</option>;
                            <option value='B'>B</option>;
                            <option value='C'>C</option>;
                            <option value='D'>D</option>;
                            <option value='E'>E</option>;
                        </select></td>
                </tr>
                <tr>
                    <td>Sueldo:</td>
                    <td><input type="text" name="txtSueldo" placeholder="0.00" onkeypress="return validaNumero(event)"></td>
                </tr>
            </table>
            <br>
            <p><strong>${message}</strong></p>
            <br>
            <input type="submit" value="Registrar...">
        </form>
    </center>
    <br><br>

</html>
