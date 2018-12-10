/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlloler;

import dao.RegistroHabitacionDAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegistroHabitacion;

/**
 *
 * @author Rony
 */
@WebServlet(name = "ServletRegistrarHabitacion", urlPatterns = {"/ServletRegistrarHabitacion"})
public class ServletRegistrarHabitacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String clie = request.getParameter("clie");
        String cod_hb = request.getParameter("cod");
         String emp = request.getParameter("emp");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        int adult = Integer.parseInt(request.getParameter("adul"));
        int ninos = Integer.parseInt(request.getParameter("nin"));
       
        RegistroHabitacion rs = new RegistroHabitacion();
        rs.setCod_cliente(clie);
        rs.setCod_habitacion(cod_hb);
        rs.setCod_empleado(emp);
        rs.setFechaIngreso(fecha);
        rs.setHoraIngreso(hora);
        rs.setAdultos(adult);
        rs.setNinos(ninos);
        
        if (RegistroHabitacionDAO.RegistraHabitacion(rs)) {
           request.setAttribute("mensaje", "Registro Correcto");
        }else{
             request.setAttribute("mensaje", "Registro Incorrecto");
        }
        response.sendRedirect("vistas/recepcion.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
