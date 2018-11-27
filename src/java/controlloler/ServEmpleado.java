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
        String nombre = request.getParameter("nom");
        String aPaterno = request.getParameter("ape");
        String aMaterno = request.getParameter("ame");
        String telefono = request.getParameter("tel");
        String correo = request.getParameter("email");
        String temp = request.getParameter("tem");
        String usuario = request.getParameter("uss");
        String clave = request.getParameter("pass");
        String estado = request.getParameter("est");
        model.Empleados em = new model.Empleados();
        em.setNombres(nombre);
        /*em.setAppaterno(aPaterno);
        em.setApmaterno(aMaterno); */
        em.setFono(telefono);
        em.setEmail(correo);
        em.setCod_tipoempleado(temp);
        em.setUsuario(usuario);
        em.setClave(clave);
        em.setEstado(estado);
        if (dao.EmpleadosDAO.RegistrarEmpleado(em)) {
            request.setAttribute("mensaje", "Empleado Registrado");
        } else {
            request.setAttribute("mensaje", "Empleado no registrado");
        }
        request.getRequestDispatcher("RegistrarEmpleado.jsp").forward(request, response);
        processRequest(request, response);

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
