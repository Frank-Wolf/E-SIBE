<%-- 
    Document   : Existe_FeEval
    Created on : Apr 20, 2017, 6:20:16 PM
    Author     : PsysacElrick
--%>

<html>
<!--head-->
    <head>
        <script type="text/javascript">
window.onload = function(){//window.addEventListener('load',function(){...}); (for Netscape) and window.attachEvent('onload',function(){...}); (for IE and Opera) also work
    alert("Solo es posible registrar una fecha para evaluaciones.\n\
         Intente borrar o modificar la que ya existe");
}
</script>
    </head>

<body> 

<jsp:include page="/Admins/Evaluaciones.jsp"></jsp:include>

</body>
</html>
