<!DOCTYPE html>
<html x lang="en" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

<head>
    <link href="/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<#include "adminHeader.ftl">

<div class="container">
    <h1>Usuarios</h1>
    <a href="crear_usuario/"><@spring.message "nuevo" /></a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Username</th>
            <th> <@spring.message "nombre" /></th>
            <th><@spring.message "apellido" /></th>
            <th><@spring.message "rol" /></th>
        </tr>
        </thead>
        <tbody>
        <#list usuarios as u>
        <tr class="row-click" data-href="/administracion/editar/${u.username}">
            <td>${u.username}</td>
            <td>${u.nombre}</td>
            <td>${u.apellido}</td>
            <td>
                <#list u.roles as r>
                    ${r.rol}
                </#list>
            </td>

        </tr>
        </#list>

        </tbody>
    </table>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/webjars/jquery/3.1.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>

</body>





</html>