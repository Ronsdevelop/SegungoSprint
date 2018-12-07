<%@page import="model.TipoEmpleado"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% if (E != null) { %>   
<%@page import="dao.EstadoHabitacionDAO"%>
<%@page import="model.EstadoHabitacion"%>
<%@page import="dao.NivelDAO"%>
<%@page import="model.Niveles"%>
<%@page import="dao.TipoHabitacionDAO"%>
<%@page import="model.TipoHabitacion"%>
<%@page import="dao.HabitacionDAO"%>
<%@page import="model.Habitacion"%>
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
                        HABITACIONES
                        <small>Lista Habitaciones</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Habitaciones</a></li>
                        <li class="active">Lista Habitaciones</li>
                    </ol>
                </section>


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">


                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Vista General de Habitaciones</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table style="table-layout: fixed;"  id="example3" class="table table-bordered table-striped">
                                            <thead>
                                                <tr class="bg-primary" border="1">
                                                    <th>CODIGO</th>
                                                    <th>NUMERO</th>
                                                    <th>PRECIO</th>
                                                    <th>DESCRIPCION</th>
                                                    <th>TIPO HABITACION</th>
                                                    <th>NIVEL</th>
                                                    <th>ESTADO</th>
                                                    <th width="70" >ACCIONES</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Habitacion hab : HabitacionDAO.ListaHabitacion()) {%> 
                                                <tr>
                                                    <td width='5'><%= hab.getCod_habitacion()%></td>
                                                    <td width='5'><%= hab.getNumero()%></td>
                                                    <td width='5'><%= hab.getPrecio()%></td>
                                                    <td width='5'><%= hab.getDescripcion()%></td>
                                                    <td width='5'><%= TipoHabitacionDAO.getTipo(hab.getCod_tipoh()) %></td>
                                                    <td width='5'><%= NivelDAO.getPiso(hab.getCod_nivel()) %></td>
                                                    <td width='5'><%= EstadoHabitacionDAO.getEstado(hab.getCod_estado()) %></td>
                                                    <td> 

                                                        <a href="#?cod=<%= hab.getCod_habitacion()%>">
                                                            <button type="button" class="btn btn-success btn-sm">
                                                                <span Class="glyphicon glyphicon-edit"></span>
                                                            </button>
                                                        </a>

                                                        <a href="../ServEliminahabitacion?cod=<%= hab.getCod_habitacion()%>">
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
                                    <button type="button" class="btn btn-block btn-primary btn-lg" data-toggle="modal" data-target="#modal-info">Nueva Habitacion</button>
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
                                    <h4 class="modal-title">Registrar Habitacion</h4>
                                </div>
                                <form action="../Servlethabitacion" method="POST">
                                    <div class="modal-body">
                                        <table class="table">
                                              <tr>
                                                <td>
                                                    <label for="">Piso : </label>
                                                    <select class="form-control" name="niv">
                                                        <option value="">-- Selecciona Nivel --</option>
                                                        <%for (Niveles niv : NivelDAO.listarniveles()) {%>
                                                        <option value="<%= niv.getCod_nivel()%>"><%= niv.getNom_nivel()%></option>
                                                        <%}%>
                                                    </select>
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Numero : </label>
                                                    <input type="text" class="form-control" name="num" required> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Precio : </label>
                                                    <input type="number" class="form-control" name="pre" required> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Descripcion : </label>
                                                    <input type="text" class="form-control" name="des" required> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Tipo Habitacion : </label>
                                                    <select class="form-control"  name="tip" >
                                                        <option value="">-- Selecciona Tipo --</option>
                                                        <%for (TipoHabitacion th : TipoHabitacionDAO.ListaTipoHAbitacion()) {%> 
                                                        <option value="<%= th.getCod_tipoh()%>"> <%= th.getTipo_habitacion()%></option>
                                                        <%}%> 
                                                    </select>
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
        
        <!--<script>
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
