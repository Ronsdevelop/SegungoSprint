/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlloler;

import dao.LimpiezaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Limpieza;

/**
 *
 * @author Rony
 */
@WebServlet(name = "ServletIngresaLimpieza", urlPatterns = {"/ServletIngresaLimpieza"})
public class ServletIngresaLimpieza extends HttpServlet {

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
            out.println("<title>Servlet ServletIngresaLimpieza</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletIngresaLimpieza at " + request.getContextPath() + "</h1>");
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
        String em = request.getParameter("emp");

        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String insi = request.getParameter("insi");
        String cod_h = request.getParameter("cod");

        Limpieza rs = new Limpieza();
        rs.setCoc_emplea(em);
        rs.setFecha_lim(fecha);
        rs.setHora_lim(hora);
        rs.setInsidencias(insi);
        rs.setCod_hab(cod_h);

        if (LimpiezaDAO.RegistroLimpieza(rs)) {
            request.setAttribute("mensaje", "Registro Correcto");
        } else {
            request.setAttribute("mensaje", "Registro Incorrecto");
        }
        response.sendRedirect("vistas/limpieza.jsp");

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
