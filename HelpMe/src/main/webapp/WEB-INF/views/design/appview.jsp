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

<div class="head">신청서 상세</div>
<table class="table">
	<tr>
		<th>제목</th>
		<td style="text-align: left;">${ dto.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td style="text-align: left;">${ dto.name }</td>
	</tr>
	<tr>
		<th>작성일자</th>
		<td style="text-align: left;">${ dto.regdate }</td>
	</tr>
	<tr>
		<th>요청 피드백</th>
		<td style="text-align: left; height: 200px;">${ dto.feedback }</td>
	</tr>
	<tr>
		<th>신청 내용</th>
		<td style="text-align: left; height: 200px;">${ dto.request }</td>
	</tr>
	<tr>
		<th>가격</th>
		<td style="text-align: left;">${ dto.price }</td>
	</tr>
	<tr>
		<th>참여 인원 수</th>
		<td style="text-align: left;">${ dto.attend }</td>
	</tr>
	<tr>
		<th>사무실 주소</th>
		<td style="text-align: left;">
			<c:if test="${ dto.address eq null }">
				주소 없음
			</c:if>
			${ dto.address }
		</td>
	</tr>
</table>

<div style="text-align: center; margin-top: 30px; margin-bottom: 100px;">

	<c:if test="${ member.state eq '1' }">
		<c:if test="${ dto.isReq eq 'n' }">
			<input type="button" value="수락하기" class="btn btn-success" 
				onclick="ok(${ dto.designSeq })"/>
			<input type="button" value="거절하기" class="btn btn-danger" 
				onclick="no(${ dto.designSeq })"/>
		</c:if>
		<input type="button" value="돌아가기" class="btn btn-default" 
		onclick="location.href='/helpme/design/reqlist.action?seq=${ dto.designSeq2 }';"/>
	</c:if>
	
	<c:if test="${ member.state eq '2' }">
		<input type="button" value="수정하기" class="btn btn-primary"
			onclick="#" />
		<input type="button" value="삭제하기" class="btn btn-danger"
			onclick="del(${ dto.designSeq })" />
		<input type="button" value="돌아가기" class="btn btn-default" 
		onclick="location.href='/helpme/design/helperlist.action?id=${ id }';"/>
	</c:if>
	
</div>


<script>

	function del(seq) {
	    let result = confirm("정말 삭제하시겠습니까?");
	    if (result) {
	       location.href = "/helpme/design/appdelformok.action?seq=" + seq;
	    } else {
	    	
		}
	}

	function ok(seq) {
	    let result = confirm("정말 수락하시겠습니까?");
	    if (result) {
	       location.href = "/helpme/design/appok.action?seq=" + seq + "&pseq=" + ${ dto.designSeq2 };
	    } else {
	    	
		}
	}
	
	function no(seq) {
	    let result = confirm("정말 거절하시겠습니까?");
	    if (result) {
	       location.href = "/helpme/design/appno.action?seq=" + seq + "&pseq=" + ${ dto.designSeq2 };
	    } else {
	    	
		}
	}

</script>