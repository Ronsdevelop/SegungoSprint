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
@WebServlet(name = "ServIngresaCliente", urlPatterns = {"/ServIngresaCliente"})
public class ServIngresaCliente extends HttpServlet {

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
            out.println("<title>Servlet ServIngresaCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServIngresaCliente at " + request.getContextPath() + "</h1>");
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
        String apellido = request.getParameter("ape");
        String razon_social = request.getParameter("raz");
        String tipo_doc = request.getParameter("tip");
        String nro_documento = request.getParameter("nro");
        String direccion = request.getParameter("dir");
        String telefono = request.getParameter("tel");
        String email = request.getParameter("ema");
        model.Cliente cli = new model.Cliente();
        cli.setNombres(nombres);
        cli.setApellidos(apellido);
        cli.setRasonsocial(razon_social);
        cli.setTipo_doc(tipo_doc);
        cli.setDocumento(nro_documento);
        cli.setDireccion(direccion);
        cli.setFono(telefono);
        cli.setEmail(email);
        if (dao.ClienteDAO.RegistrarCliente(cli)) {
            request.setAttribute("mensaje", "Registrado CORRECTAMENTE");
        } else {
            request.setAttribute("mensaje", "ERROR al Registrar");
        }
        response.sendRedirect("vistas/Clientes.jsp");

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
