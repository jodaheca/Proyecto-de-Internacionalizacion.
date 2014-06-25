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
import javax.servlet.http.HttpSession;
import udea.drai.intercambio.dao.InstitucionDAO;

/**
 *
 * @author Usuario
 */
public class EliminarInstitucionServlet extends HttpServlet {

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
         String url = "./Principal.jsp?respuesta";
        String codigo=request.getParameter("codigo");
        int cod=Integer.parseInt(codigo);
        InstitucionDAO inst= new InstitucionDAO();
        int  respuesta=inst.eliminarInstitucion(cod);
      // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Principal.jsp?respuesta");
      //  dispatcher.forward(request, response);
        if(respuesta==1){
            url="./Principal.jsp?EICorrectamente";
            response.setHeader("Location",url);   
            response.sendRedirect(url);
        }else{
            url="./Principal.jsp?EIError";
            response.setHeader("Location",url);   
            response.sendRedirect(url);
        }  

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
