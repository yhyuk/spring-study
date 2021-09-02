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

#submitbtn, #backbtn {
	height: 40px;
	width: 100px;
	border: 1px solid #ccc;
	font-size: 16px;
}

#backbtn {
	background-color: #d6e3e6;
}

h2 {
	text-align: center;
}
</style>

<h2>요청서 작성</h2>
<form method="POST" action="/helpme/health/healthreqok.action"
	name="submitform">
	<table class="table table-bordered">
		<tr>
			<th>요청 제목 </th>
			<td colspan="3"><input type="text" name="subject"
				class="form-control" autocomplete="off" required></td>

			<th>하위카테고리</th>
			<td><select id="subcategory" name="subcategory"
				style="width: 100%; border: 1px solid #ccc;">
					<option value="헤어"
						<c:if test="${subcategory eq '헤어'}">selected</c:if>>헤어</option>
					<option value="퍼스널트레이닝"
						<c:if test="${subcategory eq '퍼스널트레이닝'}">selected</c:if>>퍼스널트레이닝</option>
					<option value="심리검사"
						<c:if test="${subcategory eq '심리검사'}">selected</c:if>>심리검사</option>
					<option value="네일"
						<c:if test="${subcategory eq '네일'}">selected</c:if>>네일</option>
					<option value="성인상담"
						<c:if test="${subcategory eq '성인상담'}">selected</c:if>>성인상담</option>
					<option value="필라테스"
						<c:if test="${subcategory eq '필라테스'}">selected</c:if>>필라테스</option>
			</select></td>
		</tr>
		<tr>
			<th>희망 금액</th>
			<td><input type="number" name="price" class="form-control"
				min="0"></td>
			<th style="width: 90px">희망 날짜</th>
			<td><input type="date" name="wishdate" class="form-control"></td>
			<th style="width: 120px;">거주지(시/구)</th>
			<td><input type="text" name="address" class="form-control"
				required></td>
		</tr>
		<tr>
			<th>요청내용</th>
			<td colspan="5"><textarea rows="10" cols="40" name="content"
					id="content" required></textarea></td>
		</tr>
		<tr>
			<th style="width: 135px;">이미지 첨부 URL</th>
			<td colspan="5"><input type="text" id="img" name="img"></td>
		</tr>
		<tr>
		<c:if test="${subcategory eq '퍼스널트레이닝' || subcategory eq '필라테스' }">
			<th style="width: 95px;">비만도 계산</th>
			<td colspan="5"> <a href="https://u-health.dobong.go.kr/hcal/fatness.asp" title="비만도 계산"
			onclick="window.open(this.href, '_blank', 'width=1000px, height=1000px'); return false;" >
			비만도 계산해보기</a>
				</td>
		</c:if>
		<c:if test="${subcategory eq '심리검사' || subcategory eq '성인상담' }">
			<th style="width: 95px;">심리검사 </th>
			<td colspan="5"> <a href="https://trost.co.kr/service/test/" onclick="window.open(this.href, '_blank', 'width=1000px, height=1000px'); return false;"	 title="심리검사" >무료 심리검사 해보기</a>
				</td>
		</c:if>
		</tr>

	</table>

	<div>
		<button onclick="confirmModal()" type="submit" id="submitbtn"
			class="btn btn-default">요청서 제출</button>
		<button type="button" class="btn btn-default" style="float: right;"
			id="backbtn" onclick="history.back();">돌아가기</button>
	</div>
	<input type="hidden" name="id" value="${id}">

</form>
<script>
	function confirmModal() {
		if (confirm("요청서를 제출 하시겠습니까??") == true) { //확인

			document.submitform.submit();

		} else { //취소

			return false;

		}
	}
</script>


