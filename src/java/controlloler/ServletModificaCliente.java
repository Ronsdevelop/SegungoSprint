/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlloler;

import dao.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GRUPO FUMINSUMOS SAC
 */
@WebServlet(name = "ServletModificaCliente", urlPatterns = {"/ServletModificaCliente"})
public class ServletModificaCliente extends HttpServlet {

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
            out.println("<title>Servlet ServletModificaCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletModificaCliente at " + request.getContextPath() + "</h1>");
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
        String cod = request.getParameter("cod");
        String nombres = request.getParameter("nom");
        String apellido = request.getParameter("ape");
        String razon_social = request.getParameter("raz");
        String tipo_doc = request.getParameter("tip");
        String nro_documento = request.getParameter("nro");
        String direccion = request.getParameter("dir");
        String telefono = request.getParameter("tel");
        String email = request.getParameter("ema");
        model.Cliente cli = new model.Cliente();
        cli.setCod_cliente(cod);
        cli.setNombres(nombres);
        cli.setApellidos(apellido);
        cli.setRasonsocial(razon_social);
        cli.setTipo_doc(tipo_doc);
        cli.setDocumento(nro_documento);
        cli.setDireccion(direccion);
        cli.setFono(telefono);
        cli.setEmail(email);
        if (ClienteDAO.ModificaCliente(cli)) {
            request.setAttribute("mensaje", "Modificado CORRECTAMENTE");
        } else {
            request.setAttribute("mensaje", "ERROR al Modificar");
        }
        response.sendRedirect("vistas/Clientes.jsp");
        
        
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
