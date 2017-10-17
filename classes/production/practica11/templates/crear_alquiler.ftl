<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

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
                                <@spring.message "alquilar_equipo" />
                            </h1>
                        </div>
                        <div class="panel-body">

                            <form action="/alquileres/alquilar/" id="form-alquiler" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div class="row">
                                    <div class="col-md-6">
                                        <img style="margin-left: 37%; width: 250px; height: 160px" class="img-circle img-responsive" src="/clientes/${equipo.ruta_imagen}" />
                                    </div>
                                    <div class="col-md-4">
                                        <table class="table-striped table-bordered table">
                                            <thead>

                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">
                                                        <@spring.message "nombre" />
                                                    </th>
                                                    <td>${equipo.nombre}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <@spring.message "familia" />
                                                    </th>
                                                    <td>${equipo.subFamilia.familia.nombre}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <@spring.message "sub_familia" />
                                                    </th>
                                                    <td>${equipo.subFamilia.nombre}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <@spring.message "costo" /> por dia</th>
                                                    <td>${equipo.costoDia}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <@spring.message "disponible" />
                                                    </th>
                                                    <td>${equipo.cantidad}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nombre"><@spring.message "nombre" />:</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="fecha"><@spring.message "fecha_devuelta" />:</label>
                                            <input type="date" class="form-control" id="fecha" name="fecha">
                                        </div>
                                    </div>
                                </div>

                                <#--<div class="row">-->
                                <#--&lt;#&ndash;<div class="col-md-6">&ndash;&gt;-->
                                    <#--&lt;#&ndash;<div class="form-group">&ndash;&gt;-->
                                        <#--&lt;#&ndash;<label for="cantidad"><@spring.message "cantidad" />:</label>&ndash;&gt;-->
                                        <#--&lt;#&ndash;<input type="number" class="form-control" id="cantidad" name="cantidad">&ndash;&gt;-->
                                    <#--&lt;#&ndash;</div>&ndash;&gt;-->
                                <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--</div>-->
                                <input type="hidden" id="equipo" name="equipo" value="${equipo.id}">
                                <input type="hidden" name="cliente" value="${cliente}">
                                <hr>
                                <div class="row">
                                    <div class="col-md-offset-6 col-md-5">
                                        <div class="form-group">
                                            <button id="submit-alquiler" value="crearAlquiler" class="btn btn-danger form-control"><@spring.message "alquilar" /></button>
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

</body>

</html>
