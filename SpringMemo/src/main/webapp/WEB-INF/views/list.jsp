<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>

	table {
		text-align: center;
	}
	
	table tr th {
		text-align: center;
	}
   
</style>

</head>
<body>
   	<!-- list.jsp -->
	<div class="container">
		<h1 class="page-header">Memo</h1>      
   		   
   		<table class="table table-bordered">
   			<tr>
   				<th>번호</th>
   				<th>메모</th>
   				<th>이름</th>
   				<th>날짜</th>
   				<th>분류</th>
   				<th>삭제</th>
   			</tr>
			<c:forEach items="${ list }" var="dto">
   			<tr>
   				<td>${ dto.seq }</td>
   				<td>${ dto.memo }</td>
   				<td>${ dto.name }</td>
   				<td>${ dto.regdate }</td>
   				<td>
   					<a href="/spring/list.memo?category=${ dto.category }">${ dto.category }</a>
   				</td>
   				<td><button type="button" class="btn btn-default btn-sm"
   							onclick="location.href='/spring/delok.memo?seq=${ dto.seq}';">삭제하기</button>
   				</td>
   			</tr>
			</c:forEach>
   		</table>
   		
   		<div>
   			<button type="button" class="btn btn-default" 
   				onclick="location.href='/spring/add.memo';">메모쓰기</button>
   			<button type="button" class="btn btn-default" 
   				onclick="location.href='/spring/list.memo';">전체보기</button>
   		</div>
   		   
   		   
   	</div>   
   
   	<script>
	</script>
</body>
</html>