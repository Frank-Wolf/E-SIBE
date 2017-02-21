<%-- 
    Document   : About_us
    Created on : 30/01/2017, 10:48:29 PM
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

        <title> E-SIBE</title>

        <link href="<s:url value="../css/bootstrap.min.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <script src="<s:url value="../css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
         
        
    </head>
    
    <body background="../css/textura.png" class="container-fluid">
        
        <!--header-->
        <header class="headering rela">
            <s:div cssClass="container">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" class="img-responsive"/>
            </s:div>
        </header> 
   
        <!--Conteneor general-->    
        <s:div cssClass="container-fluid">
            <s:div cssClass="">
                
                <!--Barra de Navegacion-->                    
                <nav class="navbar navbar-default row">
        
                    <div class="container col-lg-12">
                    
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Profesor</a>
                        </div>
                        
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Menu">
                                        Menú Principal</a>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="row">
                    <div class="col-md-3 barra">
                        <nav class="nav-lateral">
                            <ul class="backcolor">
                                <li class="parent"><a class="titulo"><span class=""> </span>Actividad 2.1</a>
                                    <ul>
                                        <li><a id="2.1.1">Actividad 2.1.1</a>
                                        <li><a id="2.1.2">Actividad 2.1.2</a>    
                                    </ul>
                                </li>
                                <li class="parent"><a class="titulo"><span class="glyphicon glyphicon-pencil"> </span> Actividad 2.2</a>
                                    <ul>
                                        <li><a id="2.2.1">Actividad 2.2.1</a>
                                        <li><a id="2.2.2">Actividad 2.2.2</a>    
                                        <li><a id="2.2.3">Actividad 2.2.3</a>    
                                    </ul>
                                </li>
                                <li class="parent"><a class="titulo"><span class="glyphicon glyphicon-play-circle"></span> Actividad 2.3</a>
                                    <ul>
                                        <li><a id="2.3.1">Actividad 2.3.1</a>
                                        <li><a id="2.3.2">Actividad 2.3.2</a>    
                                        <li><a id="2.3.3">Actividad 2.3.3</a>        
                                    </ul>
                                </li>
                                <li class="parent"><a class="titulo">Actividad 2.4</a>
                                    <ul>
                                        <li><a id="2.4.2">Actividad 2.4.2</a>
                                    </ul>
                                </li>
                                <li class="parent"><a class="titulo">Actividad 2.5</a>
                                    <ul>
                                        <li><a id="2.5.2">Actividad 2.5.2</a>
                                    </ul>
                                </li>
                                <li class="parent"><a class="titulo">Actividad 2.11</a>
                                    <ul>
                                        <li><a id="2.11.1">Actividad 2.11.1</a>
                                        <li><a id="2.11.2">Actividad 2.12.2</a>    
                                    </ul>
                                </li>
                                <li class="parent"><a class="titulo">Actividad 2.12</a>
                                    <ul>
                                        <li><a id="2.12.1">Actividad 2.12.1</a>
                                        <li><a id="2.12.2">Actividad 2.12.2</a>    
                                        <li><a id="2.12.3">Actividad 2.12.3</a>
                                        <li><a id="2.12.4">Actividad 2.12.4</a>
                                        <li><a id="2.12.5">Actividad 2.12.5</a>
                                        <li><a id="2.12.6">Actividad 2.12.6</a>    
                                        <li><a id="2.12.7">Actividad 2.12.7</a>
                                        <li><a id="2.12.8">Actividad 2.12.8</a>     
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                        <br style="clear: both">
                    </div>
                    <div class="col-lg-9">
                        
                    </div>
                </div>    
                <!--Contenido-->
               
            </s:div>  
        </s:div>
                
                
        
        
        
        <!--footer-->
        <footer class="footer">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
       
        
        <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap-treeview.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>