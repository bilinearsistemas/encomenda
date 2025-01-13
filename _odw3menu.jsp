<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" />
<jsp:directive.page import="bdo.srv.cfg.CfgAppCust" />

<!DOCTYPE html>
<html lang="pt-BR">
    <!--- ****************  VARIAVEIS DE VERSÃO E PRODUTO ******************* -->
    <% 
        String produto = "Encomendas"; 
        String versaoProduto = "1.1.0";
    %>

<head>
    <meta charset="UTF-8">
    <title>
        <%= produto %> - Linear
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

    <!-- SweetAlert2 -->
    <link rel="stylesheet" type="text/css" href="js/sweetalert2-7.0.3/sweetalert2.min.css"/>
    <link rel="stylesheet" type="text/css" href="odw3/app/defaults/sweet_alert2.css">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/vendors/css/charts/apexcharts.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/vendors/css/extensions/tether-theme-arrows.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/vendors/css/extensions/tether.min.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/vendors/css/extensions/shepherd-theme-default.css">
    <!-- END: Vendor CSS>

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/pages/dashboard-analytics.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/pages/card-analytics.css">
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/app-assets/css/plugins/tour/tour.css">
    <!-- END: Page CSS>

    <!-- BEGIN: Custom CSS -->
    <link rel="stylesheet" type="text/css" href="odw3/vuexy/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>

<body class="vertical-layout vertical-menu-modern 2-columns navbar-floating footer-static" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="semi-dark-layout">

