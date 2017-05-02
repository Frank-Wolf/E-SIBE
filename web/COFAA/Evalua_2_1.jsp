<%-- 
    Document   : Evalua_2_1
    Created on : May 1, 2017, 7:16:26 PM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="lb" scope="session" class="sesion.LoginBean"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="<s:url value="../css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
      
        <link href="<s:url value="../css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Evaluador COFAA</title>
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
                            <a class="navbar-brand letritas" >E-SIBE: Administrador COFAA</a>
                        </div>
                        
                        <div id="navbar" class="navbar-collapse collapse ">

                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Menu_evalua">
                                      Regresar</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                

                
                <div class="row container-fluid" >
                        
                        
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h2 class="h3">Asigne una puntuación y/o comentarios</h2>

                        <%
                            String user=request.getParameter("id");
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("id",user);
                            ResultSet rs=null;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT * FROM profesor_tiene_proyecto WHERE "
                            + "id_alumno='"+user+"'");
                            rs.next();
                            boolean aceptado = rs.getBoolean("aceptado_alumno");
                            String comentario=rs.getString("comentarios");
                            Date Fecha_evaluar=rs.getDate("fecha_val");
                            int puntaje=rs.getInt("puntaje_alumno");
                            lb.closeConnection();
                        %>
                    </div>
                    
                    <div class="col-md-6">

                        <h2 class="h3">Asignar registro</h2>
                        

                        
                        
                        <s:set name="idTypeUsuario" value="%{6}" />
                        <s:form name="form1" id="datos3" action="Registra_COFAA">
                            <s:textfield name="user" label="Nombre de usuario" cssClass="form-control"/>
                            <s:textfield name="matricula" label="No. de Empleado" cssClass="form-control"/>
                            <s:textfield name="password" label="Contraseña" cssClass="form-control"/>
                            <s:textfield name='email' label="Correo electrónico" cssClass="form-control"/>
                            <s:select label="Seleccione una dependencia" cssClass="form-control"
                            headerKey="-1" headerValue="Dependencia"
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
                            name="u_a" />
                            <s:hidden name="idTypeUsuario" label="Tipo de usuario"/>
                            <s:hidden name="counter" label="Número de usuarios registrados"/>
                            <s:submit cssClass="btn" value="Registrar Usuario" />
                        </s:form> 
                    </div>
                        
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
         <script src="<s:url value="../css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
    </body>
    
</html>

