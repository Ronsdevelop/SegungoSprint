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

        <link href="../css/misEstilos.css" rel="stylesheet" type="text/css"/>
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
                                        

                                                        <button type="button" onclick="showModalEdit('<%= Cli.getCod_cliente()%>', '<%= Cli.getNombres()%>', '<%= Cli.getApellidos()%>', '<%= Cli.getRasonsocial()%>', '<%= TipoDocDAO.nroFila(TipoDocDAO.getDoc(Cli.getTipo_doc()))%>', '<%= Cli.getDocumento()%>', '<%= Cli.getDireccion()%>', '<%= Cli.getFono()%>', '<%= Cli.getEmail()%>')" class="btn btn-success btn-sm">
                                                            <span Class="glyphicon glyphicon-edit"></span>
                                                        </button>


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
                    <!--MODAL REGISTRAR  -->
                    <div class="modal fade" id="modal-info">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-primary">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title text-center">REGISTRAR CLIENTE</h4>
                                </div>
                                <form action="../ServIngresaCliente" method="POST">
                                    <div class="modal-body">

                                        <div class="input-group">
                                            <span class="input-group-addon">Nombres</span>
                                            <input type="text" class="form-control" name="nom" placeholder="Nombres de Cliente">
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Apellidos</span>
                                            <input type="text" class="form-control" name="ape" placeholder="Apellidos de Cliente">
                                        </div>
                                        <br>                                       
                                        <div class="input-group">
                                            <span class="input-group-addon">Rason Social</span>
                                            <input type="text" class="form-control" name="raz" placeholder="Razon Social de Cliente">
                                        </div>
                                        <br>                                       
                                        <div class="input-group">
                                            <span class="input-group-addon">Tipo de Documento</span>
                                            <select class="form-control"  name="tip" >
                                                <option value="">-- Selecciona Documento --</option>
                                                <%for (DocumentoCliente tip : TipoDocDAO.ListarDoc()) {%> 
                                                <option value="<%= tip.getCod_tipodoc()%>"> <%= tip.getTipodocum()%></option>
                                                <%}%> 
                                            </select>
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Nro Documento</span>
                                            <input type="text" class="form-control" name="nro" placeholder="Nro de Documento de cliente">
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Direccion</span>
                                            <input type="text" class="form-control" name="dir" placeholder="Direccion de Cliente">
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Telefono</span>
                                            <input type="text" class="form-control"name="tel" placeholder="Telefono de Cliente">
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Email</span>
                                            <input type="text" class="form-control" name="ema" placeholder="Email de Cliente">
                                        </div>
                                        <br>                                         
                                    </div>
                                    <div class="modal-footer bg-primary">
                                        <button type="submit" name="action" id="#" class="btn btn-success pull-left" value="Add"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
                                    </div>
                                </form>                  
                            </div>
                            </form>
                        </div>
                    </div>
                    <!-- FIN MODAL REGISTRAR-->

                    <!--MODAL EDITAR  -->
                    <div class="modal fade" id="modalEdit">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-green">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title text-center" id="tituloEdit"></h4>
                                </div>
                                <form action="../ServletModificaCliente" method="POST">
                                    <div class="modal-body">

                                        <div class="input-group">
                                            <span class="input-group-addon">Codigo</span>
                                            <input type="text" class="form-control" id="codigoEdit" name="cod" placeholder="Codigo de Cliente">
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Nombres</span>
                                            <input type="text" class="form-control" name="nom" id="nombreEdit" placeholder="Nombres de Cliente">
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Apellidos</span>
                                            <input type="text" class="form-control" name="ape"  id="apellidoEdit" placeholder="Apellidos de Cliente">
                                        </div>
                                        <br>                                       
                                        <div class="input-group">
                                            <span class="input-group-addon">Rason Social</span>
                                            <input type="text" class="form-control" name="raz" id="rasonEdit" placeholder="Razon Social de Cliente">
                                        </div>
                                        <br>                                       
                                        <div class="input-group">
                                            <span class="input-group-addon">Tipo de Documento</span>
                                            <select class="form-control" id="documentoEdit" name="tip" >
                                                <option value="">-- Selecciona Documento --</option>
                                                <%for (DocumentoCliente tip : TipoDocDAO.ListarDoc()) {%> 
                                                <option value="<%= tip.getCod_tipodoc()%>"> <%= tip.getTipodocum()%></option>
                                                <%}%> 
                                            </select>
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Nro Documento</span>
                                            <input type="text" class="form-control" id="nrodocEdit" name="nro" placeholder="Nro de Documento de cliente">
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Direccion</span>
                                            <input type="text" class="form-control" name="dir" id="direccionEdit" placeholder="Direccion de Cliente">
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Telefono</span>
                                            <input type="text" class="form-control"name="tel" id="telefonoEdit" placeholder="Telefono de Cliente">
                                        </div>
                                        <br>   
                                        <div class="input-group">
                                            <span class="input-group-addon">Email</span>
                                            <input type="text" class="form-control" name="ema" id="emailEdit" placeholder="Email de Cliente">
                                        </div>
                                        <br>                                         
                                    </div>
                                    <div class="modal-footer bg-green">
                                        <button type="submit" name="action" id="#" class="btn btn-primary pull-left" value="Add"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
                                    </div>
                                </form>                  
                            </div>
                            </form>
                        </div>
                    </div>
                    <!-- FIN MODAL EDITAR-->


                    <!-- /.row -->
                </section>
                <!-- /.content -->

            </div>
            <jsp:include page="../html/footer.jsp" />
        </div>
        <jsp:include page="../html/scripts.html"  />

        <script>
            function showModalEdit(clave, nombre, apellido, rason, tipdoc, doc, dire, tel, emai) {
                document.getElementById("codigoEdit").value = clave;
                document.getElementById("nombreEdit").value = nombre;
                document.getElementById("apellidoEdit").value = apellido;
                document.getElementById("rasonEdit").value = rason;
                document.getElementById("documentoEdit").selectedIndex = tipdoc;
                document.getElementById("nrodocEdit").value = doc;
                document.getElementById("direccionEdit").value = dire;
                document.getElementById("telefonoEdit").value = tel;
                document.getElementById("emailEdit").value = emai;
                document.getElementById("tituloEdit").innerHTML = "EDITAR REGISTRO DE CLIENTE " + clave;
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
        <!--
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
        -->
    </body>
</html>
<% } else {
        response.sendRedirect("../index.jsp");
    }%>
