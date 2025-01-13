<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" />
<jsp:directive.page import="bdo.srv.cfg.CfgAppCust" />

<!DOCTYPE html>
<html>
<!--- ****************  VARIAVEIS DE VERSÃO E PRODUTO ******************* -->
    <% 
        String produto = "Encomendas"; 
        String versaoProduto = "1.2.0";
    %>
<head>
    <meta charset="UTF-8">
    <title>
        <%= produto %> - Linear
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="manifest" href="manifest.json">

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
    <meta name="application-name" content="&nbsp;"/>
    <meta name="msapplication-TileColor" content="#" />
    <meta name="msapplication-TileImage" content="odw3/static/images/favicon/mstile-144x144.png" />
    <meta name="msapplication-square70x70logo" content="odw3/static/images/favicon/mstile-70x70.png" />
    <meta name="msapplication-square150x150logo" content="odw3/static/images/favicon/mstile-150x150.png" />
    <meta name="msapplication-wide310x150logo" content="odw3/static/images/favicon/mstile-310x150.png" />
    <meta name="msapplication-square310x310logo" content="odw3/static/images/favicon/mstile-310x310.png" />

    <!-- Bootstrap
    <link rel="stylesheet" type="text/css" href="odw3/clear/css/bootstrap.min.css">

    <!-- Open Sans
    <link rel="stylesheet" type="text/css" href="odw3/static/fonts/open-sans/open-sans.css">

    <!-- ODW Form 
    <link rel="stylesheet" type="text/css" href="odw3/static/libs/odw-form/v1.0.3/css/main.css">

    <!-- Page 
    <link rel="stylesheet" type="text/css" href="odw3/app/odw3/index.css">

    <!-- Theme Linear -->
    <link rel="stylesheet" type="text/css" href="js/pack_newera_linear/css/particlejs_custom_linear.css"> 
    
    <link rel="stylesheet" href="odw3/vuexy/login/styles.css">


</head>

<body>
   <div class="login-container">
   <div id="form" class="login-form col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1" :class="classes">
        <!-- img src="images/od_web_view_icon.png" alt="Logo" -->
		<div class="alert message" :class="classes.message " role="alert" v-show="message">
            {{message}}
        </div>
    
        <form v-on:submit.prevent="onSubmit" method="post" class="login-form">
            <h4>Gestão do Sistema</h4>
            <div class="input-group">                
                <input label="Usuário" v-model="usr" name="usr" :add-ons="{ left: addOns.usr }" placeholder="Usuário">
            </div>
            <div class="input-group">
                <input label="Senha" v-model="pwd" name="pwd" :add-ons="{ left: addOns.pwd }" :is-secret="true" type="password" placeholder="Senha">
            </div>
            <button type="button" class="btn btn-block submit" :class="classes.submit" @click="onSubmit">
				Entrar
			</button>
            <input type="submit" class="hidden" style="display:none;"></input>
        </form>    
        <p class="description">Módulo Encomendas <br/> <b>Sistema para Gestão de Encomendas</b></p>
        <p class="version">Versão <%= versaoProduto %> </p>
    </div>
    </div>

    <script src="odw3/vuexy/login/script.js"></script>
<%-- 
    <script type="text/javascript" charset="UTF-8" src="js/pack_newera_linear/stats.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/pack_newera_linear/particles.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/pack_newera_linear/particlejs_custom_linear.js"></script> --%>

    <!-- ODW Util -->
    <script type="text/javascript" charset="UTF-8" src="js/odwutil.js"></script>

    <!-- Vue -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/vue/v2.4.3/vue.js"></script>

    <!-- ODW Form -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/odw-form/v1.0.3/js/manifest.js"></script>
	<script type="text/javascript" charset="UTF-8" src="odw3/static/libs/odw-form/v1.0.3/js/vendor.js"></script>
	<script type="text/javascript" charset="UTF-8" src="odw3/static/libs/odw-form/v1.0.3/js/main.js"></script>

    <!-- ODW Server -->
    <script type="text/javascript" charset="UTF-8" src="odw3/static/libs/odw-server/v1.0.0/main.js"></script>

    <!-- Page -->
    <script>
        const payload = {
            action: "login",
            devId: "<%= request.getParameter("devId") %>",
            uiId: "<%= request.getParameter("uiId") %>",
            uiCust: "<%= request.getParameter("uiCust") %>",
            queryString: "<%= request.getQueryString() %>",
            rand: Math.random()
        }
    </script>
    <script type="text/javascript" charset="UTF-8" src="odw3/app/odw3/index.js"></script>
</body>

</html>