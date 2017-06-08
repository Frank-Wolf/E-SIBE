<%-- 
    Document   : Proyectos_reportados
    Created on : 6/06/2017, 09:02:36 PM
    Author     : le_as
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <sj:head />
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link rel="icon" href="<s:url value="/icono.ico"/>"/>
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
                            <a class="navbar-brand" >E-SIBE: Usuario SIP</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Proyecto_sip">Atras</a></li>
                                
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="SIP_Principal">
                                      Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>

                <s:div cssClass="cover-container2">    
                    <div class="row">
                        <div class="col-md-6" >
                            <br/>
                    <h2 class="titulos">Bienvenido Usuario SIP</h2>
                       
                        <s:set name="id_alumno" value="%{0}" />
                        <s:set name="registrado" value="%{1}"/>
                        <s:form action="registra_proyecto" method="post">
                            <s:textfield name="id_proyecto" label="Id del Proyecto" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="[4 dígitos-año][4 dígitos-consecutivo]" type="number"/>                           
                            <s:textfield name="nom_proyecto" label="Título del proyecto" cssClass="form-control" placeholder="Titulo del Proyecto"/>
                            <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="No. de Empleado del Autor" type="number"/>
                            
                           <s:select label="Seleccione el Rol de Profesor" cssClass="form-control"
                            headerKey="-1" headerValue="Rol de Profesor"
                            list="# {
                            'Coordinador':'Coordinador',
                            'Colaborador':'Colaborador'
                            }"
                            name="rol" />   
                            <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" placeholder="Fecha de Registro" />
                            <s:hidden name="id_alumno" label="id_alumno"/>
                            <s:hidden name="registrado"/>
                            <s:submit value="Registrar Proyecto" cssClass="btn" />
                        </s:form> 
                                                
                       </div>
                        <div class="col-md-6">
                            <h2 class="titulos" align="center">Proyectos Registrados</h2>
                            <br/>
                               
                            <%
                                lb.getConnection();
                                ResultSet beifi=lb.executeQuery("select * from profesor_tiene_proyecto where registrado=0 ;");
                                out.print("<table  class=' table "
                                         + "table-container table-striped "
                                         + "table-responsive '>");
                                out.print("<tr>");
                                out.print("<th>");
                                out.print("Numero de Proyecto");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Nombre de Proyecto");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("No. Empleado del Prof.");
                                out.print("</th>");
                                out.print("<th>");
                                out.print("Rechazar");
                                out.print("</th>");
                                out.print("<th>");
                                while(beifi.next())
                                {
                                    ResultSet proyecto=lb.executeQuery("select nom_proyecto from proyecto where id_proyecto='"+beifi.getString("id_proyecto")+"'");
                                    while (proyecto.next())
                                    {
                                        
                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(beifi.getString("id_proyecto"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(proyecto.getString("nom_proyecto"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(beifi.getString("id_usuario"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print("<a href='Borrar_PROYECTO?id_proyecto="
                                        +beifi.getString("id_proyecto")+"&id_usuario="+beifi.getString("id_usuario")+"'>Borrar</a>");
                                        out.print("</td");
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
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="/css/js/jquery.js" type="text/javascript"></script>
        <script src="/css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>