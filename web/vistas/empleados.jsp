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
                                        <table id="example3" class="table table-bordered table-striped">
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
                                                    <th>ACCIONES</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Empleados emp : EmpleadosDAO.ListaEmpleados()) {%> 
                                                <tr>
                                                    <td width='5'><%= emp.getCod_empleados()%></td>
                                                    <td width='5'><%= emp.getNombres()%></td>
                                                    <td width='5'><%=  T.Cod_Tipo(emp.getCod_tipoem()) %></td>
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

                    <div class="modal modal-info fade" id="modal-info">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Registrar Empleados</h4>
                                </div>
                                <form action="../ServEmpleado" method="POST">
                                    <div class="modal-body">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <label for="#">Tipo_Empleado</label>
                                                    <select class="form-control"  name="tem" id="">
                                                        <option value="">-- Selecciona Tipo --</option>
                                                        <%for (TipoEmpleado TP : TEmpleadoDAO.ListaTiposEm()) {%> 
                                                        <option value="<%= TP.getCod_temp()%>"> <%= TP.getTempleado()%></option>
                                                        <%}%> 
                                                    </select>
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Nombres : </label>
                                                    <input type="text" class="form-control" name="nom"> 
                                                </td> 
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label for="">Apellido : </label>
                                                    <input type="text" class="form-control" name="ape"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Dni : </label>
                                                    <input type="text" class="form-control" name="dni"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Usuario : </label>
                                                    <input type="text" class="form-control" name="usu"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Password : </label>
                                                    <input type="text" class="form-control" name="pas"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Telefono : </label>
                                                    <input type="text" class="form-control" name="tel"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Email : </label>
                                                    <input type="text" class="form-control" name="ema"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Estado</label>
                                                    <select class="form-control"  name="est">
                                                        <option value="">-- Selecciona Estado --</option>
                                                        <option value="1">ACTIVO</option>
                                                        <option value="0">INACTIVO</option>
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
