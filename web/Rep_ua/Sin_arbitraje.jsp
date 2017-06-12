<%-- 
    Document   : Reg_TT
    Created on : 22/04/2017, 10:02:51 PM
    Author     : le_as
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <head>
       <sj:head />
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE</title>
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
    </head>
    <body background="../css/textura.png" class="boding">
        <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
        <s:set var="username" value="%{#session.username}" />
        <jsp:useBean id="username" type="java.lang.String"/>
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
                            <a class="navbar-brand" >E-SIBE: Representante de Unidad Académica</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="PUB_REP_SIN">
                                      Publicaciones Reportadas por los Docentes</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Menu_RUA">
                                      Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                <s:div cssClass="cover-container2">    
                     <div class="row ">
                        <div class=" col-xs-12 col-sm-8 col-md-8 col-lg-8 
                         col-lg-offset-2 col-md-offset-2 col-xs-offset-0 
                         col-sm-offset-2 ">
                            <h2 class="titulos" align="center">Registrar Publicación Sin Arbitraje</h2>
                            <br/>
                            <br/>
                            <s:set name="id_evento" value="%{0}"/>   
                            <s:set name="registrado" value="%{1}"/>
                            <s:form action="registra_pub_sin" method="post">
                                <s:textfield name="id_publicacion" label="Folio de Control" cssClass="form-control"/>
                                <s:textfield name="Nombre_Rev" label="Nombre de la Revista" cssClass="form-control"/>
                                <s:textfield name="Nom_Public" label="Nombre de la publicacion" cssClass="form-control"/>
                                <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" />
                                <s:select label="Seleccione una dependencia" cssClass="form-control"
                                    headerKey="-1" headerValue="Tipo de publicacion"
                                    list="# {
                                    '2':'Sin Arbitraje, nacional',
                                    '3':'Sin Arbitraje, Internacional'
                                    }"
                                    name="id_tipo_pub" />
                                <s:textfield name="num_autores" label="Numero de Autores" cssClass="form-control"/>
                                <s:textfield name="numero" label="Numero de la revista" cssClass="form-control"/>
                                <s:textfield name="ISSN" label="ISSN" cssClass="form-control" />
                                <s:textfield name="ISBN" label="ISBN" cssClass="form-control" />
                                <s:textfield name="volumen" label="Volumen" cssClass="form-control"/>
                                <s:textfield name="annio" label="Año" cssClass="form-control" />
                                <sj:datepicker name="fecha_publicacion" label="Fecha de Publicacion" displayFormat="dd-mm-yy" cssClass="form-control" style="width =80%"/>
                                <s:hidden name="id_evento" />
                                <s:hidden name="registrado"/>
                                <s:submit cssClass="btn" name="Registrar TT" value="Registrar Publicación"/>
                            </s:form>  
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="titulos" align="center">Publicaciones Registradas</h2>
                            <br/>

                            <%
                                lb.getConnection();
                                ResultSet beifi=lb.executeQuery("select * from publicacion where id_tipo_pub=2 OR id_tipo_pub=3 ;");
                                out.print("<table  class=' table "
                                         + "table-container table-striped "
                                         + "table-responsive '>");
                                out.print("<tr>");
                                out.print("<th>");
                                out.print("Numero de Publicacion");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("ISSN");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("ISBN");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Nombre de la Revista");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Nombre de la Publicación");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Volumen");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Año");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Número");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("No. Empleado - ID Autor");
                                out.print("</th>");
                                out.print("</tr>");
                                while(beifi.next())
                                {
                                    ResultSet proyecto=lb.executeQuery("select id_usuario from profesor_tiene_pub where id_publicacion='"+beifi.getString("id_publicacion")+"' AND registrado=1");
                                    while (proyecto.next())
                                    {
                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(beifi.getString("id_publicacion"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("ISSN"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("ISBN"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("Nombre_Rev"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("Nom_Public"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("volumen"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("annio"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("numero"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(proyecto.getString("id_usuario"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print("</tr>");
                                    }
                                }

                                out.print("</table>");
                                lb.closeConnection();
                            %>   
                            <br/>
                            <br/>  
                        </div>
                    </div>        
                </s:div>
             </s:div>
        </s:div>
        
         <!--footer-->
        <footer class="footer">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
