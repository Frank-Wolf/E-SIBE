<%-- 
    Document   : SIP
    Created on : Feb 8, 2017, 8:07:49 AM
    Author     : PsysacElrick
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %>  
<!DOCTYPE html>
<html>
    <head>
        <sj:head />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        <link href="<s:url value="../css/nav_bar.css"/>" 
              rel="stylesheet" type="text/css"/>
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Inicio administrador COFAA </title>
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
                            <a class="navbar-brand" >E-SIBE: Periodos  de registro de actividades</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="Menu_COFAA">Menu Principal</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>      
                <s:div cssClass="cover-container2">    
                    <h2 class="titulos">Registre las fechas para el registro de las actividades</h2>   
                </s:div>
                <div class="col-md-9" align="center">
                    <s:form action="registra_obra" method="post">
                        
                        <s:textfield name="id_obra" label="Id de la obra" cssClass="form-control"/>
                        <s:textfield name="id_usuario" label="No. Empleado del Autor" cssClass="form-control" />
                        <s:textfield name="nom_obra" label="Título de la obra" cssClass="form-control"/>
                        <s:select label="Seleccione un tipo de Obra" cssClass="form-control"
                            headerKey="-1" headerValue="Tipo de Obra"
                            list="# {
                            '1':'Obra Artística',
                            '2':'Obra Arquitectónica',
                            '3':'Obra Fotográfica',
                            '4':'Manual o apuntes',
                            '5':'Obra Cinematográfica',
                            '6':'Audiovisual o Multimedia',
                            '7':'Programa de radio y televisión',
                            '8':'Diseño Gráfico',
                            '9':'Obras de Compilación',
                            '10':'Edición de libros',
                            '11':'Programa de cómputo',
                            '12':'Material Digital'
                            }"
                            name="id_tipo_obra" />        
                        <sj:datepicker name="fecha_registro" label="Fecha de Registro" displayFormat="dd-mm-yy" cssClass="form-control"/>
                        
                        
                        
                        <s:submit value="Registrar" name="submit" />
                    </s:form> 
                </div>
                    
            </s:div> 
        </s:div>             
                    
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>            
        
        
                    <!-- Scripts para Bootstrap -->
        <script src="css/js/jquery.js" type="text/javascript"></script>
        <script src="css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>


