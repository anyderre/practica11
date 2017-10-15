<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "crear_equipo"> </@spring.message></title>

    <#include "header.ftl"/>

<#--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <#--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>-->
    <#--<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>-->




    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <#--<!-- Bootstrap Core JavaScript &ndash;&gt;-->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/dist/js/sb-admin-2.js"></script>
    <script src="/dist/js/subFamilia.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">


<#--<script type="text/javascript">-->

    <#--$(document).ready(function () {-->
        <#--$('#example').dataTable({-->

        <#--});-->
    <#--});-->

<#--</script>-->

</head>

<body>


<div id="wrapper">
<#include "nav.ftl"/>

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Ver equipos
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table id="example" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>
                                        <@spring.message "foto" />
                                        </th>
                                        <th>
                                        <@spring.message "nombre" />
                                        </th>
                                        <th>
                                        <@spring.message "familia" />
                                        </th>
                                        <th>
                                        <@spring.message "sub_familia" />
                                        </th>
                                        <th>
                                        <@spring.message "disponible" />
                                        </th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <#list equipos as u>
                                    <tr class="row-click" data-href="/administracion/editar/${u.id}">
                                        <td width="50px">
                                            <#--<a href="alquilar_equipo?id=${u.id}&cliente=${cliente}"><img style="width: 150px;height: 100px;" class="img-circle" src="/archivos/${u.ruta_imagen}" /></a>-->
                                        </td>
                                        <td>${u.nombre}</td>
                                        <td>${u.subFamilia.familia.nombre}</td>
                                        <td>${u.subFamilia.nombre}</td>
                                        <td>${u.cantidad}</td>
                                    </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>



</body>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/webjars/jquery/3.1.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>


<!-- CUSTOM SCRIPTS -->


</html>