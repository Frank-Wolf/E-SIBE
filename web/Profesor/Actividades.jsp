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
                        <nav class="nav-lateral">
                            <ul class="backcolor">       
                                <!--Punto 2.1 Recursos Humanos Para La investigación-->
                                <li class="parent"><a class="titulo">Actividad 2.1: Alumnos</a>
                                    <ul>
                                        <li><a id="BEIFI" class="son linkers 
                                                btn-link" onClick="mostrar_formulario(this.id)">
                                                Actividad 2.1.1: Alumnos BEIFI</a>
                                            
                                        <li><a id="SERVICIO" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.1.2: Alumnos S.S.</a>    
                                    </ul>
                                </li>
                                
                                <!--Punto 2.2 Publicaciones en Revistas-->
                                <li class="parent"><a class="titulo"> Actividad 2.2: Publicaciones</a>
                                    <ul>
                                        <li><a id="BOLETINES" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.2.1: En boletínes </a>
                                        
                                        <li><a id="NOARBITRAJE" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.2.2: Sin arbitraje</a>    
                                            
                                        <li><a id="ARBITRAJE" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">Actividad 2.2.3: Con arbitraje</a>    
                                    </ul>
                                </li>
                                
                                <!--Punto 2.3 Publicaciones en Eventos Académicos-->
                                <li class="parent"><a class="titulo">Actividad 2.3: Part. en Eventos Académicos</a>
                                    <ul>
                                        <li><a id="INST_SINPONENCIA" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.3.1: Publicación Inst. sin Ponencia</a>
                                            
                                        <li><a id="CONRESUMEN" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.3.2: Publicación con Resúmen</a>    
                                            
                                        <li><a id="EXTENSO" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.3.3: Publicación en Extenso</a>        
                                    </ul>
                                </li>
                                
                                <!--Punto 2.4 Proyectos de Investigación SIP-->
                                <li class="parent"><a id="PRO_SIP" class="titulo linkers
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.4.2 Proyecto de Investigación SIP</a>
                                    
                                </li>
                                
                                <!--Punto 2.5 Registro de Propiedad Intelectual-->
                                <li class="parent"><a id="INDAUTOR" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.5.2 Validación de Propiedad Intelectual</a>
                                    
                                </li>
                                
                                <!--Punto 2.11 Dirección o Codirección de Tesis-->
                                <li class="parent"><a class="titulo">Actividad 2.11: Dirección de Tesis</a>
                                    <ul>
                                        <li><a id="TESIS" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.11.1 Dirección de Tesis individual</a>
                                            
                                        <li><a id="OPCION_CURRICULAR" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.11.2: Opción Curricular </a>    
                                    </ul>
                                </li>
                                
                                <!--Participación en la renovación de un plan de Estudios
                                <li class="parent"><a class="titulo">Actividad 2.12 Programa de Estudios</a>
                                    <ul>
                                        <li><a id="12_1" class="son linkers
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.1: Coordinación en 
                                            la elaboración de un plan de estudios 
                                            de carrera</a>
                                            
                                        <li><a id="12_2" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                               Actividad 2.12.2: Coordinación en
                                               la actualización de un plan de estudios 
                                               de carrera</a>    
                                            
                                        <li><a id="12_3" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.3: Participación en
                                            la elaboración de un plan de estudios</a>
                                            
                                        <li><a id="12_4" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.4: Participación en
                                            la actualización de un plan de estudios</a>
                                            
                                        <li><a id="12_5" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.5: Coordinación en
                                            la elaboración de un programa de estudios</a>
                                            
                                        <li><a id="12_6" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.6: Coordinación en
                                            la actualización de un programa de estudios</a>    
                                            
                                        <li><a id="12_7" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                                Actividad 2.12.7: Participación en
                                            la elaboración de un programa de estudios</a>
                                            
                                        <li><a id="12_8" class="son linkers 
                                               btn-link"  onClick="mostrar_formulario(this.id)">
                                               Actividad 2.12.8: Participación en
                                            la actualización de un programa de estudios</a>     
                                    </ul>
                                </li>-->
                            </ul>
                        </nav>
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
        <script src="../css/js/bootstrap-treeview.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
