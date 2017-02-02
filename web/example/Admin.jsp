<%-- 
    Document   : Admin
    Created on : 27/01/2017, 07:11:53 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
        <!--head-->
    <!--head-->
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, 
        initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title> E-SIBE</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        
        <link rel="icon" href="<s:url value="icono.ico"/>"/>
    </head>
    
    <body background="../css/textura.png" class="boding">
        
        <!--header-->
        <header class="header">
            <s:div cssClass="container">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
            </s:div>
        </header>
        
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                <s:div cssClass="cover-container">
                    <h2 class="titulos">Holi Admin</h2>
                </s:div>
            </s:div>  
        </s:div>        
        
        
        <!--footer-->
        <footer class="footer">
            <h3 class="subtitulos"> Gracias por utilizarnos</h3>
        </footer>
    </body>
</html>
