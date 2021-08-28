<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>

	.table > tbody > tr > th {
		vertical-align: middle !important;
	}

	#txtid {
		display: inline-block;
		width: 200px;
	}
	
	#result {
		color: tomato;
	}

</style>

</head>
<body>
   	<!-- ex01.jsp -->
	<div class="container">
		<h1 class="page-header">아이디 중복검사</h1>      
   		
   		<table class="table table-bordered">
   			<tr>
   				<th>아이디</th>
   				<td>
   					<input type="text" name="txtid" id="txtid" class="form-control" />
   					<input type="button" id="btnCheck" class="btn btn-default" value="중복검사"/>
   					<span id="result"></span>
   				</td>
   			</tr>
   		</table>
   		
   	</div>   
   
   	<script>
   	
   		$('#btnCheck').click(function () {
   			
   			if ($('#txtid').val() != '') {
   				
   				// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
   				$.ajax({
   					
   					type: 'GET',
   					url: '/ajax/login/idcheck.action',
   					data: 'id=' + $('#txtid').val(),
   					dataType: 'json',
   					success: function(result) {
   						if (result == '0') {
   							$('#result').text('사용 가능한 아이디입니다.');
   						} else {
   							$('#result').text('이미 사용중인 아이디입니다.');
   						}
   					},
   					error: function(a, b, c) {
   						console.log(a, b, c);
   					}
   					
   				});
   				
   			} else {
   				alert('아이디를 입력하세요.');
   				$('#txtid').focus();
   			}
   			
   		});
   	
	</script>
</body>
</html>