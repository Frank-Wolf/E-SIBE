<%-- 
    Document   : periodo_cofaa
    Created on : Feb 14, 2017, 12:29:10 PM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %>   
<!DOCTYPE html>
<html>
    <head>
        <sj:head />
        <link rel="stylesheet" href="/Struts2Example/struts/xhtml/styles.css" type="text/css"/>

        <script language="JavaScript" src="/Struts2Example/struts/utils.js"
        type="text/javascript"></script>

        <script language="JavaScript" src="/Struts2Example/struts/xhtml/validation.js"
        type="text/javascript"></script>

        <script language="JavaScript" src="/Struts2Example/struts/css_xhtml/validation.js"
        type="text/javascript"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Administración de periodos del administrador COFAA</title>
    </head>
    <body background="../css/textura.png" class="boding overflow">
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
                            <a class="navbar-brand" >E-SIBE: Periodos</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Inicio</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                
                <s:div cssClass="cover-container2">    
                    <h2 class="titulos">Seleccione una actividad</h2>   
                </s:div>
                <s:div cssClass="cover-inner" align ="center">
                    <s:form action="Registra_fechas" method="post">
                        <sj:datepicker name="date1" label="Fecha de inicio" displayFormat="dd-mm-yy"/>
                        <sj:datepicker name="date2" label="Fecha de finalización" displayFormat="dd-mm-yy"/>
                        <s:submit value="Registrar fechas" name="submit" />
                    </s:form> 
                </s:div>
            </s:div>       
        </s:div>             
        <!--footer-->
        <footer class="footer abso">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
