
function ValidarFormulario(){
   // Console.log("Entra la formulario");
     var nombre= $('#nombre').val(); 
    var apellido= $('#apellido').val(); 
    var cedula= $('#id').val();
    var correo= $('#correo').val();
    var correo2= $('#correo2').val();
    var programa= $('#programa').val();
    
    if (document.formulario.nombre.value.length==0){
       alert("Tiene que escribir su nombre")
       document.formulario.nombre.focus()
       return false;
    } 
    if(nombre===""){
        alert("Ingrese su nombre");
     return false;
    }else if (apellido==""){
        alert("Ingrese sus Apellidos");
        return false;
    }else if (cedula==""){
        alert("Ingrese su numero de documento de indentidad");
        return false;
    }else if (isNaN(cedula)){
        alert("Ingrese un numero de documento Valido");
        return false;
    }
    if(correo==""){
        alert("Ingrese su correo");
     return false;
 }else if(correo2==""){
     alert("Ingrese su correo de confirmación");
 }else if(correo!=correo2){
        alert("los correos electronicos ingresados no coinciden");
        return false;
    }
    
    if(programa==""){
        alert("Ingrese el programa al que pertenece");
     return false;
    }
    
  return true;  
}

function ValidarInstitucion(){
    
}
