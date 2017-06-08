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

function mostrar_formulariot(clicked_id)
{
    if(clicked_id === "ALUMNOSR")
    {
//        document.getElementById("ALUMNOS_FORM").style.display = "none";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
//        document.getElementById("EVENTOS_FORM").style.display = "none";
//        document.getElementById("PROYECTO_FORM").style.display = "none";
//        //document.getElementById("INDA_FORM").style.display = "none";
//        //document.getElementById("INDA_FORM2").style.display = "block";
//        document.getElementById("TT_FORM").style.display = "none";
//        document.getElementById("PART_FORM").style.display="none";
//        document.getElementById("IND").style.display = "none";
        document.getElementById("ALU2").style.display = "block";
        document.getElementById("PUB2").style.display = "none";
        document.getElementById("EVE2").style.display = "none";
        document.getElementById("PRO2").style.display = "none";
        document.getElementById("IND2").style.display = "none";
        //document.getElementById("INDA_FORM2").style.display = "block";
        document.getElementById("TT2").style.display = "none";
        document.getElementById("PART2").style.display="none";
        //document.getElementById("IND").style.display = "none";
    }
    
    if(clicked_id ==="PUBLICACIONESR")
    {
        document.getElementById("ALUMNOS_FORMR").style.display = "none";
        document.getElementById("PUBLICACIONES_FORMR").style.display = "block";
        document.getElementById("EVENTOS_FORMR").style.display = "none";
        document.getElementById("PROYECTO_FORMR").style.display = "none";
        document.getElementById("INDA_FORMR").style.display = "none";
        document.getElementById("TT_FORMR").style.display = "none";
        document.getElementById("PART_FORMR").style.display="none";
    } 
    
    if(clicked_id === "EVENTOSR")
    {
        document.getElementById("ALUMNOS_FORMR").style.display = "none";
        document.getElementById("PUBLICACIONES_FORMR").style.display = "none";
        document.getElementById("EVENTOS_FORMR").style.display = "block";
        document.getElementById("PROYECTO_FORMR").style.display = "none";
        document.getElementById("INDA_FORMR").style.display = "none";
        
        document.getElementById("TT_FORMR").style.display = "none";
        document.getElementById("PART_FORMR").style.display="none";
    }
    
    if(clicked_id === "PRO_SIPR")
    {
        document.getElementById("ALUMNOS_FORMR").style.display = "none";
        document.getElementById("PUBLICACIONES_FORMR").style.display = "none";
        document.getElementById("EVENTOS_FORMR").style.display = "none";
        document.getElementById("PROYECTO_FORMR").style.display = "block";
        document.getElementById("INDA_FORMR").style.display = "none";
        
        document.getElementById("TT_FORMR").style.display = "none";
        document.getElementById("PART_FORMR").style.display="none";
    }
    
    if(clicked_id ==="INDAUTORR")
    {
        document.getElementById("ALUMNOS_FORMR").style.display = "none";
        document.getElementById("PUBLICACIONES_FORMR").style.display = "none";
        document.getElementById("EVENTOS_FORMR").style.display = "none";
        document.getElementById("PROYECTO_FORMR").style.display = "none";
        document.getElementById("INDA_FORMR").style.display = "block";
        
        document.getElementById("TT_FORMR").style.display = "none";
        document.getElementById("PART_FORMR").style.display="none";
    } 
    
    
    if(clicked_id === "TTR")
    {
        document.getElementById("ALUMNOS_FORMR").style.display = "none";
        document.getElementById("PUBLICACIONES_FORMR").style.display = "none";
        document.getElementById("EVENTOS_FORMR").style.display = "none";
        document.getElementById("PROYECTO_FORMR").style.display = "none";
        document.getElementById("INDA_FORMR").style.display = "none";
        
        document.getElementById("TT_FORMR").style.display = "block";
        document.getElementById("PART_FORMR").style.display="none";
    }
    
  
    
    if(clicked_id ==="PART2")
    {
        document.getElementById("ALU2").style.display = "none";
        document.getElementById("PUB2").style.display = "none";
        document.getElementById("EVE2").style.display = "none";
        document.getElementById("PRO2").style.display = "none";
        document.getElementById("IND2").style.display = "none";
        
        document.getElementById("TT2").style.display = "none";
        document.getElementById("PART2").style.display="block";
    }
    //FALTA AGREGAR EL PUNTO 12
}
//}
//function no(clicked_id){
//     if(clicked_id === "ALUMNOS")
//    {
//        document.getElementById("ALUMNOS_FORM").style.display = "block";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
//        document.getElementById("EVENTOS_FORM").style.display = "none";
//        document.getElementById("PROYECTO_FORM").style.display = "none";
//        document.getElementById("INDA_FORM").style.display = "none";
//        document.getElementById("INDA_FORM2").style.display = "block";
//        document.getElementById("TT_FORM").style.display = "none";
//        document.getElementById("PART_FORM").style.display="none";
//    }
//    
//    if(clicked_id ==="PUBLICACIONES")
//    {
//        document.getElementById("ALUMNOS_FORM").style.display = "none";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "block";
//        document.getElementById("EVENTOS_FORM").style.display = "none";
//        document.getElementById("PROYECTO_FORM").style.display = "none";
//        document.getElementById("INDA_FORM").style.display = "none";
//        
//        document.getElementById("TT_FORM").style.display = "none";
//        document.getElementById("PART_FORM").style.display="none";
//    } 
//    
//    if(clicked_id === "EVENTOS")
//    {
//        document.getElementById("ALUMNOS_FORM").style.display = "none";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
//        document.getElementById("EVENTOS_FORM").style.display = "block";
//        document.getElementById("PROYECTO_FORM").style.display = "none";
//        document.getElementById("INDA_FORM").style.display = "none";
//        
//        document.getElementById("TT_FORM").style.display = "none";
//        document.getElementById("PART_FORM").style.display="none";
//    }
//    
//    if(clicked_id === "PRO_SIP")
//    {
//        document.getElementById("ALUMNOS_FORM").style.display = "none";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
//        document.getElementById("EVENTOS_FORM").style.display = "none";
//        document.getElementById("PROYECTO_FORM").style.display = "block";
//        document.getElementById("INDA_FORM").style.display = "none";
//        
//        document.getElementById("TT_FORM").style.display = "none";
//        document.getElementById("PART_FORM").style.display="none";
//    }
//    
//    if(clicked_id ==="INDA2")
//    {
//        document.getElementById("ALUMNOS_FORM").style.display = "none";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
//        document.getElementById("EVENTOS_FORM").style.display = "none";
//        document.getElementById("PROYECTO_FORM").style.display = "none";
//        document.getElementById("IND").style.display = "block";
//        
//        document.getElementById("TT_FORM").style.display = "none";
//        document.getElementById("PART_FORM").style.display="none";
//    } 
//    
//    
//    if(clicked_id === "TT")
//    {
//        document.getElementById("ALUMNOS_FORM").style.display = "none";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
//        document.getElementById("EVENTOS_FORM").style.display = "none";
//        document.getElementById("PROYECTO_FORM").style.display = "none";
//        document.getElementById("INDA_FORM").style.display = "none";
//        
//        document.getElementById("TT_FORM").style.display = "block";
//        document.getElementById("PART_FORM").style.display="none";
//    }
//    
//  
//    
//    if(clicked_id ==="PART")
//    {
//        document.getElementById("ALUMNOS_FORM").style.display = "none";
//        document.getElementById("PUBLICACIONES_FORM").style.display = "none";
//        document.getElementById("EVENTOS_FORM").style.display = "none";
//        document.getElementById("PROYECTO_FORM").style.display = "none";
//        document.getElementById("INDA_FORM").style.display = "none";
//        
//        document.getElementById("TT_FORM").style.display = "none";
//        document.getElementById("PART_FORM").style.display="block";
//    }   
//}