
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="dao.Conexion"%>
<%@page import="dao.Consultas"%>
<%@page import="model.Empleados"%>
<% Empleados E = (Empleados) session.getAttribute("user"); %>
<% if (E != null) { %> 
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="dao.NivelDAO"%>
<%@page import="dao.TipoHabitacionDAO"%>

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
                <section  class="content-header">
                    <h1>
                        <i class="fa fa-bed"></i> AREA DE LIMPIEZA
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Limpieza</a></li>

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

                                    if (hab.getValueAt(h, 1).equals(niv.getValueAt(i, 1)) && hab.getValueAt(h, 2).equals(es.getValueAt(canes, 0)) && (es.getValueAt(canes, 1).equals("LIMPIEZA"))) {
                                        out.print("<div class='col-lg-3 col-x6'>");
                                        out.print("<div class='small-box bg-gray-active'>");
                                        out.print("<div class='inner'>");
                                        out.print("<h3>" + hab.getValueAt(h, 0) + "</h3>");
                                        out.print("<p  style='margin: 0 ;'>" + TipoHabitacionDAO.getTipo(hab.getValueAt(h, 5).toString()) + "</p>");
                                        out.print("<p style='margin: 0 ; '  > S/. " + hab.getValueAt(h, 4) + "</p>");
                                        out.print("</div>");
                                        out.print("<div class='icon'  >");
                                        out.print("<i class='fa fa-hotel'></i>");
                                        out.print("</div>");

                                        out.print("<a href='#' onclick='showModalEdit(\"" + hab.getValueAt(h, 0) + "\",\"" + hab.getValueAt(h, 3) + "\")' class='small-box-footer'>" + es.getValueAt(canes, 1) + "  <i class='fa fa-arrow-circle-right'></i></a>");

                                        out.print("</div>");
                                        out.print("</div>");
                                    }
                                }
                            }

                            out.print("</div>");

                        }

                    %>         


                    <div class="modal fade" id="modalEdit">
                        <div class="modal-dialog">
                            <form class="form-horizontal" method="post" id="cliente_form" action="../ServletRegistrarHabitacion">
                                <div class="modal-content">
                                    <div class="modal-header bg-aqua  ">
                                        <h3 class="modal-title text-center" id="tituloEdit"></h3>
                                    </div>
                                    <div class="modal-body">

                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">Codigo</span>
                                            <input type="text" class="form-control" id="codigoEdit" name="cod" readonly="readonly"  >
                                        </div>
                                        <br>
                                     
                                        <div class="input-group ">
                                            <span class="input-group-addon">Fecha Limpieza</span>
                                            <input type="date" class="form-control" name="fecha" >
                                        </div>
                                        <br>
                                        <div class="input-group ">
                                            <span class="input-group-addon">Hora de Limpieza</span>
                                            <input type="time" class="form-control" name="hora" placeholder="Hora Ingreso">
                                        </div> 
                                        <br>                                       
                                       
                                        <div class="input-group">
                                            <span class="input-group-addon">Insidencias</span>
                                            <textarea class="form-control "  name="insi" rows="3"></textarea>
                                        </div>                                    
                                        <div class="input-group">                                           
                                            <input type="text" value="<%= E.getCod_empleados()%>" name="emp" style="visibility:hidden"  >
                                        </div>                                        


                                    </div>
                                    <!--modal-body-->
                                    <div class="modal-footer bg-aqua ">                            
                                        <button type="submit" name="action" id="#" class="btn btn-primary pull-left" value="Add"><i class="glyphicon glyphicon-floppy-save" aria-hidden="true"></i> Registrar </button>
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
                document.getElementById("codigoEdit").value = codigo;
                document.getElementById("tituloEdit").innerHTML = " LIMPIEZA DE HABITACION " + numero;
                $('#modalEdit').modal('show');

            }
        </script>


    </body>
</html>

<% } else {
        response.sendRedirect("../index.jsp");
    }%>
