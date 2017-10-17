<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><@spring.message "ver_factura"/></title>
<#include "header.ftl">
</head>
<body>

<div class="container">

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

                <hr>
                <div class="row">
                    <div class="col-md-offset-7 col-md-6">
                        <label id="mensaje-validacion" style="color: red"></label><br>
                        <a href="/"><span   value="crearUsuario" class="btn btn-danger"><@spring.message "guardar"/></span></a>
                    </div>
                </div>


            </div>
        </div>

    </form>
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/dist/js/sb-admin-2.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>


</body>
</html>