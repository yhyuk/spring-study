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
   	<!-- user2.jsp -->
	<div class="container">
		<h1 class="page-header">Ajax</h1>      
	  		
		<div id="output" class="alert alert-success"></div>
		
		<button id="btn" type="button" class="btn btn-default">유저수 가져오기</button>
		<button type="button" class="btn btn-default" onclick="$('#output').text('');">페이지 초기화</button>
			
		<hr>
		
		<h2>다른 업무</h2>
		
		<input type="text" class="form-control">
	  		
	  		   
	</div>   
   	
   	<script>
   	
		$('#btn').click(function() {
			
			// XMLHttpRequest
			// - 자바스크립트 비동기 통신 객체
			// - 서버와 데이터를 주고 받는 역할
			let ajax = new XMLHttpRequest();
			
			// console.log(XMLHttpRequest);
			
			/*
				onreadystatechange
				
				on 
				readystate 
				change
			*/
			
			ajax.onreadystatechange = function() {
				
				// console.log('readystate', ajax.readyState); // 0, 1, 2, 3, 4
				if (ajax.readyState == 4) {
					
					// readyState == 4 > 서버에서 데이터를 클라이언트(ajax)에게 반환 완료
					
					// 서버로부터 가져온 데이터
					// 1. ajax.responseText -> JSON 변환
					// 2. ajax.responseXML
					
					// console.log(ajax.responseText);
					$('#output').text('인원수: ' + ajax.responseText);
					
				}
				
			};		
			// ------------------------> ajax 설정 완료
			
			
			
			/*
				ajax 객체를 가지고 서버에게 GET 방식으로 페이지를 요청
				 - case1. <a href="/ajax/user/count.action">link</a>
				 - case2. <form method="GET" action="/ajax/user/count.action">
				 - case3. location.href = "/ajax/user/count.action";
				
				 case 3가지 전부 동일한 행동.
			*/
			// 연결 요청
			ajax.open('GET', '/ajax/user/count.action');
			
			// 데이터 전송(데이터 유무와 상관없이 반드시 실행) -> 연결 요청 완료
			ajax.send();
			
		});	
   	
	</script>
</body>
</html>