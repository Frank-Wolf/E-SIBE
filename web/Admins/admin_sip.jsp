<%-- 
    Document   : admins_sip
    Created on : 2/02/2017, 11:23:23 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        
        <title>Inicio administrador SIP</title>
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
                            <a class="navbar-brand">E-SIBE: Administrador SIP</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
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
                    <div class="col-md-4 col-md-offset-1">
                        <h2 class="h3">Lista de usuarios SIP activos</h2>
                    
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                        ResultSet rs=null;
                        lb.getConnection();
                        ValueStack stack = ActionContext.getContext().getValueStack();
                        int i = 0;
                        rs=lb.executeQuery("SELECT nom_usuario, "
                                    + "id_usuario FROM usuario WHERE "
                                    + "id_type_usuario = '7'");
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

                            out.print("<a href='Borrar?id_usuario="+rs.getString("id_usuario")
                                    +"'>Borrar</a>");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='/login/Admins/modifica_usip.jsp?id="
                                    +rs.getString("id_usuario")+"'>Modificar</a>");
                            out.print("</td>");
                        }
                        out.print("</table>");
                        lb.closeConnection();
                        stack.getContext().put("varName", i);
                        stack.setValue("#attr['varName']", i, false);
                        %>
                    </div>  
                    
                    <div class="col-md-4 col-md-offset-1">
                        <h2 class="h3">Registrar nuevo usuario SIP</h2>
                        <s:set name="counter" value="#varName"/>
                        <s:set name="u_a" value="%{'SIP'}" />
                        <s:set name="periodo" value="%{0}" />
                        <s:set name="idTypeUsuario" value="%{7}" />
                        <s:form id="datos3" action="/Usuario/Registra_SIP">
                            <s:textfield name="user" label="Nombre de usuario" cssClass="form-control"/>
                            <s:textfield name="matricula" label="Matricula" cssClass="form-control" maxlength="8" type="number"/>
                            <s:textfield name='email' label="Correo electrónico" cssClass="form-control"/>
                            <s:textfield name="password" label="Contraseña" cssClass="form-control" maxlength="15" minlength="7"/>
                            <s:hidden name="u_a" label="Dependencia"/>
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
        <script src="/css/js/jquery.js" type="text/javascript"></script>
        <script src="/css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>

<!-- Esto da las opciones de borrar y modificar
lo dejo por si se requiere

-->
