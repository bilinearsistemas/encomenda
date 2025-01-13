<jsp:useBean id="usuario" class="bdo.entity.Usuario" scope="session"/>
<div id="header_logged">
    <span class="odw_hello">Olá,</span><br>
<!--    <span class="odw_user"><jsp:getProperty name="usuario" property="usuario"/></span><br>
    <span class="odw_logout"><a href="odwctrl?action=logout">Sair</a></span>-->
    <script>
	$(function() {
            $(".popbox").popbox();
	});
    </script>
    <style>
        .box { 
            padding: 10px;
            width: 110px;
        }
    </style>
    <div class="popbox">
        <input type="button" class="open" value="<jsp:getProperty name="usuario" property="usuario"/>"</input>
        <div class="collapse">
            <div class="box">
                <div class="arrow"></div>
                <div class="arrow-border"></div>
                <ul style="list-style: none; text-align: left; font-size: 1.2em;">
                    <li><a href="odwctrl?action=logout">Sair</a></li>
                    <li><a href="odwctrl?action=updatePwd">Alterar senha</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
