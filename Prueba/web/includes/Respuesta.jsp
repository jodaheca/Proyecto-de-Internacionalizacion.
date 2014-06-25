<%-- 
    Document   : Respuesta
    Created on : 19-jun-2014, 9:45:02
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 String mensaje=(String)request.getAttribute("mensaje");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=mensaje%></h1>
        <h2>Si entro</h2>
    </body>
</html>
