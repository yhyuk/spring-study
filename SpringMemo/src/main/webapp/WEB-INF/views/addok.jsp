<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>
   
</style>

</head>
<body>
   	<!-- addok.jsp -->
	<div class="container">
		<h1 class="page-header"></h1>      
   		   
   	</div>   
   
   	<script>
   	
   		<c:if test="${ result == 1 }">
   			alert('성공!!');
   			location.href = '/spring/list.memo';
   		</c:if>	
   		
   		<c:if test="${ result == 0 }">
			alert('실패!!');
   			location.href = '/spring/list.memo';
   		</c:if>
   	
	</script>
</body>
</html>