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
   	<!-- user.jsp -->
	<div class="container">
		<h1 class="page-header">Ajax</h1>      
   		
   		<!--  
   		
   			AJAX
   			- Asynchronous JavaScript and XML
   			- 비동기 자바스크립트 그리고 XML
   			- 자바스크립트를 사용한 서버와 통신하는 기술(서버와 데이터를 주고 받는 기술)
   			- 브라우저를 깜빡임(새로고침)없이 내용을 새로 고치는 기술이요.
   			- 자바스크립트 기술
   			
   			순수 Ajax
   			
   			jQuery Ajax
   		-->
   		
   		<div id="output" class="alert alert-success">
   			<c:if test="${ empty count }">
   			&nbsp;
   			</c:if>
   			<c:if test="${ not empty count }">
   			유저 수: ${ count }명
   			</c:if>
   		</div>
   		
   		<button type="button" id="btn"  class="btn btn-default">유저 수 가져오기</button>
   		<button type="button" class="btn btn-default">페이지 초기화</button>
   		
   		<hr />
   		
   		<h2>다른 업무</h2>
   		
   		<input type="text" class="form-control" />
   		
   		   
   	</div>   
   	
   	<script>
   	
   		$('#btn').click(function() {
   			
   			// XMLHttpRequest
   			// - 자바스크립트 비동기 통신 객체
   			// - 서버와 데이터를 주고 받는 역할
   			let ajax = new XMLHttpRequest();
   			
   		});
   	
	</script>
</body>
</html>