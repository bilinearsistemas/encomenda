<%--
    Document   : _odw3parameters
    Created on : Out 25, 2017, 10:48:17 AM
    Author     : Douglas Granzotto
--%>

<%--<%@page errorPage="error.jsp"%>--%> 
<%@page import="bdo.entity.Tarefa, bdo.srv.exec.script.ParameterCommand, bdo.srv.exec.script.Types, com.elisha.commons.util.StringUtil, java.util.List" %>
<jsp:useBean id="htmlHeadBefore" class="java.lang.String" scope="request"/>
<jsp:useBean id="htmlHead" class="java.lang.String" scope="request"/>
<jsp:useBean id="tarefa" class="bdo.entity.Tarefa" scope="request"/>
<jsp:useBean id="parameters" class="java.util.ArrayList" scope="request"/>
<jsp:useBean id="execScript" class="bdo.srv.exec.script.ExecScript" scope="request"/>
<jsp:useBean id="action" class="bdo.srv.servlet.action.GetParametersAction" scope="request"/>
<jsp:useBean id="actionProps" class="bdo.srv.servlet.action.ActionProps" scope="request"/>

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

    <!-- SweetAlert2 -->
    <link rel="stylesheet" type="text/css" href="js/sweetalert2-7.0.3/sweetalert2.min.css"/>
    <link rel="stylesheet" type="text/css" href="odw3/app/defaults/sweet_alert2.css">

	<!-- Selectize -->
	<link rel="stylesheet" type="text/css" href="js/selectize-0.12.4/css/selectize.bootstrap3.css">
	
	<!-- Bootstrap Switch -->
	<link rel="stylesheet" type="text/css" href="js/bootstrap-switch-3.3.4/css/bootstrap3/bootstrap-switch.min.css">
	
	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" type="text/css" href="js/bootstrap-datetimepicker-4.17.47/css/bootstrap-datetimepicker.min.css">

    <!-- Ladda -->
    <link rel="stylesheet" type="text/css" href="js/ladda-1.0.5/ladda-themeless.min.css">
	
	<!-- ODW Form -->
	<link rel="stylesheet" type="text/css" href="js/odw-form/v1.0.4/css/main.css">
	
    <!-- Page -->
    <link rel="stylesheet" type="text/css" href="odw3/clear/css/advbuttons.css">

	<link rel="stylesheet" type="text/css" href="odw3/app/defaults/index.css">
	<link rel="stylesheet" type="text/css" href="odw3/app/_odw3parameters/index.css">

    <%= htmlHeadBefore %>
    <%= htmlHead %>

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
                                    <form id="form" v-on:submit.prevent="" method="post" <%= actionProps.getEnctype() != null ? "enctype=\""+actionProps.getEnctype()+"\"" : "" %>>
                                        <%! 
                                        public String createComponent(ParameterCommand pc) {
                                            if ("autocomplete".equals(pc.getInputType())) {
                                                String component = "<of-select v-model=\"parameters.%s\" name=\"%s\" label=\"%s\" :is-multiple=\"%s\" " +
                                                                        ":options=\"{ valueField: 'id', labelField: 'value', searchField: 'value', " +
                                                                            "load(query, callback) { executeScriptFunction({ idTarefa: %s, scriptFunction: '%s', term: query }, callback) } }\"" +
                                                                    "></of-select>\n";
                                                return String.format(component, 
                                                                        pc.getName(), pc.getName(), pc.getLabel(), pc.isMulti(), 
                                                                        pc.getTarefaScriptFunction(), pc.getScriptFunction());
                                            } else if (StringUtil.isNotEmpty(pc.getValues())) {
                                                return String.format("<of-select v-model=\"parameters.%s\" name=\"%s\" label=\"%s\" :type=\"%s\" :is-multiple=\"%s\" :options=\"{ options: store['%s'].options }\"></of-select>\n", 
                                                                        pc.getName(), pc.getName(), pc.getLabel(), pc.getJavascriptType(), pc.isMulti(), pc.getName());
                                            } else if (Types.isGroupDate(pc.getType())) {
                                                return String.format("<of-date-picker v-model=\"parameters.%s\" name=\"%s\" label=\"%s\" :type=\"String\"></of-date-picker>\n", 
                                                                        pc.getName(), pc.getName(), pc.getLabel());
                                            } else if (Types.isBoolean(pc.getType())) {
                                                return String.format("<of-switch v-model=\"parameters.%s\" name=\"%s\" label=\"%s\"></of-switch>\n", 
                                                                        pc.getName(), pc.getName(), pc.getLabel());
                                            } else if (Types.isGroupDecimal(pc.getType())) {
                                                return String.format("<of-number v-model=\"parameters.%s\" name=\"%s\" label=\"%s\"></of-number>\n", 
                                                                        pc.getName(), pc.getName(), pc.getLabel());
                                            } else if (Types.isGroupInteger(pc.getType())) {
                                                return String.format("<of-number v-model=\"parameters.%s\" name=\"%s\" label=\"%s\" :options=\"{ precision: 0 }\"></of-number>\n", 
                                                                        pc.getName(), pc.getName(), pc.getLabel());
                                            } else if (pc.getRows() != -1) {
                                                return String.format("<of-textarea v-model=\"parameters.%s\" name=\"%s\" label=\"%s\" :options=\"{ rows: %s, cols: %s }\"></of-textarea>\n", 
                                                                        pc.getName(), pc.getName(), pc.getLabel(), pc.getRows(), pc.getCols());
                                            } else {
                                                return String.format("<of-input v-model=\"parameters.%s\" name=\"%s\" label=\"%s\" :is-hidden=\"%s\"></of-input>\n", 
                                                                        pc.getName(), pc.getName(), pc.getLabel(), Types.isHidden(pc.getType()));
                                            }
                                        } 
                                        %> 

                                        <%
                                        if (parameters != null) {
                                            if (StringUtil.isNotEmpty(execScript.getPreprocessScript().getHtmlForm())) {
                                                String htmlForm = execScript.replaceVars(execScript.getPreprocessScript().getHtmlForm(), false);
                                                String[] params = StringUtil.substringsBetween(htmlForm, "$p{", "}");
                                                if (params != null) {
                                                    ParameterCommand pc;
                                                    ParameterCommand pcForSearch = new ParameterCommand();
                                                    String name, attribute, component;
                                                    int idx;
                                                    for (String p : params) {
                                                        idx = p.indexOf('.');
                                                        if (idx == -1) {
                                                            name = p.trim();
                                                            attribute = null;
                                                        } else {
                                                            name = p.substring(0,idx).trim();
                                                            attribute = p.substring(idx+1).trim();
                                                        }
                                                        pcForSearch.setName(name);
                                                        idx = parameters.indexOf(pcForSearch);
                                                        if (idx != -1) {
                                                            pc = (ParameterCommand)parameters.get(idx);
                                                            if (StringUtil.isEmpty(attribute)) {
                                                                component = createComponent(pc);
                                                            } else if (attribute.equals("label")) {
                                                                component = pc.getLabel();
                                                            } else {
                                                                component = null;
                                                            }
                                                            if (component != null) {
                                                                htmlForm = StringUtil.replace(htmlForm, "$p{"+p+"}", component);
                                                                pc.setCustomLayout(true);
                                                            }
                                                        }
                                                    }
                                                }
                                                out.print(htmlForm);
                                            }
                                            for (Object obj : parameters) {
                                                ParameterCommand pc = (ParameterCommand)obj;
                                                if (!pc.isCustomLayout()) {
                                                    out.print(createComponent(pc));
                                                }
                                            }
                                        }
                                        %>

                                        <div class="col-md-12 text-center">
                                            <button class="ladda-button btn btn-primary button_normal" data-style="zoom-out" @click="execute()">
                                                <span class="ladda-label">Executar <i class="fa ti-control-play" aria-hidden="true"></i></span><span class="ladda-spinner"></span>
                                            </button>
                                            <button type="button" class="btn btn-danger" v-show="running" @click="cancelExec()">
                                                <span>Cancelar <i class="fa ti-control-stop" aria-hidden="true"></i>
                                            </button>
                                        </div>

                                        <input type="hidden" name="_idTarefa" id="_idTarefa" value="<jsp:getProperty name="tarefa" property="idTarefa"/>"/>
                                        <input type="hidden" name="_versao" id="_versao" value="<jsp:getProperty name="tarefa" property="versao"/>"/>
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

	<!-- Moment -->
	<script type="text/javascript" charset="UTF-8" src="js/moment-2.18.1/moment-with-locales.min.js"></script>
	
	<!-- ODW Server -->
	<script type="text/javascript" charset="UTF-8" src="js/odw-server/v1.0.1/main.js"></script>
	
	<!-- Vue -->
	<script type="text/javascript" charset="UTF-8" src="js/vue-2.4.3/vue.js"></script>

    <!-- SweetAlert2 -->
    <script type="text/javascript" charset="UTF-8" src="js/sweetalert2-7.0.3/sweetalert2.min.js"></script>
	
	<!-- Selectize -->
	<script type="text/javascript" charset="UTF-8" src="js/selectize-0.12.4/js/standalone/selectize.js"></script>
	
	<!-- Bootstrap Switch -->
	<script type="text/javascript" charset="UTF-8" src="js/bootstrap-switch-3.3.4/js/bootstrap-switch.min.js"></script>
	
	<!-- Bootstrap DateTimePicker -->
	<script type="text/javascript" charset="UTF-8" src="js/bootstrap-datetimepicker-4.17.47/js/bootstrap-datetimepicker.min.js"></script>
	
    <!-- Ladda -->
    <script type="text/javascript" charset="UTF-8" src="js/ladda-1.0.5/spin.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/ladda-1.0.5/ladda.min.js"></script>

	<!-- ODW Form -->
	<script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/manifest.js"></script>
	<script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/vendor.js"></script>
	<script type="text/javascript" charset="UTF-8" src="js/odw-form/v1.0.4/js/main.js"></script>

    <!-- Page -->
    <script>
        const payload = {
            idTarefa: <jsp:getProperty name="tarefa" property="idTarefa"/>,
            apelido: "<jsp:getProperty name="tarefa" property="apelido"/>"
        }
        const parameters = {
            <%  
            out.print("\tmodel: {\n");
            if (parameters != null) {
                boolean quotes = false;
                for (int i = 0; i < parameters.size(); i++) {
                    ParameterCommand pc = (ParameterCommand)parameters.get(i);
                    if (i > 0) {
                        out.print(",\n");
                    }
                    out.print("\t\t\t\t" + pc.getName() + ": ");
                    if (StringUtil.isNotEmpty(pc.getValues()) && StringUtil.isEmpty(pc.getDefaultValue())) {  // select e sem default
                        out.print("null");
                    } else {
                        //quotes = !(Types.isGroupDecimal(pc.getType()) || Types.isGroupInteger(pc.getType()) || Types.isBoolean(pc.getType()));
                        quotes = true;
                        if (quotes) {
                            out.print("\"");
                        }
                        if (pc.getDefaultValue() != null) {
                            out.print(pc.getDefaultValue().replace("\n","\\n"));
                        }
                        if (quotes) {
                            out.print("\"");
                        }
                    }
                }
                out.print("\n");
                out.print("\t\t\t}");  // model
                for (int i = 0; i < parameters.size(); i++) {
                    ParameterCommand pc = (ParameterCommand)parameters.get(i);
                    if (StringUtil.isNotEmpty(pc.getValues()) && StringUtil.isEmpty(pc.getScriptFunction())) {
                        out.print(",\n");
                        out.print("\t\t\t" + pc.getName() + ": {\n");
                        out.print("\t\t\t\toptions: ");
                        out.print(pc.getJSONValues());
                        out.print("\n");
                        out.print("\t\t\t}");
                    }
                }
            } else {
                out.print("\t\t\t}");  // model
            }
            %>
        }
    </script>
    <script type="text/javascript" charset="UTF-8" src="odw3/app/defaults/alerts.js"></script>    
    <script type="text/javascript" charset="UTF-8" src="odw3/app/_odw3parameters/index.js"></script>
</body>

</html>
