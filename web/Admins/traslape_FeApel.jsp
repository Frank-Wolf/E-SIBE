<%-- 
    Document   : traslape_FeApel
    Created on : May 21, 2017, 12:25:17 PM
    Author     : PsysacElrick
--%>

<html>
<!--head-->
    <head>
        <script type="text/javascript">
window.onload = function(){//window.addEventListener('load',function(){...}); (for Netscape) and window.attachEvent('onload',function(){...}); (for IE and Opera) also work
    alert("La fecha de apelaciones ingresada se traslapa con la fecha de evaluaciones. \n\
            Pruebe ingresando otra fecha.");
};
</script>
    </head>

<body> 

<jsp:include page="/Admins/Apelaciones.jsp"></jsp:include>

</body>
</html>
