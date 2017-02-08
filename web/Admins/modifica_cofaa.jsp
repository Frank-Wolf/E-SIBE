<%-- 
    Document   : modifica_usip
    Created on : 2/02/2017, 12:46:53 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Inicio administrador COFAA</title>
    </head>
     <body background="../css/textura.png" class="boding">
        
        <!--header-->
        <header class="headering">
            <s:div cssClass="container-fluid">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
            </s:div>
        </header>
        
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">   
                <s:div cssClass="cover-container">   
                    <h2 class="titulos" align="center">
                        Ingrese los cambios deseados al usuario Evaluador</h2>
        
                    <%@ page import="java.sql.*" %>
                    <!--jsp:useBean-->
                    <jsp:useBean id="lb" scope="session" 
                                 class="sesion.LoginBean"></jsp:useBean>
                    <%
                    String user=request.getParameter("id");
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("id",user);
                    ResultSet rs=null;
                    lb.getConnection();
                    rs=lb.executeQuery("SELECT * FROM usuarios WHERE "
                            + "nom_prof='"+user+"'");
                    rs.next();
                        String id_user=rs.getString("nom_prof");
                        String id_prof=rs.getString("id_prof");
                        String id_password=rs.getString("password");
                    lb.closeConnection();
                    %>


                    <s:form action="/Usuario/Modifica_COFAA">
                        <s:set var="id_user"><%=id_user%></s:set>
                        <s:textfield name="usuario" value="%{#id_user}"/>
                        <br>
                        <s:set var="id_prof"><%=id_prof%></s:set>
                        <s:textfield name="matricula" value="%{#id_prof}" />
                        <br>
                        <s:set var="id_password"><%=id_password%></s:set>
                        <s:textfield name="password" value="%{#id_password}" />
                        <br>
                        <s:set var="user"><%=user%></s:set>
                        <s:hidden name="id" value="%{#user}"/>
                        <br>
                        <s:submit cssClass="btn" value="Guardar"/>
                    </s:form>
        
        
                </s:div>
            </s:div>
        </s:div>
        <!--footer-->
        <footer class="footer">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
        </footer>
             
                    <!-- Scripts para Bootstrap -->
        <script src="/css/js/jquery.js" type="text/javascript"></script>
        <script src="/css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>


