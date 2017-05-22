<%-- 
    Document   : usuarios_cofaa_modifica
    Created on : May 21, 2017, 5:19:21 PM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
      
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Administrador COFAA</title>
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
                            <a class="navbar-brand letritas" >E-SIBE: Administrador COFAA</a>
                        </div>
                        
                        <div id="navbar" class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li><a href="Menu_COFAA">
                                        Menú Principal</a>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Cerrar_sesion">
                                      Cerrar Sesion</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                

                
                <div class="row container-fluid" >
                        
                        
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6" align="center">
                        <h2 class="h3">Lista de Profesores Evaluadores activos</h2>
                    
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            int i = 0;
                            rs=lb.executeQuery("SELECT nom_usuario, "
                                    + "id_usuario, u_a FROM usuario WHERE "
                                    + "id_type_usuario = 6");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  No. de Empleado  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Nombre de Usuario  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Unidad Académica  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs.next())
                            {
                                i++;
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs.getString("id_usuario"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString("nom_usuario"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString("u_a"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Admins/modifica_cofaa2.jsp?id="
                                        +rs.getString("id_usuario")+"'>Modificar</a>");
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
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
         <script src="<s:url value="../css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
    </body>
    
</html>

