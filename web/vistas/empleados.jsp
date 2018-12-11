<%@page import="dao.EmpleadosDAO"%>
<%@page import="model.TipoEmpleado"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>

<% if (E != null) { %>  
<%@page import="dao.TEmpleadoDAO"%>
<% TEmpleadoDAO T = new TEmpleadoDAO();%>

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
                        EMPLEADOS 
                        <small>Lista Empleados</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Empleados</a></li>
                        <li class="active">Lista Empleados</li>
                    </ol>
                </section>


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">


                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Vista General de Empleados </h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table  id="example3" class="table table-bordered table-striped">
                                            <thead>
                                                <tr class="bg-primary" border="1">

                                                    <th>CODIGO</th>
                                                    <th>NOMBRE</th>
                                                    <th>TIPO</th>
                                                    <th>APELLIDO</th>
                                                    <th>DNI</th>
                                                    <th>USUARIO</th>
                                                    <th>PASSWORD</th>
                                                    <th>TELEFONO</th>
                                                    <th>EMAIL</th>
                                                    <th>ESTADO</th>
                                                    <th width="70">ACCIONES</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Empleados emp : EmpleadosDAO.ListaEmpleados()) {%> 
                                                <tr>
                                                    <td width='5'><%= emp.getCod_empleados()%></td>
                                                    <td width='5'><%= emp.getNombres()%></td>
                                                    <td width='5'><%=  T.Cod_Tipo(emp.getCod_tipoem())%></td>
                                                    <td width='5'><%= emp.getApellidos()%></td>
                                                    <td width='5'><%= emp.getDni()%></td>
                                                    <td width='5'><%= emp.getUsername()%></td> 
                                                    <td width='5'><%= emp.getPassword()%></td>
                                                    <td width='5'><%= emp.getTelefono()%></td>
                                                    <td width='5'><%= emp.getEmail()%></td>                                             
                                                    <td width='5'><%= emp.getEstado()%></td>                                             
                                                    <td> 

                                                        <a href="#?cod=<%= emp.getCod_empleados()%>">
                                                            <button type="button" class="btn btn-success btn-sm">
                                                                <span Class="glyphicon glyphicon-edit"></span>
                                                            </button>
                                                        </a>

                                                        <a href="../ServEliminaEmpleado?cod=<%= emp.getCod_empleados()%>">
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
                                    <button type="button" class="btn btn-block btn-primary btn-lg" data-toggle="modal" data-target="#modal-info">Nuevo Empleado</button>
                                </td>
                            </div>
                        </div>  
                    </div>

                    <div class="modal  fade" id="modal-info">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-primary">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title text-center">REGISTRAR EMPLEADOS</h4>
                                </div>
                                <form action="../ServEmpleado" method="POST">
                                    <div class="modal-body">

                                        <div class="input-group">
                                            <span class="input-group-addon">Tipo Empleado</span>
                                            <select class="form-control"  name="tem" id="">
                                                <option value="">-- Selecciona Tipo --</option>
                                                <%for (TipoEmpleado TP : TEmpleadoDAO.ListaTiposEm()) {%> 
                                                <option value="<%= TP.getCod_temp()%>"> <%= TP.getTempleado()%></option>
                                                <%}%> 
                                            </select>
                                        </div>
                                        <br>
                                        <div class="input-group">

                                            <span class="input-group-addon">Nombres</span>
                                            <input type="text" class="form-control" name="nom" placeholder="Nombres de Empleado"> 

                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Apellidos</span>
                                            <input type="text" class="form-control" name="ape" placeholder="Apellidos de Empleado"> 
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Dni</span>
                                            <input type="text" class="form-control" name="dni"  placeholder="Dni de Empleado"> 
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Usuario</span>
                                            <input type="text" class="form-control" name="usu"  placeholder="Uusuario de Empleado"> 
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Password</span>
                                            <input type="password" class="form-control" name="pas" placeholder="Password de Empleado"> 
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Telefono</span>
                                            <input type="text" class="form-control" name="tel" placeholder="Telefono de Empleado"> 
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Email</span>
                                            <input type="text" class="form-control" name="ema"  placeholder="Email de Empleado"> 
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Estado</span>
                                            <select class="form-control"  name="est">
                                                <option value="">-- Selecciona Estado --</option>
                                                <option value="1">ACTIVO</option>
                                                <option value="0">INACTIVO</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer bg-primary">
                                          <button type="submit" name="action" id="#" class="btn btn-success pull-left" value="Add"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
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
             });</script>  -->
    </body>
</html>
<% } else {
        response.sendRedirect("../index.jsp");
    }%>
