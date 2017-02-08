<%-- 
    Document   : About_us
    Created on : 30/01/2017, 10:48:29 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="icono.ico"/>"/>
    </head>
    <body background="css/textura.png" class="boding">
       <!--header-->
        <header class="headering">
            <s:div cssClass="container">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
            </s:div>
        </header>
        
        <s:if test="hasActionErrors()">
   <div class="errors">
      <s:actionerror/>
   </div>
</s:if>
        
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                <s:div cssClass="cover-container">
                    <h2 class="titulos">E-SIBE</h2>
                    <div>
                    <s:div cssClass="cover-inner" align ="center">
                        <p>E-SIBE es un sistema web basado en la nube que busca facilitar el proceso de validación de la
                        beca por exclusividad brindada por la COFAA permitiendo a los docentes y a los usuarios de diversas
                        dependencias gestionar y controlar todos los archivos que sean subidos a dicha plataforma.
                        Todo esto, con ayuda de sofisticadas tecnologías web.</p>
                    </s:div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="Modifica_USIP">Modificar Usuario</a></li>
                                <li><a>Borrar Usuario</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                        </div>  
                    
                    
                </s:div>
            </s:div>  
        </s:div>

        <!--footer-->
        <footer class="footer">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
        </footer>
        
    </body>
</html>
