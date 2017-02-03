<%-- 
    Document   : modifica_usip
    Created on : 2/02/2017, 12:46:53 PM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
   background-image: url(guinda.jpg);
}
#ipn {
  width: 200px;
  height: 200px;
  position: relative;
  top: 1em;
}
#cofaa{
	width: 200px;
  height: 200px;
  position: relative;
  top: 1em;
  left: 50em;

}

#datos{
  position: relative;
  top: 10em;
  left: 32em;
}
#p1{
	font-size: 2em;
}

#p2{
  font-size: 1em;
}
#navegador ul{
   list-style-type: none;
   text-align: center;
}
#navegador li{
   display: inline;
   text-align: center;
   margin: 0 10px 0 0;
}
#navegador li a {
   padding: 2px 7px 2px 7px;
   color: #666;
   background-color: #eeeeee;
   border: 1px solid #ccc;
   text-decoration: none;
}
#navegador li a {
   padding: 2px 7px 2px 7px;
   color: #666;
   background-color: #eeeeee;
   border: 1px solid #ccc;
   text-decoration: none;
}
#navegador li a:hover{
   background-color: #333333;
   color: #ffffff;
}

#navegador2 ul{
   list-style-type: none;
   position: relative;
   top: 3em;
   left: 45em;
   
}
#navegador2 li{
   display: inline;
   text-align: center;
   margin: 0 10px 0 0;
}
#navegador2 li a {
   padding: 2px 7px 2px 7px;
   color: #666;
   background-color: #eeeeee;
   border: 1px solid #ccc;
   text-decoration: none;
}

#navegador2 li a:hover{
   background-color: #333333;
   color: #ffffff;
}

#puntaje{
  position: relative;
  top: 5em;
  left: 25em;
}
#puntaje2{
  position: relative;
  top: 4em;
  left: 25em;
}
#navegador3{
    position: relative;
    top: 6em;
    left: 35em;
}
#regresar ul{
   list-style-type: none;
   text-align: center;
   position: relative;
   top: 5em;
   left: 1em;
}
#regresar li{
   display: inline;
   text-align: center;
   margin: 0 10px 0 0;
}
#regresar li a {
   padding: 2px 7px 2px 7px;
   color: #666;
   background-color: #eeeeee;
   border: 1px solid #ccc;
   text-decoration: none;
}

            #datos2{
                position: relative;
                top: 10em;
                left: 50em;
            }
            #datos3{
                position: relative;
                top: 2em;
                left: 2em;
            }
            #p3{
                font-size: 2em;
            }
            #p4{
                font-size: 2em;
            }
            #parte1{
                position: relative;
                top: 6em;
                left: 5em;
            }
            #parte2{
                position: relative;
                top: -2em;
                left: 40em;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar usuarios SIP</title>
    </head>
    <body background="../css/guinda.jpg">
        <img id="ipn" src="../css/ipn.png"/>
        <img id="cofaa" src="../css/cofaa.png"/>
        <p id="p1" align="center">Ingrese los cambios deseados al usuario SIP</p>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"></jsp:useBean>
        <%
        String user=request.getParameter("id");
        HttpSession sesion = request.getSession();
        sesion.setAttribute("id",user);
        ResultSet rs=null;
        lb.getConnection();
        rs=lb.executeQuery("SELECT * FROM usuarios WHERE nom_prof='"+user+"'");
        rs.next();
            String id_user=rs.getString("nom_prof");
            String id_prof=rs.getString("id_prof");
            String id_password=rs.getString("password");
        lb.closeConnection();
        %>
        <div id="parte2">    
        <s:form action="Modifica">
            <s:set var="id_user"><%=id_user%></s:set>
            <s:textfield name="usuario" value="%{#id_user}"/>
            <br>
            <s:set var="id_prof"><%=id_prof%></s:set>
            <s:textfield name="matricula" value="%{#id_prof}" />
            <br>
            <s:set var="id_password"><%=id_password%></s:set>
            <s:textfield name="password" value="%{#id_password}" />
            <br>
            <s:set var="user"><%=user%></s:set>
            <s:hidden name="id" value="%{#user}"/>
            <br>
            <s:submit value="Guardar"/>
        </s:form>
        </div>
    </body>
</html>
