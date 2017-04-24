<%-- 
    Document   : test_doc
    Created on : Mar 30, 2017, 8:28:48 PM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
        
    <!--head-->
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title> E-SIBE: Profesor</title>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
       
        <link href="<s:url value="/css/js/captura_actividad_profesor.js"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="/icono.ico"/>"/>
    </head>
    
    <body background="../css/textura.png" class="container-fluid boding overflow">
        
        <!--header-->
        <header class="headering">
            <s:div cssClass="container-fluid">            
                <div class="img-responsive">
                    
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
                </div>
            </s:div>
        </header>
       
       
           
        
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
            <s:div cssClass="site-wrapper-inner">
                
                                    
                <nav class="navbar navbar-default">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" >E-SIBE: Profesor</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Inicio</a></li>
                                <li><a href="apelacion_prof">
                                        Apelación de alguna actividad</a>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Cerrar_sesion">
                                      Cerrar Sesion</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
                <h2 class="titulos">Bienvenido Profesor</h2>
                <s:div cssClass="cover-container2" align="center"> 
             
        <s:set name="username" value="%{#session.username}" />
        <s:form id = "datos" action="upload_file" method="post" enctype="multipart/form-data">
            <s:label for="myFile">Suba su constancia (máximo 10 MB y formato pdf):</s:label>
            
            <s:file name="myFile" />
            <s:hidden name="username" label="Matrícula"/>
            <s:submit value="Subir" cssClass="btn"/>
        </s:form>
                    
                </s:div>
                <s:form id="datos" action="create_pdf" method="post" style="display:none;" >
                    <s:submit value="Generar PDF"/>
                </s:form>
            </s:div>  
        </s:div>        
        
        
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
                    <!-- Scripts para Bootstrap -->
        <script src="../css/js/jquery.js" type="text/javascript"></script>
        <script src="../css/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
