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
                            <li><a id="ALUMNOS" onClick="mostrar_formulario(this.id)"><i class="icono izquierda fa fa-users"></i> 
                                    Actividad 2.1: Alumnos </a></li>
                            
                            <!--Actividad 2.2: Publicaciones-->
                            <li><a id="PUBLICACIONES" onClick="mostrar_formulario(this.id)"><i class="icono izquierda fa fa-newspaper-o" aria-hidden="true"></i>
                                    Actividad 2.2: Publicaciones</a></li>    
                            
                            <!--Actividad 2.3: Eventos Académicos-->
                            <li><a id ="EVENTOS" onClick="mostrar_formulario(this.id)"><i class="icono izquierda fa fa-university" aria-hidden="true"></i> 
                                    Actividad 2.3: Eventos Académicos</a></li>
                            
                            <!--Actividad 2.4: Proyecto de Investigación SIP-->
                            <li><a id="PRO_SIP" onClick="mostrar_formulario(this.id)"><i class="icono izquierda fa fa-file-text" aria-hidden="true"></i> 
                                    Actividad 2.4.2: Proyecto SIP </a></li>
                            
                            <!--Actividad 2.5: Registro de propiedad Intelectual-->        
                            <li><a id="INDAUTOR" onClick="mostrar_formulario(this.id)"><i  class="icono izquierda fa fa-lock" aria-hidden="true"></i> 
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
                            <li class="activado"><a  id="PART" onClick="mostrar_formulario(this.id)"><i class="icono izquierda fa fa-pencil" aria-hidden="true"  ></i>
                                    Actividad 2.12: Plan de Estudios</a> 
                            </li>
                        </ul>
                    
                    </div>    
                    
                    <h2 class="Titular" align="center"> Registro de Actividades </h2>
                    
                    <!--FORM ALUMNNOS -->
                    <s:div id="ALUMNOS_FORM"  cssClass="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;">    
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_1'}"/>
                        <s:form action="valida_alumnoB" method="post" enctype="multipart/form-data">
                            <s:hidden name="username" label="Matrícula"/>
                            <s:textfield name="id_proyecto" label="Número de Proyecto de Investigación" cssClass="form-control"/>
                            <s:textfield name="id_alumno" label="Matrícula del Alumno" cssClass="form-control"/>
                            <s:select label="Seleccione el tipo de Alumno que participo en su proyecto SIP" cssClass="form-control"
                            headerKey="-1" headerValue="Tipo de Alumno"
                            list="# {
                            'BEIFI':'Alumno BEIFI',
                            'SS':'Alumno en Servicio Social'
                            }"
                            name="tipo_alumno" /> 
                            
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    
                                
                    <!--PUBLICACIONES FORM-->
                    <s:div  id="PUBLICACIONES_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_2'}"/>
                        <s:form action="valida_publicacion" method="post" enctype="multipart/form-data">
                            <s:textfield name="id_publicacion" label="ID de la Publicacion" cssClass="form-control" />
                            <s:textfield name="nombre_publicacion" label="Nombre de publicación" cssClass="form-control" />
                            <s:select label="Seleccione el tipo de publicacion que realizo" cssClass="form-control"
                            headerKey="-1" headerValue="Tipo de Publicacion"
                            list="# {
                            '1':'Boletin Institucional',
                            '2':'Sin arbitraje, Nacional',
                            '3':'Sin arbitraje, Internacional',
                            '4':'Con arbitraje, Nacional',
                            '5':'Con arbitraje, Internacional'
                            }"
                            name="id_tipo_pub" /> 
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
                            <s:hidden name="username" label="Matrícula"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>     

                    <!--EVENTOS FORM-->        
                    <s:div  id="EVENTOS_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_3'}"/>
                        <s:form action="valida_evento" method="post" enctype="multipart/form-data">
                            <s:textfield name="id_evento" label="ID del Evento Académico" cssClass="form-control" />
                            <s:textfield name="id_publicacion" label="Número de Publicación" cssClass="form-control" />
                            <s:select label="Seleccione la dependecia con la que participó" cssClass="form-control"
                            headerKey="-1" headerValue="Tipo de publicacion"
                            list="# {
                            '6':'Institucional, sin ponencia publicada',
                            '7':'Institucional, con resumen publicado',
                            '8':'Institucional, publicado en extenso'
                            }"
                            name="id_tipo_pub" />   
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
                            <s:hidden name="username" label="Matrícula"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div> 

                    <!--PROYECTO DE INVESTIGACIÖN SIP FORM-->
                    <s:div id="PROYECTO_FORM"  cssClass="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;">
                        <s:set name="activity" value="%{'Actividad_2_4'}"/>
                        <s:set name="username" value="%{#session.username}" />
                        <s:form action="valida_proyecto" method="post" enctype="multipart/form-data">
                            <s:hidden name="username" label="Matrícula"/>
                            <s:textfield name="id_proyecto" label="Número de Proyecto de Investigación" cssClass="form-control"/>
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    

                    <!--PROPIEDAD INTELECTUAL FORM-->
                    <s:div id="INDA_FORM"  cssClass="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;">    
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_5'}"/>
                        <s:form action="valida_inda" method="post" enctype="multipart/form-data">
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
                            <s:hidden name="username" label="Matrícula"/>
                            <s:textfield name="id_obra" label="Número de Obra" cssClass="form-control"/>
                        
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    

                    <!--TESIS FORM-->
                    <s:div id="TESIS_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">
                        <s:set name="activity" value="%{'Actividad_2_11'}"/>
                        <s:form action="valida_tt" method="post" enctype="multipart/form-data">
                            <s:hidden name="username" label="Matrícula"/>
                            <s:textfield name="id_TT" label="Número de Tésis" cssClass="form-control"/>
                            <s:textfield name="id_alumno" label="Numero de boleta del Alumno" cssClass="form-control"/>
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    

                    <!--TT_CURRICULAR FORM-->
                    <s:div id="TT_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">    
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_11'}"/>
                        <s:form action="valida_tt" method="post" enctype="multipart/form-data">
                            <s:hidden name="username" label="Matrícula"/>
                            <s:textfield name="id_TT" label="Número de Tésis" cssClass="form-control"/>
                            <s:textfield name="id_alumno" label="Numero de boleta del Alumno" cssClass="form-control"/>
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>    
                    
                    <s:div id="PART_FORM"  cssClass="col-lg-9 cover-inner" align="center" style="display:none;">    
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_12'}"/>
                        <s:form action="valida_partt" method="post" enctype="multipart/form-data">
                            <s:hidden name="username" label="Matrícula"/>
                            <s:textfield name="id_part" label="Número de Participacion" cssClass="form-control"/>
                            <s:select label="Seleccione la dependecia con la que participó" cssClass="form-control"
                            headerKey="-1" headerValue="Dependencia"
                            list="# {
                            'SIP':'SIP',
                            'DES':'DES',
                            'DEMS':'DEMS'
                            }"
                            name="u_a" />   
                            <s:label for="myFile">Suba su constancia o archivo (máximo 10 MB y formato pdf).</s:label>
                            <s:file name="myFile" />
                            <s:hidden name="activity"/>
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
