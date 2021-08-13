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
   	<!-- result.jsp -->
	<div class="container">
		<h1 class="page-header">결과</h1>      
   		   
   		 <div>insert 작업 결과: ${ addResult }</div>
   		 <div>delete 작업 결과: ${ delResult }</div>
   		 <div>update 작업 결과: ${ updateResult }</div>
   		 <%-- <div>HashMap 작업 결과: ${ result }</div> --%>
   		 <div>selectOne 작업 결과(매개변수X, 반환값O): ${ count }</div>
   		 <div>selectOne 작업 결과(매개변수O, 반환값O): ${ memo }</div>
   		 <div>단일레코드: ${ dto }</div>
   		 <c:forEach items="${ list }" var="dto">
   		 	<div>다중레코드:${dto.seq }, ${dto.name }</div>
   		 </c:forEach>
   	</div>   
   
   	<script>
	</script>
</body>
</html>