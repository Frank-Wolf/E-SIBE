<%-- 
    Document   : Apela
    Created on : May 8, 2017, 1:11:13 AM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<s:set var="username" value="%{#session.username}" />
<jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
<jsp:useBean id="username" type="java.lang.String"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.min.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link rel="icon" href="<s:url value="/icono.ico"/>"/>
        <style>
            .box{
            display: none;
            width: 100%;
            }

            a:hover + .box,.box:hover{
                display: inline-block;
                position: relative;
                z-index: 9999;
            }
        </style>
    </head>
    <body background="../css/textura.png" class="boding">
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
                            <a class="navbar-brand" >E-SIBE: Evaluador COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="/login/Usuario/Regresar_cofaa2">
                                      Regresar</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                
                <s:div cssClass="cover-container2">    
                    <%
                        String user=request.getParameter("id");
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("id",user);
                        lb.getConnection();
                        ResultSet rg = lb.executeQuery("SELECT * "
                                    + "FROM usuario WHERE "
                                    + "id_usuario = " + user);
                        out.print("<h2 class='Titular' align='center'>Lista de actividades que el profesor quiere apelar </h2>" );
                        //out.print(rg.getString("nom_usuario") + "</h2>");
                    %>
                    <div class="col-md-6">
                        <h2 class="h3">2.1 Formación de recursos humanos para la investigación</h2>
                        <%
                            ResultSet rs=null;
                            
                            rs=lb.executeQuery("SELECT * "
                                    + "FROM profesor_tiene_proyecto WHERE "
                                    + "id_usuario = " + user + " AND aceptado_alumno = 0 AND "
                                            + "validado_alumno = 1");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  Boleta de alumno  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs.getString("id_alumno"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///" + rs.getString("ruta_alumno") + "'>Ver constancia</a>");//Aquí poner la ruta de los alumnos
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/COFAA/Apela_2_1.jsp?id="
                                        +  rs.getString("id_alumno") + "'>Asigna puntaje y/o comentarios</a>");
                                out.print("</td>");
                                
                            }
                            out.print("</table>");
                            //lb.closeConnection();
                            //stack.getContext().put("varName", i);
                            //stack.setValue("#attr['varName']", i, false);
                        %>
                    </div>
                    <div class="col-md-6">
                    <h2 class="h3">2.2 Publicaciones científicas y de divulgación impresas y/o en línea</h2>   
                    <%
                        ResultSet rd=lb.executeQuery("SELECT * "
                                    + "FROM profesor_tiene_pub WHERE "
                                    + "id_usuario = " + user + " AND aceptado = 0 AND "
                                            + "validado = 1");
                        out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  ID de publicación  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rd.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rd.getString("id_publicacion"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///" + rd.getString("ruta_alm") + "'>Ver constancia</a>");//Aquí poner la ruta de los alumnos
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/COFAA/Apela_2_2.jsp?id="
                                        +  rd.getString("id_publicacion") + "'>Asigna puntaje y/o comentarios</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            //lb.closeConnection();
                    %>
                    </div>
                    <div class="col-md-6">
                    <h2 class="h3">2.3 Trabajos de investigación presentados en congresos, reuniones y eventos académicos</h2>   
                    <%
                        ResultSet ra=lb.executeQuery("SELECT * "
                                    + "FROM profesor_participa_ev WHERE "
                                    + "id_usuario = " + user + " AND aceptado =  0 AND validado = 1");
                        out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  ID de evento  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (ra.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(ra.getString("id_evento"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///" + ra.getString("ruta_alm") + "'>Ver constancia</a>");//Aquí poner la ruta de los alumnos
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/COFAA/Apela_2_3.jsp?id="
                                        +  ra.getString("id_evento") + "'>Asigna puntaje y/o comentarios</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            //lb.closeConnection();
                    %>
                    </div>
                    <div class="col-md-6">
                    <h2 class="h3">2.4 Investigación y/o desarrollo tecnológico satisfactorio</h2>   
                    <%
                        ResultSet rv=lb.executeQuery("SELECT count(*), id_proyecto, ruta_alm "
                                    + "FROM profesor_tiene_proyecto "
                                + " WHERE id_usuario = " + user 
                                    + " AND aceptado = 0 AND "
                                            + "validado = 1"
                                            + " GROUP BY id_proyecto"
                                        + " HAVING COUNT(*) > 1;");
                                    /*
                                    SELECT count(*), id_proyecto
                                    FROM profesor_tiene_proyecto
                                    WHERE id_usuario = 11014 AND 
                                    aceptado IS NULL AND
                                    validado = 1
                                    GROUP BY id_proyecto
                                    HAVING COUNT(*) > 1;*/
                        out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("ID de proyecto");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rv.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rv.getString("id_proyecto"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///" + rv.getString("ruta_alm") + "'>Ver constancia</a>");//Aquí poner la ruta de los alumnos
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/COFAA/Apela_2_4.jsp?id="
                                        +  rv.getString("id_proyecto") + "'>Asigna puntaje y/o comentarios</a>");
                               out.print("</td>");
                            }
                            out.print("</table>");
                            //lb.closeConnection();
                    %>
                    </div>
                    <div class="col-md-6">
                    <h2 class="h3">2.5 Derechos de autor</h2>   
                    <%
                        ResultSet rb=lb.executeQuery("SELECT * "
                                    + "FROM profesor_tiene_obra WHERE "
                                    + "id_usuario = " + user + " AND aceptado = 0 AND "
                                            + "validado = 1");
                        out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  ID de Obra  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rb.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rb.getString("id_obra"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///" + rb.getString("ruta_alm") + "'>Ver constancia</a>");
                                //out.print("<div class='box'><iframe src='file:///" + rb.getString("ruta_alm") + "' "
                                //        + "width = '500px' height = '500px'></iframe></div>");
                                out.print("<div class='box'><iframe src='http://en.wikipedia.org/' "
                                        + "width = '100px' height = '100px'></iframe></div>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/COFAA/Apela_2_5.jsp?id="
                                        +  rb.getString("id_obra") + "'>Asigna puntaje y/o comentarios</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            //lb.closeConnection();
                    %>
                    </div>
                    <div class="col-md-6">
                    <h2 class="h3">2.11 Direcciones y codirecciones de tésis</h2>   
                    <%
                        ResultSet rn=lb.executeQuery("SELECT * "
                                    + "FROM profesor_tiene_tt WHERE "
                                    + "id_usuario = " + user + " AND aceptado = 0 ");
                        out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  ID de TT  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rn.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rn.getString("id_TT"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///" + rn.getString("ruta_alm") + "'>Ver constancia</a>");//Aquí poner la ruta de los alumnos
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/COFAA/Apela_2_11.jsp?id="
                                        +  rn.getString("id_TT") + "'>Asigna puntaje y/o comentarios</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            //lb.closeConnection();
                    %>
                    </div>
                    <div class="col-md-6">
                    <h2 class="h3">2.12 Coordinación o participación en la elaboración de un plan de estudios</h2>   
                    <%
                        ResultSet rm=lb.executeQuery("SELECT * "
                                    + "FROM profesor_participa_en_plan WHERE "
                                    + "id_usuario = " + user + " AND aceptado = 0 AND "
                                            + "validado = 1");
                        out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  ID de Plan de estudios  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rm.next())
                            {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rm.getString("id_part"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='file:///" + rm.getString("ruta_alm") + "'>Ver constancia</a>");//Aquí poner la ruta de los alumnos
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/COFAA/Apela_2_12.jsp?id="
                                        +  rm.getString("id_part") + "'>Asigna puntaje y/o comentarios</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            lb.closeConnection();
                    %>
                    </div>
                <s:set var="num_profesor"><%=user%></s:set>
                <s:form id="datos" action="update_evaluador_evalua" method="post" style="display:block;">
                    <s:hidden name="num_profesor"/>
                    <s:submit value="Registrar puntaje y fecha de registro"/>
                </s:form>
                </s:div>
            </s:div>  
              
        </s:div>        
        
        
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
                    <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>

