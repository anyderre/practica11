<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "crear_alquiler"> </@spring.message></title>
<#include "header.ftl">
</head>
<body>

<div id="wrapper">
<#--<!--        <#include "AdminHeader.ftl"/>&ndash;&gt;-->
<#include "nav.ftl"/>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header"><@spring.message "alquilar"> </@spring.message></h1>
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1>
                            <h1><@spring.message "equipos_no_devueltos" /></h1>

                        </h1>
                    </div>
                    <div class="panel-body">

                        <form action="/alquileres/facturar/" id="form-factura"  method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <div class = "panel panel-default">
                                <div class = "panel-body">
                                    <br/>
                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3">
                                            <table class="table-striped table-bordered table">
                                                <thead>
                                                <tr>

                                                    <th>Equipo</th>
                                                    <th>Cliente</th>
                                                    <th>Dias alquilados</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <#list alquileres as alquiler>
                                                <tr>
                                                    <td>${alquiler.equipo.nombre}</td>
                                                    <td>${alquiler.factura.cliente.nombre} ${alquiler.factura.cliente.apellido}</td>
                                                    <td>${alquiler.calculoDias}</td>
                                                </tr>
                                                </#list>
                                                </tbody>
                                            </table>
                                            <br>
                                        </div>
                                    </div>



                                    <br>
                                    <label id="mensaje-validacion" style="color: red"></label><br>

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

</body>
</html>