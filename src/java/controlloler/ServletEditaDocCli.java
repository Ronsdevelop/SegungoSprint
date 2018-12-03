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
 * @author Rony
 */
@WebServlet(name = "ServletEditaDocCli", urlPatterns = {"/ServletEditaDocCli"})
public class ServletEditaDocCli extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEditaDocCli</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEditaDocCli at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("codigo");
        String doc = request.getParameter("documento");
        DocumentoCliente DC = new DocumentoCliente();
        DC.setCod_tipodoc(cod);
        DC.setTipodocum(doc);
        if (TipoDocDAO.ModificaTipoDocumento(DC)) {
             request.setAttribute("mensaje", "REGISTRO MODIFICADO");
        }else{
            request.setAttribute("mensaje", "ERROR AL MODIFICAR REGISTRO");
        }
        
       response.sendRedirect("vistas/documentoscliente.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
