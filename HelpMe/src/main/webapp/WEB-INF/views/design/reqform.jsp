<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 일반 사용자 > 요청서 작성 -->
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

<div class="head">요청서 작성</div>
<form method="POST" action="/helpme/design/reqformok.action">

	<table>
		<tr>
			<th>서비스</th>
			<td style="text-align: left;">${ service }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" class="form-control" style="width: 700px;" placeholder="제목을 입력해주세요."/></td>
		</tr>
		<tr>
			<th>요청 내용</th>
			<td><textarea name="ask" class="area form-control" style="width: 700px; height: 150px;" placeholder="요청 사항을 자유롭게 작성해주세요.(*필수 기재 사항*)"></textarea></td>
		</tr>
		<tr>
			<th>기획 내용</th>
			<td><textarea name="plan" class="area form-control" style="width: 700px; height: 150px;" placeholder="기획 사항을 자유롭게 작성해주세요.(기재 안하셔도 됩니다.)"></textarea></td>
		</tr>
		<tr>
			<th>참고 내용</th>
			<td><textarea name="refer" class="area form-control" style="width: 700px; height: 150px;" placeholder="참고 사항을 자유롭게 작성해주세요.(기재 안하셔도 됩니다.)"></textarea></td>
		</tr>
		<tr>
			<th>시작 희망 날짜</th>
			<td><input type="date" name="startDay" id="startDate" class="form-control" style="width: 200px;"></td>
		</tr>
		<tr>
			<th>종료 희망 날짜</th>
			<td><input type="date" name="endDay" id="endDate" class="form-control" style="width: 200px;"></td>
		</tr>
		<tr>
			<th>방문 희망 주소</th>
			<td><input type="text" name="address" class="form-control" style="width: 400px;" placeholder="방문 주소를 입력해주세요.(기재 안하셔도 됩니다.)" /></td>
		</tr>
		<tr>
			<th>희망 숙련도</th>
			<td style="text-align: left;">
				<input type="radio" name="ability" value="고급">고급
				<input type="radio" name="ability" value="중급">중급
				<input type="radio" name="ability" value="초급">초급
				<input type="radio" name="ability" value="상관없음">상관없음
			</td>
			
			
		</tr>
	
	</table>
	
	<input type="hidden" name="category" value="${ service }"/>
	<input type="hidden" name="id" value="${ id }"/>
	
	<div style="text-align: center; margin-top: 30px; margin-bottom: 100px;">
		<input type="submit" value="작성하기" class="btn btn-success" />
		<input type="button" value="돌아가기" class="btn btn-default" 
			onclick="location.href='/helpme/design/list.action';"/>
	</div>

</form>

<script>

	var listVar = $('input[name=ability]:checked').val();
	console.log(listVar);
	

</script>
