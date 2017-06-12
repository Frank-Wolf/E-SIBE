<%-- 
    Document   : BEIFI
    Created on : 23/04/2017, 09:38:52 AM
    Author     : le_as
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <sj:head />
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
          <script src="<s:url value="/css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link rel="icon" href="<s:url value="/icono.ico"/>"/>
    </head>
    <body background="../css/textura.png" class="boding">
        <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
        <s:set var="username" value="%{#session.username}" />
        <jsp:useBean id="username" type="java.lang.String"/>
        <header class="headering">
            <s:div cssClass="container-fluid">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
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
                            <li><a id="ALUMNOSR" onClick="mostrar_formulariot(this.id)"><i class="icono izquierda fa fa-users"></i> 
                                    Actividad 2.1: Alumnos </a></li>
                            
                            <!--Actividad 2.2: Publicaciones-->
                            <li><a id="PUBLICACIONESR" onClick="mostrar_formulariot(this.id)"><i class="icono izquierda fa fa-newspaper-o" aria-hidden="true"></i>
                                    Actividad 2.2: Publicaciones</a></li>    
                            
                            <!--Actividad 2.3: Eventos Académicos-->
                            <li><a id ="EVENTOSR" onClick="mostrar_formulariot(this.id)"><i class="icono izquierda fa fa-university" aria-hidden="true"></i> 
                                    Actividad 2.3: Eventos Académicos</a></li>
                            
                            <!--Actividad 2.4: Proyecto de Investigación SIP-->
                            <li><a id="PRO_SIPR" onClick="mostrar_formulariot(this.id)"><i class="icono izquierda fa fa-file-text" aria-hidden="true"></i> 
                                    Actividad 2.4.2: Proyecto SIP </a></li>
                            
                            <!--Actividad 2.5: Registro de propiedad Intelectual-->        
                            <li><a id="INDAUTORR" onClick="mostrar_formulariot(this.id)"><i  class="icono izquierda fa fa-lock" aria-hidden="true"></i> 
                                    Actividad 2.5.2.2: Propiedad Intelectualusa </a></li>
                            
                                    
                            <!--Actividad 2.11: Dirección de Tesis-->        
                            <li class="activado"><a id="TTR" onclick="mostrar_formulariot(this.id)"><i class="icono izquierda fa fa-graduation-cap" aria-hidden="true"></i> 
                                    Actividad 2.11: Dirección de Tesis </a>
                                
                            </li>
                            <li class="activado"><a  id="PARTR" onClick="mostrar_formulariot(this.id)"><i class="icono izquierda fa fa-pencil" aria-hidden="true"  ></i>
                                    Actividad 2.12: Plan de Estudios</a> 
                            </li>
                        </ul>
                    
                    </div>    
                    
                    <h2 class="Titular" align="center"> Reportar Actividades No Registradas</h2>
                    
                    <div id="ALU2" css="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;"> 
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_1'}"/>
                        <s:set name="registrado_alumno" value="%{0}"/>
                        <s:form action="registra_AlumnoS_profesor" method="post">
                                <s:textfield name="id_usuario" label="No. Empleado del Profesor" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="No. de Empleado del Autor" type="number"/>
                                <s:textfield name="id_proyecto" label="Id del Proyecto" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="[4 dígitos-año][4 dígitos-consecutivo]" type="number"/>                                                      
                                <s:select label="Seleccione el Rol de Profesor" cssClass="form-control"
                                headerKey="-1" headerValue="Rol de Profesor"
                                list="# {
                                'Coordinador':'Coordinador',
                                'Colaborador':'Colaborador'
                                }"
                                name="rol_profesor" /> 
                                 <s:select label="Seleccione el Tipo de Alumno" cssClass="form-control"
                                headerKey="-1" headerValue="Tipo de Alumno"
                                list="# {
                                'BEIFI':'Alumno BEIFI',
                                'SS':'Alumno en Servicio Social'
                                }"
                                name="tipo_alumno" /> 
                                <s:textfield name="id_alumno" label="Matricula del Alumno" cssClass="form-control" maxlength="10" pattern="([0-9]{10})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="Matricula del Alumno a registrar" type="number"/>
                                <s:textfield name="nom_alumno" label="Nombre del Alumno" cssClass="form-control" placeholder="Nombre del Alumno a Registrar"/>
                                <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" placeholder="Fecha del Registro"/>
                                <s:hidden name="registrado_alumno"/>
                                <s:submit value="Registrar Proyecto" cssClass="btn" />
                            </s:form> 
                    </div> 
                    
                    <div id="PUB2" css="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;"> 
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_2'}"/>
                        <s:set name="id_evento" value="%{0}"/>     
                        <s:set name="registrado" value="%{0}"/>
                            <s:form action="registra_pub_bol_profesor" method="post">
                                <s:textfield name="id_publicacion" label="Folio de Control" cssClass="form-control" placeholder="Identificador de la constancia de la pub" maxLength="19"/>
                                <s:textfield name="Nombre_Rev" label="Nombre de la Revista" cssClass="form-control" placeholder="Nombre de La Revista"/>
                                <s:textfield name="Nom_Public" label="Nombre de la publicacion" cssClass="form-control" placeholder="Nombre de la Publicación"/>
                                <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" placeholder="No. de Empleado del Autor" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                                <s:select label="Seleccione una dependencia" cssClass="form-control"
                                    headerKey="-1" headerValue="Tipo de publicacion"
                                    list="# {
                                    '1':'En Boletín Institucional',
                                    '2':'Sin Arbitraje, nacional',
                                    '3':'Sin Arbitraje, Internacional',
                                    '4':'Con Arbitraje, nacional',
                                    '5':'Con Arbitraje, Internacional'
                                    }"
                                    name="id_tipo_pub" />
                                <s:textfield name="num_autores" label="Numero de Autores"  placeholder="Numero de Autores" cssClass="form-control" maxlength="1" pattern="([0-9]{1})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                                <s:textfield name="numero" label="Numero de la revista" cssClass="form-control"/>
                                <s:textfield name="ISSN" label="ISSN" cssClass="form-control" maxlength="9" />
                                <s:textfield name="ISBN" label="ISBN" cssClass="form-control" maxlength="13"/>
                                <s:textfield name="volumen" label="Volumen" cssClass="form-control" placerholder="Vol. #"/>
                                <s:textfield name="annio" label="Año" cssClass="form-control" placeholder="VII"/>
                                <sj:datepicker name="fecha_publicacion" label="Fecha de Publicacion" displayFormat="dd-mm-yy" cssClass="form-control" style="width =80%"/>
                                <s:hidden name="id_evento" />
                                <s:hidden name="registrado" />
                                <s:submit cssClass="btn" name="Registrar TT" value="Registrar Publicación"/>
                            </s:form>
                    </div> 
                    
                    <div id="EVE2" css="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;"> 
                        <s:set name="Nacional" value="%{1}"/>
                            <s:set name="compulsado" value="%{1}"/>
                            <s:set name="ISBN" value="%{' - '}"/>
                            <s:set name="ISSN" value="%{' - '}"/>
                            <s:set name="Nombre_Rev" value="%{' - '}"/>
                            <s:set name="volumen" value="%{' - '}"/>
                            <s:set name="annio" value="%{' - '}"/>
                            <s:set name="numero" value="%{' - '}"/>
                            <s:set name="sede" value="%{'ESCOM'}"/>
                            <s:set name="registrado" value="%{0}"/>
                            <s:form action="registra_evento_profesor" method="post">
                                <s:textfield name="id_evento" label="Id de Participacion en el Evento" cssClass="form-control" placeholder="[4 dígitos consecutivos]"/>
                                <s:textfield name="nom_evento" label="Nombre del evento Academico" cssClass="form-control" placeholder="Nombre del Evento"/>
                                <sj:datepicker name="fecha_inicio" label="Fecha de Inicio" displayFormat="dd-mm-yy" style="width: 89%;"/>
                                <sj:datepicker name="fecha_fin" label="Fecha de Cierre " displayFormat="dd-mm-yy" style="width: 89%;"/>
                                <s:textfield name="id_publicacion" label="Numero de Publicación" placeholder="Id de la Publicacion" cssClass="form-control"/>
                                <s:textfield name="Nom_Public" label="Nombre de la Publicación" placeholder="Nombre de la Publicacion" cssClass="form-control"/>
                                <s:textfield name="num_autores" label="Numero de Autores" cssClass="form-control" placeholder="Numero de Autores" maxlength="1" pattern="([0-9]{1})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                                <s:select label="Seleccione el tipo de Actividad" cssClass="form-control"
                                    headerKey="-1" headerValue="Tipo de publicacion"
                                    list="# {
                                    '6':'Institucional, sin ponencia publicada',
                                    '7':'Institucional, con resumen publicado',
                                    '8':'Institucional, publicado en extenso'
                                    }"
                                    name="id_tipo_pub" />
                                <sj:datepicker name="fecha_publicacion" label="Fecha de Publicacion" displayFormat="dd-mm-yy" style="width: 89%;" />
                                <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number" />
                                <s:hidden name="Nacional" cssClass="form-control"/>
                                <s:hidden name="compulsado" cssClass="form-control"/>
                                <s:hidden name="ISSN" label="ISSN" cssClass="form-control" />
                                <s:hidden name="ISBN" label="ISBN" cssClass="form-control" />
                                <s:hidden name="Nombre_Rev" label="ISBN" cssClass="form-control" />
                                <s:hidden name="volumen" label="Volumen" cssClass="form-control"/>
                                <s:hidden name="annio" label="Año" cssClass="form-control" />
                                <s:hidden name="numero" label="Año" cssClass="form-control" />
                                <s:hidden name="sede" label="Año" cssClass="form-control" />
                                <s:hidden name="registrado" />
                                <s:submit cssClass="btn" name="Registrar"/>
                            </s:form>  
                    </div> 
                    
                    <div id="PRO2" css="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;"> 
                        <s:set name="id_alumno" value="%{0}" />
                        <s:set name="registrado" value="%{0}" />
                        <s:form action="registra_proyecto_profesor" method="post">
                            <s:textfield name="id_proyecto" label="Id del Proyecto" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="[4 dígitos-año][4 dígitos-consecutivo]" type="number"/>                           
                            <s:textfield name="nom_proyecto" label="Título del proyecto" cssClass="form-control" placeholder="Titulo del Proyecto"/>
                            <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="No. de Empleado del Autor" type="number"/>
                            
                           <s:select label="Seleccione el Rol de Profesor" cssClass="form-control"
                            headerKey="-1" headerValue="Rol de Profesor"
                            list="# {
                            'Coordinador':'Coordinador',
                            'Colaborador':'Colaborador'
                            }"
                            name="rol" />   
                            <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" placeholder="Fecha de Registro" />
                            <s:hidden name="id_alumno" label="id_alumno"/>
                            <s:hidden name="registrado" />
                            <s:submit value="Registrar Proyecto" cssClass="btn" />
                        </s:form> 
                    </div> 
                    
                    <div id="IND2" css="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;"> 
                        <s:set name="registrado" value="%{0}"/>
                        <s:form action="registra_obra_profesor" method="post">
                            <s:textfield name="id_obra" label="Id de la obra" cssClass="form-control" placeholder="[numero de autores 2 dígitos]-[año 4 dígitos]-[consecutivo de 12 dígitos]-[2 dígitos]"/>
                            <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" placeholder="No. de Empleado del autor"/>
                            <s:textfield name="nom_obra" label="Título de la obra" cssClass="form-control" placeholder="Titulo de la Obra"/>
                            <s:textfield name="num_autores" label="Número de Autores" cssClass="form-control" placeholder="Numero de Autores de la obra" maxlength="1" pattern="([0-9]{1})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                            <s:select label="Seleccione un tipo de Obra" cssClass="form-control"
                                headerKey="-1" headerValue="Tipo de Obra"
                                list="# {
                                '1':'Obra Artística',
                                '2':'Obra Arquitectónica',
                                '3':'Obra Fotográfica',
                                '4':'Manual o apuntes',
                                '5':'Obra Cinematográfica',
                                '6':'Audiovisual o Multimedia',
                                '7':'Programa de radio y televisión',
                                '8':'Diseño Gráfico',
                                '9':'Obras de Compilación',
                                '10':'Edición de libros',
                                '11':'Programa de cómputo',
                                '12':'Material Digital'
                                }"
                                name="id_tipo_obra" />        
                            <sj:datepicker name="fecha_registro" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" placeholder="fecha de registro"/>
                            <s:hidden name="registrado"/>
                            <s:submit value="Registrar" />
                        </s:form> 
                    </div> 
                    
                    <div id="TT2" css="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;"> 
                        <s:set name="registrado" value="%{0}"/>
                        <s:form action="registra_tt_prof" method="post">
                                <s:textfield name="id_alumno" label="Matricula del Alumno graduado" placeholder="Numero de 10 dígitos" cssClass="form-control"  maxlength="10" pattern="([0-9]{10})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                                <s:textfield name="nom_alumno" label="Nombre del Alumno graduado" placeholder="Nombre Completo del Alumno" cssClass="form-control"/>
                                <s:textfield name="id_TT" label="numero del TT" cssClass="form-control" placeholder="TT20##-[A/B]###"/>
                                <s:textfield name="nom_TT" label="Título del TT" cssClass="form-control" placeholder="Nombre del Trabajo Terminal"/>
                                <s:textfield name="id_usuario" label="No. Empleado del Director" cssClass="form-control" placeholder="Numero de 8 dígitos" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                                <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" style="width =80%" placeholder="Fecha de Registro de la evidencia"/>
                                <s:hidden name="registrado"/>
                                 <s:submit cssClass="btn" name="Registrar TT" value="Registrar Usuario"/>
                            </s:form> 
                    </div>
                    
                    <div id="PART2" css="col-lg-9 cover-inner" align="center" enctype="multipart/form-data"
                           style="display:none;"> 
                        <s:set name="registrado" value="%{0}"/>
                        <s:form action="registra_part_sip_profesor" method="post">
                            
                            <s:textfield name="id_participacion" label="Id de Participacion" cssClass="form-control" maxlength="4" pattern="([0-9]{4})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="[4 dígitos-consecutivo]" type="number"/>                           
                            <s:textfield name="Asignatura" label="Asignatura en la que se participó" cssClass="form-control" placeholder="Asginatura o plan en el que se Participó"/>
                            <s:textfield name="id_usuario" label="No. Empleado del Participante" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="No. de Empleado del Autor" type="number"/>
                            <s:select label="Seleccione el Tipo de participacion" cssClass="form-control"
                            headerKey="-1" headerValue="tipo de participacion"
                            list="# {
                            '1':'Coordinacion en la elaboracion de un plan de estudios',
                            '2':'Coordinacion en la actualización de un plan de estudios',
                            '3':'Participacion en la elaboracion de un plan de estudios',
                            '4':'Participacion en la actualizacion de un plan de estudios',
                            '5':'Coordinacion en la elaboracion de un programa de estudios',
                            '6':'Coordinacion en la actualización de un programa de estudios',
                            '7':'Participacion en la elaboracion de un programa de estudios',
                            '8':'Participacion en la actualizacion de un programa de estudios'
                            }"
                            name="id_tipo_part_plan" />
                            <s:select label="Seleccione la dependencia con la que participo" cssClass="form-control"
                            headerKey="-1" headerValue="Dependencia"
                            list="# {
                            'SIP':'SIP',
                            'DES':'DES',
                            'DEMS':'DEMS'
                            }"
                            name="u_a" />
                            <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" />
                            <s:hidden name="registrado"/>
                            <s:submit value="Registrar Proyecto" cssClass="btn" />
                        </s:form>                        
                    </div> 
                   
                </div><!--Contenido-->    
            </s:div>  
        </s:div>
                
        <!--footer-->
        <footer class="footer" style="position:fixed;">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <!--<script src="/css/js/jquery.js" type="text/javascript"></script>-->
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/css/js/jquery.js" type="text/javascript"></script>
    </body>
</html>
