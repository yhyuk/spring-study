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
		<h1 class="page-header">스프링 업로드 결과</h1>      
   		
   		<!-- + Ajax -> 다운로드 횟수 Update -->
		<a href="/file/resources/files/${ filename }" download>첨부 파일 다운로드: ${filename}</a>
		
		<hr>
		
		<a href="/file/download.action?filename=${filename}">첨부 파일 다운로드: ${filename}</a>
   		   
   	</div>   
   
   	<script>
	</script>
</body>
</html>