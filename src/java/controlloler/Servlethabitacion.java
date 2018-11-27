
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlloler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Richard
 */
@WebServlet(name = "Servlethabitacion", urlPatterns = {"/Servlethabitacion"})
public class Servlethabitacion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlethabitacion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlethabitacion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tipohabitacion = request.getParameter("thab");
        String nivel = request.getParameter("niv");
        String numero = request.getParameter("num");
        String observacion = request.getParameter("obs");
        String disponible = request.getParameter("dis");
        String reservado = request.getParameter("res");

        model.Habitacion hab = new model.Habitacion();
        
        hab.setCod_tipohabitacion(tipohabitacion);
        hab.setCod_nivel(nivel);
        hab.setNumero(numero);
        hab.setObservaciones(observacion);
        hab.setDisponible(disponible);
        hab.setReserva(reservado);
          if(dao.HabitacionDAO.registrarhabitacion(hab)){
            request.setAttribute("mensaje","habitacion registrada");
        }else{
            request.setAttribute("mensaje","Error al registrar Habitacion");
        }
        request.getRequestDispatcher("Registrahabitacion.jsp").forward(request, response);
        
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
