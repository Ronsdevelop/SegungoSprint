
<%@page import="model.TipoEmpleado"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>

<% if (E != null) { %>   
<% Consultas c = new Consultas(); %>
<% TipoEmpleado Tip = c.getCargo(E.getCod_tipoempleado()); %>
<%@page import="dao.ClienteDAO"%>
<%@page import="dao.TipoDocDAO"%>
<%@page import="model.Cliente"%>
<%@page import="model.DocumentoCliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../html/head.jsp" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../html/header.jsp" />

            <% if (Tip.getTempleado().equals("ADMINISTRADOR") ) {     %>       


            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        CLIENTES 
                        <small>Lista Completa</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Cliente</a></li>
                        <li class="active">Lista Clientes</li>
                    </ol>
                </section>


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">


                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Vista General de Clientes </h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example3" class="table table-bordered table-striped">
                                            <thead>
                                                <tr class="bg-primary" border="1">
                                                    <th>CODIGO</th>
                                                    <th>NOMBRES</th>
                                                    <th>APELLIDOS </th>
                                                    <th>RASON SOCIAL</th>
                                                    <th>DOCUMENTO</th>
                                                    <th>NUMERO</th>
                                                    <th>DIRECCION</th>
                                                    <th>TELEFONO</th>
                                                    <th>EMAIL</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Cliente Cli : ClienteDAO.listarClientes()) {%> 
                                                <tr>
                                                    <td width='5'><%= Cli.getCod_cliente()%></td>
                                                    <td width='5'><%= Cli.getNombres()%></td>
                                                    <td width='5'><%= Cli.getApellidos()%></td>
                                                    <td width='5'><%= Cli.getRasonsocial()%></td>
                                                    <td width='5'><%= TipoDocDAO.getDoc(Cli.getTipo_doc())%></td>
                                                    <td width='5'><%= Cli.getDocumento()%></td> 
                                                    <td width='5'><%= Cli.getDireccion()%></td>
                                                    <td width='5'><%= Cli.getFono()%></td>
                                                    <td width='5'><%= Cli.getEmail()%></td>                                             

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
                                    <button type="button" class="btn btn-block btn-primary btn-lg" data-toggle="modal" data-target="#modal-info">Nuevo Cliente</button>
                                </td>
                            </div>
                        </div>  
                    </div>

                    <div class="modal modal-primary fade" id="modal-info">
                        <div class="modal-dialog">
                            <form class="form-horizontal" method="post" id="cliente_form" action="">
                                <div class="modal-content">

                                    <div class="modal-header  ">

                                        <h4 class="modal-title text-center">AGREGAR CLIENTE </h4>
                                    </div>
                                    <div class="modal-body">


                                        <div class="form-group">
                                            <label for="inputText1" class="col-lg-1 control-label">Nombres</label>

                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombres" required pattern="^[a-zA-Z_áéíóúñ\s]{0,30}$">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputText1" class="col-lg-1 control-label">Apellidos</label>

                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellidos" required pattern="^[a-zA-Z_áéíóúñ\s]{0,30}$">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputText1" class="col-lg-1 control-label">Rason Social</label>

                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="text" class="form-control" id="apellido" name="rason" placeholder="Rason Social" required pattern="^[a-zA-Z_áéíóúñ\s]{0,30}$">
                                            </div>
                                        </div>                                     

                                        <div class="form-group">
                                            <label for="inputText4" class="col-lg-1 control-label">Tipo Documento</label>

                                            <div class="col-lg-9 col-lg-offset-1">

                                                <select class="form-control" id="estado" name="estado" required>
                                                    <option value="">-- Selecciona Documento --</option>
                                                    <% for (DocumentoCliente Doc : TipoDocDAO.ListarDoc()) {%>
                                                    <option value="<%= Doc.getCod_tipodoc()%> "><%= Doc.getTipodocum()%></option>     
                                                    <%}%>                                                   

                                                </select>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputText4" class="col-lg-1 control-label">Documento</label>

                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="text" class="form-control" id="telefono" name="documento" placeholder="Documento Identificador" required pattern="[0-9]{0,15}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputText5" class="col-lg-1 control-label">Dirección</label>

                                            <div class="col-lg-9 col-lg-offset-1">
                                                <textarea class="form-control  col-lg-5" rows="3" id="direccion" name="direccion"  placeholder="Direccion ..." required pattern="^[a-zA-Z0-9_áéíóúñ°\s]{0,200}$"></textarea>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="inputText4" class="col-lg-1 control-label">Teléfono</label>

                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" required pattern="[0-9]{0,15}">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputText4" class="col-lg-1 control-label">Correo</label>

                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="Correo" required="required">
                                            </div>
                                        </div>

                                    </div>
                                    <!--modal-body-->

                                    <div class="modal-footer ">
                                        <input type="hidden" name="id_usuario" id="id_usuario" value=""/>
                                        <input type="hidden" name="id_cliente" id="id_cliente"/>
                                        <input type="hidden" name="cedula_cliente" id="cedula_cliente"/>


                                        <button type="submit" name="action" id="#" class="btn btn-success pull-left" value="Add"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </button>

                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
                                    </div>
                                </div>
                            </form>
                        </div> </div>




                    <!-- /.row -->
                </section>
                <!-- /.content -->

            </div>
            <%} else { %>
            <jsp:include page="../html/noacceso.jsp" />
            <%}%>
            <jsp:include page="../html/footer.jsp" />
        </div>
        <jsp:include page="../html/scripts.html"  />
        <script>
            $(function () {
                $('#example3').DataTable()
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
