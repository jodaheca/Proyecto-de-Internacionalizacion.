<%-- 
    Document   : Materia
    Created on : 09-jun-2014, 10:04:54
    Author     : Usuario
--%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Homologacion</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../css/logo-nav.css" rel="stylesheet" type="text/css" />
    </head>
    <body  >
          <div class="container" align="center">
              <p> Materias Homologables</p>
            <div class="panel" id="info1" style="background:#F8F8F8;  width:800px;  margin: 0auto; " >
            <form method="post" >
             <div class="row" style=" width: 800px;  margin-left: 150px;">
              
                
                    <div class="col-lg-3">
                        <p>  Materia (Origen)</p>
                        Código<input type="text" class="form-control" name="codigOrigen" required="true" />
                       Nombre<input type="text" class="form-control" name="nombreOrigen" required="true" />
                    </div>
           
             
                    <div class="col-lg-3" >
                        <p>  Materia (Destino)</p>
                        Código<input type="text" class="form-control" name="codigoDestino" required="true" />
                       Nombre<input type="text" class="form-control" name="nombreDestino" required="true" />
                   </div>
            
             </div>
                <br />
             <div class="row">
                 <p> Acta - Resolución comité de carrera (fecha: <input type="date" name="fecha" id="fecha" style=" width: 140px; height: 30px;" required="true" /> Número: <input type="number" name="acta" id="acta" style=" width: 70px;" required="true" /> )</p>
             </div>
             <div class="row" style=" width: 800px; margin-left: -100px;  " >
                 <br />
                 <input type="submit" class="btn-default" value="Agregar" />
             </div>
      
            </form>
                </div>
          </div>
    </body>
</html>

