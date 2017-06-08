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
                                <li><a href="EVENTO_REP">
                                      Participaciones en Eventos Reportadas por los profesores</a></li>
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
                            <s:set name="Nacional" value="%{1}"/>
                            <s:set name="compulsado" value="%{1}"/>
                            <s:set name="ISBN" value="%{' - '}"/>
                            <s:set name="ISSN" value="%{' - '}"/>
                            <s:set name="Nombre_Rev" value="%{' - '}"/>
                            <s:set name="volumen" value="%{' - '}"/>
                            <s:set name="annio" value="%{' - '}"/>
                            <s:set name="numero" value="%{' - '}"/>
                            <s:set name="sede" value="%{'ESCOM'}"/>
                            <s:set name="registrado" value="%{1}"/>
                            <s:form action="registra_evento" method="post">
                                <s:textfield name="id_evento" label="Id de Participacion en el Evento" cssClass="form-control"/>
                                <s:textfield name="nom_evento" label="Nombre del evento Academico" cssClass="form-control"/>
                                <sj:datepicker name="fecha_inicio" label="Fecha de Inicio" displayFormat="dd-mm-yy" style="width: 89%;"/>
                                <sj:datepicker name="fecha_fin" label="Fecha de Cierre " displayFormat="dd-mm-yy" style="width: 89%;"/>
                                <s:textfield name="id_publicacion" label="Numero de Publicación" cssClass="form-control"/>
                                <s:textfield name="Nom_Public" label="Nombre de la Publicación" cssClass="form-control"/>
                                <s:textfield name="num_autores" label="Imserte el numero de autores" cssClass="form-control"/>
                                <s:select label="Seleccione el tipo de Actividad" cssClass="form-control"
                                    headerKey="-1" headerValue="Tipo de publicacion"
                                    list="# {
                                    '6':'Institucional, sin ponencia publicada',
                                    '7':'Institucional, con resumen publicado',
                                    '8':'Institucional, publicado en extenso'
                                    }"
                                    name="id_tipo_pub" />
                                <sj:datepicker name="fecha_publicacion" label="Fecha de Publicacion" displayFormat="dd-mm-yy" style="width: 89%;" />
                                <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" />
                                <s:hidden name="Nacional" cssClass="form-control"/>
                                <s:hidden name="compulsado" cssClass="form-control"/>
                                <s:hidden name="ISSN" label="ISSN" cssClass="form-control" />
                                <s:hidden name="ISBN" label="ISBN" cssClass="form-control" />
                                <s:hidden name="Nombre_Rev" label="ISBN" cssClass="form-control" />
                                <s:hidden name="volumen" label="Volumen" cssClass="form-control"/>
                                <s:hidden name="annio" label="Año" cssClass="form-control" />
                                <s:hidden name="numero" label="Año" cssClass="form-control" />
                                <s:hidden name="sede" label="Año" cssClass="form-control" />
                                <s:hidden name="registrado"/>
                                <s:submit cssClass="btn" name="Registrar"/>
                            </s:form>  
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="titulos" align="center">Publicaciones Registradas</h2>
                            <br/>

                            <%
                                lb.getConnection();
                                ResultSet beifi=lb.executeQuery("select * from publicacion where id_tipo_pub=6 OR id_tipo_pub=7 OR id_tipo_pub=8");
                                out.print("<table  class=' table "
                                         + "table-container table-striped "
                                         + "table-responsive '>");
                                out.print("<tr>");
                                out.print("<th>");
                                out.print("ID del Evento");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Nombre del Evento");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Numero de Publicación");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Título de la Ponencia");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("No. Empleado - ID Autor");
                                out.print("</th>");
                                out.print("</tr>");
                                while(beifi.next())
                                {
                                    ResultSet proyecto=lb.executeQuery("select * from profesor_tiene_pub where id_publicacion='"+beifi.getString("id_publicacion")+"' AND registrado=1");
                                    while (proyecto.next())
                                    {
                                        ResultSet evento=lb.executeQuery("select * from evento_academico where id_evento='"+beifi.getString("id_evento")+"'");
                                        while(evento.next())
                                        {
                                            out.print("<tr>");
                                        out.print("<td>");
                                        out.print(proyecto.getString("id_evento"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(evento.getString("nom_evento"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(proyecto.getString("id_publicacion"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("Nom_Public"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(proyecto.getString("id_usuario"));
                                        out.print("</td>");
                                        out.print("</tr>");
                                        }
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
        <footer class="footer ">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
