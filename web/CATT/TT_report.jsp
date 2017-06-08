<%-- 
    Document   : TT_report
    Created on : 7/06/2017, 05:37:51 PM
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
                            <a class="navbar-brand" >E-SIBE: Usuario CATT</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Cerrar_sesion">
                                      Cerrar Sesión</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                
                <s:div cssClass="cover-container2">        
                    <div class="row ">
                        <div class=" col-xs-12 col-sm-8 col-md-8 col-lg-8 
                         col-lg-offset-2 col-md-offset-2 col-xs-offset-0 
                         col-sm-offset-2 ">
                            <h2 class="Titulos" align="center">Registrar Dirección de Trabajo Terminal</h2>
                            <s:set name="registrado" value="%{1}"/>
                            <s:form action="registra_TT" method="post">
                                <s:textfield name="id_alumno" label="Matricula del Alumno graduado" placeholder="Numero de 10 dígitos" cssClass="form-control"  maxlength="10" pattern="([0-9]{10})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                                <s:textfield name="nom_alumno" label="Nombre del Alumno graduado" placeholder="Nombre Completo del Alumno" cssClass="form-control"/>
                                <s:textfield name="id_TT" label="numero del TT" cssClass="form-control" placeholder="TT20##-[A/B]###"/>
                                <s:textfield name="nom_TT" label="Título del TT" cssClass="form-control" placeholder="Nombre del Trabajo Terminal"/>
                                <s:textfield name="id_usuario" label="No. Empleado del Director" cssClass="form-control" placeholder="Numero de 8 dígitos" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number"/>
                                <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" style="width =80%" placeholder="Fecha de Registro de la evidencia"/>
                                <s:hidden name="registrado"/>
                                <s:submit cssClass="btn" name="Registrar TT" value="Registrar Usuario"/>
                            </s:form> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            
                                <h2 class="Titulos" align="center">Trabajos Terminales Registrados</h2>
                               
                        <%
                            lb.getConnection();
                            ResultSet beifi=lb.executeQuery("select * from profesor_tiene_tt where registrado=0");
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("Numero de TT");
                            out.print("</th>");
                             out.print("<th>");
                            out.print("Nombre de TT");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("No. Empleado del Prof.");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Numero de Boleta de Alumno");
                            out.print("</th>");
                             out.print("<th>");
                            out.print("Nombre de Alumno");
                            out.print("</th>");
                            
                            out.print("</tr>");
                            
                                
                                while(beifi.next())
                                {
                                    ResultSet proyecto=lb.executeQuery("select * from tt where id_TT='"+beifi.getString("id_TT")+"'");
                                    while (proyecto.next())
                                    {
                                        ResultSet alumno=lb.executeQuery("select nom_alumno from alumno where id_alumno="+beifi.getInt("id_alumno")+"");
                                        while(alumno.next())
                                        {
                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(beifi.getString("id_tt"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(proyecto.getString("nom_tt"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("id_usuario"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("id_alumno"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(alumno.getString("nom_alumno"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print("<a href='Borrar_TT?id_TT="
                                        +beifi.getString("id_tt")+"&id_usuario="+beifi.getString("id_usuario")+"'>Borrar</a>");
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
        <footer class="footer">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
