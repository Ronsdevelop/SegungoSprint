
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="dao.Conexion"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% if (E != null) { %> 
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="dao.NivelDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include  page="../html/head.jsp"/>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../html/header.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        RECEPCION
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Recepcion</a></li>

                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">                  
                    <%
                        Consultas v = new Consultas();
                        Conexion cn = new Conexion();
                        DefaultTableModel niv = new DefaultTableModel();
                        niv = v.Listaniveles(cn.conectar());

                        DefaultTableModel hab = new DefaultTableModel();
                        hab = v.Lishabitacion(cn.conectar());

                        DefaultTableModel es = new DefaultTableModel();
                        es = v.Listaestado(cn.conectar());

                        for (int i = 0; i < niv.getRowCount(); i++)//i tiene el valor de 5
                        {

                            out.print("<h2 class='bg-blue-active text-white text-center'>" + niv.getValueAt(i, 0) + "</h2>");
                            out.print("<div class='row panel_modulos'>");
                            for (int canes = 0; canes < es.getRowCount(); canes++) {

                                for (int h = 0; h < dao.HabitacionDAO.CantHabitacion(); h++) {

                                    if (hab.getValueAt(h, 1).equals(niv.getValueAt(i, 1)) && hab.getValueAt(h, 2).equals(es.getValueAt(canes, 0))) {
                                        out.print("<div class='col-lg-3 col-x6'>");
                                        if (es.getValueAt(canes, 1).equals("DISPONIBLE")) {
                                            out.print("<div class='small-box bg-aqua'>");
                                        } else if (es.getValueAt(canes, 1).equals("RESERVADA")) {
                                            out.print("<div class='small-box bg-green'>");
                                        } else if (es.getValueAt(canes, 1).equals("OCUPADA")) {
                                            out.print("<div class='small-box bg-yellow'>");
                                        }

                                        out.print("<div class='inner'>");
                                        out.print("<h4>" + hab.getValueAt(h, 0) + "</h4>");
                                        out.print("<p>Habitacion</p>");
                                        out.print("</div>");
                                        out.print("<div class='icon'  >");
                                        out.print("<i class='fa fa-hotel'></i>");
                                        out.print("</div>");
                                        out.print("<a href='#' onclick='showModalEdit(\"" + hab.getValueAt(h, 0) + "\",\"" + hab.getValueAt(h, 3) + "\")' class='small-box-footer'>" + es.getValueAt(canes, 1) + "<i class='fa fa-arrow-circle-right'></i></a>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    }
                                }
                            }

                            out.print("</div>");

                        }

                    %>

                    <div class="modal modal-success fade" id="modalEdit">
                        <div class="modal-dialog">
                            <form class="form-horizontal" method="post" id="cliente_form" action="../ServletEditaDocCli">
                                <div class="modal-content">
                                    <div class="modal-header  ">
                                        <h4 class="modal-title text-center" id="tituloEdit"></h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="input-group">
                                            <span class="input-group-addon">Numero</span>
                                            <input type="text" class="form-control" id="nombreEdit" >
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Codigo</span>
                                            <input type="text" class="form-control" id="codigoEdit" >
                                        </div>
                                        <br>
                                         <div class="input-group">
                                            <span class="input-group-addon">Cliente</span>
                                            <input type="text" class="form-control" placeholder="Cliente">
                                        </div>
                                        <br>
                                         <div class="input-group">
                                            <span class="input-group-addon">Fecha Ingreso</span>
                                            <input type="date" class="form-control" >
                                        </div>
                                        <br>
                                         <div class="input-group">
                                            <span class="input-group-addon">Hora de Ingreso</span>
                                            <input type="time" class="form-control" placeholder="Hora Ingreso">
                                        </div>                                      
                                        
                                    </div>
                                    <!--modal-body-->
                                    <div class="modal-footer ">                            
                                        <button type="submit" name="action" id="#" class="btn btn-primary pull-left" value="Add"><i class="glyphicon glyphicon-floppy-save" aria-hidden="true"></i> Reservar </button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
                                    </div>
                                </div>
                            </form>
                        </div> 
                    </div>  

                </section>  
            </div>
            <jsp:include page="../html/footer.jsp" />

        </div>
        <jsp:include page="../html/scripts.html"  />   
        <script>
            function showModalEdit(numero, codigo) {
                document.getElementById("nombreEdit").value = numero;
                document.getElementById("codigoEdit").value = codigo;
                document.getElementById("tituloEdit").innerHTML = " REGISTRAR HABITACION " + numero;
                $('#modalEdit').modal('show');

            }
        </script>

    </body>
</html>

<% } else {
        response.sendRedirect("../index.jsp");
    }%>
