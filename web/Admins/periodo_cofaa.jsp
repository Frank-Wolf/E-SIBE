<%-- 
    Document   : periodo_cofaa
    Created on : Feb 14, 2017, 12:29:10 PM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" href="/Struts2Example/struts/xhtml/styles.css" type="text/css"/>

        <script language="JavaScript" src="/Struts2Example/struts/utils.js"
        type="text/javascript"></script>

        <script language="JavaScript" src="/Struts2Example/struts/xhtml/validation.js"
        type="text/javascript"></script>

        <script language="JavaScript" src="/Struts2Example/struts/css_xhtml/validation.js"
        type="text/javascript"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Administración de periodos del administrador COFAA</title>
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
                            <a class="navbar-brand" >E-SIBE: Periodos COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Reg_Acti">Registro de actividades</a></li>
                                <li><a href="Apelaciones">Apelaciones</a></li>
                                <li><a href="Evaluaciones">Evaluaciones</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Menu_COFAA">Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                
                <s:div cssClass="cover-container2"><h2 class="titulos">Fechas disponibles</h2></s:div>
                        <div class="col-md-6">
                        <h2 class="h3"><b>Fechas de registro de actividades</b></h2>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                        ResultSet rs=null;
                        lb.getConnection();
                        rs=lb.executeQuery("SELECT * FROM fecha_actividades");
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Fecha de inicio");
                        out.print("</th>");
                        out.print("<th>");
                        out.print("Fecha límite");
                        out.print("</th>");
                        out.print("</tr>");
                        while (rs.next())
                        {
                            out.print("<tr>");
                            out.print("<s:hidden name='id_fecha' label='fecha'/>");
                            out.print("<td>");
                            out.print(rs.getString("fecha_inicio"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("fecha_fin"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='Borrar_fechaacti?id_fecha="+rs.getInt("id_fecha")+"'>Borrar</a>");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='/login/Admins/modifica_feacti.jsp?id="+rs.getInt("id_fecha")+"'>Modificar</a>");
                            out.print("</td>");
                        }
                        out.print("</table>");
                        lb.closeConnection();
                        %>
                    </div>
                    <div class="col-md-6">
                        <h2 class="h3"><b>Fechas de apelaciones</b></h2>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="ls" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                        ResultSet rt=null;
                        ls.getConnection();
                        rs=ls.executeQuery("SELECT * FROM fecha_apelaciones");
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Fecha de inicio");
                        out.print("</th>");
                        out.print("<th>");
                        out.print("Fecha límite");
                        out.print("</th>");
                        out.print("</tr>");
                        while (rs.next())
                        {
                            out.print("<tr>");
                            out.print("<td>");
                            out.print(rs.getString("fecha_inicio"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("fecha_fin"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='Borrar_fechaapela?id_fecha="+rs.getInt("id_fecha")+"'>Borrar</a>");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='/login/Admins/modifica_feapela.jsp?id="+rs.getInt("id_fecha")+"'>Modificar</a>");
                            out.print("</td>");
                        }
                        out.print("</table>");
                        lb.closeConnection();
                        %>
                    </div>
                    <div class="col-md-6">
                        <h2 class="h3"><b>Fechas de evaluaciones</b></h2>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lf" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                        ResultSet ra=null;
                        lf.getConnection();
                        rs=lf.executeQuery("SELECT * FROM fecha_evaluaciones");
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Fecha de inicio");
                        out.print("</th>");
                        out.print("<th>");
                        out.print("Fecha límite");
                        out.print("</th>");
                        out.print("</tr>");
                        while (rs.next())
                        {
                            out.print("<tr>");
                            out.print("<td>");
                            out.print(rs.getString("fecha_inicio"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("fecha_fin"));
                            out.print("</td>");
                           out.print("<td>");
                            out.print("<a href='Borrar_fechaeval?id_fecha="+rs.getInt("id_fecha")+"'>Borrar</a>");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='/login/Admins/modifica_feeval.jsp?id="+rs.getInt("id_fecha")+"'>Modificar</a>");
                            out.print("</td>");
                        }
                        out.print("</table>");
                        lb.closeConnection();
                        %>
                    </div>
            </s:div>       
        </s:div>  
                    
        <!--footer-->
        <footer class="footer abso">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
