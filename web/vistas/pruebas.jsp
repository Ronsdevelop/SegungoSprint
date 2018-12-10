<%-- 
    Document   : pruebas
    Created on : 08/12/2018, 09:50:58 PM
    Author     : Rony
--%>

<%@page import="java.util.List"%>
<%@page import="dao.Consultas"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../ServletRegistrarHabitacion" method="POST">
            <label for=""> Cliente</label>
            <input type="text" name="clie"  />
            <br>
            <label for=""> Habitacion</label>
            <input type="text" name="cod"  />
            <br>
            <label for=""> Empleado</label>
            <input type="text" name="emp"  />
            <br>
            <label for=""> Fecha Ingreso</label>
            <input type="date" name="fecha"  />
            <br>
            <label for=""> Hora Ingreso</label>
            <input type="time" name="hora"  />
            <br>
            <label for=""> Adultos</label>
            <input type="text" name="adul"  />
            <br>
            <label for=""> Niños</label>
            <input type="text" name="nin"  />
            <br>
            <input type="submit" value="Enviar" /> 
            <br>          
            
        </form>
        
        <%=request.getAttribute("mensaje")!=null?request.getAttribute("mensaje"):""%>
    </body>
    
    <%
       ArrayList<String> c = new Consultas().RegistroEntrada("103");
  
    %>
    
    <h1><%= c.get(0) %></h1>
    <h1><%= c.get(1) %></h1>
    <h1><%= c.get(2) %></h1>
    <h1><%= c.get(3) %></h1>
</html>
