<%@page import="model.TipoEmpleado"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% if (E != null) { %>   
<%@page import="dao.NivelDAO"%>
<%@page import="model.Niveles"%>
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
                       NIVELES
                        <small>Lista Niveles</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Niveles</a></li>
                        <li class="active">Lista Niveles</li>
                    </ol>
                </section>


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">


                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Vista General de Niveles</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <%=(request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "")%>

                                        <table id="example3" class="table table-bordered table-striped">
                                            <thead>
                                                <tr class="bg-primary" border="1">
                                                    <th>CODIGO</th>
                                                    <th>NIVEL</th>
                                                    <th>OPERACIONES</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Niveles th : NivelDAO.listarniveles()) {%> 
                                                <tr>
                                                    <td width='5'><%= th.getCod_nivel()%></td>
                                                    <td width='5'><%= th.getNom_nivel()%></td>
                                                    <td> 

                                                        <a href="#?cod=<%= th.getCod_nivel()%>">
                                                            <button type="button" class="btn btn-success btn-sm">
                                                                <span Class="glyphicon glyphicon-edit"></span>
                                                            </button>
                                                        </a>

                                                        <a href="../Servleteliminarnivel?cod=<%= th.getCod_nivel()%>">
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
                                    <button type="button" class="btn btn-block btn-primary btn-lg" data-toggle="modal" data-target="#modal-info">Nuevo Nivel</button>
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
                                    <h4 class="modal-title">Registrar Nivel</h4>
                                </div>
                                <form action="../ingresanivel" method="POST">
                                    <div class="modal-body">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <label for="">Nivel : </label>
                                                    <input type="text" class="form-control" name="niv" required> 
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
            });</script>  
    </body>
</html>


<% } else {
        response.sendRedirect("../index.jsp");
    }%>
