<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "ver_equipos"> </@spring.message></title>

    <#include "header.ftl"/>

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
                                    <#list equipos as equipo>
                                    <tr class="row-click" data-href="/administracion/editar/${equipo.id}">
                                        <td width="50px">
                                            <#--<a href="alquilar_equipo?id=${equipo.id}&cliente=${cliente}">-->
                                                <img style="width: 150px;height: 100px;" class="img-circle" src="/clientes/${equipo.ruta_imagen}" />
                                            <#--</a>-->
                                        </td>
                                        <td>${equipo.nombre}</td>
                                        <td>${equipo.subFamilia.familia.nombre}</td>
                                        <td>${equipo.subFamilia.nombre}</td>
                                        <td>${equipo.cantidad}</td>
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

<!-- jQuery -->
<script src="/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/dist/js/sb-admin-2.js"></script>

<#--<!-- jQuery (necessary for Bootstrap's JavaScript plugins) &ndash;&gt;-->
<#--<script src="/webjars/jquery/3.1.0/jquery.min.js"></script>-->
<#--<!-- Include all compiled plugins (below), or include individual files as needed &ndash;&gt;-->
<#--<script src="/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>-->


<!-- CUSTOM SCRIPTS -->


</html>