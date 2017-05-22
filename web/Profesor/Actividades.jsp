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
        <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
        <s:set var="username" value="%{#session.username}" />
        <jsp:useBean id="username" type="java.lang.String"/>
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
                            <li class="activado"><a id="TT" onclick="mostrar_formulario(this.id)"><i class="icono izquierda fa fa-graduation-cap" aria-hidden="true"></i> 
                                    Actividad 2.11: Dirección de Tesis </a>
                                
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
                             <h2 class="letritas">Actividades por registrar en este módulo</h2>
                         
                         
                            <%
                            int l = 0;
                            ResultSet alumnos=null;
                            lb.getConnection();
                            alumnos=lb.executeQuery("SELECT id_proyecto, id_alumno, tipo_alumno "
                                     + "FROM profesor_tiene_proyecto WHERE id_usuario = "+ username +" and validado_alumno=0");
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de proyecto");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Matricula del Alumno");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de alumno");
                            out.print("</th>");
                            out.print("</tr>");
                            while (alumnos.next())
                            {
                                if(alumnos.getInt("id_alumno") == 0)
                                    l++;
                                else{
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(alumnos.getString("id_proyecto"));
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(alumnos.getString("id_alumno"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(alumnos.getString("tipo_alumno"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            
                        %> 
                        <br>
                        <h2 class="letritas">Actividades Ya validadas</h2>
                         <%
                            
                            ResultSet alumnos2=null;
                            lb.getConnection();
                            alumnos2=lb.executeQuery("SELECT id_proyecto, id_alumno, tipo_alumno "
                                     + "FROM profesor_tiene_proyecto WHERE id_usuario = "+ username +" and validado_alumno=1");
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de proyecto");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Matricula del Alumno");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de alumno");
                            out.print("</th>");
                            out.print("</tr>");
                            while (alumnos2.next())
                            {
                                out.print("<tr>");
                                out.print("<th>");
                                out.print(alumnos2.getString("id_proyecto"));
                                out.print("</th>");
                                out.print("<td>");
                                out.print(alumnos2.getString("id_alumno"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(alumnos2.getString("tipo_alumno"));
                                out.print("</td>");
                                out.print("</tr>");

                            }
                            out.print("</table>");
                            
                        %> 
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
                    
                        <h2 class="letritas">Actividades por registrar en este módulo</h2>
                        <h2 class="subtitulos">Tipo de publicacion: 1.- En boletin, 2.- Nacional sin arbitraje, 3.- Internacional sin arbitraje, 4.- Nacional con arbitraje, 5.- Nacional sin Arbitraje</h2>
                        <%
                            ResultSet rs=null;
                            
                            rs=lb.executeQuery("SELECT id_publicacion, id_tipo_pub "
                                     + "FROM profesor_tiene_pub WHERE id_usuario = "+ username +" and validado=0 and id_evento='0'");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("ID de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de Publicacion");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs.next())
                            {
                                ResultSet publica=lb.executeQuery("select Nom_Public from publicacion where id_publicacion='"+rs.getString("id_publicacion")+"' and id_tipo_pub='"+rs.getString("id_tipo_pub")+"'");
                                while(publica.next())
                                {
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(rs.getString("id_publicacion"));
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(publica.getString("Nom_Public"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rs.getString("id_tipo_pub"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            
                        %>          
                        <h2 class="letritas">Actividades Ya validadas</h2>
                        <h2 class="subtitulos">Tipo de publicacion: 1.- En boletin, 2.- Nacional sin arbitraje, 3.- Internacional sin arbitraje, 4.- Nacional con arbitraje, 5.- Nacional sin Arbitraje</h2>
                        <%
                            ResultSet rs1=null;
                            
                            rs1=lb.executeQuery("SELECT id_publicacion, id_tipo_pub "
                                     + "FROM profesor_tiene_pub WHERE id_usuario = "+ username +" and validado=1 and id_evento='0'");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("ID de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de Publicacion");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs1.next())
                            {
                                ResultSet publica1=lb.executeQuery("select Nom_Public from publicacion where id_publicacion='"+rs.getString("id_publicacion")+"' and id_tipo_pub='"+rs.getString("id_tipo_pub")+"'");
                                while(publica1.next())
                                {
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(rs1.getString("id_publicacion"));
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(publica1.getString("Nom_Public"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rs1.getString("id_tipo_pub"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            
                        %>          
                    </s:div>     

                    <!--EVENTOS FORM-->        
                    <s:div  id="EVENTOS_FORM" cssClass="col-lg-9 formulario-oculto cover-inner" align ="center" style="display:none;">
                        <s:set name="username" value="%{#session.username}" />
                        <s:set name="activity" value="%{'Actividad_2_3'}"/>
                        <s:form action="valida_evento" method="post" enctype="multipart/form-data">
                            <s:textfield name="id_evento" label="ID del Evento Académico" cssClass="form-control" />
                            <s:textfield name="id_publicacion" label="Número de Publicación" cssClass="form-control" />
                            <s:select label="Seleccione el tipo de publicación que realizó" cssClass="form-control"
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
                        
                        <h2 class="letritas">Actividades por registrar en este módulo</h2>
                        <h2 class="subtitulos">Tipo de publicacion: 6 .-Institucional( Sin ponencia), 7.-Institucional (con resumen publicado), 8.-Institucional (publicado en extenso)</h2>
                        <%
                            
                            ResultSet rws=null;
                            
                            rws=lb.executeQuery("SELECT * "
                                     + "FROM profesor_tiene_pub WHERE id_usuario = "+ username +" and validado=0 and id_evento<>'0'");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("ID del Evento");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Numero de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de Publicacion");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rws.next())
                            {
                                ResultSet ev=lb.executeQuery("select Nom_Public from publicacion where id_publicacion='"+rws.getString("id_publicacion")+"' and id_tipo_pub='"+rws.getString("id_tipo_pub")+"'");
                                while(ev.next())
                                {
                                    
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(rws.getString("id_evento"));
                                    out.print("</th>");
                                    out.print("<th>");
                                    out.print(rws.getString("id_publicacion"));
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(ev.getString("Nom_Public"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rws.getString("id_tipo_pub"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            
                        %>    
                        <h2 class="letritas">Actividades Ya registradas</h2>
                        <h2 class="subtitulos">Tipo de publicacion: 6 .-Institucional( Sin ponencia), 7.-Institucional (con resumen publicado), 8.-Institucional (publicado en extenso)</h2>
                        <%
                            
                            ResultSet rws1=null;
                            
                            rws1=lb.executeQuery("SELECT * "
                                     + "FROM profesor_tiene_pub WHERE id_usuario = "+ username +" and validado=1 and id_evento<>'0'");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("ID del Evento");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Numero de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de Publicacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de Publicacion");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rws1.next())
                            {
                                ResultSet ev2=lb.executeQuery("select Nom_Public from publicacion where id_publicacion='"+rws1.getString("id_publicacion")+"' and id_tipo_pub='"+rws1.getString("id_tipo_pub")+"'");
                                while(ev2.next())
                                {
                                    
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(rws1.getString("id_evento"));
                                    out.print("</th>");
                                    out.print("<th>");
                                    out.print(rws1.getString("id_publicacion"));
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(ev2.getString("Nom_Public"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rws1.getString("id_tipo_pub"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            
                        %>        
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
                        
                        <h2 class="letritas">Actividades por registrar en este módulo</h2>
                        <%
                            
                            ResultSet proyecto=null;
                            
                            proyecto=lb.executeQuery("SELECT id_proyecto "
                                     + "FROM profesor_tiene_proyecto WHERE id_usuario = "+ username +" and validado=0 and id_alumno=0");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de Proyecto");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de Proyecto");
                            out.print("</th>");
                            out.print("</tr>");
                            while (proyecto.next())
                            {
                                ResultSet pr=lb.executeQuery("select * from proyecto where id_proyecto='"+proyecto.getString("id_proyecto")+"'");
                                while(pr.next())
                                {
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(proyecto.getString("id_proyecto"));
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(pr.getString("nom_proyecto"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            
                        %>
                       
                        <h2 class="letritas">Actividades por registrar en este módulo</h2>
                        <%
                            
                            ResultSet proyecto1=null;
                            
                            proyecto1=lb.executeQuery("SELECT id_proyecto "
                                     + "FROM profesor_tiene_proyecto WHERE id_usuario = "+ username +" and validado=1 and id_alumno=0");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de Proyecto");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de Proyecto");
                            out.print("</th>");
                            out.print("</tr>");
                            while (proyecto1.next())
                            {
                                ResultSet pr1=lb.executeQuery("select * from proyecto where id_proyecto='"+proyecto1.getString("id_proyecto")+"'");
                                while(pr1.next())
                                {
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(proyecto1.getString("id_proyecto"));
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(pr1.getString("nom_proyecto"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            
                        %> 
                        
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
                        <h2 class="letritas"> Actividades por validar en este módulo</h2>    
                        <%
                            
                            ResultSet obra=null;
                            
                            obra=lb.executeQuery("SELECT * "
                                     + "FROM profesor_tiene_obra WHERE id_usuario = "+ username +" and validado=0");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de Obra");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de obra");
                            out.print("</th>");
                            
                            out.print("</tr>");
                            while (obra.next())
                            {
                                ResultSet ob=lb.executeQuery("select nom_obra from obra where id_obra='"+obra.getString("id_obra")+"'");
                                while(ob.next())
                                {
                                out.print("<tr>");
                                out.print("<th>");
                                out.print(obra.getString("id_obra"));
                                out.print("</th>");
                                out.print("<td>");
                                out.print(ob.getString("nom_obra"));
                                out.print("</td>");
                                out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                        %>            
                        <h2 class="letritas"> Actividades por validar en este módulo</h2>    
                        <%
                            
                            ResultSet obra1=null;
                            
                            obra1=lb.executeQuery("SELECT * "
                                     + "FROM profesor_tiene_obra WHERE id_usuario = "+ username +" and validado=1");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de Obra");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre de obra");
                            out.print("</th>");
                            
                            out.print("</tr>");
                            while (obra1.next())
                            {
                                ResultSet ob1=lb.executeQuery("select nom_obra from obra where id_obra='"+obra1.getString("id_obra")+"'");
                                while(ob1.next())
                                {
                                out.print("<tr>");
                                out.print("<th>");
                                out.print(obra1.getString("id_obra"));
                                out.print("</th>");
                                out.print("<td>");
                                out.print(ob1.getString("nom_obra"));
                                out.print("</td>");
                                out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                        %>       
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
                            <h2 class="letritas"> Actividades por validar en este módulo</h2>
                            <%
                            
                            ResultSet tt=null;
                            
                            tt=lb.executeQuery("SELECT * "
                                     + "FROM profesor_tiene_tt WHERE id_usuario = "+ username +" and validado=0");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de TT o Tesis");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre del Trabajo");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Matricula del Alumno");
                            out.print("</th>");
                            
                            out.print("</tr>");
                            while (tt.next())
                            {
                                ResultSet ToT=lb.executeQuery("select nom_TT from tt where id_TT='"+tt.getString("id_TT")+"'");
                                while(ToT.next())
                                {
                                out.print("<tr>");
                                out.print("<th>");
                                out.print(tt.getString("id_TT"));
                                out.print("</th>");
                                out.print("<td>");
                                out.print(ToT.getString("nom_TT"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(tt.getString("id_alumno"));
                                out.print("</td>");
                                out.print("</tr>");
                                
                                }
                            }
                            out.print("</table>");
                        %>
                        <h2 class="letritas"> Actividades validadas </h2>
                            <%
                            
                            ResultSet tt1=null;
                            
                            tt1=lb.executeQuery("SELECT * "
                                     + "FROM profesor_tiene_tt WHERE id_usuario = "+ username +" and validado=1");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de TT o Tesis");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Nombre del Trabajo");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Matricula del Alumno");
                            out.print("</th>");
                            
                            out.print("</tr>");
                            while (tt1.next())
                            {
                                ResultSet ToT1=lb.executeQuery("select nom_TT from tt where id_TT='"+tt1.getString("id_TT")+"'");
                                while(ToT1.next())
                                {
                                out.print("<tr>");
                                out.print("<th>");
                                out.print(tt1.getString("id_TT"));
                                out.print("</th>");
                                out.print("<td>");
                                out.print(ToT1.getString("nom_TT"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(tt1.getString("id_alumno"));
                                out.print("</td>");
                                out.print("</tr>");
                                
                                }
                            }
                            out.print("</table>");
                        %>    
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
                            
                        <h2 class="letritas">Actividades por registrar en este módulo</h2>
                        <h2 class="subtitulos" align="center">Tipo de participacion:</h2>
                        <h2 class="subtitulos">1.- Coordinacion en la elaboracion de un plan de estudios , 2.- Coordinacion en la actualización de un plan de estudios</h2>   
                        <h2 class="subtitulos">3.- Participacion en la elaboracion de un plan de estudios, 4.- Participacion en la actualizacion de un plan de estudios</h2>   
                        <h2 class="subtitulos">5.- Coordinacion en la elaboracion de un programa de estudios, 6.- Coordinacion en la actualización de un programa de estudios</h2>
                        <h2 class="subtitulos">7.- Participacion en la elaboracion de un programa de estudios, 8.- Participacion en la actualizacion de un programa de estudios</h2>   
                         <%
                            
                            ResultSet participacion=null;
                            
                            participacion=lb.executeQuery("SELECT * "
                                     + "FROM profesor_participa_en_plan WHERE id_usuario = "+ username +" and validado=0");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero Participacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Asignatura");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Unidad Academica con la que colaboro");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de participacion");
                            out.print("</th>");
                            out.print("</tr>");
                            while (participacion.next())
                            {
                                ResultSet part=lb.executeQuery("select asignatura, u_a from part_plan_est where id_part='"+participacion.getString("id_part")+"'");
                                while(part.next())
                                {
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(participacion.getString("id_part"));
                                    out.print("</th>");

                                    out.print("<td>");
                                    out.print(part.getString("asignatura"));
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(part.getString("u_a"));
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(participacion.getString("id_tipo_part"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>
                         <h2 class="letritas">Actividades ya validadas</h2>
                        <%
                            
                            ResultSet participacion1=null;
                            
                            participacion1=lb.executeQuery("SELECT * "
                                     + "FROM profesor_participa_en_plan WHERE id_usuario = "+ username +" and validado=0");
                            
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero Participacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Asignatura");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Unidad Academica con la que colaboro");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de participacion");
                            out.print("</th>");
                            out.print("</tr>");
                            while (participacion1.next())
                            {
                                ResultSet part1=lb.executeQuery("select asignatura, u_a from part_plan_est where id_part='"+participacion1.getString("id_part")+"'");
                                while(part1.next())
                                {
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print(participacion1.getString("id_part"));
                                    out.print("</th>");

                                    out.print("<td>");
                                    out.print(part1.getString("asignatura"));
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(part1.getString("u_a"));
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(participacion1.getString("id_tipo_part"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>   
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
