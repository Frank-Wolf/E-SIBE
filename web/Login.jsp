<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <!--head-->
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
                        <s:form id="datos" action="Sesion" method="post">
                            <s:textfield name="usuario" label="Usuario" />
                            <s:password  name="pass" label="Contraseña" />
                            <s:submit cssClass="btn" value= "Ingresar"><span>. .</span></s:submit>
                        </s:form>
                    </s:div>
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

