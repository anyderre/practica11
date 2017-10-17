<!DOCTYPE html>
<html x lang="en">

<head>
    <link href="/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><@spring.message "ver_alquiler"/></title>
   <#include "header.ftl">

</head>

<body>

<#include "nav.ftl"/>

<div id="wrapper">

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1>
                            <@spring.message "ver_equipos" />
                            </h1>
                        </div>
                        <div class="panel-body">
                            <a href="/alquileres/ver_lista?cliente=${cliente}"><@spring.message "ver_articulos_alquilados"/></a>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
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
                                            <a href="alquilar_equipo?id=${equipo.id}&cliente=${cliente}"><img style="width: 150px;height: 100px;" class="img-circle" src="/clientes/${equipo.ruta_imagen}" /></a>
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

<!-- jQuery -->
<script src="/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/dist/js/sb-admin-2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
<!-- DATA TABLE SCRIPTS -->
<#--<script src="assets/js/dataTables/jquery.dataTables.js"></script>-->
<#--<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>-->
<#--<script>-->
    <#--$(document).ready(function() {-->
        <#--$('#dataTables-example').dataTable();-->
    <#--});-->
<#--</script>-->
<!-- CUSTOM SCRIPTS -->
<#--<script src="assets/js/custom.js"></script>-->

</body>

</html>