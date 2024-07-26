<%--
  Created by IntelliJ IDEA.
  User: Rafael
  Date: 26/07/2024
  Time: 02:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<input type="hidden" id="status" value="<%= session.getAttribute("status")%>">
<h1 style="font-size: 3em; color: white;">Bem Vindo!</h1>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    var status = document.getElementById("status").value;
    if(status === "logado"){
        Swal.fire({
            icon: 'success',
            title: 'logado!',
            text: 'Login efetuado com sucesso!',
            confirmButtonText: 'OK',
        });
    }
</script>
</body>
</html>
