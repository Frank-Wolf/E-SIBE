<%-- 
    Document   : Profesor
    Created on : 27/01/2017, 07:11:22 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
        
    <!--head-->
    <head>  
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> E-SIBE: Apelaciones</title>

        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <script src="<s:url value="../css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        
       
        <link rel="stylesheet" href="<s:url value="../css/font-awesome-4.7.0/css/font-awesome.min.css"/>"/>
        
    </head>
    
    <body background="../css/textura.png" class="container-fluid" >
        
        <!--header-->
        <header class="headering rela">
            <s:div cssClass="container">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" class="img-responsive"/>
            </s:div>
        </header> 
        <!--s:iterator value="%{#session.username}"--> 
        <!--s:property/-->
        <!--/s:iterator-->
        <!--Conteneor general-->    
        <s:div cssClass="container-fluid">
            <s:div cssClass="">
                <nav class="navbar navbar-default">
        
                    <div class="container">
                    
                        <div class="navbar-header">
                            <a class="navbar-brand letritas" >E-SIBE: Profesor</a>
                        </div>
                        
                        <div id="navbar" class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li><a href="menu_notime2">
                                        Menú Principal</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                    <!--Tabla en la que se muestran las actividades no aprobadas-->
                    <div class="col-md-12" align="center">
                        <h2 class="h3">Lista de actividades no aprobadas</h2>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <s:set var="username" value="%{#session.username}" />
                        <jsp:useBean id="username" type="java.lang.String"/>
                    
                        <h2 class="h3"><b>Actividad 2.1</b></h2>
                        <%
                            String id_prof = username;
                            int l = 0;
                            ResultSet rs8=null, rs9=null, rs10=null, rs11=null, rs12=null, rs13=null, rs14=null;
                            lb.getConnection();
                            rs8=lb.executeQuery("SELECT * "//comentarios, puntaje_alumno, ruta_alumno, id_alumno, id_proyecto
                                    //tipo_alumno
                                    + "FROM profesor_tiene_proyecto WHERE "
                                    + "id_usuario = " + id_prof + " AND aceptado_alumno = 0 AND validado_alumno=0");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print(  "Tipo de alumno");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("  Boleta del alumno  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "  Comentarios ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Ver constancia");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Número del proyecto SIP");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Puntaje asignado");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs8.next())
                            {
                                if(rs8.getString("id_alumno") == "0")
                                    l = 1;
                                else{
                                    out.print("<tr>");
                                    out.print("<td>");
                                    out.print(rs8.getString("tipo_alumno"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rs8.getString("id_alumno"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rs8.getString("comentarios"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print("<a href='file:///"
                                        +rs8.getString("ruta_alumno")+"'>Ver constancia</a>");
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rs8.getString("id_proyecto"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(rs8.getString("puntaje_alumno"));
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print("<a href='/login/Profesor/Envia_apela_2_1.jsp?id="
                                        + rs8.getString("id_alumno") + "'>Apelar</a>");
                                    out.print("</td>");
                                }
                            }
                            out.print("</table>");
                        %>
                        <br/><br/><br/>
                        <h2 class="h3"><b>Actividad 2.2</b></h2>
                        <%
                            rs9=lb.executeQuery("SELECT * "//
                                    + "FROM profesor_tiene_pub WHERE "
                                    + "id_usuario = " + id_prof + " AND validado = 0 AND aceptado=0");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print(  "Identificador de la publicación");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("  Tipo de publicación  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "  Comentarios ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Ver constancia");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Puntaje asignado");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs9.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs9.getString("id_publicacion"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs9.getString("id_tipo_pub"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs9.getString("comentarios"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///"
                                        +rs9.getString("ruta_alm")+"'>Ver constancia</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs9.getString("puntaje"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Profesor/Envia_apela_2_2.jsp?id="
                                        + rs9.getString("id_publicacion") + "'>Apelar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                        %>
                        <br/><br/><br/>
                        <h2 class="h3"><b>Actividad 2.3</b></h2>
                        <%
                            rs10=lb.executeQuery("SELECT * "//
                                    + "FROM profesor_participa_ev WHERE "
                                    + "id_usuario = " + id_prof + " AND validado = 0 AND aceptado=0");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print(  "Identificador del evento");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("  Actividad  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "  Comentarios ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Ver archivos subidos");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Puntaje asignado");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs10.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs10.getString("id_evento"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs10.getString("actividad"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs10.getString("comentarios"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///"
                                        +rs10.getString("ruta_alm")+"'>Ver constancia</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs10.getString("puntaje"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Profesor/Envia_apela_2_3.jsp?id="
                                        + rs10.getString("id_evento") + "'>Apelar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                        %>
                        <br/><br/><br/>
                        <h2 class="h3"><b>Actividad 2.4</b></h2>
                        <%
                            rs11=lb.executeQuery("SELECT count(*), id_proyecto, ruta_alm, puntaje, comentarios, rol_profesor "
                        + "FROM profesor_tiene_proyecto "
                        + "WHERE id_usuario = '" + id_prof +"' "
                        + "AND validado = 0 AND aceptado=0 "
                        + "GROUP BY id_proyecto "
                        + "HAVING COUNT(*) > 1");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print(  "Identificador del proyecto");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("  Rol del profesor  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "  Comentarios ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Ver archivos subidos");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Puntaje asignado");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs11.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs11.getString("id_proyecto"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs11.getString("rol_profesor"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs11.getString("comentarios"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///"
                                        +rs11.getString("ruta_alm")+"'>Ver constancia</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs11.getString("puntaje"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Profesor/Envia_apela_2_4.jsp?id="
                                        + rs11.getString("id_proyecto") + "'>Apelar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                        %>
                        <br/><br/><br/>
                        <h2 class="h3"><b>Actividad 2.5</b></h2>
                        <%
                            rs12=lb.executeQuery("SELECT * "//
                                    + "FROM profesor_tiene_obra WHERE "
                                    + "id_usuario = " + id_prof + " AND validado = 0 AND aceptado=0");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print(  "Identificador de la obra");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("  Tipo de obra  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "  Comentarios ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Ver archivos subidos");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Puntaje asignado");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs12.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs12.getString("id_obra"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs12.getString("id_tipo_obra"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs12.getString("comentarios"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///"
                                        +rs12.getString("ruta_alm")+"'>Ver constancia</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs12.getString("puntaje"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Profesor/Envia_apela_2_5.jsp?id="
                                        + rs12.getString("id_obra") + "'>Apelar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                        %>
                        <br/><br/><br/>
                        <h2 class="h3"><b>Actividad 2.11</b></h2>
                        <%
                            rs13=lb.executeQuery("SELECT * "//
                                    + "FROM profesor_tiene_tt WHERE "
                                    + "id_usuario = " + id_prof + " AND validado = 0 AND aceptado=0"/*and periodo = (same as professor)*/);
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print(  "Identificador del Trabajo Terminal");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("  Boleta de alumno que se graduó primero  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "  Comentarios ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Ver archivos subidos");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Puntaje asignado");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs13.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs13.getString("id_TT"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs13.getString("id_alumno"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs13.getString("comentarios"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///"
                                        +rs13.getString("ruta_alm")+"'>Ver constancia</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs13.getString("puntaje"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Profesor/Envia_apela_2_11.jsp?id="
                                        + rs13.getString("id_TT") + "'>Apelar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                        %>
                        <br/><br/><br/>
                        <h2 class="h3"><b>Actividad 2.12</b></h2>
                        <%
                            rs14=lb.executeQuery("SELECT * "//
                                    + "FROM profesor_participa_en_plan WHERE "
                                    + "id_usuario = " + id_prof + " AND validado = 0 AND aceptado=0"/*and periodo = (same as professor)*/);
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print(  "Identificador de participación");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de participación");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "  Comentarios ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Ver archivos subidos");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Puntaje asignado");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Opción");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs14.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs14.getString("id_part"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs14.getString("id_tipo_part"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs14.getString("comentarios"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///"
                                        +rs14.getString("ruta_alm")+"'>Ver constancia</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs14.getString("puntaje"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Profesor/Envia_apela_2_12.jsp?id="
                                        + rs14.getString("id_part") + "'>Apelar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>
                    </div>
                <br/><br/>
                </s:div>
                    </s:div>
                
        
        
        
        <!--footer-->
        <footer class="footer ">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
       
        
        <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/barralateral.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
