<%-- 
    Document   : PrincipalEstudiante
    Created on : 09-jun-2014, 10:02:59
    Author     : Usuario
--%>

<%@page import="udea.drai.intercambio.dto.Persona"%>
<%
HttpSession sesionOk =request.getSession();
int tipoUsuario = (Integer)sesionOk.getAttribute("tipoUsuario");
System.out.println(tipoUsuario);
if(tipoUsuario !=3){
    //redireccionamos a la pagina del login
 %>
   <jsp:forward page="index.jsp" />
  
 <% } %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Información Personal</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/logo-nav.css" rel="stylesheet" type="text/css" />
 <% String ms = (String) request.getAttribute("mensaje");
    Persona persona = null ;
     %> 
</head>
<body>
    <div class="container" align="center" >
	
	<div class="panel" id="info" style="background:#F8F8F8; width: 750px; margin: 0auto;">
    	 <% 
                                if (ms != null){
                                %>
                                <p> <%=ms %></p>
                                <%
                                }
                             %>
 <div class="navbar navbar-default navbar-static-top">
    <div class="navbar-inner">
        
            <div class="navbar-brand">
                
            </div>

      
            <div class="collapse navbar-collapse navHeaderCollapse">
                <ul class="nav navbar-nav navbar-left">
                       Informacion personal
                </ul>
                <ul class="nav navbar-nav navbar-right">
                  
                      <%
                         String login = (String) sesionOk.getAttribute("login");
                         String prog ;
                        if (login == "true"){
                           persona = (Persona) sesionOk.getAttribute("persona");
                           if (persona.getPrograma() != null){
                               prog = persona.getPrograma();
                           }
                      %>        
                    <li><a href="<% sesionOk.invalidate(); %>index.jsp"><%=persona.getUsuario() %> - Cerrar Sessión</a></li>
                    <% }else{%>
                    <li><a href="index.jsp">Acceder</a></li>
                    <% } %>
                </ul>
            </div>
     
    </div>
 </div>

<form id="datos" name="datos" action="estudianteServlet" method="post">
       <div class="row" style="width: 700px; margin-left: 100px;">
            <div class="col-sm-3">
            <p> Nombre Completo: </p>    
            <input type="text" class="form-control" id="nombre" name="nombre" maxlength="80" required="true" value="<%=persona.getNombre() %>"/>
            </div>
            <div class="col-sm-3">
            <p> Cédula: </p>
            <input type="text" class="form-control" id="cedula" name="cedula" maxlength="15" required="true" value="<%=persona.getCedula() %>" /> 
            </div>
            <div class="col-sm-3">
            <p> Usuario </p>
            <input type="text" class="form-control" id="user" name="user" maxlength="15" required="true" value="<%=persona.getUsuario() %>" /> 
            </div>
	 </div>
       <div class="row" style="width: 700px; margin-left: 100px;">
       <br />
            <div class="col-sm-3">
            <p> Correo Electrónico: </p>
            <input type="text" class="form-control" id="email" name="email" required="true" value="<%=persona.getEmail() %> "/> 
            </div>
            <div class="col-sm-3">
            <p> Programa: </p>
            <select class="form-control" id="programa" name="programa">
                	<option>Seleccione una...</option>
                        <option value="507">Ingeniería Telecomunicaciones</option>
                        <option value="504">Ingeniería de Sistemas</option>
                </select>
            </div>
        <div class="col-sm-3">
            <p> Contraseña: </p>
            <input type="password" class="form-control" id="contrasena" name="contrasena" maxlength="15" required="true" /> 
            </div>
      </div>
          
          <div class="row" >
              <div class="col-sm-4" style=" width:750px;  margin: 0auto;">
        <br />
			<input type="submit" class="btn-default" value="Actualizar" />
        </div>
      </div>
                     
     </form>
	</div>
   	<p>Listado de solicitudes de intercambio</p>
	<div class="panel" id="intercambios" style="background:#F8F8F8; width: 750px;">	
        <a href="includes/Intercambio.jsp">Nueva solicitud de intercambio</a>
        </div>
    	
</div>
</body>
</html>
