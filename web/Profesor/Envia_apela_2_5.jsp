<%-- 
    Document   : Envia_apela_2_5
    Created on : May 7, 2017, 2:49:58 PM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="lb" scope="session" class="sesion.LoginBean"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
      
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Profesor</title>
    </head>
    <body background="../css/textura.png" class="boding overflow">
        
        <!--header-->
        <header class="headering">
            <s:div cssClass="container-fluid">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
            </s:div>
        </header>

        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                
                                    
                <nav class="navbar navbar-default">
        
                    <div class="container">
                    
                        <div class="navbar-header">
                            <a class="navbar-brand letritas" >E-SIBE: Profesor</a>
                        </div>
                        
                        <div id="navbar" class="navbar-collapse collapse ">

                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Menu_apelaciones_prof">
                                      Regresar</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                

                
                <div class="row container-fluid" >
                        
                        
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h2 class="h3">Por favor suba nuevamente la constancia y la carta donde indique 
                        la razón de la apelación.</h2>

                        <%
                            String id_actividad=request.getParameter("id");
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("id",id_actividad);
                            ResultSet rs=null;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT * FROM profesor_tiene_obra WHERE "
                            + "id_obra='"+id_actividad+"'");
                            rs.next();
                            //boolean aceptado = rs.getBoolean("aceptado_alumno");
                            String comentario=rs.getString("comentarios");
                            //Date fecha_evaluar=rs.getDate("fecha_val");
                            //int puntaje=rs.getInt("puntaje_alumno");
                            lb.closeConnection();
                            out.println("<p>");
                            out.println("El evaluador comentó lo siguiente: "
                                    + comentario);
                            out.println("</p>");
                        %>
                    </div>
                    
                    <div cssClass="" align ="center">

                        <h2 class="h3">Enviar intento de apelación</h2>
                        
        <s:set var="id_actividad"><%=id_actividad%></s:set>
        <s:set var="username" value="%{#session.username}"/>
        <s:form id = "datos" action="/Usuario/upload_file_apela_25" method="post" enctype="multipart/form-data">
            <s:label for="myFile">Suba su constancia nuevamente y la hoja de apelación (máximo 10 MB y en un mismo archivo pdf):</s:label>
            <s:file name="myFile" />
            <s:hidden name="id_actividad"/>
            <s:hidden name="username"/>
            <s:submit value="Subir" cssClass="btn"/>
        </s:form>
                    </div>
                        
                </div>                 
            </s:div>  
        </s:div>        

        
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
         <script src="<s:url value="../css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
    </body>
    
</html>


