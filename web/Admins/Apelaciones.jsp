<%-- 
    Document   : Apelaciones.jsp
    Created on : Feb 21, 2017, 11:59:04 AM
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
        <b><%=request.getParameter("token")%></b>
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                
                                    
                <nav class="navbar navbar-default">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Periodos de apelaciones</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Menu_COFAA">Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                
                <s:div cssClass="cover-container2">    
                    <h2 class="titulos">Indique las fechas para las apelaciones</h2>   
                </s:div>
                <div class="col-md-6">
                    <s:form action="Registra_apelaciones" method="post">
                        <sj:datepicker name="date1" label="Fecha de inicio" displayFormat="dd-mm-yy"/>
                        <sj:datepicker name="date2" label="Fecha de finalización" displayFormat="dd-mm-yy"/>
                        <s:submit value="Registrar fechas" name="submit" />
                    </s:form> 
                </div>
                
                <div class="col-md-6">
                        <h2 class="h3"><b>Fechas de apelaciones</b></h2>
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="ls" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                        ResultSet rt=null;
                        ls.getConnection();
                        rt=ls.executeQuery("SELECT * FROM fecha_apelaciones");
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Fecha de inicio");
                        out.print("</th>");
                        out.print("<th>");
                        out.print("Fecha límite");
                        out.print("</th>");
                        out.print("</tr>");
                        while (rt.next())
                        {
                            out.print("<tr>");
                            out.print("<td>");
                            out.print(rt.getString("fecha_inicio"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rt.getString("fecha_fin"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='Borrar_fechaapela?id_fecha="+rt.getInt("id_fecha")+"'>Borrar</a>");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a href='/login/Admins/modifica_feapela.jsp?id="+rt.getInt("id_fecha")+"'>Modificar</a>");
                            out.print("</td>");
                        }
                        out.print("</table>");
                        ls.closeConnection();
                        %>
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
