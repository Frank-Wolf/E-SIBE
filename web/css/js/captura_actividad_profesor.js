/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function limpia()
{
    alert("no es temporada de apelaciones");
}


function mostrar_formulario(clicked_id)
{
    if(clicked_id === "BEIFI")
    {
        document.getElementById("BEIFI_FORM").style.display = "block";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    }
    
    if(clicked_id ==="SERVICIO")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "block";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    } 
    
    if(clicked_id === "BOLETINES")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "block";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    }
    
    if(clicked_id ==="NOARBITRAJE")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "block";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    } 

    if(clicked_id === "ARBITRAJE")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "block";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    }
    
    if(clicked_id ==="INST_SINPONENCIA")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "block";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    } 
    
    if(clicked_id === "CONRESUMEN")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "block";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    }
    
    if(clicked_id ==="EXTENSO")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "block";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    } 
    
    if(clicked_id === "PRO_SIP")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "block";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    }
    
    if(clicked_id ==="INDAUTOR")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "block";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "none";
    } 
    
    if(clicked_id === "TESIS")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "block";
        document.getElementById("TT_FORM").style.display = "none";
    }
    
    if(clicked_id ==="OPCION_CURRICULAR")
    {
        document.getElementById("BEIFI_FORM").style.display = "none";
        document.getElementById("SERVICIO_FORM").style.display = "none";
        document.getElementById("BOLETINES_FORM").style.display = "none";
        document.getElementById("SINAR_FORM").style.display = "none";
        document.getElementById("CONAR_FORM").style.display = "none";
        document.getElementById("SIN_PONENCIA_FORM").style.display = "none";
        document.getElementById("CON_RESUMEN_FORM").style.display = "none";
        document.getElementById("EN_EXTENSO_FORM").style.display = "none";
        document.getElementById("PROYECTO_FORM").style.display = "none";
        document.getElementById("INDA_FORM").style.display = "none";
        document.getElementById("TESIS_FORM").style.display = "none";
        document.getElementById("TT_FORM").style.display = "block";
    } 
    
    //FALTA AGREGAR EL PUNTO 12
    
}