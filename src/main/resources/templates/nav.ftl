<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">Practica 11</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
                    <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="flot.html">Flot Charts</a>
                        </li>
                        <li>
                            <a href="morris.html">Morris.js Charts</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                </li>
                <li>
                    <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                </li>

                <li>
                    <a href="#"><i class="fa fa-sitemap fa-fw"></i><@spring.message "equipo" /><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/equipos/"><@spring.message "ver_equipos" /></a>
                        </li>
                        <li>
                            <a href="/equipos/crear_equipo/"><@spring.message "crear_equipo" /></a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#"><i class="fa fa-sitemap fa-fw"></i><@spring.message "cliente"> </@spring.message><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/clientes/"><@spring.message "ver_cliente"> </@spring.message></a>
                        </li>
                        <li>
                            <a href="/clientes/crear_cliente/"><@spring.message "crear_cliente"> </@spring.message></a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-files-o fa-fw"></i><@spring.message "familia"> </@spring.message><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/zona_admin/familias/crear_familia/"><@spring.message "crear_familia"> </@spring.message></a>
                        </li>
                        <li>
                            <a href="/zona_admin/familias/"><@spring.message "ver_familia"> </@spring.message></a>
                        </li>

                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-fw"></i><@spring.message "alquilar" /><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/alquileres/ver_graficos/"><@spring.message "graficos" /></a>
                        </li>
                        <li>
                            <a href="/alquileres/redirect/"><@spring.message "crear_alquiler" /></a>
                        </li>
                        <li>
                            <a href="/alquileres/devolver/"><@spring.message "devolver_equipos" /></a>
                        </li>
                        <li>
                            <a href="/alquileres/redirect_alq_clientes/"><@spring.message "alquileres_por_cliente" /></a>
                        </li>
                        <li>
                            <a href="/alquileres/no_devueltos/"><@spring.message "equipos_no_devueltos" /></a>
                        </li>
                    </ul>
                </li>
                <#if isAdmin>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i><@spring.message "usuario" /><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/zona_admin/crear_usuario/"><@spring.message "crear_usuario" /></a>
                            </li>
                            <li>
                                <a href="/zona_admin/"><@spring.message "ver_usuario" /></a>
                            </li>
                        </ul>
                    </li>
                </#if>

            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
