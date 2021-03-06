<%-- 
    Document   : admin_cofaa
    Created on : 2/02/2017, 11:26:36 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
        <title>Administrador COFAA</title>
    </head>
    <body background="../css/textura.png" class="boding ">
        
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
                            <ul class="nav navbar-nav">
                                <li><a href="Menu_COFAA">
                                        Menú Principal</a>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Cerrar_sesion">
                                      Cerrar Sesion</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                

                
                <div class="row container-fluid" >
                        
                        
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h2 class="h3">Lista de Profesores Evaluadores activos</h2>
                    
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            int i = 0;
                            rs=lb.executeQuery("SELECT nom_usuario, "
                                    + "id_usuario, u_a FROM usuario WHERE "
                                    + "id_type_usuario = 6");
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>");
                            out.print("  No. de Empleado  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Nombre de Usuario  ");
                            out.print("</th>");
                            out.print("<th>");
                            out.print(  "Unidad Académica  ");
                            out.print("</th>");
                            out.print("</tr>");
                            while (rs.next())
                            {
                                i++;
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs.getString("id_usuario"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString("nom_usuario"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString("u_a"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='Borrar_COFAA?id_usuario="
                                        +rs.getString("id_usuario")+"'>Borrar</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Admins/modifica_cofaa.jsp?id="
                                        +rs.getString("id_usuario")+"'>Modificar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>
                    </div>
                    
                    <div class="col-md-6">

                        <h2 class="h3">Registrar nuevo Profesor Evaluador</h2>
                        

                        <s:set name="counter" value="#varName"/>
                        
                        <s:set name="idTypeUsuario" value="%{6}" />
                        <s:form name="form1" id="datos3" action="Registra_COFAA">
                            <s:textfield name="user" label="Nombre de usuario" cssClass="form-control"/>
                            <s:textfield name="matricula" label="No. de Empleado" cssClass="form-control" maxlength="8" pattern="([0-9]{8})" type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"/>
                            <s:textfield name="password" label="Contraseña" cssClass="form-control" maxlength="15" minlength="7"/>
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
        <footer class="footer ">
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
