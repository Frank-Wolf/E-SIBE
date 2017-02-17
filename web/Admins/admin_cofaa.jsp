<%-- 
    Document   : admin_cofaa
    Created on : 2/02/2017, 11:26:36 AM
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
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Administrador COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                          
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                <div class="row container-fluid" >
                    
                    <!-- Formulario para registrar un usuario-->
                    <div class="col-md-6">

                        <h2 class="h3">Registrar nuevo Profesor Evaluador</h2>
                        <s:set name="u_a" value="%{'COFAA'}" />
                        <s:set name="periodo" value="%{0}" />
                        <s:set name="idTypeUsuario" value="%{'usuario_cofaa'}" />
                        <s:form id="datos3" action="Registra_COFAA">
                            <s:textfield name="user" label="Nombre de usuario"/>
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
                        <h2 class="h3">Lista de Profesores Evaluadores activos</h2>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT nom_prof, "
                                    + "id_prof FROM usuarios WHERE "
                                    + "idTypeUsuario = 'usuario_cofaa'");
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
                                out.print("<a href='Borrar_COFAA?nom_prof="
                                        +rs.getString("nom_prof")+"'>Borrar</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Admins/modifica_cofaa.jsp?id="
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

        
        <!--footer-->
        <footer class="footer">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
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
