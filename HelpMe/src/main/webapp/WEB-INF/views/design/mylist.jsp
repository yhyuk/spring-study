<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

	.head {
		font-size: 1.6em;
		font-weight: bold;
		text-align: center;
		margin-bottom: 10px;
		margin-top: 30px;
		margin-bottom: 30px;
	}

	.back {
		text-align: right;
		margin-bottom: 100px;
	}
	
	table tr th:nth-child(1) { width: 100px; }
	table tr th:nth-child(2) { width: 150px; }
	table tr th:nth-child(3) { width: auto; }
	table tr th:nth-child(4) { width: 100px; }
	table tr th:nth-child(5) { width: 150px; }
	table tr th:nth-child(6) { width: 100px; }

</style>

<div class="head">나의 요청 리스트</div>
<!-- 일반 사용자 > 요청 목록 -->
<c:forEach items="${ list }" var="list">

	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>숙련도</th>
			<th>처리상태</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>${ list.designSeq }</td>
			<td>${ list.category }</td>
			<td>
				<a href="/helpme/design/view.action?seq=${ list.designSeq }">${ list.title }</a>
			</td>
			<td>${ list.ability }</td>
			<td>
				<c:if test="${ list.isPass eq 'n' }">처리 대기</c:if>
				<c:if test="${ list.isPass eq 'y' }">처리 완료</c:if>
			</td>
			<td>${ list.cnt }</td>
		</tr>
	</table>

</c:forEach>

<div class="back"><input type="button" class="btn btn-default" value="돌아가기" 
	onclick="location.href='/helpme/design/list.action';"/></div>
	
	
	
	
	
