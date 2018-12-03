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
@WebServlet(name = "ServletModificaHabitacion", urlPatterns = {"/ServletModificaHabitacion"})
public class ServletModificaHabitacion extends HttpServlet {

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
            out.println("<title>Servlet ServletModificaHabitacion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletModificaHabitacion at " + request.getContextPath() + "</h1>");
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
        String codigo = request.getParameter("cod");
        String numero = request.getParameter("num");
        float precio = Float.parseFloat(request.getParameter("pre"));
        String descripcion = request.getParameter("des");
        String tipo_habitacion = request.getParameter("tip");
        String nivel = request.getParameter("niv");
        String estado_habitacion = request.getParameter("est");
        
        model.Habitacion hab = new model.Habitacion();
        hab.setCod_habitacion(codigo);
        hab.setNumero(numero);
        hab.setPrecio(precio);
        hab.setDescripcion(descripcion);
        hab.setCod_tipoh(tipo_habitacion);
        hab.setCod_nivel(nivel);
        hab.setCod_estado(estado_habitacion);
                

        if (dao.HabitacionDAO.ModificarHabitacion(hab)) {
            request.setAttribute("mensaje", "Modificado CORRECTAMENTE");
        } else {
            request.setAttribute("mensaje", "ERROR al Modificar");
        }
        response.sendRedirect("vistas/habitaciones.jsp");

    
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
