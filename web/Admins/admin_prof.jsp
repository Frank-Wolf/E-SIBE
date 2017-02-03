<%-- 
    Document   : admin_prof
    Created on : 2/02/2017, 11:27:52 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        
        <title>Inicio administrador de profesores dentro del sistema</title>
    </head>
    <body background="css/textura.png" class="boding">
        
        <header class="headering">
            <s:div cssClass="container-fluid">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
            </s:div>
        </header>
        
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                
                                    
                <nav class="navbar navbar-default">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Administrador SIP</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Modifica_USIP">Modificar Usuario</a></li>
                                <li><a>Borrar Usuario</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                
               <!--Conteneor general--> 
                
                <div class="row container-fluid" >
                    
                    <!-- Formulario para registrar un usuario-->
                    <div class="col-md-6">

                        <h2 class="subtitulos">Registrar nuevo profesor</h2>
                        <s:set name="u_a" value="%{'ESCOM'}" />
                        <s:set name="periodo" value="%{0}" />
                        <s:set name="idTypeUsuario" value="%{'Profesor'}" />
                        <s:form id="datos3" action="Registra_SIP">
                            <s:textfield name="user" label="Nombre del profesor"/>
                            <s:textfield name="matricula" label="Matricula"/>
                            <s:textfield name="password" label="Contraseña"/>
                            <s:hidden name="u_a" label="Dependencia"/>
                            <s:hidden name="periodo" label="Periodo"/>
                            <s:hidden name="idTypeUsuario" label="Tipo de usuario"/>
                            <s:submit cssClass="btn" name="Registrar Usuario"/>
                        </s:form> 
                    </div>
                    
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h3 class="subtitulos">Lista de usuarios SIP activos</h3>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT nom_prof, "
                                    + "id_prof FROM usuarios WHERE "
                                    + "idTypeUsuario = 'Profesor'");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  Id de Usuario  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Nombre de Usuario  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print("  ");
                                out.print(rs.getString("id_prof"));
                                out.print("  ");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("  ");
                                out.print(rs.getString("nom_prof"));
                                out.print("  ");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/Borrar?nom_prof="//modificar
                                        +rs.getString("nom_prof")+"'>Borrar</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='Admins/modifica_usip.jsp?id="//modificar
                                        +rs.getString("nom_prof")+"'>Modificar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>
                    </div>
                        
                </div>                 
            </s:div>  
        </s:div>  
    </body>
</html>
