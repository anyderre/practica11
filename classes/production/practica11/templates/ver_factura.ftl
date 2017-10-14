<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">
<head>
    <!-- Bootstrap -->
    <link href="/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet">
    <title>Login Customizado.....</title>
</head>
<body>
<#include "/header.ftl">
<div class="container" id="contenedorCrearUsuario">

    <h1><@spring.message "factura" /></h1>
    <form action="/alquileres/facturar/" id="form-factura"  method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class = "panel panel-default">
            <div class = "panel-body">
                <br/>
                <div class="row">
                   <div class="col-lg-4 col-lg-offset-4">
                       <table class="table-striped table-bordered table">
                           <thead>
                           <tr>

                               <th>Equipo</th>
                               <th>Costo por dia</th>
                               <th>Dias alquilados</th>
                               <th>Sub-total</th>
                           </tr>
                           </thead>
                           <tbody>
                           <#list lista_alquileres as u>
                           <tr>
                               <td>${u.equipo.nombre}</td>
                               <td>$${u.equipo.costoDia}</td>
                               <td>${u.diasAlquilado}</td>
                               <td>$${u.subtotal}</td>
                           </tr>
                           </#list>
                           </tbody>
                       </table>
                       <br>
                       <label style="font-weight: bold">Total: $${lista_alquileres[0].factura.total} </label>
                   </div>
               </div>



                <br>
                <label id="mensaje-validacion" style="color: red"></label><br>
                <a href="/"><span   value="crearUsuario" class="btn btn-primary">Guardar</span></a>

            </div>
        </div>

    </form>
</div>
<script src="/webjars/jquery/3.1.0/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
</body>
</html>