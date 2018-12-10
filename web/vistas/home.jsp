
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% if (E != null) {%> 
<%@page import="dao.Consultas"%>
<%@page import="dao.Conexion"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="dao.HabitacionDAO"%>
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
                        <i class="fa fa-home"></i>  PRINCIPAL

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
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-light-blue">
                                <div class="inner">
                                    <h3><%= HabitacionDAO.CantHabitacion()%></h3>

                                    <p>Habitaciones</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-hotel"></i>
                                </div>
                                <a href="habitaciones.jsp" class="small-box-footer">
                                    Mas info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3><%= HabitacionDAO.HabReservadas()%></h3>

                                    <p>Reservadas</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-hotel"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    Mas info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3><%= HabitacionDAO.HabOcupadas()%></h3>

                                    <p>Ocupadas</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-hotel"></i>
                                </div>
                                <a href="checkout.jsp" class="small-box-footer">
                                    Mas info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3><%= HabitacionDAO.HabDisponibles()%></h3>

                                    <p>Disponibles</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-hotel"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    Mas info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>



                    </div>



                    <div class="row">
                        <div class="col-md-12">
                            <div class="box">
                                <h2 class="container-fluid bg-blue-active text-white text-center mh-50">

                                    LISTA DE HABITACIONES OCUPADAS
                                </h2>

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example3" class="table table-bordered table-striped" style="table-layout: fixed">
                                        <thead>
                                            <tr class="bg-green-active" border="1">
                                                <th width="20">#</th>
                                                <th>Cliente </th>
                                                <th width="170">Nro Documento</th>
                                                <th width="70">Habitacion</th>
                                                <th width="120">Tipo</th>
                                                <th width="80">F. Ingreso</th>
                                                <th width="80">H. Ingreso</th>                                              

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Consultas v = new Consultas();
                                                Conexion cn = new Conexion();
                                                DefaultTableModel t = new DefaultTableModel();
                                                t = v.ListaHabOcupadas(cn.conectar());
                                                for (int i = 0; i < t.getRowCount(); i++) {
                                            %>
                                            <tr>
                                                <td><%= i + 1%></td>
                                                <td><%= t.getValueAt(i, 0)%></td>
                                                <td><%= t.getValueAt(i, 1)%></td>
                                                <td><%= t.getValueAt(i, 2)%></td>
                                                <td><%= t.getValueAt(i, 3)%></td>
                                                <td><%= t.getValueAt(i, 4)%></td>
                                                <td><%= t.getValueAt(i, 5)%></td>
                                            </tr>
                                            <% } %>

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
            $(document).ready(function () {
                var table = $('#example3').DataTable({
                    responsive: true,
                    searching: false,
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                    },
                    lengthMenu: [
                        [10, 25, 50, -1],
                        ['10 Filas', '25 Filas', '50 Filas', 'Todos']
                    ],

                });

                new $.fn.dataTable.FixedHeader(table);
            });
        </script>

        <!--
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
            })</script>  -->

    </body>
</html>

<% } else {
        response.sendRedirect("../index.jsp");
    }%>