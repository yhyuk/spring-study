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
	<!-- spa.jsp -->
	<div class="container">
		<h1 class="page-header">SPA 페이지 방식(한장의 페이지에서 대부분의 업무를 처리)</h1>
		
		<table class="table table-bordered list">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>코드</th>
					<th>예시</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>		
		
		<div>
			<form id="form1">
				<table class="table table-bordered">
					<tr>
						<td><input type="text" name="name" class="form-control"></td>						
						<td><input type="color" name="rgb" class="form-control"></td>
						<td><input type="text" name="example" class="form-control"></td>
						<td><button type="button" id="btnAdd" class="btn btn-default">추가하기</button></td>
					</tr>
				</table>	
			</form>
		</div>		
		
	</div>	
	
	
	<script src="/rest/resources/js/jquery.serializeObject.js"></script>
	<script>
	
		//시작 > 데이터 가져오기
		$.ajax({
			type: 'GET',
			url: 'http://localhost:8090/rest/color',
			dataType: 'json',
			success: function(list) {
				
				$(list).each(function(index, item) {
					
					$('.list tbody').append('<tr><td>' + item.seq + '</td><td onclick="del();">' + item.name + '</td><td>' + item.rgb + '</td><td>' + item.example + '</td></tr>');
					
				});
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
			
		});
		
		
		
		
		$('#btnAdd').click(function() {
			
			//form-data 형식
			//$('#form1').serialize()
			
			//alert($('#form1').serializeObject());
			//console.log($('#form1').serializeObject());
			
			//자바스크립트 객체 > JSON 표현의 문자열로 변경
			let data = JSON.stringify($('#form1').serializeObject());
			//alert(data);
			
			
			//수정하기
			//type: 'PUT',
			//url: 'http://localhost:8090/rest/color/5',
			//data: data,
			//contentType: 'application/json;charset=UTF-8',
			
			//삭제하기
			//type: 'DELETE',
			//url: 'http://localhost:8090/rest/color/5',
			
			
			$.ajax({
				type: 'POST',
				url: 'http://localhost:8090/rest/color',
				dataType: 'json', //받는 데이터 형식
				data: data,
				contentType: 'application/json;charset=UTF-8',
				success: function(result) {
					if (result == 1) {
						//$('.list tbody').append('<tr><td>' + item.seq + '</td><td>' + item.name + '</td><td>' + item.rgb + '</td><td>' + item.example + '</td></tr>');
					} else {
						
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}				
			});
			
			
		});
		
		
		
		function del() {
			
			let td = event.srcElement;
			let seq = $(td).parent().children().eq(0).text();
			//alert(seq);
			
			//삭제하기
			//type: 'DELETE',
			//url: 'http://localhost:8090/rest/color/5',
			
			$.ajax({
				type: 'DELETE',
				url: 'http://localhost:8090/rest/color/' + seq,
				dataType: 'json',
				success: function(result) {
					if (result == 1) {
						$(td).parent().remove();
					} else {
						
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}				
			});
			
		}
		
		
		//RESTful API + Ajax 복습(정리)
		// -> 게시판 구현
	
	</script>
</body>
</html>












