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
import udea.drai.intercambio.dao.EstudianteDAO;
import udea.drai.intercambio.dao.UsuarioDAO;
import udea.drai.intercambio.dto.Persona;
import udea.drai.intercambio.dto.login;

/**
 *
 * @author Usuario
 */
public class loginServlet extends HttpServlet {

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
            String usuario= request.getParameter("usuario");
            String contrasena= request.getParameter("contrasena");
            UsuarioDAO us = new UsuarioDAO();
            EstudianteDAO es = new EstudianteDAO();
            if (usuario == null){
               request.setAttribute("mensaje", "Usuario y/o contraseña incorrecta");         
               RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
               dispatcher.forward(request, response); 
            }
            login lg= us.verificacion(usuario);
            if (lg != null && lg.getContrasena().equals(contrasena)){
                    Persona e = es.getEstudianteXusuario(usuario);
                     HttpSession session = request.getSession(true);
                    session.setAttribute("persona", e);
                    session.setAttribute("login", "true");

                if(lg.getPermiso() == 3){
                    session.setAttribute("tipoUsuario","3");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PrincipalEstudiante.jsp");
                    dispatcher.forward(request, response); 
                }else if(lg.getPermiso() == 2){
                    session.setAttribute("tipoUsuario","2");
                     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Principal.jsp");
                    dispatcher.forward(request, response); 
                }
            }else{
                request.setAttribute("mensaje", "Usuario y/o contraseña incorrecta");         
               RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
               dispatcher.forward(request, response); 
            }
        processRequest(request, response);
    }
      
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
