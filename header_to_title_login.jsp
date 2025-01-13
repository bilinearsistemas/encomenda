<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bdo.srv.cfg.CfgAppCust"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="header_custom.jsp"/>
        <title><%= CfgAppCust.getInstance().getWebViewTitle() %></title>
        <!-- bootstrap -->
        <link href="odw3/clear/css/bootstrap.min.css" rel="stylesheet">
        <!-- end of bootstrap -->
        <!-- page level css -->
        <link type="text/css" href="odw3/clear/vendors/themify/css/themify-icons.css" rel="stylesheet"/>
        <link href="odw3/clear/vendors/iCheck/css/all.css" rel="stylesheet">
        <link href="odw3/clear/vendors/bootstrapvalidator/css/bootstrapValidator.min.css" rel="stylesheet"/>
        <link href="odw3/clear/css/login.css" rel="stylesheet">
        <!--end page level css-->
        