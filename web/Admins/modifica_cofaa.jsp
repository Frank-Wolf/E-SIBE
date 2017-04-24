<%-- 
    Document   : modifica_usip
    Created on : 2/02/2017, 12:46:53 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Inicio administrador COFAA</title>
    </head>
     <body background="../css/textura.png" class="boding overflow">
        
        <!--header-->
        <header class="headering">
            <s:div cssClass="container-fluid">            
                <img src="<s:url value="/banner_IPN.png"/>" alt="IPN" />
            </s:div>
        </header>
        
        <s:div style="align: center;" cssClass="row">
            
                <h2 class="titulos" align="center">
                        Ingrese los cambios deseados al usuario Evaluador</h2>
                    
        
                    <!--jsp:useBean-->
                    <jsp:useBean id="lb" scope="session" 
                                 class="sesion.LoginBean"></jsp:useBean>
                    <%
                    String user=request.getParameter("id");
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("id",user);
                    ResultSet rs=null;
                    lb.getConnection();
                    rs=lb.executeQuery("SELECT * FROM usuario WHERE "
                            + "id_usuario='"+user+"'");
                    rs.next();
                        String id_user=rs.getString("nom_usuario");
                        String id_prof=rs.getString("id_usuario");
                        String id_ua=rs.getString("u_a");
                        String id_password=rs.getString("password");
                    lb.closeConnection();
                    %>

                    <div class="margen" align="center">
                    <s:form action="/Usuario/Modifica_COFAA">
                        <s:set var="id_user"><%=id_user%></s:set>
                        <s:textfield label="Nombre de Usuario" name="usuario" value="%{#id_user}" cssClass="form-control"/>
                        <br>
                        <s:set var="id_prof"><%=id_prof%></s:set>
                        <s:textfield label="No. de Empleado" name="matricula" value="%{#id_prof}" cssClass="form-control" />
                        <br>
                        <s:set var="id_ua"><%=id_ua%></s:set>
                        <s:select label="Seleccione una dependencia" cssClass="form-control"
                            headerKey="1" headerValue="Dependencia"
                            list="# {
                            'ESCOM':'ESCOM',
                            'ESIA - Unidad Ticomán':'ESIA - Unidad Ticomán',
                            'ESFM':'ESFM',
                            'ESIA - Unidad Zacatenco':'ESIA - Unidad Zacatenco',
                            'ESIME - Unidad Azcapotzalco':'ESIME - Unidad Azcapotzalco',
                            'UPIBI':'UPIBI',
                            'ESIME - Unidad Culhuacán':'ESIME - Unidad Culhuacán',
                            'UPIIZ - Campus Zacatecas':'UPIIZ - Campus Zacatecas',
                            'ESIME - Unidad Ticomán':'ESIME - Unidad Ticomán',
                            'UPIICSA':'UPIICSA',
                            'ESIME - Unidad Zacatenco':'ESIME - Unidad Zacatenco',
                            'UPIIG - Campus Guanajuato':'UPIIG - Campus Guanajuato',
                            'ESIQIE':'ESIQIE',
                            'UPIITA':'UPIITA',
                            'ESIT':'ESIT',
                            'ESIA - Unidad Tecamachalco':'ESIA - Unidad Tecamachalco',
                            'CICS - Unidad Milpa Alta':'CICS - Unidad Milpa Alta',
                            
                            'ENMyH':'ENMyH',
                            'CICS - Unidad Santo Tomás':'CICS - Unidad Santo Tomás',
                            'ESEO':'ESEO',
                            'ENCB':'ENCB',
                            'ESM':'ESM',
                            'ESCA - Unidad Santo Tomás':'ESCA - Unidad Santo Tomás',
                            'ESE':'ESE',
                            'ESCA - Unidad Tepepan':'ESCA - Unidad Tepepan',
                            'EST':'EST'
                            }"
                            name="u_a" value="%{#id_ua}"/>
                        
                        <br>
                        <s:set var="id_password"><%=id_password%></s:set>
                        <s:textfield label="Contraseña" name="password" value="%{#id_password}" cssClass="form-control" />
                        <br>
                        <s:set var="user"><%=user%></s:set>
                        <s:hidden name="id" value="%{#user}"/>
                        <br>
                        <s:submit cssClass="btn" value="Guardar"/>
                    </s:form>
                    </div>
        
                
            
        </s:div>
        <!--footer-->
        <footer class="footer abso">
            <p class="subtitulos"> Tresguerras No.27 Esq. Tolsá Col. Centro, C.P. 06040.</p>
            <p class="subtitulos"> Delegación Cuauhtémoc, Ciudad de México.Tel. 57296000 Ext. 65007</p>
        </footer>
                    <!-- Scripts para Bootstrap -->
        <script src="/css/js/jquery.js" type="text/javascript"></script>
        <script src="/css/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>


