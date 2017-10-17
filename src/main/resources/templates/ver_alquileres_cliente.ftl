<!DOCTYPE html>
<html x lang="en">

<head>
    <link href="/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><@spring.message "ver_alquiler"/></title>
   <#include "header.ftl"/>
</head>

<body>

<#include "nav.ftl"/>

<div id="wrapper">
    <div id="page-wrapper">
        <h1 class="page-header"><@spring.message "alquiler"> </@spring.message></h1>
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1><@spring.message "ver_alquiler"/></h1>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>
                                        <@spring.message "nombre" />
                                        </th>
                                        <th>
                                        <@spring.message "familia" />
                                        </th>
                                        <th>
                                        <@spring.message "fecha" />
                                        </th>
                                        <th>
                                        <@spring.message "disponible" />
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list alquileres as u>
                                    <tr class="row-click" data-href="/administracion/editar/${u.id}">
                                        <td>${u.equipo.nombre}</td>
                                        <td>${u.equipo.subFamilia.familia.nombre}</td>
                                        <td>${u.factura.fecha}</td>
                                        <td><span id="submit-devolver" value="Devolver" class="btn btn-danger" data-toggle="modal" data-target="#myModal3"><@spring.message "devolver" /></span></td>
                                        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <form action="/alquileres/devolver_equipo/" method="POST">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <div class="panel panel-default">
                                                            <div class="panel-body">
                                                                <label for="nombre">
                                                                    <@spring.message "confirmacion" />
                                                                </label>
                                                                <input type="hidden" value="${u.id}" name="alquiler">
                                                                <input type="hidden" value="${cliente}" name="cedula">

                                                                </select>
                                                                <br>
                                                                <button type="submit" name="action" id="btnCrearUsuario" value="crearUsuario" class="btn btn-primary">
                                                                    <@spring.message "devolver" />
                                                                </button>
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                                    <@spring.message "volver" />
                                                                </button>
                                                            </div>
                                                    </form>

                                                </div>

                                            </div>

                                        </div>

                                    </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
