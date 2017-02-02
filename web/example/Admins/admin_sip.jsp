<%-- 
    Document   : admins_sip
    Created on : 2/02/2017, 11:23:23 AM
    Author     : le_as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
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
        <title>Administrador SIP</title>
    </head>
    <body>
        <div id = "parte1">
           <p id="p4">Lista de usuarios SIP activos</p>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="lb" scope="session" class="sesion.LoginBean"></jsp:useBean>
        <%
        ResultSet rs=null;
        lb.getConnection();
        rs=lb.executeQuery("SELECT nom_prof, id_prof FROM usuarios WHERE idTypeUsuario = 'usuario_sip'");
        out.print("<table border='.5px'>");
            while (rs.next())
            {
            out.print("<tr>");
            out.print("<td>");
            out.print(rs.getString("nom_prof"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("id_prof"));
            out.print("</td>");
            out.print("<td>");
            out.print("<a href='Borrar?nom_prof="+rs.getString("nom_prof")+"'>Borrar</a>");
            out.print("</td>");
            out.print("<td>");
            out.print("<a href='/login/Admins/modifica_usip.jsp?id="+rs.getString("nom_prof")+"'>Modificar</a>");
            out.print("</td>");
            }
        out.print("</table>");
        lb.closeConnection();
        %>
        </div>
        <div id="parte2">
        <p id="p3">Registrar nuevo usuario SIP</p>
        <s:set name="u_a" value="%{'SIP'}" />
        <s:set name="periodo" value="%{0}" />
        <s:set name="idTypeUsuario" value="%{'usuario_sip'}" />
        <s:form id="datos3" action="/Usuario/Registra_SIP">
            <s:textfield name="user" label="Nombre de usuario"/>
            <s:textfield name="matricula" label="Matricula"/>
            <s:textfield name="password" label="Contraseña"/>
            <s:hidden name="u_a" label="Dependencia"/>
            <s:hidden name="periodo" label="Periodo"/>
            <s:hidden name="idTypeUsuario" label="Tipo de usuario"/>
            <s:submit name="Registrar Usuario"/>
        </s:form> 
        </div>
    </body>
</html>
