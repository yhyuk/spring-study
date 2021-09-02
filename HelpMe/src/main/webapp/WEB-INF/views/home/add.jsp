<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

body > section > form > table > tbody > tr:nth-child(7) > td:nth-child(2) > textarea {

	height: 300px;

}

</style>
<body>



<form method="POST" action="/helpme/home/addok.action">        
<table class="table">
	<tr>
		<td>서비스</td>
		<td>
		<select name="service" id="service" class="form-control">
			<option value="인테리어">인테리어</option>
			<option value="해충방역">해충방역</option>
			<option value="입주청소">입주청소</option>
			<option value="세탁기청소">세탁기청소</option>
			<option value="에어컨청소">에어컨청소</option>
			<option value="도배/장판">도배/장판</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>종류</td>
		<td>
			<select name="building" id="building" class="form-control">
			<option value="아파트">아파트</option>
			<option value="빌라">빌라</option>
			<option value="원룸">원룸</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" id="title" class="form-control"></td>
	</tr>
	<tr>
		<td>면적</td>
		<td><input type="text" name="area" id="area" class="form-control"></td>
	</tr>
	<tr>
		<td>방갯수</td>
		<td><input  type="text" name="roomCnt" class="form-control"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input  type="text" name="address" class="form-control"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" class="form-control" required ></textarea></td>
	</tr>


</table>

		<div class="btns">
			<button type="button" class="btn btn-default" onclick="location.href='/helpme/home/index.action';">뒤로가기</button>
			<button type="submit" class="btn btn-primary">등록하기</button>
		</div>



		<input type="hidden" name="homeSeq">
</form>



</body>
</html>