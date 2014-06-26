<%-- 
    Document   : Principal
    Created on : 09-jun-2014, 10:14:40
    Author     : Usuario
--%>

<%@page import="udea.drai.intercambio.dto.Persona"%>
<%@page import="java.util.List"%>
<%@page import="udea.drai.intercambio.dao.InstitucionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
HttpSession sesionOk =request.getSession();
String login = (String)sesionOk.getAttribute("login");
String tipoUsuario=(String)sesionOk.getAttribute("tipoUsuario");
Persona persona= (Persona)sesionOk.getAttribute("persona");
System.out.println("El estado del login es= " +login);
System.out.println("El tipo de usuario es= " +tipoUsuario);
if(login == null || tipoUsuario!="2"){
    //redireccionamos a la pagina del login
 %>
   <jsp:forward page="index.jsp" />
  
 <% } %>
<html>
    <head>
         <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
       <link href="css/logo-nav.css" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="css/main.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <title>Principal Profesores</title>
    </head>
 
    <body>
         <div align="right">
            <% out.println("Usuario: "+persona.getNombre());%>
<!--            <a href="./logout"><img src="imagenes/out.png" alt="" width="15" height="20" style="border:none" /></a>-->
        </div>
        <!--Barra de Navegacion-->
        <div class="container">
        <div class="row">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Cambiar Navegacion</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
              <a href="Principal.jsp" class="navbar-brand">Programa de Internacionalización</a></div>

                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Instituciones<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href='Principal.jsp?agregarInstitucion' >Agregar</a></li>
                                <li><a href="Principal.jsp?eliminarInstitucion" >Eliminar</a></li>
                                <li><a href="Principal.jsp?ListarInstituciones">Listar Instituciones</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Programas<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Agregar Programa</a></li>
                                <li><a href="#">Eliminar Programa</a></li>
                                <li><a href="#">Listar Programas</a></li>
                            </ul>
                        </li>
                 
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Estudiantes<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Ingresar estudiante</a></li>
                                <li><a href="#">Buscar estudiante</a></li>
                                <li><a href="#">Revisar Tareas</a></li>
                                <li><a href="#">Revisar Materias</a></li>
                                <li><a href="#">Listar Estudiantes</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Tipos Intercambios<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Agregar Intercambio</a></li>
                                <li><a href="#">Eliminar Intercambio</a></li>
                                <li><a href="#">Listar Intercambios</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<%= request.getContextPath()+"/LogOutServlet"%>">Cerrar Sesion</a></li>
                        
                    </ul>
                </div>
        </nav>
                         <%
        if(!(request.getParameter("agregarInstitucion")== null)){
            %>
           <%@include file="includes/RegistrarInstitucion.jsp" %>
            <%
        }else if (!(request.getParameter("eliminarInstitucion")== null)){
            %>
            <%@include  file="includes/EliminarInstitucion.jsp" %>
            <%
        }else if (request.getParameter("ListarInstituciones")!= null){
            InstitucionDAO nuevo= new InstitucionDAO();
                    
            List insti=nuevo.getInstituciones();
            request.setAttribute("instituciones", insti);
            %>
            <%@include  file="includes/ListarInstituciones.jsp" %>
            <% }else if (!(request.getParameter("EICorrectamente")== null)){    
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
            <br><br><br>
            <p class="bg-success">La institucion se elimino correctamente</p>
            </div>
            <% }else if (!(request.getParameter("EIError")== null)){    
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
            <br><br><br>
            <p class="bg-danger">Ocurrio un error al intentar eliminar la institucion</p>
            </div>
            <% }else if (!(request.getParameter("IICorrectamente")== null)){    
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
            <br><br><br>
            <p class="bg-success">La institución se agrego correctamente</p>
            </div>
            <% }else if (!(request.getParameter("IIError")== null)){    
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
            <br><br><br>
            <p class="bg-danger">La institución no se pudo agregar</p>
            </div>
            <% }%>
        
    </div>
    </div>    
        
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
