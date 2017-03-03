<%-- 
    Document   : Profesor
    Created on : 27/01/2017, 07:11:22 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
        
    <!--head-->
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE: Profesor</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link rel="icon" href="<s:url value="/icono.ico"/>"/>
    </head>
    
    <body background="../css/textura.png" class="boding">
        
        <!--header-->
        <header class="headering">
            <s:div cssClass="container-fluid">            
                <div class="img-responsive">
                    
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
                </div>
            </s:div>
        </header>
       
       
           
        
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                
                                    
                <nav class="navbar navbar-default">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Profesor</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Inicio</a></li>
                                <li><a href="apelacion_prof">
                                        Apelación de alguna actividad</a>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                               
                <s:div cssClass="cover-container" align="center"> 
                    <div class="container row">
                        <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 table-responsive">
                            <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
                            <s:set var="username" value="%{#session.username}" />
                            <jsp:useBean id="username" type="java.lang.String"/>
                                <%
                                String mystring = username;
                                 ResultSet rs=null;
                                 lb.getConnection();
                                 rs=lb.executeQuery("SELECT nom_prof, u_a, puntaje "
                                         + "FROM usuarios WHERE id_prof = " 
                                         + mystring);
                                 out.print("<table  class='table table-striped table-condensed'>");
                                 while (rs.next()){
                                     out.print("<tr>");
                                     out.print("<th>");
                                     out.print("Nombre de profesor");
                                     out.print("</th>");
                                     out.print("<td>");
                                     out.print(rs.getString("nom_prof"));
                                     out.print("</td>");
                                     out.print("</tr>");
                                     out.print("<tr>");
                                     out.print("<th>");
                                     out.print("Unidad Académica");
                                     out.print("</th>");
                                     out.print("<td>");
                                     out.print(rs.getString("u_a"));    
                                     out.print("</td>");
                                     out.print("</tr>");
                                     out.print("<tr>");
                                     out.print("<th>");
                                     out.print("Puntaje");
                                     out.print("</th>");
                                     out.print("<td>");
                                     out.print(rs.getString("puntaje"));
                                     out.print("</td>");
                                     out.print("</tr>");
                                     
                                 }
                                 out.print("</table>");
                                 lb.closeConnection();
                                %>       
                        </div>
                    </div>
             
           
                    
                </s:div>
            </s:div>  
        </s:div>        
        
        
        <!--footer-->
        <footer class="footer">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
        </footer>
       
        
                    <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>