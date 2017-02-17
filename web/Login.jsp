<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <!--head-->
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> E-SIBE</title>
        
        <link href="<s:url value="css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="css/style.css"/>" 
              rel="stylesheet" type="text/css"/>

        
        
        <link rel="icon" href="<s:url value="icono.ico"/>"/>
    </head>
    
    <body background="css/textura.png" class="container-fluid boding">
        
        <!--header-->
        <header class="headering abso">
            <s:div cssClass="container">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" class="img-responsive"/>
            </s:div>
        </header>
        
        <s:if test="hasActionErrors()">
   <div class="errors">
      <s:actionerror/>
   </div>
</s:if>
        
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
                <s:div cssClass="cover-container">
                    <h2 class="titulos">E-SIBE</h2>
                    <div>
                    <s:div cssClass="" align ="center">
                        <s:form id="datos" action="Usuario/Sesion" method="post"  >
                            <s:textfield name="usuario" label="Matricula" cssClass="form-control" />
                            <s:password  name="pass" label="Contraseña" cssClass="form-control" />
                            <s:submit cssClass="btn" value= "Ingresar"><span></span></s:submit>
                        </s:form>
                    </s:div>
                        </div>  
                    
                    
                </s:div>
            </s:div>  


        <!--footer-->
       
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
        
    </body>
</html>

