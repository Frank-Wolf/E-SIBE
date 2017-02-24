<%-- 
    Document   : admin_cofaa
    Created on : 2/02/2017, 11:26:36 AM
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
        
        
        
        
        <title>Inicio administrador COFAA </title>
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
                            <a class="navbar-brand" >E-SIBE: Administrador COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Admin_usuarios">Administrar usuarios COFAA</a></li>
                                <li><a href="Periodos_cofaa">Administrar periodos</a></li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                 <div class="cover-container2 ">    
                    <div class="container">
                        <div class="row ">
                    <div class=" col-xs-12 col-sm-8 col-md-8 col-lg-8 
                         col-lg-offset-2 col-md-offset-2 col-xs-offset-0 
                         col-sm-offset-2 ">

                        <h2 class="titulos">Bienvenido Administrador</h2>
                        
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
                    </div>
                    
                            
                        </div>
                    </div> 
                    <!-- Tabla donde se muestran los usuarios Activos-->    

                    
            </s:div>  
        </s:div>        

        
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                                    <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script> 
    <script type="text/javascript"
     src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
    <script type="text/javascript">
      $('#datetimepicker').datetimepicker({
        format: 'dd/MM/yyyy hh:mm:ss',
        language: 'pt-BR'
      });
    </script>
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
    
</html>
