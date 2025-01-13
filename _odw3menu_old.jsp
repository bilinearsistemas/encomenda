<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" />
<jsp:directive.page import="bdo.srv.cfg.CfgAppCust" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>
        BI - Linear 
    </title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- Favicon -->
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="odw3/static/images/favicon/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="odw3/static/images/favicon/apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="odw3/static/images/favicon/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="odw3/static/images/favicon/apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="60x60" href="odw3/static/images/favicon/apple-touch-icon-60x60.png" />
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="odw3/static/images/favicon/apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="odw3/static/images/favicon/apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="odw3/static/images/favicon/apple-touch-icon-152x152.png" />
    <link rel="icon" type="image/png" href="odw3/static/images/favicon/favicon-196x196.png" sizes="196x196" />
    <link rel="icon" type="image/png" href="odw3/static/images/favicon/favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/png" href="odw3/static/images/favicon/favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="odw3/static/images/favicon/favicon-16x16.png" sizes="16x16" />
    <link rel="icon" type="image/png" href="odw3/static/images/favicon/favicon-128.png" sizes="128x128" />
    <meta name="application-name" content="&nbsp;" />
    <meta name="msapplication-TileColor" content="#" />
    <meta name="msapplication-TileImage" content="odw3/static/images/favicon/mstile-144x144.png" />
    <meta name="msapplication-square70x70logo" content="odw3/static/images/favicon/mstile-70x70.png" />
    <meta name="msapplication-square150x150logo" content="odw3/static/images/favicon/mstile-150x150.png" />
    <meta name="msapplication-wide310x150logo" content="odw3/static/images/favicon/mstile-310x150.png" />
    <meta name="msapplication-square310x310logo" content="odw3/static/images/favicon/mstile-310x310.png" />

    <!-- Clear -->
    <link rel="stylesheet" type="text/css" href="odw3/clear/css/custom.css">
    <link rel="stylesheet" type="text/css" href="odw3/clear/css/app.css">

    <!-- Metis Menu -->
    <link rel="stylesheet" type="text/css" href="odw3/clear/css/custom_css/metisMenu.css">

    <!-- Roboto -->
    <link rel="stylesheet" type="text/css" href="odw3/static/fonts/roboto/roboto.css">

    <!-- SweetAlert2 -->
    <link rel="stylesheet" type="text/css" href="js/sweetalert2-7.0.3/sweetalert2.min.css"/>
    <link rel="stylesheet" type="text/css" href="odw3/app/defaults/sweet_alert2.css">

    <!-- Toastr -->
    <link rel="stylesheet" type="text/css" href="js/toastr-2.1.3/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="odw3/clear/css/custom_css/toastr_notificatons.css">

    <!-- Awesomplete -->
    <link rel="stylesheet" type="text/css" href="js/awesomplete-1.1.1/awesomplete.css">
    <style>
        .awesomplete {
            width: calc(100% - 15px);
        }
        .awesomplete > ul {
            min-width: 137%;
        }
        .awesomplete > ul > li {
            border-bottom-style: ridge;
            border-width: 1px;
        }
    </style>

    <!-- Selectize -->
    <link rel="stylesheet" type="text/css" href="js/selectize-0.12.4/css/selectize.bootstrap3.css">

    <!-- ODW Form -->
    <link rel="stylesheet" type="text/css" href="js/odw-form/v1.0.4/css/main.css">

    <!-- Custom -->
	<link rel="stylesheet" type="text/css" href="odw3/app/defaults/index.css">
    <link rel="stylesheet" type="text/css" href="odw3/app/defaults/sweet_alert2.css">
    <link rel="stylesheet" type="text/css" href="odw3/app/_odw3menu/index.css">
</head>

