<%-- 
    Document   : SIP
    Created on : Feb 8, 2017, 8:07:49 AM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
<s:set var="username" value="%{#session.username}" />
<jsp:useBean id="username" type="java.lang.String"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.min.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link rel="icon" href="<s:url value="/icono.ico"/>"/>
    </head>
    <body background="../css/textura.png" class="boding overflow">
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
                            <a class="navbar-brand" >E-SIBE: Evaluador COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="ver_registros">Ver registros </a></li>
                                <li><a href="apelaciones_cofaa">Actividades a apelar</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Cerrar_sesion">
                                      Cerrar Sesión</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                
                <s:div cssClass="cover-container2">    
                    
                    
                    
                    
                    <h2 class="titulos">Bienvenido Profesor Evaluador</h2>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <h2>Fechas de registro de actividades</h2>
                            
                                <%
                                    ResultSet rs=null;
                                    lb.getConnection();
                                    ResultSet rf1, rf2, rf3;
                                    rf1=lb.executeQuery("SELECT * FROM fecha_actividades");
                                    out.print("<table  class='table table-striped table-condensed'>");
                                    while(rf1.next()){
                                        out.print("<tr>");
                                        out.print("<th>");
                                        out.print("Fecha de inicio");
                                        out.print("</th>");
                                        out.print("<td>");
                                        out.print(rf1.getString("fecha_inicio"));
                                        out.print("</td>");
                                        out.print("</tr>");
                                        out.print("<tr>");
                                        out.print("<th>");
                                        out.print("Fecha de termino");
                                        out.print("</th>");
                                        out.print("<td>");
                                        out.print(rf1.getString("fecha_fin"));    
                                        out.print("</td>");
                                        out.print("</tr>");
                                    }
                                    out.print("</table>");

                                    //lb.closeConnection();
                                %>
                        </div>
                        <div class="col-md-4">
                            <h2>Fechas de evaluaciones de actividades</h2>
                            <%
                                rf2=lb.executeQuery("SELECT * FROM fecha_evaluaciones");
                                out.print("<table  class='table table-striped table-condensed'>");
                                while(rf2.next()){
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print("Fecha de inicio");
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(rf2.getString("fecha_inicio"));
                                    out.print("</td>");
                                    out.print("</tr>");
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print("Fecha de termino");
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print(rf2.getString("fecha_fin"));    
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                                out.print("</table>");

                                //lb.closeConnection();
                            %>
                        </div>
                        <div class="col-md-3">
                        <h2>Fechas de apelaciones de actividades rechazadas</h2>
                        <%
                            rf3=lb.executeQuery("SELECT * FROM fecha_apelaciones");
                            out.print("<table  class='table table-striped table-condensed'>");
                            while(rf3.next()){
                                out.print("<tr>");
                                out.print("<th>");
                                out.print("Fecha de inicio");
                                out.print("</th>");
                                out.print("<td>");
                                out.print(rf3.getString("fecha_inicio"));
                                out.print("</td>");
                                out.print("</tr>");
                                out.print("<tr>");
                                out.print("<th>");
                                out.print("Fecha de termino");
                                out.print("</th>");
                                out.print("<td>");
                                out.print(rf3.getString("fecha_fin"));    
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
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
                    <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>

