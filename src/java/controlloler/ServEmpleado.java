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
@WebServlet(name = "ServEmpleado", urlPatterns = {"/ServEmpleado"})
public class ServEmpleado extends HttpServlet {

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
            out.println("<title>Servlet ServEmpleado</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServEmpleado at " + request.getContextPath() + "</h1>");
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
        String nombres = request.getParameter("nom");
        int cod_tipoempleado = Integer.parseInt(request.getParameter("tem"));
        String apellido = request.getParameter("ape");
        String dni = request.getParameter("dni");
        String usuario = request.getParameter("usu");
        String password = request.getParameter("pas");
        String telefono = request.getParameter("tel");
        String email = request.getParameter("ema");
        int estado = Integer.parseInt(request.getParameter("est"));
        model.Empleados em = new model.Empleados();
        em.setNombres(nombres);
        em.setCod_tipoem(cod_tipoempleado);
        em.setApellidos(apellido);
        em.setDni(dni);
        em.setUsername(usuario);
        em.setPassword(password);
        em.setTelefono(telefono);
        em.setEmail(email);
        em.setEstado(estado);
        if (dao.EmpleadosDAO.RegistrarEmpleados(em)) {
            request.setAttribute("mensaje", "Registrado CORRECTAMENTE");
        } else {
            request.setAttribute("mensaje", "ERROR al Registrar");
        }
        response.sendRedirect("vistas/empleados.jsp");

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
