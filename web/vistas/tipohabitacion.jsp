<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% if (E != null) { %> 

<%@page import="dao.TipoHabitacionDAO"%>
<%@page import="model.TipoHabitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../html/head.jsp" />


    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../html/header.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        TIPO HABITACIONES 
                        <small>Lista Completa</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#breadcrumb"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Tipo Habitaciones</a></li>
                        <li class="active">Lista TipoHabitaciones</li>
                    </ol>
                </section>


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">


                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Vista General de Tipo_Habitaciones</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table  id="example3" class="table table-bordered table-striped">
                                            <thead>
                                                <tr class="bg-primary" border="1">
                                                    <th>CODIGO</th>
                                                    <th>TIPO</th>
                                                    <th>DESCRIPCION</th>
                                                    <th width="70">ACCIONES</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (TipoHabitacion th : TipoHabitacionDAO.ListaTipoHAbitacion()) {%> 
                                                <tr>
                                                    <td width='5'><%= th.getCod_tipoh()%></td>
                                                    <td width='5'><%= th.getTipo_habitacion()%></td>
                                                    <td width='5'><%= th.getDescripcion()%></td>
                                                    <td> 

                                                        <a href="#?cod=<%= th.getCod_tipoh()%>">
                                                            <button type="button" class="btn btn-success btn-sm">
                                                                <span Class="glyphicon glyphicon-edit"></span>
                                                            </button>
                                                        </a>

                                                        <a href="../ServletElimminaTipoHabitacion?cod=<%= th.getCod_tipoh()%>">
                                                            <button type="button" class="btn btn-danger btn-sm">
                                                                <span Class="glyphicon glyphicon-trash"></span>
                                                            </button>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <%}%> 


                                            </tbody>                                       
                                        </table>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>
                            <!-- /.col -->
                        </div>

                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-2">
                                <td>
                                    <button type="button" class="btn btn-block btn-primary btn-lg" data-toggle="modal" data-target="#modal-info">Nuevo Tipo</button>
                                </td>
                            </div>
                        </div>  
                    </div>

                    <div class="modal modal-info fade" id="modal-info">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4  class="modal-title text-center">REGISTRA TIPO DE HABITACION</h4>
                                </div>
                                <form action="../Servletingresatipohabitacion" method="POST">
                                    <div class="modal-body">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <label for="">Tipo_Habitacion : </label>
                                                    <input type="text" class="form-control" name="nom" required> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Descripcion : </label>
                                                    <input type="text" class="form-control" name="des" required> 
                                                </td> 
                                            </tr>

                                        </table>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-outline">Guardar</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>


                    <!-- /.row -->
                </section>
                <!-- /.content -->

            </div>
                                                <jsp:include page="../html/footer.jsp" />
        </div>
        <jsp:include page="../html/scripts.html"  />
        
         <script>
            $(document).ready(function () {
                var table = $('#example3').DataTable({
                    responsive: true,
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
       <!-- <script>
            $(function () {
                $('#example3').DataTable();
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                });
            });</script>   -->
    </body>
</html>

<% } else {
        response.sendRedirect("../index.jsp");
    }%>
