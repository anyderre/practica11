<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "equipo"> </@spring.message></title>

<#include "header.ftl"/>
</head>

<body>

    <div id="wrapper">
        <!--     -->
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
                                <@spring.message "editar_equipo" />
                            </h1>
                        </div>
                        <div class="panel-body">

                            <form action="#" th:action="@{/editar_equipo}" th:object="${equipo}" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nombre"><@spring.message "nombre" />:</label>
                                            <input type="text" class="form-control" id="nombre" placeholder="Entre nombre equipo" name="nombre" value="${equipo.nombre}">

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "disponible" />:</label>
                                            <input type="text" class="form-control" placeholder="Entre Cantidad Diponible" id="cantidad" name="cantidad" value="${equipo.cantidad}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "costo" />:</label>
                                            <input type="text" class="form-control" id="costoDia" placeholder="Entre Costo Dia" name="costoDia" value="${equipo.costoDia}">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="correo"><@spring.message "familia" />:</label>
                                            <select class="form-control selectpicker" name="familia" id="familia">
                                                        <#list Familias as fa>
                                                            <option value="${fa.id}" <#if equipo.subFamilia.familia.id == su.id>selected</#if> >${su.nombre}</option>
                                                        </#list>
                                                    </select>
                                        </div>
                                    </div>

                                </div>
                                <input type="hidden" name="ruta_imagen" value="${cliente.ruta_imagen}" />

                                <hr>
                                <div class="row">

                                    <div class="col-md-offset-6 col-md-6">
                                        <div class="form-group">
                                            <button type="submit" name="action" id="btnCrearEquipo" value="editarEquipo" class="btn btn-danger form-control"><@spring.message "editar" /></button>

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
        <script src="../assets/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../assets/vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>
        <script src="../dist/js/custom.js"></script>

</body>

</html>
