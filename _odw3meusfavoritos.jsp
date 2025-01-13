<%--
    Document   : _odw3meusfavoritos
    Created on : Out 16, 2017, 18:28:01 PM
    Author     : Douglas Granzotto
--%>


<!DOCTYPE html>
<html lang="pt-br">

<head>
	<title>Meus Favoritos</title>
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

	<!-- gridstack -->
	<link rel="stylesheet" type="text/css" href="../js/gridstack-0.3.0/gridstack.css">

    <!-- Page -->
	<link rel="stylesheet" type="text/css" href="app/defaults/index.css">
	<link rel="stylesheet" type="text/css" href="app/_odw3meusfavoritos/index.css">
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
					<h2>Meus Favoritos</h2>
				</div>
			</div>
		</div>
	</nav>
	
	<section id="favoritos" class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="grid-stack grid-stack-instance-230 grid-stack-animate" data-gs-width="12" data-gs-animate="yes" data-gs-current-height="12" style="height: 940px;" @dragover.prevent @drop="drop">
					<div style="height: 800px;"></div>
					<!--<div v-for="favorito in favoritos" class="grid-stack-item ui-draggable ui-resizable ui-resizable-autohide" 
						:data-gs-x="favorito.x" :data-gs-y="favorito.y" :data-gs-width="favorito.width" :data-gs-height="favorito.height">
						<div class="grid-stack-item-content ui-draggable-handle">
							{{favorito.text}}
						</div>
						<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90; display: none;"></div>
						<div class="ui-resizable-handle ui-resizable-se" style="z-index: 90; display: none;"></div>
						<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90; display: none;"></div>
						<div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90; display: none;"></div>
						<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90; display: none;"></div>
					</div>-->
				</div>
			</div>
		</div>
	</section>
	
	<!-- jQuery -->
	<script type="text/javascript" charset="UTF-8" src="../js/jquery-3.2.1/jquery.min.js"></script>
	
	<!-- ODW Server -->
	<script type="text/javascript" charset="UTF-8" src="../js/odw-server/v1.0.1/main.js"></script>
	
	<!-- Vue -->
	<script type="text/javascript" charset="UTF-8" src="../js/vue-2.4.3/vue.js"></script>

	<!-- gridstack -->
	<script type="text/javascript" src="../js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/lodash-4.17.4/lodash.full.min.js"></script>
	<script type="text/javascript" src="../js/gridstack-0.3.0/gridstack.js"></script>
	<script type="text/javascript" src="../js/gridstack-0.3.0/gridstack.jQueryUI.js"></script>

    <!-- Page -->
    <script type="text/javascript" charset="UTF-8" src="app/_odw3meusfavoritos/index.js"></script>
</body>

</html>
