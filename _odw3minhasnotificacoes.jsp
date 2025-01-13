<%--
    Document   : _odw3minhasnotificacoes
    Created on : Out 05, 2017, 03:57:11 PM
    Author     : Douglas Granzotto
--%>


<!DOCTYPE html>
<html lang="pt-br">

<head>
	<title>Minhas Notifica??es</title>
	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<!-- Favicon -->
	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="static/images/favicon/apple-touch-icon-57x57.png" />
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="static/images/favicon/apple-touch-icon-114x114.png" />
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="static/images/favicon/apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="static/images/favicon/apple-touch-icon-144x144.png" />
	<link rel="apple-touch-icon-precomposed" sizes="60x60" href="static/images/favicon/apple-touch-icon-60x60.png" />
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="static/images/favicon/apple-touch-icon-120x120.png" />
	<link rel="apple-touch-icon-precomposed" sizes="76x76" href="static/images/favicon/apple-touch-icon-76x76.png" />
	<link rel="apple-touch-icon-precomposed" sizes="152x152" href="static/images/favicon/apple-touch-icon-152x152.png" />
	<link rel="icon" type="image/png" href="static/images/favicon/favicon-196x196.png" sizes="196x196" />
	<link rel="icon" type="image/png" href="static/images/favicon/favicon-96x96.png" sizes="96x96" />
	<link rel="icon" type="image/png" href="static/images/favicon/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="static/images/favicon/favicon-16x16.png" sizes="16x16" />
	<link rel="icon" type="image/png" href="static/images/favicon/favicon-128.png" sizes="128x128" />
	<meta name="application-name" content="&nbsp;"/>
	<meta name="msapplication-TileColor" content="#" />
	<meta name="msapplication-TileImage" content="static/images/favicon/mstile-144x144.png" />
	<meta name="msapplication-square70x70logo" content="static/images/favicon/mstile-70x70.png" />
	<meta name="msapplication-square150x150logo" content="static/images/favicon/mstile-150x150.png" />
	<meta name="msapplication-wide310x150logo" content="static/images/favicon/mstile-310x150.png" />
	<meta name="msapplication-square310x310logo" content="static/images/favicon/mstile-310x310.png" />
	
	<!-- Font Awesome -->
	<!-- <link rel="stylesheet" type="text/css" href="../js/font-awesome-4.5.0/css/font-awesome.min.css"> -->

	<!-- Clear -->
	<link rel="stylesheet" type="text/css" href="clear/css/app.css">
	<link rel="stylesheet" type="text/css" href="clear/css/custom.css">

	<!-- ODW Form -->
	<link rel="stylesheet" type="text/css" href="../js/odw-form/v1.0.4/css/main.css">

	<!-- Selectize -->
	<link rel="stylesheet" type="text/css" href="../js/selectize-0.12.4/css/selectize.bootstrap3.css">
	
	<!-- Bootstrap Switch -->
	<link rel="stylesheet" type="text/css" href="../js/bootstrap-switch-3.3.4/css/bootstrap3/bootstrap-switch.min.css">

	<!-- DataTables -->
	<link rel="stylesheet" type="text/css" href="../js/datatables-1.10.16/datatables.min.css">

    <!-- Page -->
	<link rel="stylesheet" type="text/css" href="app/defaults/index.css">
	<link rel="stylesheet" type="text/css" href="app/_odw3minhasnotificacoes/index.css">
</head>

<body>
	<div class="preloader">
		<div class="loader_img">
			<img src="static/images/loader/clear-loader.gif" alt="loading..." height="64" width="64">
		</div>
	</div>

	<nav class="nav">
		<div class="text-center page-header">
			<div class="container">
				<div class="panel-title text-center">
					<h2>Minhas Notificações</h2>
				</div>
			</div>
		</div>
	</nav>
	
	<section class="container">
		<div class="row">
			<div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel filterable">
                            <div class="panel-body">
                                <div id="filter" class="row">	                        
                                    <div class="col-xs-12 col-md-10">
                                        <of-select v-model="model.idTarefaList" name="idTarefaList" label="Tarefas" :is-multiple="true" :options="{ valueField: 'id', labelField: 'value', searchField: 'value', load(query, callback) { $$service.tarefa.get({ term: query }).done(callback).fail(callback) } }" />
                                    </div>
                                    <div class="col-xs-12 col-md-2">
                                        <label> </label>
                                        <div>
                                            <button class="btn btn-sm" role="button" title="Filtrar" @click="search()">
                                                <b><i class="fa fa-fw ti-search"></i></b>
                                            </button>
                                            <button class="btn btn-sm" role="button" title="Limpar" @click="clean()">
                                                <b><i class="fa fa-fw ti-close"></i></b>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table id="grid" class="table table-striped table-condensed"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</section>
	
	<!-- Moment -->
	<script type="text/javascript" charset="UTF-8" src="../js/moment-2.18.1/moment-with-locales.min.js"></script>
	
	<!-- jQuery -->
	<script type="text/javascript" charset="UTF-8" src="../js/jquery-2.1.0.min.js"></script>
	
	<!-- ODW Server -->
	<script type="text/javascript" charset="UTF-8" src="../js/odw-server/v1.0.1/main.js"></script>
	
	<!-- Vue -->
	<script type="text/javascript" charset="UTF-8" src="../js/vue-2.4.3/vue.js"></script>
	
	<!-- Selectize -->
	<script type="text/javascript" charset="UTF-8" src="../js/selectize-0.12.4/js/standalone/selectize.js"></script>
	
	<!-- Bootstrap Switch -->
	<script type="text/javascript" charset="UTF-8" src="../js/bootstrap-switch-3.3.4/js/bootstrap-switch.min.js"></script>
	
	<!-- Bootstrap DateTimePicker -->
	<script type="text/javascript" charset="UTF-8" src="../js/bootstrap-datetimepicker-4.17.47/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- ODW Form -->
	<script type="text/javascript" charset="UTF-8" src="../js/odw-form/v1.0.4/js/manifest.js"></script>
	<script type="text/javascript" charset="UTF-8" src="../js/odw-form/v1.0.4/js/vendor.js"></script>
	<script type="text/javascript" charset="UTF-8" src="../js/odw-form/v1.0.4/js/main.js"></script>

	<!-- DataTables -->
	<script type="text/javascript" charset="UTF-8" src="../js/datatables-1.10.16/datatables.min.js"></script>
	<!-- DataTables - Custom -->
	<script type="text/javascript" charset="UTF-8" src="app/defaults/datatables.js"></script>

    <!-- Page -->
    <script type="text/javascript" charset="UTF-8" src="app/_odw3minhasnotificacoes/index.js"></script>
</body>

</html>