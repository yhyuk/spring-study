<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
   
</style>

</head>
<body>
   	<!--  -->
   	<h1>결과 페이지</h1>
   	
   	
   	<div><a href="/spring/list.action">목록보기</a></div>
   	<div><a href="/spring/add.action">글쓰기(회원전용)</a></div>
   	<div><a href="/spring/view.action">글보기</a></div>
   	<div><a href="/spring/login.action">로그인</a></div>
   	<div><a href="/spring/logout.action">로그아웃</a></div>
   	<hr />
   	
   	<c:if test="${ empty id }">로그인 전입니다.</c:if>
   	<c:if test="${ not empty id }">${ id } 로그인 상태입니다.</c:if>
</body>
</html>