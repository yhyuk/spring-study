<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>

	div > input[type=button] { margin-bottom: 100px; }
	div > input[type=text] { margin-bottom: 10px; }
	
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
		<div id="m3" class="alert alert-success"></div>
		<div><input type="button" id="btn3" class="btn btn-default" value="클릭" /></div>
		
		<h2>데이터 보내기(원자값)</h2>      
		<div id="m4" class="alert alert-success"></div>
		<div><input type="text" id="seq" placeholder="seq" class="form-control"/></div>
		
		<div><input type="button" id="btn4" class="btn btn-default" value="클릭" /></div>
		
		<h2>데이터 보내기(원자값) + 가져오기(복합값)</h2>      
		<div id="m5" class="alert alert-success"></div>
		<div><input type="text" id="seq5" placeholder="seq" class="form-control"/></div>
		
		<div><input type="button" id="btn5" class="btn btn-default" value="클릭" /></div>
		
		<h2>데이터 보내기(form)</h2>
		<!-- form을 사용하지만 ajax를 쓰기 때문에 method와 action은 안쓴다. -->
		<form id="form6">
			<div><input type="text" name="name" id="name6" class="form-control" placeholder="name" /></div>
			<div><input type="text" name="age" id="age6" class="form-control" placeholder="age" /></div>
			<div><input type="text" name="address" id="address6" class="form-control" placeholder="address" /></div>
			<div><input type="text" name="birthday" id="birthday6" class="form-control" placeholder="birthday" /></div>
			<div><input type="button"  value="클릭" id="btn6" class="btn btn-default"/></div>
		</form>      
		
		<h2>데이터 보내기(form)</h2>      
		<form id="form7">
			<div><input type="text" name="name" id="name7" class="form-control" placeholder="name" /></div>
			<div><input type="text" name="age" id="age7" class="form-control" placeholder="age" /></div>
			<div><input type="text" name="address" id="address7" class="form-control" placeholder="address" /></div>
			<div><input type="text" name="birthday" id="birthday7" class="form-control" placeholder="birthday" /></div>
			<div><input type="button"  value="클릭" id="btn7" class="btn btn-default"/></div>
		</form>      
   		   
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
					console.log(a, b, c);
				}
				
			});
			
		});
		
		$('#btn3').click(function () {
			
			$.ajax({
				
				type: 'GET',
				url: '/ajax/basic/m3.action',
				dataType: 'json',
				success: function(list) {
					
					// ** 자바스크립트 forEach, 제이쿼리 each
					$(list).each(function(index, item) {
						$('#m3').append('<div>' + item.seq + ', ' + item.name + ', ' + item.age + ', ' + item.address + ', ' + item.birthday +'</div>');
					});
					
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
				
			});
			
		});
		
		
		$('#btn4').click(function () {
			
			$.ajax({
				
				type: 'GET',
				url: '/ajax/basic/m4.action',
				data: 'seq=' + $('#seq').val(), // 서버에 전송할 데이터(seq=1) 만약 데이터가 더 있다면 &key=vallue&key=value.. 이런식으로 하면된다.
				//dataType: 
				//success: function() {
					
				//}, 
				
				// -> 일방적으로 데이터를 보내기만 하고, 돌려받을것이 없기때문에 dataType과 success는 쓰이지 않는다.
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
		});
		
		// 2번예제(데이터 가져오기-복합값) + 4번예제(데이터 보내기-원자값)
		$('#btn5').click(function() {
			
			$.ajax({
				
				type: 'GET',
				url: '/ajax/basic/m5.action',
				data: 'seq=' + $('#seq5').val(),
				dataType: 'json',
				success: function(dto) {
					$('#m5').text('seq: ' + dto.seq + ', name: ' + dto.name + ', age: ' + dto.age );
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
				
			});
		});
		
		$('#btn6').click(function() {
			
			$.ajax({
				
				type: 'POST',
				url: '/ajax/basic/m6.action',
				data: 
						'name=' + $('#name6').val() + 
						'&age=' + $('#age6').val() + 
						'&address=' + $('#address6').val() + 
						'&birthday=' + $('#birthday6').val(),
				dataType: 'json',
				success: function(result) {
					if (result == '1') {
						alert('성공');
					} else {
						alert('실패');
					}
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
				
			});
			
		});
		
		$('#btn7').click(function() {
			
			// 직렬화: 객체나 배열 등의 데이터를 하나의 연속된 문자열로 만드는 작업 
			// alert($('#form7').serialize());
			// -> 결과값 name=?&age=?&address=?..
			
			$.ajax({
				
				type: 'POST',
				url: '/ajax/basic/m6.action',
				data: $('#form7').serialize(),
				dataType: 'json',
				success: function(result) {
					if (result == '1') {
						alert('성공');
					} else {
						alert('실패');
					}
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
				
			});
			
		});
   	
	</script>
</body>
</html>















