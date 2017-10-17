<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "crear_factura"> </@spring.message></title>

<#include "header.ftl">

</head>

<body>

    <div id="wrapper">
        <#--<!--        <#include "header.ftl"/>&ndash;&gt;-->
        <#include "nav.ftl"/>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header"><@spring.message "factura"> </@spring.message></h1>
                </div>
                <!-- /.col-md-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1>
                                <@spring.message "despachar_alquileres" />
                            </h1>
                        </div>
                        <div class="panel-body">
                            <form action="/alquileres/facturar/" id="form-factura" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4">
                                        <table class="table-striped table-bordered table">
                                            <thead>
                                                <tr>
                                                    <th>Equipo</th>
                                                    <th>Costo por dia</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list lista as l>
                                                    <tr>
                                                        <td>${l.equipo.nombre}</td>
                                                        <td>$${l.equipo.costoDia}</td>
                                                    </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <hr>
                                <input type="hidden" name="cliente" value="${cliente}">
                                    <div class="row">

                                        <div class="col-md-offset-6 col-md-6">

                                            <div class="form-group">
                                                <label id="mensaje-validacion" style="color: red"></label><br>
                                                <button type="submit" id="submit-alquiler" value="crearUsuario" class="btn btn-danger form-control"><@spring.message "despachar" /></button>

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
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
            <!-- Latest compiled and minified JavaScript -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

</body>

</html>
