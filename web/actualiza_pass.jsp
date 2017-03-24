<%-- 
    Document   : reset_password
    Created on : Mar 23, 2017, 7:42:09 PM
    Author     : PsysacElrick
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>

<html>
    <!--head-->
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> E-SIBE</title>
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="/css/style.css"/>" 
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
        
        
        <!--Conteneor general-->    
        <s:div cssClass="contenedor-general">
                <s:div cssClass="cover-container">
                    <h2 class="titulos">E-SIBE</h2>
                    <div>
                    <s:div cssClass="" align ="center">
                        <%                           
                            ValueStack stack = ActionContext.getContext().getValueStack();
                            String i = request.getParameter("token");
                            stack.getContext().put("varName", i);
                            stack.setValue("#attr['varName']", i, false);
                        %>
                        <p>Restaure la contraseña</p>
                        <s:set name="token" value="#varName"/>
                        <s:form id="datos" action="/Usuario/Reset_pass" method="post">
                            <s:password name="password" label="Nueva contraseña" cssClass="form-control" style="width: 100%;"/>
                            <s:password name="password2" label="Ingrese nuevamente la contraseña" cssClass="form-control" style="width: 100%;"/>
                            <s:hidden name="token" label="Token temporal"/>
                            <s:submit cssClass="btn" value= "Cambiar contraseña"><span></span></s:submit>
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
