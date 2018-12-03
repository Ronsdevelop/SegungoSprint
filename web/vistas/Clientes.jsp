<%@page import="model.TipoEmpleado"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>

<% if (E != null) { %>   
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
                                        <table style="table-layout:fixed" id="example3" class="table table-bordered table-striped">
                                            <thead>
                                                <tr class="bg-primary" border="1">
                                                    <th>CODIGO</th>
                                                    <th>NOMBRES</th>
                                                    <th>APELLIDOS </th>
                                                    <th>RASON SOCIAL</th>
                                                    <th>TIPO DOCUMENTO</th>
                                                    <th>DOCUMENTO</th>
                                                    <th>DIRECCION</th>
                                                    <th>TELEFONO</th>
                                                    <th>EMAIL</th>
                                                    <th width="70">ACCIONES</th>

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
                                                    <td> 

                                                        <a href="#?cod=<%= Cli.getCod_cliente()%>">
                                                            <button type="button" class="btn btn-success btn-sm">
                                                                <span Class="glyphicon glyphicon-edit"></span>
                                                            </button>
                                                        </a>

                                                        <a href="#?cod=<%= Cli.getCod_cliente()%>">
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
                                    <button type="button" class="btn btn-block btn-primary btn-lg" data-toggle="modal" data-target="#modal-info">Nuevo Cliente</button>
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
                                    <h4 class="modal-title">Registrar Cliente</h4>
                                </div>
                                <form action="../ServIngresaCliente" method="POST">
                                    <div class="modal-body">

                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <label for="">Nombres : </label>
                                                    <input type="text" class="form-control" name="nom"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Apellidos : </label>
                                                    <input type="text" class="form-control" name="ape"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Rason Social : </label>
                                                    <input type="text" class="form-control" name="raz"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Tipo Documento : </label>
                                                    <select class="form-control"  name="tip" >
                                                        <option value="">-- Selecciona Documento --</option>
                                                        <%for (DocumentoCliente tip : TipoDocDAO.ListarDoc()) {%> 
                                                        <option value="<%= tip.getCod_tipodoc()%>"> <%= tip.getTipodocum()%></option>
                                                        <%}%> 
                                                    </select>
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Nro Documento : </label>
                                                    <input type="text" class="form-control" name="nro"> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Direccion : </label>
                                                    <input type="text" class="form-control" name="dir"> 
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
                                                    <input type="email" class="form-control" name="ema"> 
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
