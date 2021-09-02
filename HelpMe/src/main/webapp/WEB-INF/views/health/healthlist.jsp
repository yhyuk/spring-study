<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.modal-content {
	position: relative;
	top: 210px;
	width: 1125px;
	left: -164px;
	height: 1050px;
}

.table {
	border-bottom: 1px #ddd solid;
}
</style>

<table class="table">
	<tr>
		<th>No</th>
		<th>제목</th>
		<th>신청수</th>
		<th>조회수</th>
		<th>세부 카테고리</th>
		<th>지역</th>
		<th>매칭여부</th>
		<th>작성일자</th>
	</tr>
	<c:forEach items="${list }" var="dto">
		<!-- 헬퍼인 경우 본인 하위카테고리만 확인 가능 -->
		<c:if test="${ member.state eq '2' }">
			<tr>
				<td>${dto.healthseq}</td>

				<td><a onclick="fnModuleInfo('${dto.healthseq}')"
					style="cursor: pointer;" title="상세보기"> ${dto.subject} <c:if
							test="${not empty dto.img }">
				📷
			</c:if>

				</a></td>
				<td>${dto.requestcnt}</td>
				<td>${dto.viewcnt}</td>
				<td>${dto.subcategory}</td>
				<td>${dto.address}</td>
				<td><c:if test="${dto.matching eq 'n' }"> 진행중 </c:if> <c:if
						test="${dto.matching eq 'y' }"> 완료 </c:if></td>
				<td style="font-size: 12px;">${dto.regdate}</td>
			</tr>
		</c:if>
		<!-- 일반 사용자 + 본인이 작성한 글 조회 -->
		<c:if test="${ member.state eq '1' && id eq dto.id  }">
			<tr>
				<td>${dto.healthseq}</td>

				<td><a onclick="fnModuleInfo('${dto.healthseq}')"
					style="cursor: pointer;" title="상세보기"> ${dto.subject} <c:if
							test="${not empty dto.img }">
				📷
			</c:if>

				</a></td>
				<td>${dto.requestcnt}</td>
				<td>${dto.viewcnt}</td>
				<td>${dto.subcategory}</td>
				<td>${dto.address}</td>
				<td>
				<c:if test="${dto.matching eq 'n' }"> <span style="color: cornflowerblue;"> 진행중 </span> </c:if> 
				<c:if test="${dto.matching eq 'y' }"> <span style="color: tomato;">완료</span> </c:if>
				</td>
				<td style="font-size: 12px;">${dto.regdate}</td>
			</tr>

		</c:if>
	</c:forEach>
</table>
<div>

	<button type="button" class="btn btn-primary" style="float: right;"
		onclick="location.href='/helpme/health/main.action';">메인화면으로
		가기</button>
</div>


<!-- Moa Modal Button -->
<!-- <a onclick="fnModuleInfo()">  </a> -->

<!-- Moa Modal-->
<div class="modal fade" id="MoaModal" tabindex="-1" role="dialog"
	aria-labelledby="historyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document"
		style="position: static;">
		<div class="modal-content"></div>
	</div>
</div>

<br>
<br>
<br>
<br>




<script>
	/*모달*/
	function fnModuleInfo(seq) {
		$('#MoaModal .modal-content').load(
				"/helpme/health/healthview.action?healthseq=" + seq);
		$('#MoaModal').modal();

	}
</script>