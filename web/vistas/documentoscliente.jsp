
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
        <link href="../css/misEstilos.css" rel="stylesheet" type="text/css"/>
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
                        TIPOS DE DOCUMENTOS DE CLIENTE
                        <small>Lista Completa</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Documentos</a></li>
                        <li class="active">Lista Documentos</li>
                    </ol>
                </section>


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">


                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Vista General de Documentos de Clientes </h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example3" class="table table-bordered table-striped" >
                                            <thead>
                                                <tr class="bg-primary" border="1">
                                                    <th>CODIGO</th>
                                                    <th>TIPO DE DOCUMENTO DE CIENTE</th>
                                                    <th width="70">ACCIONES</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (DocumentoCliente D : TipoDocDAO.ListarDoc()) {%> 
                                                <tr>
                                                    <td width='5'><%= D.getCod_tipodoc()%></td>
                                                    <td width='5'><%= D.getTipodocum()%></td>
                                                    <td>

                                                        <button type="button" onclick="showModalEdit('<%= D.getCod_tipodoc()%>', '<%= D.getTipodocum()%>')" class="btn btn-success btn-sm">
                                                            <span Class="glyphicon glyphicon-edit"></span>
                                                        </button>


                                                        <a href="../ServletEliminadocClien?cod=<%= D.getCod_tipodoc()%>">
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
                                    <button type="button" class="btn btn-block btn-primary btn-lg" data-toggle="modal" data-target="#modal-info">Agrega</button>
                                </td>
                            </div>
                        </div>  
                    </div>

                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title"></h4>
                                </div>
                                <div class="modal-body">
                                    <p></p>
                                </div>
                                <div class="modal-footer">
                                    <button id="close-modal" type="button" class="btn btn-default btn-styles" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- MODAL REGISTRAR -->

                    <div class="modal fade" id="modal-info">
                        <div class="modal-dialog">
                            <form class="form-horizontal" method="post" id="cliente_form" action="../ServletIngresaDoc">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary  ">
                                        <h4 class="modal-title text-center "> AGREGAR TIPO DE DOCUMENTO </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="input-group">
                                            <span class="input-group-addon">Documento</span>
                                            <input type="text" class="form-control" placeholder="Documento Cliente">
                                        </div>
                                    </div>
                                    <!--modal-body-->
                                    <div class="modal-footer bg-primary">                            
                                        <button type="submit" name="action" id="#" class="btn btn-success pull-left" value="Add"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
                                    </div>
                                </div>
                            </form>
                        </div> 
                    </div>

                    <!-- MODAL EDITAR -->

                    <div class="modal modal-success fade" id="modalEdit">
                        <div class="modal-dialog">
                            <form class="form-horizontal" method="post" id="cliente_form" action="../ServletEditaDocCli">
                                <div class="modal-content">
                                    <div class="modal-header  ">
                                        <h4 class="modal-title text-center" id="tituloEdit"></h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="inputText1" class="col-lg-1 control-label" >CODIGO:</label>
                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="text" class="form-control" id="codigoEdit" name="codigo" readonly="readonly" required pattern="^[a-zA-Z_áéíóúñ\s]{0,30}$">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputText1" class="col-lg-1 control-label">DOCUMENTO:</label>
                                            <div class="col-lg-9 col-lg-offset-1">
                                                <input type="text" class="form-control" id="nombreEdit" name="documento"  required pattern="^[a-zA-Z_áéíóúñ\s]{0,30}$">
                                            </div>
                                        </div>
                                    </div>
                                    <!--modal-body-->
                                    <div class="modal-footer ">                            
                                        <button type="submit" name="action" id="#" class="btn btn-primary pull-left" value="Add"><i class="glyphicon glyphicon-edit" aria-hidden="true"></i> Editar </button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
                                    </div>
                                </div>
                            </form>
                        </div> 
                    </div>                                                
                    <!-- FIN MODAL EDITAR -->            


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
