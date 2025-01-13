<%@page import="bdo.srv.cfg.CfgAppCust"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<div id="bottom_outside">
    <div id="bottom_inside" class="container1">

        <p>
            Copyright &copy; 2008-<%= new GregorianCalendar().get(Calendar.YEAR) %> | <%= CfgAppCust.getInstance().getCompany() %> 
            <a href="<%= CfgAppCust.getInstance().getCompanyURL() %>" title="<%= CfgAppCust.getInstance().getCompany() %>"><%= CfgAppCust.getInstance().getCompanyDomain() %></a>
        </p>

    </div>
</div>