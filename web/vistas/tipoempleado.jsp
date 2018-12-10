<%@page import="model.TipoEmpleado"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>

<% if (E != null) { %>  

<%@page import="dao.TEmpleadoDAO"%>

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
                        TIPO EMPLEADOS
                        <small>Lista TipoEmpleados</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#breadcrumb"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Tipo Empleado</a></li>
                        <li class="active">Lista TipoEmpleado</li>
                    </ol>
                </section>


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">


                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Vista General de Tipo_Empleados</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example3" class="table table-bordered table-striped">
                                            <thead>
                                                <tr class="bg-primary" border="1">
                                                    <th>CODIGO</th>
                                                    <th>TIPO EMPLEADO</th>

                                                    <th>OPERACIONES</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (TipoEmpleado temp : TEmpleadoDAO.ListaTiposEm()) {%> 
                                                <tr>
                                                    <td width='5'><%= temp.getCod_temp()%></td>
                                                    <td width='5'><%= temp.getTempleado()%></td>

                                                    <td> 

                                                        <button type="button"  onclick="showModalEdit('<%= temp.getCod_temp()%>', '<%= temp.getTempleado()%>')" class="btn btn-success btn-sm">
                                                            <span Class="glyphicon glyphicon-edit"></span>
                                                        </button>

                                                        <a href="../ServEliminaTipo?cod=<%= temp.getCod_temp()%>">
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

                    <!-- MODAL REGISTRAR -->

                    <div class="modal modal-info fade" id="modal-info">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Registrar Tipo_Empleado</h4>
                                </div>
                                <form action="../ServIngresaTipoEmp" method="POST">
                                    <div class="modal-body">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <label for="">Tipo Empleado : </label>
                                                    <input type="text" class="form-control" name="tip" required> 
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
                    <!-- MODAL EDITAR -->
                    <div class="modal fade" id="modalEdit">
                        <div class="modal-dialog">
                            <form action="../ServModificaTipo" method="POST">
                                <div class="modal-content">

                                    <div class="modal-header bg-green ">
                                        <h4 class="modal-title text-center" id="tituloEdit"></h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="input-group">
                                            <span class="input-group-addon">Codigo</span>
                                            <input type="text" class="form-control" name="cod" id="codigoEdit" readonly="readonly" placeholder="Codigo">
                                        </div>
                                        <br>                                        
                                        <div class="input-group">
                                            <span class="input-group-addon">Nivel</span>
                                            <input type="text" class="form-control" name="tipo" id="nombreEdit" placeholder="Nivel">
                                        </div>
                                    </div>

                                    <div class="modal-footer bg-green" >
                                        <button type="submit" name="action" id="#" class="btn btn-primary pull-left" value="Add"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
                                    </div>

                                </div>
                            </form>
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
            function showModalEdit(clave, nombre) {
                document.getElementById("codigoEdit").value = clave;
                document.getElementById("nombreEdit").value = nombre;
                document.getElementById("tituloEdit").innerHTML = "EDITAR REGISTRO " + clave;
                $('#modalEdit').modal('show');

            }
        </script>
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
             });</script>  -->
    </body>
</html>
<% } else {
        response.sendRedirect("../index.jsp");
    }%>
