window.onload = function(){
    //document.getElementById('usuario').focus();
    var formulario = document.forms[0];
    //alert("Carregou JS" + formulario.name);
    
    var firstElement = formulario.elements[0];
        
    if (firstElement.value == "" ) {
        firstElement.focus();
    }
    else {
        firstElement.select();
    }
};
