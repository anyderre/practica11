<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

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
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header"><@spring.message "cliente"> </@spring.message></h1>
                </div>
                <!-- /.col-md-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             <h1>
                                <@spring.message "nuevo_cliente" />
                            </h1>
                        </div>
                        <div class="panel-body">
                           
                            <form action="#" enctype='multipart/form-data' th:action="@{/crear_rol/}" th:object="${cliente}" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "cedula" />:</label>
                                            <input type="text" class="form-control" id="cedula" name="cedula">

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "nombre" />:</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <label for="correo"><@spring.message "apellido" />:</label>
                                            <input type="text" class="form-control" id="apellido" name="apellido">
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "correo" />:</label>
                                            <input type="email" class="form-control" id="email" name="correo">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-6">

                                        <div class="form-group">
                                            <label for="upload-file-input"><@spring.message "foto" />:</label>
                                            <input id="upload-file-input" type="file" name="uploadfile" accept="*" />
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">

                                    <div class="col-md-offset-6 col-md-6">
                                        <div class="form-group">
                                            <button type="submit" name="action" id="btnCrearUsuario" value="crearUsuario" class="form-control btn btn-danger"><@spring.message "crear" /></button>


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
