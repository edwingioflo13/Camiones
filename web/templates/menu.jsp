<%-- 
    Document   : menu
    Created on : 14/11/2018, 0:03:57
    Author     : t4nk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/Camiones/templates/menu.css">
        <script src="/Camiones/templates/menu.js"></script>
        <link rel="shortcut icon" href="/Camiones/images/icono.ico" type="image/x-icon"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!------ Include the above in your HEAD tag ---------->

        <!-- Ace Responsive Menu -->
        <nav>
            <!-- Menu Toggle btn-->

            <!-- Responsive Menu Structure-->
            <!--Note: declare the Menu style in the data-menu-style="horizontal" (options: horizontal, vertical, accordion) -->
            <ul id="respMenu" class="ace-responsive-menu" data-menu-style="horizontal">
                <li>
                    <a href="javascript:;">
                        <i class="fa fa-home" aria-hidden="true"></i>
                        <span class="title">CAMIONES MONSTER</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <i class="fa-cube" aria-hidden="true"></i>
                        <span class="title">Almacenes</span>

                    </a>
                    <!-- Level Two-->
                    <ul>
                        <li>
                            <a href="/Camiones/registroAlmacen.jsp">Registrar</a>
                        </li>
                        <li>
                            <a href="/Camiones/consultar_almacen.do">Buscar</a>
                        </li>
                        <li>
                            <a href="/Camiones/modificarAlmacen.jsp">Editar</a>
                        </li>
                        <li>
                            <a href="/Camiones/eliminarAlmacen.jsp">Eliminar</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="fa-cube" aria-hidden="true"></i>
                        <span class="title">Tiendas</span>

                    </a>
                    <!-- Level Two-->
                    <ul>
                        <li>
                            <a href="/Camiones/registroTienda.jsp">Registrar</a>
                        </li>
                        <li>
                            <a href="/Camiones/consultar_tienda.do">Buscar</a>
                        </li>
                        <li>
                            <a href="/Camiones/modificarTienda.jsp">Editar</a>
                        </li>
                        <li>
                            <a href="/Camiones/eliminarTienda.jsp">Eliminar</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="fa-cube" aria-hidden="true"></i>
                        <span class="title">Camiones</span>

                    </a>
                    <!-- Level Two-->
                    <ul>
                        <li>
                            <a href="/Camiones/RegistroCamiones.jsp">Registrar</a>
                        </li>
                        <li>
                            <a href="/Camiones/consultar_camiones.do">Buscar</a>
                        </li>
                        <li>
                            <a href="/Camiones/ModificarCamiones.jsp">Editar</a>
                        </li>
                        <li>
                            <a href="/Camiones/EliminarCamiones.jsp">Eliminar</a>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="javascript:;">
                        <i class="fa-cube" aria-hidden="true"></i>
                        <span class="title">Pedidos</span>

                    </a>
                    <!-- Level Two-->
                    <ul>
                        <li>
                            <a href="#">Registrar</a>
                        </li>
                        <li>
                            <a href="#">Buscar</a>
                        </li>
                        <li>
                            <a href="#">Editar</a>
                        </li>
                        <li>
                            <a href="#">Eliminar</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="fa-cube" aria-hidden="true"></i>
                        <span class="title">Viajes</span>

                    </a>
                    <!-- Level Two-->
                    <ul>
                        <li>
                            <a href="#">Registrar</a>
                        </li>
                        <li>
                            <a href="#">Buscar</a>
                        </li>
                        <li>
                            <a href="#">Editar</a>
                        </li>
                        <li>
                            <a href="#">Eliminar</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="fa-cube" aria-hidden="true"></i>
                        <span class="title">Choferes</span>

                    </a>
                    <!-- Level Two-->
                    <ul>
                        <li>
                            <a href="/Camiones/registroChofer.jsp">Registrar</a>
                        </li>
                        <li>
                            <a href="/Camiones/consultar_chofer.do">Buscar</a>
                        </li>
                        <li>
                            <a href="/Camiones/modificarChofer.jsp">Editar</a>
                        </li>
                        <li>
                            <a href="/Camiones/eliminarChofer.jsp">Eliminar</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="fa-cube" aria-hidden="true"></i>
                        <span class="title">Usuarios</span>

                    </a>
                    <!-- Level Two-->
                    <ul>
                        <li>
                            <a href="/Camiones/registroUsuario.jsp">Registrar</a>
                        </li>
                        <li>
                            <a href="/Camiones/consultar_usuario.do">Buscar</a>
                        </li>
                        <li>
                            <a href="/Camiones/modificarUsuario.jsp">Editar</a>
                        </li>
                        <li>
                            <a href="/Camiones/eliminarUsuario.jsp">Eliminar</a>
                        </li>
                    </ul>
                </li>


            </ul>
        </nav>
        <!--Plugin Initialization-->
        <script type="text/javascript">
            $(document).ready(function () {
                $("#respMenu").aceResponsiveMenu({
                    resizeWidth: '768', // Set the same in Media query       
                    animationSpeed: 'fast', //slow, medium, fast
                    accoridonExpAll: false //Expands all the accordion menu on click
                });
            });
        </script>
    </body>
</html>
