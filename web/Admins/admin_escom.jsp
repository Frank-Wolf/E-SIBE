<%-- 
    Document   : admin_escom
    Created on : 2/02/2017, 11:28:33 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Inicio administrador de usuarios en ESCOM</title>
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
                            <a class="navbar-brand" >E-SIBE: Administrador ESCOM</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Servicio">Servicio Social</a></li>
                                <li><a href="CATT">C.A.T.T.</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                <div class="row ">
                    <div class=" col-xs-12 col-sm-8 col-md-8 col-lg-8 
                         col-lg-offset-2 col-md-offset-2 col-xs-offset-0 
                         col-sm-offset-2 ">
                        <h2 class="h3" align="center">Bienvenido, administrador</h2>
                    
                        <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
                        <s:set var="username" value="%{#session.username}" />
                        <jsp:useBean id="username" type="java.lang.String"/>
                            <%
                            String mystring = username;
                             ResultSet rs=null;
                             lb.getConnection();
                             rs=lb.executeQuery("SELECT nom_prof, u_a, id_prof "
                                     + "FROM usuarios WHERE id_prof = " 
                                     + mystring);
                             out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
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
                                 out.print("No. de Empleado");
                                 out.print("</th>");
                                 out.print("<td>");
                                 out.print(rs.getString("id_prof"));
                                 out.print("</td>");
                                 
                                 out.print("</tr>");
                                 out.print("<tr>");
                                 out.print("<th>");
                                 out.print("Dependencia");
                                 out.print("</th>");
                                 out.print("<td>");
                                 out.print(rs.getString("u_a"));    
                                 out.print("</td>");
                    
                                 out.print("</tr>");

                             }
                             out.print("</table>");
                             lb.closeConnection();
                            %>
                    </div>                         
                </s:div>  
            </s:div>        
        </div>

        
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
