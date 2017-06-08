<%-- 
    Document   : Reportes_Actividades
    Created on : 22/05/2017, 02:07:35 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<s:set var="username" value="%{#session.username}" />
<jsp:useBean id="lb" scope="session" class="sesion.LoginBean"/>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        
        
        
        
        <title>Inicio administrador COFAA </title>
    </head>
    <body background="../css/textura.png" class="boding">
        
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
                            <a class="navbar-brand" >E-SIBE: Administrador COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Menu_COFAA">
                                      Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                
                 <div class="cover-container2 ">    
                    <div class="container">
                          <!--Aquí van las consultas-->  
                    </div> 
                </div> 
                    <!-- Tabla donde se muestran los usuarios Activos-->   
                    <%
                        lb.getConnection();
                        int periodo = 0, bei = 0, ss = 0;
                        ResultSet rperiodo = lb.executeQuery("SELECT * FROM evaluador");
                        while(rperiodo.next()){
                            periodo = rperiodo.getInt("periodo_actual");
                        }
                        /***********************Alumnos******************************/
                        ResultSet rAlumB = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 1 "
                     + "AND tipo_alumno = 'BEIFI' AND periodo = " + periodo);
                        if(rAlumB.next())
                            bei = rAlumB.getInt(1);
                        ResultSet rAlumSS = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 1 "
                     + "AND tipo_alumno = 'SS' AND periodo = " + periodo);
                        if(rAlumB.next())
                            ss = rAlumB.getInt(1);
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Número de Alumnos registrados y aceptados");
                        out.print("</th>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print("BEIFI");
                        out.print("</td>");
                        out.print("<td>");
                        out.print("Servicio Social");
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(bei);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(ss);//Aquí poner la ruta de los alumnos
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("</table>");
                        /***********************AlumnosEND******************************/
                        /***********************Publicaciones******************************/
                        int acep = 0, rech = 0;
                        ResultSet pub_acep = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 "
                     + "AND (id_tipo_pub = 1 OR id_tipo_pub = 2 OR id_tipo_pub = 3 OR id_tipo_pub = 4 OR id_tipo_pub = 1) AND periodo = " + periodo);
                        if(pub_acep.next())
                            acep = pub_acep.getInt(1);
                        ResultSet pub_rech = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 0 "
                     + "AND (id_tipo_pub = 1 OR id_tipo_pub = 2 OR id_tipo_pub = 3 OR id_tipo_pub = 4 OR id_tipo_pub = 1) AND periodo = " + periodo);
                        if(pub_rech.next())
                            rech = pub_rech.getInt(1);
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Número de publicaciones registradas");
                        out.print("</th>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print("Aceptadas");
                        out.print("</td>");
                        out.print("<td>");
                        out.print("Rechazadas");
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(acep);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rech);//Aquí poner la ruta de los alumnos
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("</table>");
                        /***********************PublicacionesEND******************************/
                        /***********************Eventos aceptados y rechazados******************************/
                        int acep_ev = 0, rech_ev = 0;
                        ResultSet ev_acep = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 1 "
                     + "AND periodo = " + periodo);
                        if(ev_acep.next())
                            acep_ev = ev_acep.getInt(1);
                        ResultSet ev_rech = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 0 "
                     + "AND periodo = " + periodo);
                        if(ev_rech.next())
                            rech_ev = ev_rech.getInt(1);
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Número de eventos registrados");
                        out.print("</th>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print("Aceptados");
                        out.print("</td>");
                        out.print("<td>");
                        out.print("Rechazados");
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(acep_ev);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rech_ev);//Aquí poner la ruta de los alumnos
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("</table>");
                        /***********************Eventos aceptados y rechazados******************************/
                        /***********************Proyecto SIP aceptados y rechazados******************************/
                        int a = 0, r = 0;
                        ResultSet rb = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 1 AND periodo = " + periodo);
                        if(rb.next())
                            a = rb.getInt(1);
                        ResultSet rc = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 0 AND periodo = " + periodo);
                        if(rc.next())
                            r = rc.getInt(1);
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Número de proyectos SIP registrados");
                        out.print("</th>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print("Aceptados");
                        out.print("</td>");
                        out.print("<td>");
                        out.print("No aceptados");
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(a);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(r);//Aquí poner la ruta de los alumnos
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("</table>");
                        /***********************Proyecto SIP aceptados y rechazadosEND******************************/
                        /***********************Obras con propiedad intelectual******************************/
                        //int a = 0, r = 0;
                        ResultSet ro = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND periodo = " + periodo);
                        if(ro.next())
                            a = ro.getInt(1);
                        ResultSet ro2 = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 0 AND periodo = " + periodo);
                        if(ro2.next())
                            r = ro2.getInt(1);
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Número de obras registradas");
                        out.print("</th>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print("Aceptadas");
                        out.print("</td>");
                        out.print("<td>");
                        out.print("No aceptadas");
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(a);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(r);//Aquí poner la ruta de los alumnos
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("</table>");
                        /***********************Obras con propiedad intelectualEND******************************/
                        /***********************Direcciones y codirecciones de tesis******************************/
                        ResultSet rtt = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 1 AND periodo = " + periodo);
                        if(rtt.next())
                            a = rtt.getInt(1);
                        ResultSet rtt2 = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 0 AND periodo = " + periodo);
                        if(rtt2.next())
                            r = rtt2.getInt(1);
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Número de Trabajas Terminales registrados");
                        out.print("</th>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print("Aceptados");
                        out.print("</td>");
                        out.print("<td>");
                        out.print("No aceptados");
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(a);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(r);//Aquí poner la ruta de los alumnos
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("</table>");
                        /***********************Direcciones y codirecciones de tesisEND******************************/
                        /***********************Participación en plan de estudios******************************/
                        ResultSet rplan = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND periodo = " + periodo);
                        if(rplan.next())
                            a = rplan.getInt(1);
                        ResultSet rplan2 = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 0 AND periodo = " + periodo);
                        if(rplan2.next())
                            r = rplan2.getInt(1);
                        out.print("<table class='table table-striped'>");
                        out.print("<tr>");
                        out.print("<th>");
                        out.print("Número de registros de participación en planes de estudio");
                        out.print("</th>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print("Aceptados");
                        out.print("</td>");
                        out.print("<td>");
                        out.print("No aceptados");
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(a);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(r);//Aquí poner la ruta de los alumnos
                        out.print("</td>");
                        out.print("</tr>");
                        out.print("</table>");
                        /***********************Participación en plan de estudiosEND******************************/
                        lb.closeConnection();
                    %>
                    
            </s:div>  
        </s:div>        

        
        <!--footer-->
        <footer class="footer">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                                    <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script> 
    <script type="text/javascript"
     src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
    
</html>
