<%-- 
    Document   : Apela_2_2
    Created on : May 8, 2017, 1:17:24 AM
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
        <script type="text/javascript">
                function show_form(x) {
                if(x == 1 || x == 2 || x == 3) {
                    document.getElementById("form1").style.visibility="visible";  
                    document.getElementById("form2").style.visibility="hidden"; 
                    document.getElementById("form3").style.visibility="hidden";
                }

                else if(x == 4) {
                    document.getElementById("form1").style.visibility="hidden";  
                    document.getElementById("form2").style.visibility="visible"; 
                    document.getElementById("form3").style.visibility="hidden"; 
                }

                else if(x == 5)  {
                    document.getElementById("form1").style.visibility="hidden";  
                    document.getElementById("form2").style.visibility="hidden"; 
                    document.getElementById("form3").style.visibility="visible";; 
                }
            }
        </script>
    </head>
    <%
                            String user=request.getParameter("id");
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("id",user);
                            ResultSet rs=null;
                            int n = 0;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT * FROM profesor_tiene_pub WHERE "
                            + "id_publicacion='"+user+"'");
                            while(rs.next()){
                                n++;
                            }
                            //boolean aceptado = rs.getBoolean("aceptado_alumno");
                            //String comentario=rs.getString("comentarios");
                            //Date fecha_evaluar=rs.getDate("fecha_val");
                            //int puntaje=rs.getInt("puntaje_alumno");
                            lb.closeConnection();
                        %>
    <body background="../css/textura.png" class="boding overflow" onload="show_form('<%=n%>')">
        
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
                        <h2 class="h3">Asigne una nueva puntuación y/o comentarios</h2>
                    </div>
                    
                    <div cssClass="" align ="center">

                        <h2 class="h3">Apelar</h2>
                        <s:set var="id_actividad"><%=user%></s:set>
                        <s:set name="username" value="%{#session.username}" />
                        <s:set var="id_actividad"><%=user%></s:set>
                        <s:set name="username" value="%{#session.username}" />
                        <s:form action="/Usuario/apela_2_2" id="form1">
                            <s:select label="Seleccione si es aceptado o no" cssClass="form-control"
                                      headerKey="-1" headerValue="Seleccione"
                                      list="# {
                                      'Aceptado':'Aceptado',
                                      'No aceptado':'No aceptado'
                                      }"
                                      name="aceptado"/>
                            <s:textfield name="comentario" label="Comentarios (máximo 400 letras)" value="%{#comentario}" cssClass="form-control" size="100"/>
                            <s:select label="Asignar puntaje"  cssClass="form-control" 
                                      headerKey="-1" headerValue="Marque puntaje"
                                      list="# {
                                      20:20,
                                      50:50,
                                      150:150
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form> 
                        
                        <s:form action="/Usuario/apela_2_2" id="form2">
                            <s:select label="Seleccione si es aceptado o no" cssClass="form-control"
                                      headerKey="-1" headerValue="Seleccione"
                                      list="# {
                                      'Aceptado':'Aceptado',
                                      'No aceptado':'No aceptado'
                                      }"
                                      name="aceptado"/>
                            <s:textfield name="comentario" label="Comentarios (máximo 400 letras)" value="%{#comentario}" cssClass="form-control" size="100"/>
                            <s:select label="Asignar puntaje"  cssClass="form-control" 
                                      headerKey="-1" headerValue="Marque puntaje"
                                      list="# {
                                      5:5,
                                      13:13,
                                      38:38
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form> 
                        
                        <s:form action="/Usuario/apela_2_2" id="form3">
                            <s:select label="Seleccione si es aceptado o no" cssClass="form-control"
                                      headerKey="-1" headerValue="Seleccione"
                                      list="# {
                                      'Aceptado':'Aceptado',
                                      'No aceptado':'No aceptado'
                                      }"
                                      name="aceptado"/>
                            <s:textfield name="comentario" label="Comentarios (máximo 400 letras)" value="%{#comentario}" cssClass="form-control" size="100"/>
                            <s:select label="Asignar puntaje"  cssClass="form-control" 
                                      headerKey="-1" headerValue="Marque puntaje"
                                      list="# {
                                      4:4,
                                      10:10,
                                      15:15
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

