<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.main-section-lesson {
	width: 1200px;
	margin: 35px auto;
	position: relative;
	left: 0;
	top: 0;
	margin-bottom: 100px;
}

#reqinfo {
	margin: 30px auto;
}

	tr{
		cursor: pointer;
	}
</style>
<div class="main-section-lesson">

	<h2>요청내역 <small>클릭시 자세한 사항을 볼 수 있습니다.</small></h2>
	<div id="reqlist">
	<table class="table table-bordered table-hover">
	<tr>
		<th>아이디</th>
		<th>매칭여부</th>
		<th>가격</th>
		<th>종류</th>
		<th>주소</th>
		<th>시작날짜</th>
		<th>종료날짜</th>
		<th>옵션</th>
		<th>채팅</th>
	</tr>
<c:forEach items="${listcheck}" var="lrdto">
	
	 <tr onclick="location.href='/helpme/lesson/reqlistdetail.action?lessonSeq=${lrdto.lessonSeq}';">
	<td>${lrdto.id}</td>
	<td class="matching">${lrdto.matching}</td>
	<td>${lrdto.price}</td>
	<td>${lrdto.subkind}</td>
	<td>${lrdto.address}</td>
	<td>${fn:substring(lrdto.begindate,0,10)}</td>
	<td>${fn:substring(lrdto.enddate,0,10)}</td>
	<td>${lrdto.optoin}</td>
	<c:if test="${lrdto.matching == '대기중'}">
	<td><input type="button" class="btn btn-primary chat"
							value="채팅" id="chat" disabled onclick="fnchat();"></td>
	</c:if>
		<c:if test="${lrdto.matching == '매칭완료'}">
	<td><input type="button" class="btn btn-primary chat"
							value="채팅" id="chat" onclick="fnchat();"></td>
	</c:if>
	</tr>
	
</c:forEach>
</table>
</div>
</div>

<script type="text/javascript">

function fnchat() {
	var pop = window.open("/helpme/chat/chat.action", "pop",
			"width=570,height=500, scrollbars=yes, resizable=yes");
}
</script>
