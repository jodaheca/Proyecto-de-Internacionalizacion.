/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package udea.drai.intercambio.control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import udea.drai.intercambio.dao.InstitucionDAO;
import udea.drai.intercambio.dto.Institucion;

/**
 *
 * @author Usuario
 */
public class IngresarInstitucionServlet extends HttpServlet {

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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "./Principal.jsp";
        String nombre= request.getParameter("nombre");
        String pais= request.getParameter("pais");
        Institucion nuevaInstitucion=new Institucion();
        nuevaInstitucion.setNombre(nombre);
        nuevaInstitucion.setPais(pais);
        InstitucionDAO agregar= new InstitucionDAO();
        agregar.agregarInstitucion(nuevaInstitucion);
        
        response.setHeader("Location",url);
//
//        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
//        dispatcher.forward(request, response); 
        
        response.sendRedirect(url);
            
            
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
