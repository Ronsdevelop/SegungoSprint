
<%@page import="model.TipoEmpleado"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<%@page import="java.util.Date" %>


<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% Consultas c = new Consultas(); %>
<% TipoEmpleado T = c.getCargo(E.getCod_tipoem());%>




<header class="main-header">
    <!-- Logo -->
    <a href="../vistas/home.jsp" class="logo">

        <span class="logo-lg"><b>LAS AMERICAS</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">

        </a>


        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../Publico/dist/img/avatar5.png" class="user-image" alt="User Image">
                        <span class="hidden-xs"><%=T.getTempleado()%></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="../Publico/dist/img/avatar5.png" class="img-circle" alt="User Image">

                            <p>
                                <%= E.getNombres() + " " + E.getApellidos()%>
                                <small> Diciembre 2018</small>
                            </p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a  data-toggle="modal" data-target="#modal-info" class="btn btn-default btn-flat">Perfil</a>
                            </div>
                            <div class="pull-right">
                                <a href="../CerrarSesionServlet" class="btn btn-default btn-flat">Salir</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->

            </ul>
        </div>
    </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">

            <!-- Optionally, you can add icons to the links -->
            <li class="header">MENU DE NAVEGACION</li>
            <li>
                <a href="../vistas/home.jsp">
                    <i class="fa fa-home"></i> <span>Inicio</span>
                </a>
            </li>


            <% if (T.getCod_temp() == 1 || T.getCod_temp() == 2) { %>
            <li><a href="recepcion.jsp"><i class="fa fa-bed"></i> <span>Recepcion</span></a></li>
            <li><a href="checkout.jsp"><i class="fa fa-sign-out"></i> <span>Check Out</span></a></li>
            <li><a href="reservas.jsp"><i class="fa fa-calendar"></i> <span>Reservas</span></a></li>
            <li><a href="Clientes.jsp"><i class="fa fa-users"></i> <span>Clientes</span></a></li>
            <li><a href="venta.jsp"><i class="fa fa-newspaper-o"></i> <span>Facturacion</span></a></li>
                <% }
                    if (T.getCod_temp() == 1 || T.getCod_temp() == 3) { %>
            <li><a href="#"><i class="fa fa-money"></i> <span>Modulo Caja</span></a></li>

            <% }
                if (T.getCod_temp() == 1 || T.getCod_temp() == 4) { %>
            <li><a href="limpieza.jsp"><i class="fa fa-bath"></i> <span>Limpieza</span></a></li> 
                <% }
                    if (T.getCod_temp() == 1) { %>
            <li class="treeview">
                <a href="#"><i class="fa fa-bank"></i> <span>Habitaciones</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="habitaciones.jsp" >Habitacion</a></li>
                    <li><a href="niveles.jsp">Niveles</a></li>
                    <li><a href="tipohabitacion.jsp">Tipos</a></li>
                    <li><a href="estadohabitacion.jsp">Estados</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#"><i class="fa fa-cog"></i> <span>Administracion</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="empleados.jsp">Empleados</a></li>
                    <li><a href="#">Forma de Pago</a></li>
                    <li><a href="tipoempleado.jsp">Tipo de Empleado</a></li>
                    <li><a href="documentoscliente.jsp">Documento de Cliente</a></li>

                </ul>
            </li>
            <% }%>
        </ul>

    </section>
    <!-- /.sidebar -->
</aside>