<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.main-section-lesson {
	width: 1200px;
	margin: 35px auto;
	position: relative;
	left: 0;
	top: 0;

	}
	
	th{
		text-align : center;
	}
	
	td:nth-child(1){width:70px; text-align:center;}
	td:nth-child(2){width:70px; text-align:center;}
	td:nth-child(3){width:80px; text-align:center;}
	td:nth-child(4){width:200px; text-align:center;}
	td:nth-child(5){width:120px; text-align:center;}
	td:nth-child(6){width:120px; text-align:center;}
	td:nth-child(7){width:120px; text-align:center;}
	td:nth-child(8){width:120px; text-align:center;}
	td:nth-child(9){width:120px; text-align:center;}
	td:nth-child(10){width:100px; text-align:center;}
	td:nth-child(11){width:50px; text-align:center;}
	
	tr{
		cursor: pointer;
	}

	

</style>

<div class="main-section-lesson">
<h2>조회하고 싶으신 글을 선택해주세요.</h2>
	<table class="table table-bordered table-hover">
		<tr>
			<th>이름</th>
			<th>종류</th>
			<th>세부종류</th>
			<th>주소</th>
			<th>시작날짜</th>
			<th>종료날짜</th>
			<th>희망요일</th>
			<th>희망시간</th>
			<th>기타사항</th>
			<th>목적</th>
			<th>실력</th>

		</tr>
		
		<c:forEach items="${list}" var="lrdto">
		
		<tr onclick="location.href='/helpme/lesson/reqlistdetail.action?lessonSeq=${lrdto.lessonSeq}';">
			<td>${lrdto.name}</td>
			<td>${lrdto.kind}</td>
			<td>${lrdto.subkind}</td>
			<td>${lrdto.address}</td>
			<td>${fn:substring(lrdto.begindate,0,10)}</td>
			<td>${fn:substring(lrdto.enddate,0,10)}</td>
			<td>${lrdto.hopeweek}</td>
			<td>${lrdto.hopetime}</td>
			<td>${lrdto.others}</td>
			<td>${lrdto.perpose}</td>
			<td>${lrdto.skill}</td>
			

		</tr>
		
		</c:forEach>
	
	</table>


</div>