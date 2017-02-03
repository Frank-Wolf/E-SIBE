<%-- 
    Document   : admins_sip
    Created on : 2/02/2017, 11:23:23 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/Tablas.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        
        <title>Inicio administrador SIP</title>
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
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Administrador SIP</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                <div class="row container" >
                    <div class="col-md-6">
                        <h4 class="subtitulos">Lista de usuarios SIP activos</h4>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT nom_prof, "
                                    + "id_prof FROM usuarios WHERE "
                                    + "idTypeUsuario = 'usuario_sip'");
                            out.print("<table border='.5px'>");

                            while (rs.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs.getString("nom_prof"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString("id_prof"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='Admins/Borrar?nom_prof="
                                        +rs.getString("nom_prof")+"'>Borrar</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='Admins/modifica_usip.jsp?id="
                                        +rs.getString("nom_prof")+"'>Modificar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>
                    </div>
                    
                    <div class="col-md-6">

                        <p id="p3">Registrar nuevo usuario SIP</p>
                        <s:set name="u_a" value="%{'SIP'}" />
                        <s:set name="periodo" value="%{0}" />
                        <s:set name="idTypeUsuario" value="%{'usuario_sip'}" />
                        <s:form id="datos3" action="Registra_SIP">
                            <s:textfield name="user" label="Nombre de usuario"/>
                            <s:textfield name="matricula" label="Matricula"/>
                            <s:textfield name="password" label="Contraseña"/>
                            <s:hidden name="u_a" label="Dependencia"/>
                            <s:hidden name="periodo" label="Periodo"/>
                            <s:hidden name="idTypeUsuario" label="Tipo de usuario"/>
                            <s:submit name="Registrar Usuario"/>
                        </s:form> 
                    </div>
                </div>                 
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