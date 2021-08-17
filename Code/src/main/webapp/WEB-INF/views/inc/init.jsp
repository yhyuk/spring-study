<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });
</script>

<%

	if (request.getServletPath().endsWith("list.jsp")) {
		out.println("<script src='/code/resources/js/list.js'></script>");
	} else if (request.getServletPath().endsWith("add.jsp")) {
		out.println("<script src='/code/resources/js/add.js'></script>");
	} else if (request.getServletPath().endsWith("view.jsp")) {
		out.println("<script src='/code/resources/js/view.js'></script>");
	}

%>