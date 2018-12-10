/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlloler;

import dao.RegistroHabitacionDAO;
import dao.RegistroSalidaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegistroSalida;

/**
 *
 * @author Rony
 */
@WebServlet(name = "ServletIngresaRegSalida", urlPatterns = {"/ServletIngresaRegSalida"})
public class ServletIngresaRegSalida extends HttpServlet {

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
            out.println("<title>Servlet ServletIngresaRegSalida</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletIngresaRegSalida at " + request.getContextPath() + "</h1>");
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
        
        String regEnt = request.getParameter("cod");       
        String fecha = request.getParameter("fSalida");
        String hora = request.getParameter("hSalida");
        String insi = request.getParameter("insi");
        RegistroSalida rs = new RegistroSalida();
        rs.setCod_registro(regEnt);
        rs.setFechaSalida(fecha);
        rs.setHoraSalida(hora);
        rs.setInsidencias(insi);      

 if (RegistroSalidaDAO.RegistroSalida(rs)) {
           request.setAttribute("mensaje", "Registro Correcto");
        }else{
             request.setAttribute("mensaje", "Registro Incorrecto");
        }
        response.sendRedirect("vistas/checkout.jsp");        
        
     
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
