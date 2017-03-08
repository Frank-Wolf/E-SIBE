<%-- 
    Document   : admin_inda
    Created on : 2/02/2017, 11:24:49 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        
        <title>Inicio administrador INDAUTOR</title>
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
                            <a class="navbar-brand">E-SIBE: Administrador INDAUTOR</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <!--<h2 class="titulos">Bienvenido Administrador INDAUTOR</h2>-->
                <div class="row container-fluid cover-container2" >
                    <!-- Formulario para registrar un usuario-->
                    <div class="col-md-4 col-md-offset-1">
                        <h2 class="h3">Registrar nuevo usuario INDAUTOR</h2>
                        <s:set name="u_a" value="%{'INDAUTOR'}" />
                        <s:set name="periodo" value="%{0}" />
                        <s:set name="idTypeUsuario" value="%{'usuario_inda'}" />
                        <s:form id="datos3" action="/Usuario/Registra_INDA">
                            <s:textfield name="user" label="Nombre de usuario" cssClass="form-control"/>
                            <s:textfield name="matricula" label="No. de Empleado" cssClass="form-control"/>
                            <s:textfield name="password" label="Contraseña" cssClass="form-control"/>
                            <s:hidden name="u_a" label="Dependencia"/>
                            <s:hidden name="periodo" label="Periodo"/>
                            <s:hidden name="idTypeUsuario" label="Tipo de usuario"/>
                            <s:submit cssClass="btn" name="Registrar Usuario" value="Registrar Usuario"/>
                        </s:form> 
                    </div>
                    
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-4 col-md-offset-1">
                        <h2 class="h3">Lista de usuarios INDAUTOR activos</h2>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                        ResultSet rs=null;
                        lb.getConnection();
                        rs=lb.executeQuery("SELECT nom_prof, "
                                    + "id_prof FROM usuarios WHERE "
                                    + "idTypeUsuario = 'usuario_inda'");
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

                            out.print("<a href='Borrar_INDA?id_prof="+rs.getString("id_prof")
                                    +"'>Borrar</a>");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='/login/Admins/modifica_inda.jsp?id="
                                    +rs.getString("id_prof")+"'>Modificar</a>");
                            out.print("</td>");
                        }
                        out.print("</table>");
                        lb.closeConnection();
                        %>
                    </div>   
                </div>                 
            </s:div>  
        </s:div>        

        
        <<!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="/css/js/jquery.js" type="text/javascript"></script>
        <script src="/css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
