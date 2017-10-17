<!DOCTYPE html>
<html x lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "crear_cliente"> </@spring.message></title>

<#include "header.ftl">

</head>

<body>

<div id="wrapper">
<#--<!--        <#include "header.ftl"/>&ndash;&gt;-->
<#include "nav.ftl"/>

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1><@spring.message "clientes" /></h1>
                        </div>
                        <div class="panel-body">
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
                                        <@spring.message "apellido" />
                                        </th>
                                        <th>
                                        <@spring.message "cedula" />
                                        </th>
                                        <th>
                                        <@spring.message "correo" />
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <a href="crear_cliente/">
                                    <@spring.message "nuevo" />
                                    </a>
                                    <#list clientes as u>
                                    <tr class="row-click" data-href="/administracion/editar/${u.cedula}">
                                        <td width="50px">
                                            <a href="editar_cliente?cedula=${u.cedula}"><img style="width: 150px;height: 100px;" class="img-circle" src="/clientes/${u.ruta_imagen}" /></a>
                                        </td>
                                        <td>${u.nombre}</td>
                                        <td>${u.apellido}</td>
                                        <td>${u.cedula}</td>
                                        <td>${u.correo}</td>

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
<script src="/dist/js/subFamilia.js"></script>
<script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- CUSTOM SCRIPTS -->


</body>

</html>
