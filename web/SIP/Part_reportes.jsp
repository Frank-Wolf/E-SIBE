<%-- 
    Document   : Part_reportes
    Created on : 7/06/2017, 01:47:34 AM
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
                                <li><a href="PARTSIP_REPORTES">Participaciones en plan de estudios reportados por Docentes</a></li>
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
                       <div class="col-md-12" align="center">
                       <h2 class="titulos">Registrar Participación</h2>
                        <s:set name="u_a" value="%{'SIP'}" />
                        <s:set name="registrado" value="%{1}" />
                        <s:form action="registra_part_sip" method="post">
                            <s:hidden name="u_a" label="dependencia"/>
                            <s:textfield name="id_participacion" label="Id de Participacion" cssClass="form-control" maxlength="4" pattern="([0-9]{4})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="[4 dígitos-consecutivo]" type="number"/>                           
                            <s:textfield name="Asignatura" label="Asignatura en la que se participó" cssClass="form-control" placeholder="Asginatura o plan en el que se Participó"/>
                            <s:textfield name="id_usuario" label="No. Empleado del Participante" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="No. de Empleado del Autor" type="number"/>
                            <s:select label="Seleccione el Tipo de participacion" cssClass="form-control"
                            headerKey="-1" headerValue="tipo de participacion"
                            list="# {
                            '1':'Coordinacion en la elaboracion de un plan de estudios',
                            '2':'Coordinacion en la actualización de un plan de estudios',
                            '3':'Participacion en la elaboracion de un plan de estudios',
                            '4':'Participacion en la actualizacion de un plan de estudios',
                            '5':'Coordinacion en la elaboracion de un programa de estudios',
                            '6':'Coordinacion en la actualización de un programa de estudios',
                            '7':'Participacion en la elaboracion de un programa de estudios',
                            '8':'Participacion en la actualizacion de un programa de estudios'
                            }"
                            name="id_tipo_part_plan" />   
                            <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control" />
                            <s:hidden name="registrado"/>
                            <s:submit value="Registrar Proyecto" cssClass="btn" />
                        </s:form>                        
                        </div>
                    </div>
                        <br/>
                        
                        <br/>
                        <div class="row">
                        <div class="col-md-12" style="margin-left: 10px; ">
                            <h2 class="titulos">Participaciones Registradas</h2>
                            <%
                            lb.getConnection();
                            ResultSet participacion=lb.executeQuery("select * FROM part_plan_est where u_a = 'SIP';");
                            out.print("<table  class=' table "
                                     + "table-container table-striped "
                                     + "table-responsive '>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("No. Participacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Asignatura");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Tipo de Participacion");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("No. Empleado del Prof.");
                            out.print("</th>");
                            out.print("<th>");
                            out.print("Rechazar");
                            out.print("</th>");
                            out.print("</tr>");
                            
                                
                                while(participacion.next())
                                {
                                    ResultSet profe_part=lb.executeQuery("select * from profesor_participa_en_plan where id_part='"+participacion.getString("id_part")+"' and registrado=0");
                                    while (profe_part.next())
                                    {
                                        ResultSet nom_part=lb.executeQuery("select * from tipo_part_plan where id_tipo_part="+participacion.getString("id_tipo_part")+"");
                                        while(nom_part.next())
                                        {
                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(participacion.getString("id_part"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(participacion.getString("asignatura"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(nom_part.getString("nombre_part"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(profe_part.getString("id_usuario"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print("<a href='Borrar_PART?id_part="
                                        +profe_part.getString("id_part")+"&id_usuario="+profe_part.getString("id_usuario")+" &asignatura="+participacion.getString("asignatura")+"'>Borrar</a>");;
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
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="/css/js/jquery.js" type="text/javascript"></script>
        <script src="/css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>


