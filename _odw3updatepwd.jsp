<%--
    Document   : _odw3updatepwd
    Created on : Nov 22, 2017, 03:37:01 PM
    Author     : Douglas Granzotto
--%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
	<title>
        Alterar Senha
    </title>
	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<!-- Clear -->
	<link rel="stylesheet" type="text/css" href="odw3/clear/css/app.css">
	<link rel="stylesheet" type="text/css" href="odw3/clear/css/custom.css">

    <!-- SweetAlert2 -->
    <link rel="stylesheet" type="text/css" href="js/sweetalert2-7.0.3/sweetalert2.min.css"/>
    <link rel="stylesheet" type="text/css" href="odw3/app/defaults/sweet_alert2.css">

    <!-- Ladda -->
    <link rel="stylesheet" type="text/css" href="js/ladda-1.0.5/ladda-themeless.min.css">

	<!-- ODW Form -->
	<link rel="stylesheet" type="text/css" href="js/odw-form/v1.0.4/css/main.css">
	
    <!-- Page -->
	<link rel="stylesheet" type="text/css" href="odw3/app/defaults/index.css">
    <link rel="stylesheet" type="text/css" href="odw3/app/defaults/sweet_alert2.css">
	<link rel="stylesheet" type="text/css" href="odw3/app/_odw3updatepwd/index.css">
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
                        Alterar Senha
                    </h2>
				</div>
			</div>
		</div>
	</nav>
    
	<section class="container">
		<div class="row">
			<div class="col-xs-12">
                <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                    <div class="panel filterable">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <form id="form" v-on:submit.prevent="" method="post">
                                        <of-input label="Senha Atual" v-model="currPwd" @input="$v.currPwd.$touch()" name="currPwd" :is-secret="true" ></of-input>
                                        <p v-if="$v.currPwd.$error" class="has-error">Senha Atual deve ser informada</p>
                                        <of-input label="Nova Senha" v-model="newPwd" @input="$v.newPwd.$touch()" name="newPwd" :is-secret="true"></of-input>
                                        <p v-if="$v.newPwd.$error" class="has-error">Nova Senha deve ser informada</p>
                                        <of-input label="Redigite a Nova Senha" v-model="newPwd2" @input="$v.newPwd2.$touch()" name="newPwd2" :is-secret="true"></of-input>
                                        <p v-if="$v.newPwd2.$error" class="has-error">Senha redigitada deve ser igual a Nova Senha</p>
                                        <div class="col-md-12 text-center">
                                            <button class="ladda-button btn-md btn btn-primary button_normal" data-style="zoom-out" @click="save()">
                                                <span class="ladda-label">Salvar <i class="fa ti-save" aria-hidden="true"></i></span><span class="ladda-spinner"></span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</section>
    
    <!-- jQuery -->
	<script type="text/javascript" charset="UTF-8" src="js/jquery-3.2.1/jquery.min.js"></script>

    <!-- ODW Util -->
    <script type="text/javascript" charset="UTF-8" src="js/odwutil.js"></script>

	<!-- ODW Server -->
	<script type="text/javascript" charset="UTF-8" src="js/odw-server/v1.0.1/main.js"></script>
	
	<!-- Vue -->
	<script type="text/javascript" charset="UTF-8" src="js/vue-2.4.3/vue.js"></script>

    <!-- SweetAlert2 -->
    <script type="text/javascript" charset="UTF-8" src="js/sweetalert2-7.0.3/sweetalert2.min.js"></script>

    <!-- Ladda -->
    <script type="text/javascript" charset="UTF-8" src="js/ladda-1.0.5/spin.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/ladda-1.0.5/ladda.min.js"></script>

	<!-- ODW Form -->
	<script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/manifest.js"></script>
	<script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/vendor.js"></script>
	<script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/main.js"></script>

    <!-- vuelidate -->
    <script type="text/javascript" charset="UTF-8" src="js/vuelidate-0.6.1/vuelidate.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/vuelidate-0.6.1/validators.min.js"></script>

    <!-- Page -->
    <script type="text/javascript" charset="UTF-8" src="odw3/app/defaults/alerts.js"></script>
    <script type="text/javascript" charset="UTF-8" src="odw3/app/_odw3updatepwd/index.js"></script>
</body>

</html>
