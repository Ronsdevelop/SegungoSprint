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
@WebServlet(name = "ServModificaEmpleado", urlPatterns = {"/ServModificaEmpleado"})
public class ServModificaEmpleado extends HttpServlet {

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
            out.println("<title>Servlet ServModificaEmpleado</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServModificaEmpleado at " + request.getContextPath() + "</h1>");
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
        String nombre = request.getParameter("nom");
        String apepar = request.getParameter("ape");
        String apemar = request.getParameter("ame");
        String telefono = request.getParameter("tel");
        String correo = request.getParameter("email");
        String temp = request.getParameter("tem");
        String usuario = request.getParameter("uss");
        String clave = request.getParameter("pass");
        String estado = request.getParameter("est");
        
        model.Empleados emp = new model.Empleados();
        emp.setCod_empleado(codigo);
        emp.setNombres(nombre);
        /*emp.setAppaterno(apepar);
        emp.setApmaterno(apemar); */
        emp.setFono(telefono);
        emp.setEmail(correo);
        emp.setCod_tipoempleado(temp);
        emp.setUsuario(usuario);
        emp.setClave(clave);
        emp.setEstado(estado);
        
        if (dao.EmpleadosDAO.ModificaEmpleado(emp)) {
            request.setAttribute("mensaje", "Empleado Modificado");
        } else {
            request.setAttribute("mensaje", "Error al Modificar Empleado");
        }
        request.getRequestDispatcher("ModificaEmpleado.jsp").forward(request, response);
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
