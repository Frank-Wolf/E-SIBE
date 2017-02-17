<%-- 
    Document   : About_us
    Created on : 30/01/2017, 10:48:29 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
        
    <!--head-->
    <head>  
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> E-SIBE</title>

        <link href="<s:url value="../css/bootstrap.min.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        
        <script>
        captura_actividad()
        {
            var Actividad=document.getElementById("Actividades").value;
            document.getElementById("resultado").innerHTML=" \
            <br>Por Nombre: "+Actividad;
        }
        </script>
    </head>
    
    <body background="../css/textura.png" class="container-fluid boding overflow">
        
        <!--header-->
        <header class="headering rela">
            <s:div cssClass="container">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" class="img-responsive"/>
            </s:div>
        </header> 
   
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                
                <!--Barra de Navegacion-->                    
                <nav class="navbar navbar-default">
        
                    <div class="container">
                    
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Profesor</a>
                        </div>
                        
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Menu">
                                        Menú Principal</a>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
             
                <!--Contenido-->
                <s:div cssClass="cover-container2" align="center"> 
                    <div class="row">
                        <div class="col-md-6 col-sm-6 hidden-xs display-table-cell v-align box" id="navigation"/>
                            <h2 class="h3">Elige la actividad a validar</h2>
                                <select id="Actividades" multiple class="form-control" size="18">
                                    <optgroup label="Actividad 2.1: Formación de 
                                               Recursos Humanos para la Investigación" >
                                        <option value="Actividad_2_1_1"> 
                                            Actividad 2.1.1: Alumnos BEIFI
                                        </option>
                                        <option name="Actividad_2_1_2"> 
                                            Actividad 2.1.2: Alumnos en Servicio
                                            Social
                                        </option>   
                                    </optgroup>

                                    <optgroup label="Actividad 2.2: Publicaciones 
                                               científicas y de divulgación impresas 
                                               o en línea" >
                                        <option name="Actividad_2_2_1"> 
                                            Actividad 2.2.1: En boletínes 
                                            Institucionales
                                        </option>
                                        <option name="Actividad_2_2_2"> 
                                            Actividad 2.2.2: En revistas sin 
                                            arbitraje
                                        </option>    
                                        <option name="Actividad_2_2_3"> Actividad 2.2.2: En revistas 
                                            con arbitraje
                                        </option>    
                                    </optgroup>

                                    <optgroup label="Actividad 2.3: Trabajos de 
                                               Investigacion" >
                                        <option name="Actividad_2_3_1"> 
                                            Actividad 2.3.1: Sin ponencia
                                        </option>
                                        <option name="Actividad_2_3_2"> 
                                            Actividad 2.3.2: Institucional con 
                                            resumen publicado
                                        </option>   
                                        <option name="Actividad_2_3_3"> 
                                            Actividad 2.3.3: Con publicación en 
                                            extenso
                                        </option>   
                                    </optgroup>

                                    <optgroup label="Actividad 2.4: Investigación y/o
                                               desarrollo Tecnológico satisfactorio">
                                        <option name="Actividad_2_4_2"> 
                                            Actividad 2.4.2: Proyecto de 
                                            Investigación SIP
                                        </option>
                                    </optgroup>

                                    <optgroup label="Actividad 2.5: Registro de 
                                               Propiedad Intelectual" >
                                        <option name="Actividad_2_5_2"> 
                                            Actividad 2.5.2.1: Derechos de Autor
                                        </option>
                                    </optgroup>

                                    <optgroup label="Actividad 2.11: Direcciones y 
                                               Coodirecciones de Tesis (Máximo 6 por 
                                               periodo)" >
                                        <option  name="Actividad_2_11_1"> 
                                            Actividad 2.11.1: Tesis individual 
                                            y colectiva
                                        </option>
                                        <option name="Actividad_2_11_2"> 
                                            Actividad 2.11.2: Opción Curricular
                                        </option>   
                                    </optgroup>                                

                                     <optgroup label="Actividad 2.12: Tipo de Participación
                                               en Plan de Estudios" >
                                        <option name="Actividad_2_12_1"> 
                                            Actividad 2.12.1: Coordinación en 
                                            la elaboración de un plan de estudios 
                                            de carrera
                                        </option>
                                        <option name="Actividad_2_12_2"> 
                                            Actividad 2.12.2: Coordinación en
                                            la actualización de un plan de estudios 
                                            de carrera
                                        </option>
                                        <option name="Actividad_2_12_3"> 
                                            Actividad 2.12.3: Participación en
                                            la elaboración de un plan de estudios
                                        </option>
                                        <option name="Actividad_2_12_4"> 
                                            Actividad 2.12.4: Participación en
                                            la actualización de un plan de estudios
                                        </option>
                                        <option name="Actividad_2_12_5"> 
                                            Actividad 2.12.5: Coordinación en
                                            la elaboración de un programa de estudios
                                        </option>
                                        <option name="Actividad_2_12_6"> 
                                            Actividad 2.12.6: Coordinación en
                                            la actualización de un programa de estudios
                                        </option>
                                        <option name="Actividad_2_12_7"> 
                                            Actividad 2.12.7: Participación en
                                            la elaboración de un programa de estudios
                                        </option>
                                        <option name="Actividad_2_12_8"> 
                                            Actividad 2.12.8: Participación en
                                            la actualización de un programa de estudios
                                        </option>
                                     </optgroup>
                                </select>  
                            <input type="button" class="btn" value="Confirmar Actividad" onclick="capturar_actividad()">
                        </div>
                        
                        <div class="col-md-6 col-sm-6 hidden-xs display-table-cell v-align box" id="navigation"/>
                            <h2 class="h3">Elige la cantidad de documentos a 
                                validar de la misma</h2>
                            
                            <form id="cantidad">
                                   <input type="radio" name="1"  /> 1
                                   
                                <div id="resultado"></div>

                            <button class="btn"> GO!</button>
                            </form>
                        </div>
                        
                    </div>       
                </s:div>
            </s:div>  
        </s:div>        
        
        
        
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
       
        
        <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>