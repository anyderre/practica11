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

<#include "header.ftl">

</head>

<body>

<div id="wrapper">
<#--<!--        <#include "header.ftl"/>&ndash;&gt;-->
<#include "nav.ftl"/>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header"><@spring.message "equipo"> </@spring.message></h1>
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1>
                        <@spring.message "nuevo_equipo" />
                        </h1>
                    </div>
                    <div class="panel-body">

                        <form action="#" enctype='multipart/form-data' th:action="@{/crear_equipo/}"
                              th:object="${equipo}" method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nombre"><@spring.message "nombre" />:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">

                                        <label for="cantidad"><@spring.message "disponible" />:</label>
                                        <input type="text" class="form-control" id="cantidad" name="cantidad">
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="costo"><@spring.message "costo" />:</label>
                                        <input type="text" class="form-control" id="costoDia" name="costoDia">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="correo"><@spring.message "sub_familia" />:</label>
                                                <select name="sub-familia" class="form-control" id="sub-familia">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">

                                            <div class="form-group">
                                                <label for="upload-file-input"><@spring.message "foto" />:</label>
                                                <input id="upload-file-input" type="file" name="uploadfile" accept="*"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="familia"><@spring.message "familia" />:</label>
                                        <select class="form-control selectpicker" id="familia">
                                        <#if familias??>
                                            <#list familias as familia>
                                                <option value="${familia.id}">${familia.nombre}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <hr>
                            <div class="row">
                            </div>

                            <div class="row">


                                <div class="col-md-offset-6 col-md-6">
                                    <div class="form-group">
                                        <button type="submit" name="action" id="btnCrearEquipo" value="crearEquipo"
                                                class="form-control btn btn-danger"><@spring.message "crear" /></button>
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
    <script src="/dist/js/subFamilia.js"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>


</body>

</html>
