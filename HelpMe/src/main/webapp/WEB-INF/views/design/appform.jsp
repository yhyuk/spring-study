<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헬퍼 사용자 > 신청서 작성 -->
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
		border-spacing: 10px 30px;
		text-align: center;
	}
	
	table tr th {
		text-align: center;
	}
	
	.area {
		width:600px;
		resize: none;
	}

</style>

<div class="head">신청서 작성</div>
<form method="POST" action="/helpme/design/appformok.action">

	<table>
		<tr>
			<th>요청서 번호</th>
			<td style="text-align: left;">${ seq }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" class="form-control" style="width: 700px;" placeholder="제목을 입력해주세요."/></td>
		</tr>
		<tr>
			<th>요청 피드백</th>
			<td><textarea name="feedback" class="area form-control" style="width: 700px; height: 150px;" placeholder="요청 피드백을 작성해주세요.(*필수 기재 사항*)"></textarea></td>
		</tr>
		<tr>
			<th>신청 내용</th>
			<td><textarea name="request" class="area form-control" style="width: 700px; height: 150px;" placeholder="신청 내용을 정확히 작성해주세요.(*필수 기재 사항*)"></textarea></td>
		</tr>
		<tr>
			<th>작업실 주소</th>
			<td><input type="text" name="address" class="area form-control" style="width: 400px;" placeholder="작업실 주소를 작성해주세요.(기재 안하셔도 됩니다.)" /></td>
		</tr>
		<tr>
			<th>희망 가격</th>
			<td><input type="number" name="price" class="form-control" style="width: 400px;" placeholder="희망 가격을 작성해주세요.(*필수 기재 사항*)" /></td>
		</tr>
		<tr>
			<th>참여 인원 수</th>
			<td><input type="number" name="attend" class="form-control" style="width: 400px;" placeholder="참여 인원 수를 작성해주세요.(*필수 기재 사항*)" /></td>
		</tr>
	</table>
	
	<input type="hidden" name="designSeq2" value="${ seq }"/>
	<input type="hidden" name="id" value="${ id }"/>
	
	<div style="text-align: center; margin-top: 30px; margin-bottom: 100px;">
		<input type="submit" value="작성하기" class="btn btn-success" />
		<input type="button" value="돌아가기" class="btn btn-default" 
			onclick="location.href='/helpme/design/list.action';"/>
	</div>

</form>

<script>

</script>
