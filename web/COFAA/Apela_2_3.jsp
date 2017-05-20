<%-- 
    Document   : Apela_2_3
    Created on : May 8, 2017, 1:17:35 AM
    Author     : PsysacElrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.sql.*" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %> 
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
                            int n = 0;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT * FROM profesor_participa_ev WHERE "
                            + "id_evento='"+user+"'");
                            while(rs.next()){
                                n++;
                            }
                            //boolean aceptado = rs.getBoolean("aceptado_alumno");
                            //String comentario=rs.getString("comentarios");
                            //Date fecha_evaluar=rs.getDate("fecha_val");
                            //int puntaje=rs.getInt("puntaje_alumno");
                            lb.closeConnection();
                        %>
                    </div>
                    
                    <div cssClass="" align ="center">

                        <h2 class="h3">Apelar</h2>
                        <s:set var="numero_autores"><%=n%></s:set>
                        <h2 class="h3">Número de autores para esta obra: <%=n%></h2>
                        <s:set var="id_actividad"><%=user%></s:set>
                        <s:form action="/Usuario/apela_2_3">
                            <s:select label="Seleccione si es aceptado o no" cssClass="form-control"
                                      headerKey="-1" headerValue="Seleccione"
                                      list="# {
                                      'Aceptado':'Aceptado',
                                      'No aceptado':'No aceptado'
                                      }"
                                      name="aceptado"/>
                            <s:textfield name="comentario" label="Comentarios (máximo 400 letras)" cssClass="form-control" size="100"/>
                            <s:select label="Asignar puntaje"  cssClass="form-control" 
                                      headerKey="-1" headerValue="Marque puntaje"
                                      list="# {
                                      0:0,
                                      1:1,
                                      2:2,
                                      3:3,
                                      4:4,
                                      5:5,
                                      6:6,
                                      7:7,
                                      8:8,
                                      9:9,
                                      10:10,
                                      11:11,
                                      12:12,
                                      13:13,
                                      14:14,
                                      15:15,
                                      16:16,
                                      17:17,
                                      18:18,
                                      19:19,
                                      20:20
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:submit cssClass="btn" value="Evaluar" />
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

