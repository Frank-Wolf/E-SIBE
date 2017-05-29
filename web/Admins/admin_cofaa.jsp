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
    <body background="../css/textura.png" class="boding">
        
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
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Administrador COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Admin_usuarios">Administrar usuarios COFAA</a></li>
                                <li><a href="Reg_Acti">Registro de actividades</a></li>
                                
                                <li><a href="Evaluaciones">Evaluaciones</a></li>
                                <li><a href="Apelaciones">Apelaciones</a></li>
                                <li><a href="Reportes">Reportes</a></li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Cerrar_sesion">
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
                             rs=lb.executeQuery("SELECT nom_usuario, u_a, id_usuario "
                                     + "FROM usuario WHERE id_usuario = " 
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
                                 out.print(rs.getString("nom_usuario"));
                                 out.print("</td>");

                                 out.print("</tr>");
                                 out.print("<tr>");
                                 out.print("<th>");
                                 out.print("No. de Empleado");
                                 out.print("</th>");
                                 out.print("<td>");
                                 out.print(rs.getString("id_usuario"));
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
                             //lb.closeConnection();
                            %>
                        </div>    
                    </div>
                        <div align="center">
                            <s:form id="datos" action="create_pdf_admin" method="post" style="display:block;">
                      <s:submit value="Generar reporte de periodo de beca por exclusividad" cssClass="btn"/>
                  </s:form> 
                        </div>
                            
                        </div>
                    </div> 
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    
                    <div class="row">
                        <div class="col-md-4">
                            <h2>Fechas de registro de actividades</h2><br/>
                                <%
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
                        <h2>Fechas de apelaciones</h2> <br/>
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

        
        <!--footer-->
        <footer class="footer">
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
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
    
</html>
