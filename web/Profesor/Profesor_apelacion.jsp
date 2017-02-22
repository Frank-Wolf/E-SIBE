<%-- 
    Document   : Profesor
    Created on : 27/01/2017, 07:11:22 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
        
    <!--head-->
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
                            <a class="navbar-brand" >E-SIBE</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Inicio</a></li>
                                <li><a href="#">Acerca de E-SIBE</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" 
                                       data-toggle="dropdown" role="button" 
                                       aria-haspopup="true" aria-expanded="false">
                                       Actividades <span class="caret"></span>
                                    </a>
                                     <ul class="dropdown-menu">
                                        
                                        <li><a href="Actividad_2_1">Actividades 2.1</a></li>
                                        <li><a href="Actividad_2_2">Actividades 2.2</a></li>
                                        <li><a href="Actividad_2_3">Actividades 2.3</a></li>
                                        <li><a href="Actividad_2_4">Actividades 2.4</a></li>
                                        <li><a href="Actividad_2_5">Actividades 2.5</a></li>
                                        
                                        <li><a href="Actividad_2_11">Actividades 2.11</a></li>
                                        <li><a href="Actividad_2_12">Actividades 2.12</a></li>
                                     
                                    </ul>
                                    
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
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