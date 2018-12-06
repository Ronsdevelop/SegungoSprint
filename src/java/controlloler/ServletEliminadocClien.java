/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlloler;

import dao.TipoDocDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DocumentoCliente;

/**
 *
 * @author GRUPO FUMINSUMOS SAC
 */
@WebServlet(name = "ServletEliminadocClien", urlPatterns = {"/ServletEliminadocClien"})
public class ServletEliminadocClien extends HttpServlet {

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
            out.println("<title>Servlet ServletEliminadocClien</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEliminadocClien at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
        String cod = request.getParameter("cod");
        DocumentoCliente dc = new DocumentoCliente();
        dc.setCod_tipodoc(cod);
        if (TipoDocDAO.EliminaDoc(dc)) {
            request.setAttribute("mensaje","Eliminado Correctamente");
        }else{
            request.setAttribute("mensaje", "No se pudo Eliminar");
        }
          response.sendRedirect("vistas/documentoscliente.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
