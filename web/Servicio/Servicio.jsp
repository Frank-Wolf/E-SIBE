<%-- 
    Document   : SIP
    Created on : Feb 8, 2017, 8:07:49 AM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
                            <a class="navbar-brand" >E-SIBE: Usuario Servicio Social</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="#">Dar de alta alumno</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesión</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                

                
                
                <s:div cssClass="cover-container">    
                    
                    
                    
                    
                    <h2 class="titulos">Holi profesor</h2>
                    
                    
                </s:div>
            </s:div>  
              
        </s:div>        
        
        
        <!--footer-->
        <footer class="footer">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
        </footer>
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
