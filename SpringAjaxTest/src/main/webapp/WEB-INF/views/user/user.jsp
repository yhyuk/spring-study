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
   		<button type="button" class="btn btn-default"
   			onclick="location.href='/ajax/user/user.action';">페이지 초기화</button>
   		
   		<hr />
   		
   		<h2>다른 업무</h2>
   		
   		<input type="text" class="form-control" />
   		
   		   
   	</div>   
   	
   	<script>
   	
		/*
			목적? 
			버튼 클릭 > 서버로부터 데이터를 가져와서 output에 출력하기
			
			이유? (********)
			1. 아까 본 페이지와 똑같이 생긴 페이지인데, 중간에 문자열 하나만 다른 페이지를
			   새롭게 다시 받아오기 위해서 > 비효율!!
			   
			2. output태그의 내용물을 가져오기 위해서!! 
			   > 현실: output 이외에 이전과 동일한 소스까지도 다시 가져온다!
		*/
		
   		$('#btn').click(function() {
   			location.href = '/ajax/user/user.action?btn=1';
   		});
   	
   	
	</script>
</body>
</html>