<%-- 
    Document   : Evalua_2_1
    Created on : May 1, 2017, 7:16:26 PM
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
                function show_form(x, y) {
                if(x == 1 || x == 2 || x == 3) {
                    if(y == 1){
                        document.getElementById("form1_1").style.display="block";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="none";
                    }
                    else if(y == 2 || y == 3){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="block";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="none";
                    }
                    else if(y== 4 || y == 5){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="block";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="none";
                    }
                    
                }
                else if(x == 4) {
                    if(y == 1){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="block"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="none"; 
                    }
                    else if(y == 2 || y == 3){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="block"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="none";
                    }
                    else if(y == 4 || y == 5){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="block"; 
                        document.getElementById("form3_3").style.display="none";
                    }
                    
                }

                else if(x == 5)  {
                    if(y == 1){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="block";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="none";
                    }
                    else if(y == 2 || y == 3){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="block";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="none";
                    }
                    else if(y == 4 || y == 5){
                        document.getElementById("form1_1").style.display="none";  
                        document.getElementById("form1_2").style.display="none"; 
                        document.getElementById("form1_3").style.display="none";
                        document.getElementById("form2_1").style.display="none";  
                        document.getElementById("form2_2").style.display="none"; 
                        document.getElementById("form2_3").style.display="none";
                        document.getElementById("form3_1").style.display="none";  
                        document.getElementById("form3_2").style.display="none"; 
                        document.getElementById("form3_3").style.display="block";
                    }
                     
                }
            }
        </script>
    </head>
        <%
                            String user=request.getParameter("id");
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("id",user);
                            String user2=request.getParameter("id2");
                            HttpSession sesion2 = request.getSession();
                            sesion2.setAttribute("id",user2);
                            ResultSet rs=null;
                            int n = 0, tipo_pub = 0;
                            lb.getConnection();
                            rs=lb.executeQuery("SELECT * FROM profesor_tiene_pub WHERE "
                            + "id_publicacion='"+user+"'");
                            while(rs.next()){
                                n = rs.getInt("num_autor");
                                tipo_pub = rs.getInt("id_tipo_pub");
                            }
                            lb.closeConnection();
                        %>

    <body background="../css/textura.png" class="boding overflow" onload="show_form('<%=n%>', '<%=tipo_pub%>')">
        
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
                                <li><a href="/Usuario/Menu_evalua">
                                      Regresar</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                

                
                <div class="row container-fluid" >
                        
                        
                    <!-- Tabla donde se muestran los usuarios Activos-->    
                    <div class="col-md-6">
                        <h2 class="h3">Asigne una puntuación y/o comentarios</h2>
                    </div>
                    
                    <div cssClass="" align ="center">

                        <h2 class="h3">Asignar registro</h2>
                        <s:set var="id_actividad"><%=user%></s:set>
                        <s:set var="id_prof"><%=user2%></s:set>
                         <h2 class="h3">Número de participantes para esta publicación: <%=n%></h2>
                        <s:form action="/Usuario/evalua_2_2" id="form1_1">
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
                                      20:20
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form>
                        <s:form action="/Usuario/evalua_2_2" id="form1_2">
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
                                      5:5
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form>
                        <s:form action="/Usuario/evalua_2_2" id="form1_3">
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
                                      4:4
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form>
                        <!--Primera tercia de forms para el primer tipo de publicaciones FIN-->
                        <s:form action="/Usuario/evalua_2_2" id="form2_1">
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
                                      50:50
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form>
                        <s:form action="/Usuario/evalua_2_2" id="form2_2">
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
                                      13:13
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form>
                        <s:form action="/Usuario/evalua_2_2" id="form2_3">
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
                                      10:10
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form>
                        <!--Segunda tercia de forms para el segundo tipo de publicaciones FIN-->
                        
                        <s:form action="/Usuario/evalua_2_2" id="form3_1">
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
                                      150:150
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form> 
                        <s:form action="/Usuario/evalua_2_2" id="form3_2">
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
                                      38:38
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
                            <s:submit cssClass="btn" value="Evaluar" />
                        </s:form>
                        <s:form action="/Usuario/evalua_2_2" id="form3_3">
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
                                      15:15
                                      }"
                                      name="puntaje"
                                      />
                            <s:hidden name="id_actividad"/>
                            <s:hidden name="id_prof" label="hola"/>
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

