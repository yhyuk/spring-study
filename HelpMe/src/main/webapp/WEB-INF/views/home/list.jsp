<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body > .main-section {
	width: 1100px;

}
</style>
<body>
	<table class="table">
		<tr>
			<th scope="col">서비스</th>
			<th scope="col">아이디</th>
			<th scope="col">제목</th>
			<th scope="col">날짜</th>
			<th scope="col">주소</th>
			<th scope="col">진행상황</th>
		</tr>
		<tbody>
		

		<c:forEach items="${list}" var="dto">
				<tr>
					<td >${dto.service}</td>
					<td >${dto.id}</td>
					<td>${dto.title}</td>
					<td>${dto.regdate}</td>
					<td>${dto.address}</td>
					
					<c:if test="${dto.isApply == 'n'}">
						<td><button type="button" class="btn btn-success">요청중</button></td>
					</c:if>
					<c:if test="${dto.isApply == 'y'}">
						<td><button type="button" class="btn btn-danger">완  료</button></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>