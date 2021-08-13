<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<tiles:insertAttribute name="asset"></tiles:insertAttribute>
<tiles:insertAttribute name="asset_admin"></tiles:insertAttribute>

<style>

</style>

</head>
<body>
   	<!-- layout/admin.jsp -->
	<main>
	
		<!-- 
			Tiles 장점
			2. 현재 페이지(레이아웃 페이지 or 템플릿 페이지) > 레이아웃만 구성하는 전문 페이지
		-->
	
		<tiles:insertAttribute name="mainmenu"></tiles:insertAttribute>
		
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
		
		<tiles:insertAttribute name="submenu"></tiles:insertAttribute>
	
	</main>
   
   	<script>
	</script>
</body>
</html>