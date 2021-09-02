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
   	<!-- page.jsp -->
	<div class="container">
		<h1 class="page-header">일반적인 웹 페이지 방식</h1>
		
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>코드</th>
				<th>예시</th>
			</tr>
			<c:forEach items="${ list }" var="dto">
			<tr>
				<td>${ dto.seq }</td>
				<td>${ dto.name }</td>
				<td>${ dto.rgb }</td>
				<td>${ dto.example }</td>
			</tr>
			</c:forEach>
		</table>      
   		   
   	</div>   
   
   	<script>
	</script>
</body>
</html>