<!-- BEGIN: Header-->
    <nav id="navbar" class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-shadow" >    
        <div class="navbar-wrapper" >
            <div class="navbar-container content" >
                <div class="navbar-collapse" >                    
                        <ul class="nav navbar-nav float-right p-0" id="navbar-mobile">
                            <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                            <!--li class="nav-item nav-search"><a class="nav-link nav-link-search"><i class="ficon feather icon-search"></i></a>
                                <div class="search-input">
                                    <div class="search-input-icon"><i class="feather icon-search primary"></i></div>
                                    <input class="input" type="text" placeholder="Buscar Tarefas..." tabindex="-1" data-search="template-list">
                                    <div class="search-input-close"><i class="feather icon-x"></i></div>
                                    <ul class="search-list search-list-main"></ul>
                                </div>
                            </li--> 
                        </ul>
                        <div class="mr-auto float-left d-flex" >                        
                            <ul class="nav navbar-nav">
                                <li class="nav-item mobile-menu d-xl-none mr-auto">
                                    <a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#" ><i class="ficon feather icon-menu"></i>
                                    </a>
                                </li>
                            </ul>  
                            <div id="layout" class="mr-auto float-left d-flex">
                                <ul class="nav navbar-nav">
                                    <li class="nav-item "><a class="nav-link" href="#" @click="mudaTema('dark')" data-toggle="tooltip" data-placement="top" title="Modo Dark" alt="modo dark"><i class="ficon feather icon-moon"></i></a></li>
                                    <li class="nav-item d-none d-lg-block"><a class="nav-link" href="#" @click="mudaTema('semi-dark')" data-toggle="tooltip" data-placement="top" title="Modo Semi-Dark"><i class="ficon feather icon-monitor primary"></i></a></li>
                                    <li class="nav-item d-none d-lg-block"><a class="nav-link" href="#" @click="mudaTema('light')" data-toggle="tooltip" data-placement="top" title="Modo Light"><i class="ficon feather icon-sun info"></i></a></li>
                                </ul>
                                <ul class="nav navbar-nav d-xl-none">
                                    <li class="nav-item "><a class="nav-link" href="#" @click="mudaTema('semi-dark')" data-toggle="tooltip" data-placement="top" title="Modo Semi-Dark"><i class="ficon feather icon-monitor primary"></i></a></li>
                                </ul>
                            </div>
                        <!--ul class="nav navbar-nav">
                            <li class="nav-item d-none d-lg-block"><a class="nav-link bookmark-star"><i class="ficon feather icon-moon "></i></a>
                                <div class="bookmark-input search-input">
                                    <div class="bookmark-input-icon"><i class="feather icon-search primary"></i></div>
                                    <input class="form-control input" type="text" placeholder="Escolha o Layout" tabindex="0" data-search="template-list">
                                    <ul class="search-list search-list-bookmark"></ul>
                                </div>                            
                            </li>
                        </ul-->                                               
                    </div>
                <div id="header">                
                    <ul class="nav navbar float-right p-0">                                        
                        <li class="nav-item d-lg-block"><a title="Página Incial" class="nav-link" href="odwctrl?action=menu" data-toggle="tooltip" data-placement="top" title="Home" alt="home"><i class="ficon feather icon-home"></i></a></li>
                        <li class="dropdown dropdown-notification nav-item d-none d-md-block" v-event:show.bs.dropdown="getUltimasExecucoes" >
                            <a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon feather icon-check-square"></i>
                                <span class="badge badge-pill badge-primary badge-up">{{numNovasExecucoes}}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                                <li class="dropdown-menu-header">
                                    <div class="dropdown-header m-0 p-2">
                                        <span class="notification-title">Execuções Realizadas</span>
                                    </div>
                                </li>
                                <li class="scrollable-container media-list" v-for="execucao in execucoes">
                                    <a class="d-flex justify-content-between"href="#" @click="openExecucao(execucao)" >
                                        <div class="media d-flex align-items-start">
                                            <div class="media-left"><i class="feather icon-plus-square font-medium-5 secondary"></i></div>
                                            <div class="media-body">
                                                <h6 class="primary media-heading">{{execucao.tarefa.descTarefa}}</h6>
                                                <small class="notification-text"> {{execucao.tipoResultadoDesc}}</small>
                                            </div><small>
                                                <time class="media-meta">{{execucao | tarefaExecucaoData}}</time></small>
                                        </div>
                                    </a>
								</li>
                                <!-- li class="dropdown-menu-footer"><a class="dropdown-item p-1 text-center" href="javascript:void(0)">Read all notifications</a></li -->
                            </ul>
                        </li>
                        <li class="nav-item d-none d-lg-block d-none d-md-block" id="header">
                            <a class="nav-link" href="#" @click="saveVisaoInicial()" data-toggle="tooltip" data-placement="top" title="Marcar como Tela Inicial"><i class="ficon feather icon-save "></i></a>
                        </li>
                        <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">{{preferencias.usuario.usuario}}</span><span class="user-status">{{preferencias.usuario.grupoUsuarios.descGrupoUsuarios}}</span></div><span><img class="round" src="odw3/vuexy/img-custom/logo_small.png" alt="avatar" height="40" width="40"></span>
                            </a>
                            <span class="d-none" id="idGrupo">{{preferencias.usuario.grupoUsuarios.idGrupoUsuarios}}</span>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" target="_blank" href="odwctrl?action=updatePwd" @click="openURL('odwctrl?action=updatePwd', 'Alterar Senha')">
                                    <i class="feather icon-user"></i> 
                                    Alterar Senha
                                </a>
                                <div class="dropdown-divider"></div><a class="dropdown-item" href="odwctrl?action=logout"><i class="feather icon-power"></i> Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
                </div>
            </div>
        </div>    
    </nav>
    <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mr-auto"><a class="navbar-brand" href="#">
                        <div class="brand-logo"></div>
                        <h2 class="brand-text light mb-0"><%= produto %></h2>
                    </a></li>
                <li class="nav-item nav-toggle">
                    <a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse">
                        <i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i>
                        <i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i>
                    </a>
                </li>
            </ul>
        </div>
        <div class="shadow-bottom"></div>
        <div class="main-menu-content" id="sidebar-left">
            <div id="menu">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">                   
