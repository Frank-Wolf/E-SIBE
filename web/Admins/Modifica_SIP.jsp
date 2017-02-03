<%-- 
    Document   : Modifica_SIP
    Created on : 2/02/2017, 11:25:02 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
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
                

                
                <div class="row container-fluid" >
                    
                    <!-- Formulario para registrar un usuario-->
                    
                    
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h3 class="subtitulos">usuarios modificados</h3>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT nom_prof, "
                                    + "id_prof FROM usuarios WHERE "
                                    + "idTypeUsuario = 'usuario_sip'");
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
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>
                    </div>
                    
                    <s:form id="datos" action="principal_admin_sip" method="post">
                            
                            <s:submit cssClass="btn" value= "Volver"><span>. .</span></s:submit>
                        </s:form>
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

