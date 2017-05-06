/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function limpia()
{
    alert("no es temporada de apelaciones");
}

function dos()
{
    document.getElementById("autor_2").style.display = "block";
}

function mostrar_formulario(clicked_id)
{
    if(clicked_id === "ALUMNOS")
    {
        document.getElementById("ALUMNOS_FORM").style.display = "block";
        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
        document.getElementById("EVENTOS_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        
        document.getElementById("TT_FORM").style.display = "none";
        document.getElementById("PART_FORM").style.display="none";
    }
    
    if(clicked_id ==="PUBLICACIONES")
    {
        document.getElementById("ALUMNOS_FORM").style.display = "none";
        document.getElementById("PUBLICACIONES_FORM").style.display = "block";
        document.getElementById("EVENTOS_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        
        document.getElementById("TT_FORM").style.display = "none";
        document.getElementById("PART_FORM").style.display="none";
    } 
    
    if(clicked_id === "EVENTOS")
    {
        document.getElementById("ALUMNOS_FORM").style.display = "none";
        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
        document.getElementById("EVENTOS_FORM").style.display = "block";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        
        document.getElementById("TT_FORM").style.display = "none";
        document.getElementById("PART_FORM").style.display="none";
    }
    
    if(clicked_id === "PRO_SIP")
    {
        document.getElementById("ALUMNOS_FORM").style.display = "none";
        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
        document.getElementById("EVENTOS_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "block";
        document.getElementById("INDA_FORM").style.display = "none";
        
        document.getElementById("TT_FORM").style.display = "none";
        document.getElementById("PART_FORM").style.display="none";
    }
    
    if(clicked_id ==="INDAUTOR")
    {
        document.getElementById("ALUMNOS_FORM").style.display = "none";
        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
        document.getElementById("EVENTOS_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "block";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
        document.getElementById("PART_FORM").style.display="none";
    } 
    
    if(clicked_id === "TT")
    {
        document.getElementById("ALUMNOS_FORM").style.display = "none";
        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
        document.getElementById("EVENTOS_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        
        document.getElementById("TT_FORM").style.display = "block";
        document.getElementById("PART_FORM").style.display="none";
    }
    
  
    
    if(clicked_id ==="PART")
    {
        document.getElementById("ALUMNOS_FORM").style.display = "none";
        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
        document.getElementById("EVENTOS_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        
        document.getElementById("TT_FORM").style.display = "none";
        document.getElementById("PART_FORM").style.display="block";
    }
    //FALTA AGREGAR EL PUNTO 12
    
}