<li v-for="(processo,index) in menuTarefas()" v-if="processo.descProcesso === ' Configurações' || processo.descProcesso === 'Encomendas'"  class="nav-item" :data-index="index" :key="index" :class="{active: activeIndex === index }"
              @click="open(processo.idProcesso,processo.tarefas[0],index)" >
                        <a href="#"  href="#" @dragstart="dragStart(processo.tarefas[0], $event)">
                            <i class="feather icon-check-square"></i>
                            <span class="menu-title" data-i18n="Menu">{{processo.descProcesso}}</span>
                            <span class="float-right">
                            <!-- i class="feather icon-arrow-right"></i -->
                            </span>
                        </a>
                    </li>
                    <!-- li class="active" class=" nav-item">
                    <a href="app-chat.html">
                    <i class="feather icon-message-square"></i>
                    <span class="menu-title" data-i18n="Chat">Chat</span></a>
                    </li -->                               
                </ul>
            </div>
        </div>
    </div>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-1">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h3 class="content-header-title float-left" id="labelcard2"></h3>                            
                        </div>
                    </div>
                </div>                
            </div>
        </div>
            <div class="content-body ml-2 mr-1" id="content">
                <!--- Content Default -->
                <section id="basic-examples">
                    <div class="row match-height">
                    <span id="conteudoPagina"></span>                                              
                        <!-- Profile Cards Start -->                    
                        <div class="col-xl-3 col-md-6 col-sm-12 profile-card-2" v-for="itensContent in itensContentPageMenu" :key="index" :itensContent="itensContent" :class="{ active: itensContent === active }">
                            <div class="card">
                                <div class="card-header mx-auto">
                                    <div class="row ">
                                        <div class="avatar avatar-xl">
                                            <img class="img-fluid" :src="'images/icons/' + itensContent.apelido + '.png'" onerror="this.src='images/icons/not_icon.png';" alt="img placeholder">
                                        </div>                                        
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="card-body text-center mx-auto">
                                        <div class="col-sm-12 text-center">
                                            <h4>{{itensContent.desctarefa}}</h4>
                                        </div>                                                                            
                                        <a :href="'odwctrl?action=getParameters&idTarefa='+itensContent.idtarefa" target="_blank" class="btn gradient-light-success btn-block mt-2" v-html="itensContent.icone"></a>                                        
                                        <!--hr class="my-1">
                                        <div class="d-flex justify-content-between">Contatos:
                                            <div class="float-left">
                                                <a href="http://localhost/bdoserver2.7/odwctrl?action=getParameters&idTarefa=183" target="_blanck">
                                                <i class="feather icon-mail text-danger mr-50"></i>{{itensContent.email}}
                                                </a>
                                            </div>
                                            <div class="float-right">
                                                <i class="fa-brands fa-whatsapp text-success mr-50"></i>{{itensContent.celular}}
                                            </div>
                                        </div>
                                    </div -->
                                </div>
                            </div>
                        </div>                        
                        <!-- Profile Cards Ends -->
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
        <p class="clearfix blue-grey lighten-2 mb-0">
            <span class="float-md-left d-block d-md-inline-block mt-25">                
                <a href="https://atendimento.linearsistemas.com.br/kb/pt-br/article/52482/cadastro-de-usuarios-bi-linear?menuId=24101-29726-52482&ticketId=&q=" target="_blank" type="button">
                    Precisa de Ajuda<i class="feather icon-help-circle"></i></a>
                <a class="text-bold-800 grey darken-2" href="https://linearsistemas.com.br/bi-linear/" target="_blank">
                    Linear Sistemas 
                </a> 
                    (31) 2511-3131 
            </span>
            <span class="float-md-right d-none d-md-block" id="footer_version">
            </span>
        </p>
    </footer>
    <!-- END: Footer-->

    <!-- BEGIN: Vendor JS -->
    <script src="odw3/vuexy/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS
    <script src="odw3/vuexy/app-assets/vendors/js/charts/apexcharts.min.js"></script>
    <script src="odw3/vuexy/app-assets/vendors/js/extensions/tether.min.js"></script>
    <script src="odw3/vuexy/app-assets/vendors/js/extensions/shepherd.min.js"></script>
    <!-- END: Page Vendor JS-->

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

    <!-- Font awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>


    <!-- Selectize -->
    <script type="text/javascript" charset="UTF-8" src="js/selectize-0.12.4/js/standalone/selectize.js"></script>

    <!-- ODW Form -->
    <script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/manifest.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/vendor.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/main.js"></script>

    <!-- Page Observador -->
    <script type="text/javascript" charset="UTF-8" src="odw3/app/defaults/alerts.js"></script>    
    <script type="text/javascript" charset="UTF-8" src="odw3/app/_odw3menu/index.js"></script>

    <!-- BEGIN: Theme JS-->
    <script src="odw3/vuexy/app-assets/js/core/app-menu.js"></script>
    <script src="odw3/vuexy/app-assets/js/core/app.js"></script>
    <script src="odw3/vuexy/app-assets/js/scripts/components.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="odw3/vuexy/app-assets/js/scripts/pages/dashboard-analytics.js"></script>
    <!-- END: Page JS-->

<!-- END: Body-->
</body>

</html>