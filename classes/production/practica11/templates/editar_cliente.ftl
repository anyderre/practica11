<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Crear Alquiler</title>

<#include "header.ftl"/>
</head>

<body>

    <div id="wrapper">
        <#--<!--        <#include "header.ftl"/>&ndash;&gt;-->
        <#include "nav.ftl"/>


        <div id="page-wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">Cliente</h1>
                </div>
                <!-- /.col-md-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1>
                                <@spring.message "editar_cliente" />
                            </h1>
                        </div>
                        <div class="panel-body">

                            <form th:action="@{/editar_cliente}" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" th:object="${cliente}" value="${_csrf.token}" />

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "nombre" />:</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" value=${cliente.nombre}>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <label for="correo"><@spring.message "apellido" />:</label>
                                            <input type="text" class="form-control" id="apellido" name="apellido" value="${cliente.apellido}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "correo" />:</label>
                                            <input type="email" class="form-control" id="email" name="correo" value="${cliente.correo}">
                                        </div>
                                    </div>

                                </div>
                                <input type="hidden" name="ruta_imagen" value="${cliente.ruta_imagen}" />
                                <hr>
                                <div class="row">

                                    <div class="col-md-offset-6 col-md-6">
                                        <div class="form-group">
                                            <button type="submit" name="action" id="btnCrearUsuario" value="crearUsuario" class="btn btn-danger form-control"><@spring.message "editar" /></button>

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
        <script src="/dist/js/custom.js"></script>

</body>

</html>
