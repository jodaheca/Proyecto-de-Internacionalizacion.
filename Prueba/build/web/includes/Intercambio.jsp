<%-- 
    Document   : Intercambio
    Created on : 09-jun-2014, 10:04:20
    Author     : Usuario
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Nuevo intercambio</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../css/logo-nav.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div class="container" align="center"  >
    <p>Información de intercambio</p>
   <div class="panel" id="info" style="background:#F8F8F8;  width: 800px; margin: 0auto;">
	<form id="intercambio" name="intercambio"> 
        
    	<div class="row">
            <div class="col-sm-3">
        	<p>Tipo de intercambio:</p>
            <select class="form-control" name="destino" > 
				<option> Pasantía </option>
                <option> Doble titulación </option>
	        </select>
            </div>
                 <div class="col-sm-3">
        	<p>Universidad de destino:</p>
                <select class="form-control" name="destino"> 
                    <option> Seleccione una...</option>
                    <option> Universidad de Sao Paulo - Brasil</option>
                    <option> Universidad de Campinas - Brasil </option>
                </select>
            </div>
            <div class="col-sm-2">
                <p># Semestres:</p>
                <input type="number" class="form-control" required="true" />
            </div>
            

       
             Semestre(s): (Parametrizable por el administrador
                <div class="col-lg-1" style="background: #ffffff; width: 200px;">
                    <div class="checkbox">
                        2013/2 <input type="checkbox" name="1" value="1" /><br />
                        2014/1 <input type="checkbox" name="2" value="2" /><br />
                        2014/2 <input type="checkbox" name="3" /><br />
                        2015/1 <input type="checkbox" name="3" />
                    </div>
                </div>
        </div>
    </form>
</div>
  <p>Materias a Homologar</p>
  <div class="panel" id="info" style="background:#F8F8F8;  width: 800px; margin: 0auto;">
  <a href="Materia.jsp">Agregar materia</a>
  </div>
</div>
</body>
</html>

