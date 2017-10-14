<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "editar_familia"> </@spring.message></title>

   <#include "header.ftl">
</head>

<body>

    <div id="wrapper">
        <#--<#include "AdminHeader.ftl">&ndash;&gt;-->
        <#include "nav.ftl"/>


        <div id="page-wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                    <@spring.message "familia"> </@spring.message>
                    </h1>
                </div>
                <!-- /.col-md-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1>
                                <@spring.message "editar_familia" />
                            </h1>
                        </div>
                        <div class="panel-body">

                            <h4>
                                <@spring.message "sub_familias" /> ${familia.nombre}:</h4>
                            <div class="list-group">
                                <#list sub_familias as subfamilia>
                                    <li class="list-group-item">${subfamilia.nombre}</li>
                                </#list>
                            </div>

                            <!-- Button trigger modal -->
                            <div class="row">
                                <div class="col-md-offset-8 col-md-4">
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                        <@spring.message "nueva_subfamilia" />
                        </button>
                                </div>
                            </div>
                            <div class="modal fade" data-backdrop="false" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form action="#" th:action="@{/familias/editar_familia}" method="POST">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <label for="nombre"><@spring.message "nombre" />:</label>
                                                    <input type="text" class="form-control" id="familia" name="nombre">
                                                    <input type="hidden" name="familia_id" value="${familia.id}" />
                                                    <br>
                                                    <button type="submit" name="action" id="btnCrearUsuario" value="crearUsuario" class="btn btn-primary"><@spring.message "agregar" /></button>

                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal -->

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
