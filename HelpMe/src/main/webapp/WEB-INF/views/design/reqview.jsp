<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

	.head {
		font-size: 1.6em;
		font-weight: bold;
		text-align: center;
		margin-bottom: 20px;
		margin-top: 30px;
	}

	table {
		margin-left:auto; 
    	margin-right:auto;
    	width: 1000px;
    	border: 1px solid #CCC;
    	border-collapse: separate;
		border-spacing: 10px 10px;
	}
	
	table tr th {
		text-align: center;
		width: 200px;
	}
	
	table tr td {
		text-align: left;
	}

</style>

<div class="head">요청서 상세</div>
<table class="table table-bordered">
	<tr>
		<th>서비스</th>
		<td style="text-align: left;">${ dto.category }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left;">${ dto.title }</td>
	</tr>
	<tr>
		<th>요청 내용</th>
		<td style="text-align: left;">${ dto.ask }</td>
	</tr>
	<tr>
		<th>기획 내용</th>
		<td style="text-align: left;">${ dto.plan }</td>
	</tr>
	<tr>
		<th>참고 내용</th>
		<td style="text-align: left;">${ dto.refer }</td>
	</tr>
	<tr>
		<th>시작 희망 날짜</th>
		<td style="text-align: left;">${ dto.startDay }</td>
	</tr>
	<tr>
		<th>종료 희망 날짜</th>
		<td style="text-align: left;">${ dto.endDay }</td>
	</tr>
	<tr>
		<th>방문 희망 주소</th>
		<td style="text-align: left;">${ dto.address }</td>
	</tr>
	<tr>
		<th>희망 숙련도</th>
		<td style="text-align: left;">${ dto.ability }</td>
	</tr>
</table>

<div style="text-align: center; margin-top: 30px; margin-bottom: 100px;">
	<c:if test="${ member.state eq '1' }">
	<input type="button" value="삭제하기" class="btn btn-danger" 
		onclick="del()"/>
	<input type="button" value="수정하기" class="btn btn-success" />
	</c:if>
	
	<c:if test="${ member.state eq '2' }">
		<c:if test="${ dto.isPass eq 'n' }">
		<input type="button" value="신청하기" class="btn btn-primary"
			onclick="location.href='/helpme/design/appform.action?seq=${ dto.designSeq }'" />
		</c:if>
	</c:if>
	<input type="button" value="돌아가기" class="btn btn-default" 
		onclick="location.href='/helpme/design/mylist.action?id=${ id }';"/>
</div>


<script>

	function del() {
	    let result = confirm("정말 삭제하시겠습니까?");
	    if (result) {
	    	location.href = "/helpme/design/delformok.action?seq=" + ${ dto.designSeq };
	    } else {
	    	alert('실패');
		}
	}

</script>