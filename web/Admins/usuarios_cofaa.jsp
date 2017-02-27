<%-- 
    Document   : admin_cofaa
    Created on : 2/02/2017, 11:26:36 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function validatePassword(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers
 
    if (fld.value === "") {
        fld.style.background = 'Yellow';
        error = "You didn't enter a password.\n";
        alert(error);
        return false;
 
    } else if ((fld.value.length < 7) || (fld.value.length > 15)) {
        error = "The password is the wrong length. \n";
        fld.style.background = 'Yellow';
        alert(error);
        return false;
 
    } else if (illegalChars.test(fld.value)) {
        error = "The password contains illegal characters.\n";
        fld.style.background = 'Yellow';
        alert(error);
        return false;
 
    } else if ( (fld.value.search(/[a-zA-Z]+/)==-1) || (fld.value.search(/[0-9]+/)==-1) ) {
        error = "The password must contain at least one numeral.\n";
        fld.style.background = 'Yellow';
        alert(error);
        return false;
 
    } else {
        fld.style.background = 'White';
    }
   return true;
} 
        </script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="<s:url value="/css/bootstrap.css"/>" 
              rel="stylesheet" type="text/css"/>
        
       <script src="<s:url value="../css/js/captura_actividad_profesor.js"/>" 
              type="text/javascript"></script>
        <link href="<s:url value="/css/style.css"/>" 
              rel="stylesheet" type="text/css"/>
        
        <link rel="icon" href="<s:url value="../icono.ico"/>"/>
        <title>Administrador COFAA</title>
    </head>
    <body background="../css/textura.png" class="boding overflow" onload='document.form1.password.focus()'>
        
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
                            <ul class="nav navbar-nav">
                                <li><a href="Menu_COFAA">
                                        Menú Principal</a>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="http://localhost:8084/login/">
                                      Cerrar Sesion</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                

                
                <div class="row container-fluid" >
                    
                    <!-- Formulario para registrar un usuario-->
                    <div class="col-md-6">

                        <h2 class="h3">Registrar nuevo Profesor Evaluador</h2>
                        

                        
                        <s:set name="periodo" value="%{0}" />
                        <s:set name="idTypeUsuario" value="%{'usuario_cofaa'}" />
                        <s:form name="form1" id="datos3" action="Registra_COFAA">
                            <s:textfield name="user" label="Nombre de usuario"/>
                            <s:textfield name="matricula" label="No. de Empleado"/>
                            <s:textfield name="password" label="Contraseña"/>
                            <s:textfield name="u_a" label="Dependencia"/>
                            <s:hidden name="periodo" label="Periodo"/>
                            <s:hidden name="idTypeUsuario" label="Tipo de usuario"/>
                            <s:submit cssClass="btn" value="Registrar Usuario" />
                        </s:form> 
                    </div>
                    
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h2 class="h3">Lista de Profesores Evaluadores activos</h2>
                    
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="lb" scope="session" 
                                     class="sesion.LoginBean"></jsp:useBean>
                        <%
                            ResultSet rs=null;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT nom_prof, "
                                    + "id_prof, u_a FROM usuarios WHERE "
                                    + "idTypeUsuario = 'usuario_cofaa'");
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
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(rs.getString("id_prof"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString("nom_prof"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString("u_a"));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='Borrar_COFAA?nom_prof="
                                        +rs.getString("nom_prof")+"'>Borrar</a>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href='/login/Admins/modifica_cofaa.jsp?id="
                                        +rs.getString("nom_prof")+"'>Modificar</a>");
                                out.print("</td>");
                            }
                            out.print("</table>");
                            lb.closeConnection();
                        %>
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
        
    </body>
    
</html>
