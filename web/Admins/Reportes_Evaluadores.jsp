<%-- 
    Document   : Reportes_Evaluadores
    Created on : 22/05/2017, 02:07:52 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        
        
        
        
        <title>Inicio administrador COFAA </title>
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
                            <a class="navbar-brand" >E-SIBE: Administrador COFAA</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Menu_COFAA">
                                      Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                
REPORTES
                
                 <div class="cover-container2 ">    
                    <div class="container">
                        
                        <div align="center">
                            <s:form id="datos" action="create_pdf_admin" method="post" style="display:block;">
                                <s:submit value="Generar reporte de periodo de beca por exclusividad" cssClass="btn"/>
                            </s:form> 
                        </div>
                            
                    </div> 
                </div> 
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    
            </s:div>  
        </s:div>        

        
        <!--footer-->
        <footer class="footer">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
        
                                    <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script> 
    <script type="text/javascript"
     src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
    
</html>
