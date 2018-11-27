
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% if (E != null) { %>  

<%@page import="model.Empleados"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include  page="../html/head.jsp"/>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../html/header.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        PRINCIPAL

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Principal</a></li>

                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">

                    <!-- CONTENIDO DE LA PAGINA -->

                    <div class="row panel_modulos">
                        <div class="col-md-3">
                            <!-- Info Boxes Style 2 -->
                            <div class="info-box bg-yellow">
                                <span class="info-box-icon"><i class="fa fa-hotel"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Total Habitaciones</span>
                                    <span class="info-box-number">15</span>

                                </div>
                                <!-- /.info-box-content -->
                            </div>                      

                        </div>
                        <div class="col-md-3">
                            <!-- Info Boxes Style 2 -->
                            <div class="info-box bg-green">
                                <span class="info-box-icon"><i class="fa fa-hotel"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Total Habitaciones</span>
                                    <span class="info-box-number">15</span>

                                </div>
                                <!-- /.info-box-content -->
                            </div>                      

                        </div>
                        <div class="col-md-3">
                            <!-- Info Boxes Style 2 -->
                            <div class="info-box bg-aqua-gradient">
                                <span class="info-box-icon"><i class="fa fa-hotel"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Total Habitaciones</span>
                                    <span class="info-box-number">15</span>

                                </div>
                                <!-- /.info-box-content -->
                            </div>                      

                        </div>

                        <div class="col-md-3">
                            <!-- Info Boxes Style 2 -->
                            <div class="info-box bg-fuchsia-active">
                                <span class="info-box-icon"><i class="fa fa-hotel"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Total Habitaciones</span>
                                    <span class="info-box-number">15</span>

                                </div>
                                <!-- /.info-box-content -->
                            </div>                      

                        </div> 
                    </div>





                    <h2 class="container-fluid bg-blue-active text-white text-center mh-50">

                        RESUMEN DE HABITACION
                    </h2>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">HABITACIONES OCUPADAS</h3>
                                    
                                  


                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr class="bg-green-active" border="1">
                                                <th>C&oacute;digo</th>
                                                <th>Nombre</th>
                                                <th>Apellido Paterno</th>
                                                <th>Apellido Materno</th>
                                                <th>Direccion</th>
                                                <th>Telefono</th>
                                                <th>Email</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Cliente Cli : ClienteDAO.listarClientes()) {%> 
                                            <tr>
                                                <td width='5'><%= Cli.getCod_cliente()%></td>
                                                <td width='5'><%= Cli.getNombres()%></td>
                                                <td width='5'><%= Cli.getApellidos()%></td>
                                                <td width='5'><%= Cli.getTipo_doc()%></td>
                                                <td width='5'><%= Cli.getDireccion()%></td>
                                                <td width='5'><%= Cli.getFono()%></td>
                                                <td width='5'><%= Cli.getEmail()%></td>


                                            </tr>
                                            <%}%> 


                                        </tbody>                                       
                                    </table>
                                </div>
                                <!-- ./box-body -->

                                <!-- /.box-footer -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>

                    <!--GRAFICA COMPRAS-->
                    <div class="row">

                        <div class="col-lg-6 col-xs-12">

                            <div class="box">

                                <div class="box-body">

                                    <h2 class="bg-primary text-white col-lg-12 text-center">RESUMEN DE COMPRAS DEL AÑO  </h2>


                                    <!--GRAFICA-->

                                    <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>


                                </div><!--fin box-body-->
                            </div><!--fin box-->
                        </div><!--col-sm-->


                        <!--GRAFICA VENTAS-->
                        <div class="col-lg-6 col-xs-12">

                            <div class="box">

                                <div class="box-body">

                                    <h2 class="bg-red text-white col-lg-12 text-center">RESUMEN DE VENTAS DEL AÑO  </h2>


                                    <!--GRAFICA-->
                                    <div id="container_ventas" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>



                                </div><!--fin box-body-->
                            </div><!--fin box-->
                        </div><!--col-sm-->

                    </div><!--fin row-->


                </section>
            </div>
            <jsp:include page="../html/footer.jsp" />

        </div>
        <jsp:include page="../html/scripts.html"  />
        <script>
            $(function () {
                $('#example1').DataTable()
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                })
            })</script>  

    </body>
</html>

<% } else {
        response.sendRedirect("../index.jsp");
    }%>