<body class="skin-default">
    <div class="preloader">
        <div class="loader_img">
            <img src="odw3/static/images/loader/clear-loader.gif" alt="loading..." height="64" width="64">
        </div>
    </div>

    <!-- header logo: style can be found in header-->
    <header id="header" class="header">
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="logo">
                <img src="images/logo_icon_view.png" alt="logo" style="height: 30px;"/>
            </a>
            <!-- Header Navbar: style can be found in header-->
            <!-- Sidebar toggle button-->
            <div>
                <a class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button" data-toggle-extra="tooltip" data-tooltip="tooltip" data-placement="bottom" data-original-title="Menu">
                    <i class="fa fa-fw ti-menu"></i>
                </a>
            </div>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <!--rightside toggle-->
                    <!-- <li>
                        <a href="#" @click="openURL('odw3/_odw3meusfavoritos.jsp', 'Meus Favoritos')" class="dropdown-toggle" data-toggle-extra="tooltip" data-tooltip="tooltip" data-placement="bottom" data-original-title="Favoritos">
                            <i class="fa fa-fw ti-layout-grid2-alt black"></i>
                        </a>
                    </li> -->
                    <li>
                        <a href="#" @click="saveVisaoInicial()" class="dropdown-toggle" data-toggle-extra="tooltip" data-tooltip="tooltip" data-placement="bottom" data-original-title="Salvar como visão inicial">
                            <i class="fa fa-fw ti-save-alt black"></i>
                        </a>
                    </li>
                    <!-- Execuções -->
                    <li class="dropdown messages-menu tooltips" v-event:show.bs.dropdown="getUltimasExecucoes">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" data-toggle-extra="tooltip" data-tooltip="tooltip" data-placement="bottom" data-original-title="Execuções realizadas">
                            <i class="fa fa-fw ti-settings black"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-messages table-striped">
                            <li class="dropdown-title">Execuções</li>
                            <li v-for="execucao in execucoes">
                                <a href="#" @click="openExecucao(execucao)" class="message striped-col">
                                    <div class="message-body"><strong>{{execucao.tarefa.descTarefa}}</strong>
                                        <br> {{execucao | tarefaExecucaoData}}
                                        <br>
                                        <small>{{execucao.tipoResultadoDesc}}</small>
                                    </div>
                                </a>
                            </li>
                            <li class="dropdown-footer"><a href="#" @click="openURL('odw3/_odw3minhasexecucoes.jsp', 'Minhas Execuções')">Visualizar Todas</a></li>
                        </ul>
                    </li>
                    <!-- Notificações -->
                    <li class="dropdown messages-menu" v-event:show.bs.dropdown="getUltimasNotificacoes" v-event:hide.bs.dropdown="getPreferencias">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" data-toggle-extra="tooltip" data-tooltip="tooltip" data-placement="bottom" data-original-title="Notificações recebidas">
                            <i class="fa fa-fw ti-email black"></i>
                            <span v-show="numNovasNotificacoes > 0" class="label label-success">{{numNovasNotificacoes}}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages table-striped">
                            <li class="dropdown-title">Notificações</li>
                            <li v-for="notificacao in notificacoes">
                                <a href="#" @click="openNotificacao(notificacao)" class="message striped-col">
                                    <div class="message-body"><strong>{{notificacao.tarefaExecucao.tarefa.descTarefa}}</strong>
                                        <br> {{ notificacao.tarefaExecucao | tarefaExecucaoData }}
                                        <br>
                                        <small>{{notificacao.destino}}</small>
                                        <span class="label label-success label-mini msg-lable">{{notificacao.tarefaExecucao | tarefaExecucaoNova((preferencias))}}</span>
                                    </div>
                                </a>
                            </li>
                            <li class="dropdown-footer"><a href="#" @click="openURL('odw3/_odw3minhasnotificacoes.jsp', 'Minhas Notificações')">Visualizar Todas</a></li>
                        </ul>
                    </li>
                    <!-- User Account: style can be found in dropdown-->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle padding-user" data-toggle="dropdown">
                            <img src="odw3/app/_odw3menu/user.png" width="35" class="img-circle img-responsive pull-left" height="35" alt="User Image">
                            <div class="riot">
                                <div>
                                    <span>{{preferencias.usuario.usuario}}</span>
                                    <span><i class="caret"></i></span>
                                </div>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="odw3/app/_odw3menu/user.png" class="img-circle" alt="User Image">
                                <p>{{preferencias.usuario.nomeUsuario}}</p>
                            </li>
                            <!-- Menu Body -->
                            <li class="p-t-3"><a href="#" @click="openURL('odwctrl?action=updatePwd', 'Alterar Senha')"> <i class="fa fa-fw ti-user"></i> Alterar Senha </a>
                            </li>
                            <li role="presentation" class="divider"></li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="odwctrl?action=logout">
                                        <i class="fa fa-fw ti-shift-left"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <aside id="sidebar-left" class="left-side sidebar-offcanvas">
            <!-- sidebar: style can be found in sidebar-->
            <section class="sidebar">
                <div id="menu" role="navigation">
                    <div class="option-search">
                        <div class="search-wrapper">
                            <input id="search" type="text" placeholder="Executar..." v-on:keyup.enter="openSearch"><i class="ti-search"></i>
                        </div>
                    </div>
                    <ul class="navigation">
                        <li v-for="processo in menuTarefas()" class="menu-dropdown">
                            <a href="#" @click="open(processo.tarefas[0])" draggable="true" data-toggle="offcanvas" @dragstart="dragStart(processo.tarefas[0], $event)">
                                <i class="menu-icon ti-folder"></i>
                                <span>{{processo.descProcesso}}</span>
                                <span class="fa arrow">{{processo.obs}}</span>
                            </a>
                            <!--ul class="sub-menu">
                                <li v-for="tarefa in processo.tarefas">
                                    <a href="#" @click="open(tarefa)" draggable="true" @dragstart="dragStart(tarefa, $event)">
                                        <span>{{tarefa.descTarefa}}</span>
                                        <i class="fa fa-fw ti-new-window clickable pull-right" @click.stop="openNewBrowserTab(tarefa)"></i> 
                                    </a>
                                </li>
                            </ul -->
                        </li>
                    </ul>
                </div>
                <!-- / .navigation -->
            </section>
            <!-- menu -->
        </aside>
        <!-- /.sidebar -->

        <aside id="content" class="right-side">
            <!-- Nav tabs -->
            <section class="content-header">
                <div class="header-element">
                    <ul class="nav nav-tabs" role="tablist" v-sortable>
                        <li v-if="tabs[i]" v-for="(i, index) in indexes" :class="{ active: tabs[i] === active }" 
                            :data-index="i" :data-tipo-item="tabs[i].tipoItem" :data-id-item="tabs[i].idItem" :data-titulo="tabs[i].title">
                            <a href="#" @click.stop="setActive(tabs[i])">
                                <span>{{tabs[i].title}}</span>
                                <span class="pull-right">
                                    <i class="fa fa-fw ti-close clickable" v-on:click.stop="close(i)">zzz</i>
                                </span>
                                <span class="pull-right">
                                    <i class="fa fa-fw ti-reload clickable" v-on:click.stop="reload(i)"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </section>
            <section class="content">
                <!--main content-->
                <div class="tab-content">
                    <div v-for="(tab, key, index) in tabs" v-if="tab" class="panel tab-pane" :class="{ active: tab === active }">
                        <iframe v-if="tab && tab.tarefa" width="0" height="0" :src="'odwctrl?embedded=true&action=getParameters&idTarefa=' + tab.tarefa.idTarefa + '&v=' + tab.v"
                            frameborder="0" allowFullScreen="true"></iframe>
                        <!--<iframe v-if="tab && tab.notificacao" width="0" height="0" :src="'CntServlet?id=' + tab.notificacao.tarefaExecucao.idTarefaExecucao + '&hash=' + tab.notificacao.tarefaExecucao.hash + '&v=' + tab.v"
                            frameborder="0" allowFullScreen="true"></iframe>
                        <iframe v-if="tab && tab.execucao" width="0" height="0" :src="'CntServlet?id=' + tab.execucao.idTarefaExecucao + '&hash=' + tab.execucao.hash + '&v=' + tab.v"
                            frameborder="0" allowFullScreen="true"></iframe>-->
                        <iframe v-if="tab && tab.url" width="0" height="0" :src="tab.url" frameborder="0" allowFullScreen="true"></iframe>
                    </div>
                </div>
            </section>
        </aside>
        <!-- /.content -->
    </div>

    <!-- Clear -->
    <script type="text/javascript" charset="UTF-8" src="odw3/clear/js/app.js"></script>

    <!-- Vue -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/vue/v2.4.3/vue.js"></script>

    <!-- Sortable -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/sortable/v1.6.1/sortable.js"></script>

    <!-- Vue Sortable -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/vue-sortable/v0.1.3/vue-sortable.js"></script>

    <!-- Moment -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/moment/moment.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/moment/pt-br.js"></script>

    <!-- ODW Server -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/odw-server/v1.0.0/main.js"></script>

    <!-- ODW -->
    <script type="text/javascript" charset="UTF-8" src="js/odwdate.js"></script>

    <!-- Slim Scroll -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/slimscroll/jquery.slimscroll.js"></script>

    <!-- SweetAlert2 -->
    <script type="text/javascript" charset="UTF-8" src="js/sweetalert2-7.0.3/sweetalert2.min.js"></script>

    <!-- Toastr -->
    <script type="text/javascript" charset="UTF-8" src="js/toastr-2.1.3/toastr.min.js"></script>

    <!-- Awesomplete -->
    <script type="text/javascript" charset="UTF-8" src="js/awesomplete-1.1.1/awesomplete.js" async></script>

    <!-- Selectize -->
    <script type="text/javascript" charset="UTF-8" src="js/selectize-0.12.4/js/standalone/selectize.js"></script>

    <!-- ODW Form -->
    <script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/manifest.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/vendor.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/main.js"></script>

    <!-- Page -->
    <script type="text/javascript" charset="UTF-8" src="odw3/app/defaults/alerts.js"></script>    
    <script type="text/javascript" charset="UTF-8" src="odw3/app/_odw3menu/index.js"></script>
</body>

</html>