<%-- 
    Document   : modifica_feeval
    Created on : Feb 23, 2017, 8:07:06 PM
    Author     : PsysacElrick
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %> 
<!DOCTYPE html>
<html>
    <head>
        <sj:head />
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
                            <a class="navbar-brand" >E-SIBE: Periodos  de registro de actividades</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Menu_COFAA">Modificación de fechas de periodo</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>      
                <s:div cssClass="cover-container2">    
                    <h2 class="titulos">Ingrese las nuevas fechas para el periodo</h2>   
                </s:div>
                <%@ page import="java.sql.*" %>
                <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"></jsp:useBean>
                <%
                    String fecha=request.getParameter("id");
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("id",fecha);
                    ResultSet rs=null;
                    lb.getConnection();
                    rs=lb.executeQuery("SELECT * FROM fecha_evaluaciones WHERE id_fecha="+fecha);
                    rs.next();
                        Date fecha_inicio=rs.getDate("fecha_inicio");
                        Date fecha_fin=rs.getDate("fecha_fin");
                    lb.closeConnection();
                    %>
                <s:div cssClass="cover-inner" align ="center">
                    <s:form action="/Usuario/Modifica_fechaeval" method="post">
                        <s:set var="fecha_inicio"><%=fecha_inicio%></s:set>
                        <s:set var="fecha_fin"><%=fecha_fin%></s:set>
                        <s:set var="id_fecha"><%=fecha%></s:set>
                        <sj:datepicker value="%{#fecha_inicio}" name="date1" label="Fecha de inicio" displayFormat="dd-mm-yy"/>
                        <sj:datepicker value="%{#fecha_fin}" name="date2" label="Fecha de finalización" displayFormat="dd-mm-yy"/>
                        <s:hidden name="id_fecha" label="algo"/>
                        <s:submit value="Guardar nuevas fechas" name="submit" />
                    </s:form> 
                </s:div>
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
