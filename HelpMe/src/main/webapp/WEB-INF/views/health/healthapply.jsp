<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 0 1rem;
}

/* Button */
[type=submit] {
	display: inline-block;
	vertical-align: middle;
	white-space: nowrap;
	cursor: pointer;
	margin: .25rem 0;
	padding: .5rem 1rem;
	border: 1px solid #01c7ae;
	border-radius: 6px;
	background: #01c7ae;
	color: white;
	font-weight: 600;
	text-decoration: none;
	font-family: sans-serif;
	font-size: .95rem;
	height: 35px;
}

#subcategory {
	height: 36px;
	width: 100%;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#content, #img {
	border-radius: 4px;
	width: 100%;
	border: 1px solid #ccc;
}
#submitbtn , #backbtn{
	height: 40px;
	width: 100px;
	border: 1px solid #ccc;
	font-size: 16px;
}

#backbtn{
background-color: #d6e3e6;
}

h2 {
text-align: center;
}
</style>


<h2>신청서 작성</h2>
<form method="POST" action="/helpme/health/healthapplyok.action" name="submitform">
	<table class="table table-bordered">
		<tr>
			<th>요청 제목</th>
			<td colspan="3">${dto.subject }</td>

			<th>하위카테고리</th>
			<td>${dto.subcategory }</td>
		</tr>
		<tr>
			<th>견적 금액</th>
			<td><input type="number" name="helperprice" class="form-control"
				min="0"></td>
			<th>희망 날짜</th>
			<td>${dto.wishdate }</td>
			<th>거주지(시/구)</th>
			<td>${dto.address }</td>
		</tr>
		<tr>
			<th>신청내용</th>
			<td colspan="5"><textarea rows="10" cols="40" name="content"
					id="content" required></textarea></td>
		</tr>
	

	</table>
	<input type="hidden" name="healthseq" value="${dto.healthseq }">
	<input type="hidden" name="id" value="${id }">
	
	<div>
		<button onclick="confirmModal()" type="submit" id="submitbtn"
			class="btn btn-default" >신청서 제출</button>
		<button type="button" class="btn btn-default" style="float: right;" id="backbtn"
			onclick="history.back();">돌아가기</button>
	</div>

</form>
<script>
	function confirmModal() {
		if (confirm("신청서를 제출 하시겠습니까??") == true){    //확인

		     document.submitform.submit();

		 }else{   //취소

		     return false;

		 }
	}
</script>


