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

        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <script src="<s:url value="../css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        
       
         <!--<script src="https://use.fontawesome.com/bb87f67ebc.js"></script>-->
        <link rel="stylesheet" href="<s:url value="../css/font-awesome-4.7.0/css/font-awesome.min.css"/>"/>
        
    </head>
    
    <body background="../css/textura.png" class="container-fluid" style="overflow: scroll">
        
        <!--header-->
        <header class="headering rela">
            <s:div cssClass="container">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" class="img-responsive"/>
            </s:div>
        </header> 
   
        <!--Conteneor general-->    
        <s:div cssClass="container-fluid">
            <s:div cssClass="">
                
                <!--Barra de Navegacion-->                    
                <nav class="navbar navbar-default row">
        
                    <div class=" col-lg-12">
                    
                        <div class="navbar-header">
                            <a class="navbar-brand" > E-SIBE: Profesor</a>
                        </div>
                        
                        <!-- Parte derecha de barra de navegacion-->
                        <div class="container">
                            <ul class="nav navbar-nav navbar-right">
                                 <li><a href="Menu">
                                        Menú Principal</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="row">
                    <!--Menú de opciones lateral-->
                    <div class="col-md-3 barra">
                        <ul class="bl">
                            
                            <!--Actividad 2.1: Formación de Recursos Humanos para la Investigación-->
                            <li class="activado"><a><i class="icono izquierda fa fa-users"></i> 
                                    Actividad 2.1: Alumnos <i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                                <ul>
                                    <li><a id="BEIFI" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.1.1: Alumnos BEIFI</a>
                                    <li><a id="SERVICIO" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.1.2: Alumnos S.S.</a> 
                                </ul>
                            </li>
                            
                            <!--Actividad 2.2: Publicaciones-->
                            <li class="activado"><a><i class="icono izquierda fa fa-newspaper-o" aria-hidden="true"></i>
                                    Actividad 2.2: Publicaciones <i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                                <ul>
                                    <li><a id="BOLETINES" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.2.1: En boletínes </a>
                                        
                                        <li><a id="NOARBITRAJE" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.2.2: Sin arbitraje</a>    
                                            
                                        <li><a id="ARBITRAJE" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.2.3: Con arbitraje</a>    
                                </ul>
                            </li>    
                            
                            <!--Actividad 2.3: Eventos Académicos-->
                            <li class="activado"><a><i class="icono izquierda fa fa-university" aria-hidden="true"></i> 
                                    Actividad 2.3: Eventos Académicos <i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                                <ul>
                                    <li><a id="INST_SINPONENCIA" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.3.1: Publicación Inst. sin Ponencia</a>
                                            
                                        <li><a id="CONRESUMEN" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.3.2: Publicación con Resúmen</a>    
                                            
                                        <li><a id="EXTENSO"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.3.3: Publicación en Extenso</a>   
                                </ul>
                            </li>
                            
                            <!--Actividad 2.4: Proyecto de Investigación SIP-->
                            <li><a><i class="icono izquierda fa fa-file-text" aria-hidden="true"></i> 
                                    Actividad 2.4.2: Proyecto SIP </a></li>
                            
                            <!--Actividad 2.5: Registro de propiedad Intelectual-->        
                            <li><a><i class="icono izquierda fa fa-lock" aria-hidden="true"></i> 
                                    Actividad 2.5.2.2: Propiedad Intelectual </a></li>
                            
                                    
                            <!--Actividad 2.11: Dirección de Tesis-->        
                            <li class="activado"><a><i class="icono izquierda fa fa-graduation-cap" aria-hidden="true"></i> 
                                    Actividad 2.11: Dirección de Tesis <i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                                <ul>
                                    <li><a id="TESIS" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.11.1 Dirección de Tesis individual</a>
                                            
                                        <li><a id="OPCION_CURRICULAR" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.11.2: Opción Curricular </a>    
                                </ul>
                            </li>
                            <li class="activado"><a><i class="icono izquierda fa fa-pencil" aria-hidden="true"></i>
                                    Actividad 2.12: Plan de Estudios <i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                                <ul>
                                    <li><a id="12_1" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.1: Coordinación en 
                                            la elaboración de un plan de estudios 
                                            de carrera</a></li>
                                            
                                        <li><a id="12_2" onClick="mostrar_formulario(this.id)">
                                               Actividad 2.12.2: Coordinación en
                                               la actualización de un plan de estudios 
                                               de carrera</a></li>    
                                            
                                        <li><a id="12_3" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.3: Participación en
                                            la elaboración de un plan de estudios</a></li>
                                            
                                        <li><a id="12_4" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.4: Participación en
                                            la actualización de un plan de estudios</a></li>
                                            
                                        <li><a id="12_5" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.5: Coordinación en
                                            la elaboración de un programa de estudios</a></li>
                                            
                                        <li><a id="12_6" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.6: Coordinación en
                                            la actualización de un programa de estudios</a></li>    
                                            
                                        <li><a id="12_7" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.7: Participación en
                                            la elaboración de un programa de estudios</a></li>
                                            
                                        <li><a id="12_8" onClick="mostrar_formulario(this.id)">
                                               Actividad 2.12.8: Participación en
                                               la actualización de un programa de estudios</a></li>
                                    
                                </ul>
                            </li>
                        </ul>
                    
                    </div>    
                    
                    <h2 class="Titular" align="center"> Registro de Actividades </h2>
                    
                    <!--FORM BEIFI -->
                    <s:div id="BEIFI_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_a" label="Nombre de Alumno BEIFI" cssClass="form-control"/>
                            <s:textfield name="numero_bol" label="Numero de boleta del Alumno BEIFI" cssClass="form-control"/>
                            <s:textfield name="numero_p" label="Numero de Proyecto SIP" cssClass="form-control"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    
                    
                    <!--SERVICIO FORM-->
                    <s:div  id="SERVICIO_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_a" label="Nombre de Alumno en Servicio Social" cssClass="form-control" />
                            <s:textfield name="numero_ss" label="Numero de Registro de Servicio Social" cssClass="form-control" />
                            <s:textfield name="fecha_ss_fin" label="Fecha de Finalización de Servicio Social" cssClass="form-control" />
                            
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>  

                    <!--PUBLICACIONES EN BOLETINES FORM-->
                    <s:div id="BOLETINES_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">
                        
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_publi" label="Nombre del Artículo" cssClass="form-control"/>
                            <s:textfield name="fecha_pub" label="Fecha de Publicación" cssClass="form-control"/>                           
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    
                    
                    <!--PUBLICACIONES SIN ARBITRAJE FORM-->
                    <s:div  id="SINAR_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_publi" label="Nombre de publicación" cssClass="form-control" />
                            <s:textfield name="numero_ISSN" label="Numero de ISSN" cssClass="form-control" />
                            <s:textfield name="fecha_pub" label="Fecha de Publicación" cssClass="form-control" />
                            
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>         
                    
                    <!--PUBLICACIONES CON ARBITRAJE FORM-->
                    <s:div  id="CONAR_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_publi" label="Nombre de publicación" cssClass="form-control" />
                            <s:textfield name="numero_ISSN" label="Numero de ISSN" cssClass="form-control" />
                            <s:textfield name="fecha_pub" label="Fecha de Publicación" cssClass="form-control" />
                            
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>     

                    <!--EVENTOS SIN PONENCIA FORM-->        
                    <s:div  id="SIN_PONENCIA_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_ea" label="Nombre de Evento Académico" cssClass="form-control" />
                            <s:textfield name="fecha_ev" label="Fecha del Evento" cssClass="form-control" />
                            <s:textfield name="num_pub" label="Número de Publicación" cssClass="form-control" />
                            
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div> 

                    <!--PUBLICACIONES CON RESUMEN FORM-->
                    <s:div id="CON_RESUMEN_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">
                        
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_ea" label="Nombre del Evento Académico" cssClass="form-control"/>
                            <s:textfield name="fecha_ea" label="Fecha del Evento Académico" cssClass="form-control"/>
                            <s:textfield name="ponencia" label="Titulo de Ponencia" cssClass="form-control"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    
                            
                    <!--PUBLICACIONES EN EXTENSO FORM-->
                    <s:div  id="EN_EXTENSO_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_a" label="Nombre de la publicación" cssClass="form-control" />
                            <s:textfield name="numero_ss" label="Numero de Publicación" cssClass="form-control" />
                            <s:textfield name="fecha_ss_fin" label="Fecha de Publicación" cssClass="form-control" />
                            
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>  
                
                    <!--PROYECTO DE INVESTIGACIÖN SIP FORM-->
                    <s:div id="PROYECTO_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">    
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_a" label="Número de Proyecto de Investigación" cssClass="form-control"/>
                            <s:textfield name="numero_p" label="Fecha de Proyecto" cssClass="form-control"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    

                    <!--PROPIEDAD INTELECTUAL FORM-->
                    <s:div id="INDA_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">    
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_a" label="Número de Obra" cssClass="form-control"/>
                            <s:textfield name="numero_bol" label="Tipo de Obra" cssClass="form-control"/>
                            <s:textfield name="numero_p" label="Fecha del Registro" cssClass="form-control"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    

                    <!--TESIS FORM-->
                    <s:div id="TESIS_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">    
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_a" label="Número de Tésis" cssClass="form-control"/>
                            <s:textfield name="numero_bol" label="Numero de boleta del Alumno" cssClass="form-control"/>
                            <s:textfield name="numero_p" label="Fecha de Titulación del Alumno" cssClass="form-control"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    

                    <!--TT_CURRICULAR FORM-->
                    <s:div id="TT_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">    
                        <s:form action="Usuario/Sesion" method="post">
                            <s:textfield name="nombre_a" label="Número de Trabajo Terminal" cssClass="form-control"/>
                            <s:textfield name="numero_bol" label="Numero de boleta del Alumno" cssClass="form-control"/>
                            <s:textfield name="numero_p" label="Fecha de Titulación del Alumno" cssClass="form-control"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    
                
                
                
                </div><!--Contenido-->    
                
               
            </s:div>  
        </s:div>
                
                
        
        
        
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
       
        
        <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/barralateral.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
