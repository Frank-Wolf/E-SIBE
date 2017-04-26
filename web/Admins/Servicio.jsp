<%-- 
    Document   : Servicio
    Created on : 8/02/2017, 07:54:57 AM
    Author     : le_as
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Administrador ESCOM - Servicio Social</title>
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
                            <a class="navbar-brand" >E-SIBE: Administrador ESCOM</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Menu_ESCOM">Menu anterior</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Cerrar_sesion">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                
                <div class="row container-fluid" >
                    
                    <!-- Formulario para registrar un usuario-->
                    
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h2 class="h3">Lista de Usuarios de Servicio Social activos</h2>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            int i = 0;
                            ValueStack stack = ActionContext.getContext().getValueStack();
                            rs=lb.executeQuery("SELECT nom_usuario, "
                                    + "id_usuario FROM usuario WHERE "
                                    + "id_type_usuario = 10");
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
                                i++;
                                out.print("<tr>");
                                out.print("<td>");
                                out.print("  ");
                                out.print(rs.getString("id_usuario"));
                                out.print("  ");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("  ");
                                out.print(rs.getString("nom_usuario"));
                                out.print("  ");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='Borrar_SS?id_usuario="
                                        +rs.getString("id_prof")+"'>Borrar</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Admins/modifica_ss.jsp?id="
                                        +rs.getString("id_usuario")+"'>Modificar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            lb.closeConnection();
                            stack.getContext().put("varName", i);
                            stack.setValue("#attr['varName']", i, false);
                        %>
                    </div>
                    <div class="col-md-6">

                        <h2 class="h3" align="center">Registrar nuevo Usuario Servicio Social</h2>
                        <s:set name="counter" value="#varName"/>
                        <s:set name="u_a" value="%{'ESCOM'}" />
                        <s:set name="periodo" value="%{0}" />
                        <s:set name="idTypeUsuario" value="%{10}" />
                        <s:form id="datos3" action="Registra_SS" >
                            <s:textfield name="user" label="Nombre de usuario" cssClass="form-control"/>
                            <s:textfield name="matricula" label="Matricula" cssClass="form-control"/>
                            <s:textfield name="password" label="Contraseña" cssClass="form-control"/>
                            <s:hidden name="u_a" label="Dependencia"/>
                            <s:hidden name="periodo" label="Periodo"/>
                            <s:hidden name="idTypeUsuario" label="Tipo de usuario"/>
                            <s:hidden name="counter" label="Número de usuarios registrados"/>
                            <s:submit cssClass="btn" name="Registrar Usuario" value="Registrar Usuario"/>
                        </s:form> 
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
    </body>
</html>


