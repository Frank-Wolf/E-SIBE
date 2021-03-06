<%-- 
    Document   : Profesor_noperiodo
    Created on : May 30, 2017, 11:33:50 AM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
        
    <!--head-->
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title> E-SIBE: Profesor</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link href="<s:url value="/css/js/captura_actividad_profesor.js"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="/icono.ico"/>"/>
        <script type="text/javascript">
        window.onload = function(){//window.addEventListener('load',function(){...}); (for Netscape) and window.attachEvent('onload',function(){...}); (for IE and Opera) also work
            alert("El periodo actual no corresponde al suyo.");
        };
</script>
    </head>
    
    <body background="../css/textura.png" class="container-fluid boding">
        
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
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Cerrar_sesion">
                                      Cerrar Sesion</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <h2 class="titulos">Bienvenido Profesor</h2>
                <s:div cssClass="cover-container2" align="center"> 
                    <div class="container row">
                        <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 table-responsive">
                            <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
                            <s:set var="username" value="%{#session.username}" />
                            <jsp:useBean id="username" type="java.lang.String"/>
                                <%
                                String mystring = username;
                                 ResultSet rs=null;
                                 lb.getConnection();
                                 rs=lb.executeQuery("SELECT nom_usuario, u_a "
                                         + "FROM usuario WHERE id_usuario = " 
                                         + mystring);
                                 out.print("<table  class='table table-striped table-condensed'>");
                                 while (rs.next()){
                                     out.print("<tr>");
                                     out.print("<th>");
                                     out.print("Nombre de profesor");
                                     out.print("</th>");
                                     out.print("<td>");
                                     out.print(rs.getString("nom_usuario"));
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
                                     
                                 }
                                 out.print("</table>");
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
