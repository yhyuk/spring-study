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
	
	table tr th:nth-child(1) { width: 150px; }
	table tr th:nth-child(2) { width: 100px; }
	table tr th:nth-child(3) { width: auto; }
	table tr th:nth-child(4) { width: 150px; }
	table tr th:nth-child(5) { width: 100px; }
	table tr th:nth-child(6) { width: 100px; }
	table tr th:nth-child(7) { width: 200px; }
	
	table tr:hover { background-color: #EEE; }

</style>

<div class="head">헬퍼 신청 리스트</div>
<!-- 일반 사용자 > 헬퍼 신청 리스트 -->
	<table class="table table-bordered">
		<tr>
			<th>작성일자</th>
			<th>이름</th>
			<th>제목</th>
			<th>가격</th>
			<th>참여 인원 수</th>
			<th>처리상태</th>
			<th>수락/거절</th>
		</tr>
		<c:forEach items="${ list }" var="list">
		<tr>
			<td>${ list.regdate }</td>
			<td>${ list.name }</td>
			<td>
				<a href="/helpme/design/appview.action?seq=${ list.designSeq }">${ list.title }</a>
			</td>
			<td>${ list.price }원</td>
			<td>${ list.attend }</td>
			<td>
				<c:if test="${ list.isReq eq 'n' || list.isPass eq 'n' }">대기중</c:if>
				<c:if test="${ list.isReq eq 'x' && list.isPass eq 'x' }">거절</c:if>
				<c:if test="${ list.isReq eq 'y' && list.isPass eq 'y' }">완료</c:if>
			</td>
			<td>
				<c:if test="${ list.isReq eq 'n' }">
				<input type="button" class="btn btn-primary" value="신청 수락"
					onclick="ok(${ list.designSeq }, ${ list.designSeq2 })"/>
				<input type="button" class="btn btn-danger" value="신청 거절"
					onclick="no(${ list.designSeq }, ${ list.designSeq2 })"/>
				</c:if>
				<c:if test="${ list.isReq eq 'y' }">
					신청을 <span style="color: cornflowerblue; ">수락</span> 했습니다.
				</c:if>
				<c:if test="${ list.isReq eq 'x' }">
					신청을 <span style="color: tomato; ">거절</span> 했습니다.
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>



<div class="back"><input type="button" class="btn btn-default" value="돌아가기" 
	onclick="location.href='/helpme/design/mylist.action?id=${ id }';"/></div>
	
<script>

	function ok(seq, pseq) {
	    let result = confirm("정말 수락하시겠습니까?");
	    if (result) {
	       location.href = "/helpme/design/appok.action?seq=" + seq + "&pseq=" + pseq;
	    } else {
	    	
		}
	}
	
	function no(seq, pseq) {
	    let result = confirm("정말 거절하시겠습니까?");
	    if (result) {
	       location.href = "/helpme/design/appno.action?seq=" + seq + "&pseq=" + pseq;
	    } else {
	    	
		}
	}

</script>	
