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
        String thab = request.getParameter("thab");
        String niv = request.getParameter("niv");
        String num = request.getParameter("num");
        String obs = request.getParameter("obs");
        String dis = request.getParameter("dis");
        String res = request.getParameter("res");
        
        model.Habitacion hab = new model.Habitacion();
        hab.setCod_habitacion(codigo);
        hab.setCod_tipohabitacion(thab);
        hab.setCod_nivel(niv);
        hab.setNumero(num);
        hab.setObservaciones(obs);
        hab.setDisponible(dis);
        hab.setReserva(res);

        if (dao.HabitacionDAO.Modificahabitacion(hab)) {
            request.setAttribute("mensaje", "Cliente Modificado");
        } else {
            request.setAttribute("mensaje", "Error al Modificar Cliente");
        }
        request.getRequestDispatcher("Habitaciones.jsp").forward(request, response);

    
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
