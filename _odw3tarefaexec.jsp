<%--
    Document   : _odw3tarefaexec
    Created on : Dez 20, 2017, 3:57:27 PM
    Author     : Douglas Granzotto
--%>

<%@page import="bdo.entity.Tarefa, bdo.entity.TarefaExecucao" %>
<jsp:useBean id="tarefa" class="bdo.entity.Tarefa" scope="request"/>
<jsp:useBean id="tarefaExecucao" class="bdo.entity.TarefaExecucao" scope="request"/>

<!DOCTYPE html>
<html lang="pt-br">

<head>
	<title>
        <jsp:getProperty name="tarefa" property="descTarefa"/> (<jsp:getProperty name="tarefa" property="idTarefa"/>)
    </title>
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
	
	<!-- Clear -->
	<link rel="stylesheet" type="text/css" href="odw3/clear/css/app.css">
	<link rel="stylesheet" type="text/css" href="odw3/clear/css/custom.css">
	<link rel="stylesheet" type="text/css" href="odw3/clear/css/alertmessage.css">

    <!-- Page -->
	<link rel="stylesheet" type="text/css" href="odw3/app/defaults/index.css">
	<link rel="stylesheet" type="text/css" href="odw3/app/_odw3tarefaexec/index.css">
</head>

<body>
	<div class="preloader">
		<div class="loader_img">
			<img src="odw3/static/images/loader/clear-loader.gif" alt="loading..." height="64" width="64">
		</div>
	</div>

	<nav class="nav">
		<div class="text-center page-header">
			<div class="container">
				<div class="panel-title text-center">
					<h2>
                        <jsp:getProperty name="tarefa" property="descTarefa"/>
                        &nbsp;
                        (<jsp:getProperty name="tarefa" property="idTarefa"/>)
                    </h2>
				</div>
			</div>
		</div>
	</nav>

	<section class="container">
		<div class="row">
			<div class="col-xs-12">
                <div class="form-parameters col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1" :class="classes">
                    <div class="panel filterable">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12">
									<div class="alert-message alert-message-success">
										<p>
											Tarefa executada<br><br>
											Resultado: Sem dados para apresentar na tarefa.
										</p>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</section>

    <!-- Clear -->
    <script type="text/javascript" charset="UTF-8" src="odw3/clear/js/app.js"></script>

	<!-- Vue -->
	<script type="text/javascript" charset="UTF-8" src="js/vue-2.4.3/vue.js"></script>
	
    <!-- Page -->
    <script type="text/javascript" charset="UTF-8" src="odw3/app/_odw3tarefaexec/index.js"></script>
</body>

</html>
