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
   	<!-- add.jsp -->
	<div class="container">
		<h1 class="page-header">스프링 파일 업로드</h1>      
   		
   		<form method="POST" action="/file/addok.action" enctype="multipart/form-data">
   			<table class="table table-boardered">
   				<tr>
   					<th>이름</th>
   					<td><input type="text" name="name" class="form-control" value="홍길동" /></td>
   				</tr>
   				<tr>
   					<th>제목</th>
   					<td><input type="text" name="subject" class="form-control" value="파일 업로드 테스트"/></td>
   				</tr>
   				<tr>
   					<th>파일</th>
   					<td><input type="file" name="attach" class="form-control" /></td>
   				</tr>
   			</table>
   			
   			<div>
   				<button class="btn btn-default">등록하기</button>
   			</div>
   		</form>
   		
   		   
   	</div>   
   
   	<script>
	</script>
</body>
</html>