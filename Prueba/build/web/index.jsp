<%-- 
    Document   : IndexEstudiante
    Created on : 04-jun-2014, 16:25:22
    Author     : Usuario
--%>    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Información Personal</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/logo-nav.css" rel="stylesheet" type="text/css" />
  <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="signin.css" rel="stylesheet">
     <% String ms = (String) request.getAttribute("mensaje");
     %> 
</head>
<body>
     <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <h1 class="text-center login-title">Login</h1>
                    <div class="account-wall">
<!--                        <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                             accesskey="" alt="">-->
                            <br>
                                <% 
                                if (ms != null){
                                %>
                                <p> <%=ms %></p>
                                <%
                                }
                                %>
                                <form class="form-signin" action="loginServlet" method="POST">
                             <input type="text" class="form-control" placeholder="Usuario" name="usuario" id="usuario" required autofocus>
                                <br>
                                    <input type="password" class="form-control" placeholder="Contraseña" name="contrasena" id="contrasena"required>
                                 <br>
                              <button class="btn btn-lg btn-primary btn-block" type="submit">
                                 Enviar</button>
                                 <label class="checkbox pull-left">
                                 <input type="checkbox" value="recordarme">
                                 Recordarme
                                 </label>
                           </form>
                         </div>
                </div>
            </div>
</div>
    </body>
</html>

