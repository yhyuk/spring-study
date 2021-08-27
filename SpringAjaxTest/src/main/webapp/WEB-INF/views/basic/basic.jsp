<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>

	h2 + div + div {
		margin-bottom: 100px;
	}
   
</style>

</head>
<body>
   	<!-- basic.jsp -->
	<div class="container">
		<h1 class="page-header">jQuery Ajax</h1>
		
		<h2>데이터 가져오기(원자값)</h2>
		<div id="m1" class="alert alert-info"></div>
		<div><input type="button" id="btn1" class="btn btn-default" value="클릭" /></div>
		
		<h2>데이터 가져오기(복합값 - 단일 객체)</h2>     
		<div id="m2" class="alert alert-info"></div>
		<div><input type="button" id="btn2" class="btn btn-default" value="클릭" /></div>
		 

		<h2>데이터 가져오기(복합값 - 다중 객체)</h2>
		
		<h2>데이터 보내기(원자값)</h2>      
		
		<h2>데이터 보내기(다중값)</h2>      
		
		<h2>데이터 보내기(form)</h2>      
		
		<h2>데이터 보내기(form)</h2>      
   		   
   	</div>   
   
   	<script>
   	
		/*
		
		[ jquery ajax 내부 프로퍼티 작성형식 ] 
		
		$.ajax({
			type: '', 					// 요청 메소드(GET, POST..)
			url: '',					// 요청 URL(서버측 주소)
			data: '',					// 보낼 데이터(key=value&key=value..)
			dataType: '', 				// 응답 데이터 형식(text(default), json, xml)
			contentType: '', 			// 보낼 데이터 형식
			success: function() {}, 	// 응답 데이터 콜백 함수
			error: function(a, b, c) {} // 예외 콜백 함수
		});
		
		*/
   	
   		$('#btn1').click(function() {
   			
   			// 데이터 가져오기(원자값)
   			$.ajax({
   				type: 'GET',
   				url: '/ajax/basic/m1.action',
   				dataType: 'text',
   				success: function(result) {
   					$('#m1').text(result);
   				},
   				error: function(a, b, c) {
   					console.log(a, b, c);
   				}
   			});
   			
   		});
		
		$('#btn2').click(function() {
			
			$.ajax({
				
				type: 'GET',
				url: '/ajax/basic/m2.action',
				dataType: 'json',
				success: function(obj) {
					// alert(obj.name);
					$('#m2').text(obj.seq + ', ' + obj.name + ', ' + obj.address);
				},
				error: function(a, b, c) {
					console.log(a, b, c)
				}
				
			});
			
		});
   	
	</script>
</body>
</html>