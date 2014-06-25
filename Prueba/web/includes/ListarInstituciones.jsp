<%-- 
    Document   : ListarInstituciones
    Created on : 19-jun-2014, 8:33:03
    Author     : Usuario
--%>

<%@page import="udea.drai.intercambio.dto.Institucion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%     
    List instituciones=(List) request.getAttribute("instituciones");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Instituciones</title>
        <link href="../Prueba/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="../Prueba/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
                        <h1 class="text-center login-title"> Instituciones Registradas</h1>
                                <div class="account-wall">
                        <br><br>
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>Codigo</th> 
                                <th>Nombre</th> 
                                <th>Pais</th>
                            </tr>
                        </thead> 
                        <tbody>
                            <%
                              for(int i=0;i<instituciones.size();i++){
                                Institucion nueva=(Institucion) instituciones.get(i);
                                String codigo=nueva.getCodigo();
                                String nombre=nueva.getNombre();
                                String pais=nueva.getPais();

                            %>
                             <tr class="active">
                                <td><%=codigo%></td> 
                                <td><%=nombre%></td> 
                                <td><%=pais%></td> 
                            </tr>

                            <%    
                            }  
                            %> 
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>
