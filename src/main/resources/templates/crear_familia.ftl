<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><@spring.message "crear_familia"></@spring.message></title>

<#include "header.ftl">
</head>

<body>

    <div id="wrapper">
        <#--<!--        <#include "header.ftl"/>&ndash;&gt;-->
        <#--<!--        <#include "AdminHeader.ftl"/>&ndash;&gt;-->
        <#include "nav.ftl"/>


        <div id="page-wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header"><@spring.message "familia"> </@spring.message></h1>
                </div>
                <!-- /.col-md-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1>
                                <@spring.message "crear_familia" />
                            </h1>
                        </div>
                        <div class="panel-body">

                            <form action="#" enctype='multipart/form-data' th:action="@{/familias/crear_familia/}" th:object="${familia}" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nombre"><@spring.message "nombre" /></label>
                                            <input type="text" class="form-control" id="familia" name="nombre">

                                        </div>
                                    </div>

                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-offset-6 col-md-6">
                                        <div class="form-group">
                                            <button type="submit" name="action" id="btnCrearUsuario" value="crearUsuario" class="btn btn-danger form-control"><@spring.message "crear" /></button>

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
