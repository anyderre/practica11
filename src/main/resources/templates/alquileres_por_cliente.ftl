<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

<head>
    <link href="/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><@spring.message "ver_no_devueltos"/></title>
<#include "header.ftl"/>
</head>

<body>

<div id="wrapper">
<#include "nav.ftl" />
        <div id="page-wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header"><@spring.message "buscar_cliente"> </@spring.message></h1>
                </div>
                <!-- /.col-md-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1>
                            <@spring.message "cliente" />
                            </h1>
                        </div>
                        <div class="panel-body">

                            <form action="/alquileres/facturar/" id="form-factura" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div id="page-wrapper">
                                    <div id="page-inner">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="panel panel-default">

                                                    <div class="panel-body">
                                                        <h1>Historial de ${cliente}</h1>
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead>
                                                                <tr>
                                                                    <th>Equipo</th>
                                                                    <th>Fecha</th>
                                                                    <th>Estado</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <#list alquileres as u>
                                                                <tr>
                                                                    <td>${u.equipo.nombre}</td>
                                                                    <td>${u.factura.fecha}</td>
                                                                    <td>
                                                                        <#if u.devuelto>
                                                                            Devuelto
                                                                        <#else>
                                                                            Alquilado
                                                                        </#if>
                                                                    </td>
                                                                </tr>
                                                                </#list>
                                                                </tbody>
                                                            </table>
                                                            <br>
                                                        </div>
                                                    </div>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>


                        </div>

                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->

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
