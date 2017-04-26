<%-- 
    Document   : participacion
    Created on : 24/04/2017, 01:09:30 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %>
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
    <body background="../css/textura.png" class="boding overflow">
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
                                <li><a href="Proyecto_sip">Proyecto SIP</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="SIP_Principal">
                                      Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>

                <s:div cssClass="cover-container2">    
                    
                    <h2 class="titulos">Bienvenido Usuario SIP</h2>
                       <div class="col-md-9" align="center">
                        <s:set name="u_a" value="%{'SIP'}" />
                        <s:form action="registra_part_sip" method="post">
                            <s:hidden name="u_a" label="dependencia"/>
                            <s:textfield name="id_participacion" label="Id de Participacion" cssClass="form-control"/>                           
                            <s:textfield name="Asignatura" label="Título del proyecto" cssClass="form-control"/>
                            <s:textfield name="id_usuario" label="No. Empleado del Participante" cssClass="form-control" />
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
                            <sj:datepicker name="fecha_reg" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control"/>
                            
                            <s:submit value="Registrar Proyecto" cssClass="btn" />
                        </s:form> 
                                                
                        
                    
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

