<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
#others {
	width: 800px;
	height: 300px;
}

#reqlist {
	margin: 0 auto;
	width: 800px;
	margin-bottom: 150px;
}

.from-box {
	margin-bottom: 20px;
	width: 500px;
}

.main-section-lesson {
	width: 1200px;
	margin: 35px auto;
	position: relative;
	left: 0;
	top: 0;
}

#reqinfo {
	margin: 30px auto;
}

.tit {
	font-weight: bold;
	font-size: 15px;
}

.infotable {
	margin-bottom: 80px;
	margin-top: 100px;
}

.infotable tr {
	margin-bottom: 50px;
}

th {
	background-color: #F2F2F2;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	vertical-align: middle;
	/* text-align: center; */
}

.infotable td, .infotable th {
	text-align: center;
}

span.star-prototype, span.star-prototype>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	width: 80px;
	display: inline-block;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 80px;
}

.button-box {
	width: 100%;
	display: flex;
	flex-direction: row-reverse;
}

.btn {
	margin-left: 5px;
}

label, textarea {
	font-size: .8rem;
	letter-spacing: 1px;
}

textarea {
	padding: 10px;
	width: 100%;
	line-height: 1.5;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-shadow: 1px 1px 1px #999;
	font-size: 15px;
}

label {
	display: block;
	margin-bottom: 10px;
}
</style>
<div class="main-section-lesson">

	<h2>헬퍼선택를 선택해주세요.</h2>
	<div id="reqlist">
		<div id="reqinfo">

			<input type="hidden" name="id" value="${lrdto.id}">
			<!-- 아이디 -->
			<table class="table table-bordered infotable">
				<tr>
					<th>종류</th>
					<th>세부종류</th>
				</tr>
				<tr>
					<td>${lrdto.kind}</td>
					<td>${lrdto.subkind}</td>
				</tr>

				<tr>
					<th>시작날짜</th>
					<th>종료날짜</th>
				</tr>
				<tr>
					<td>${fn:substring(lrdto.begindate,0,10)}</td>
					<td>${fn:substring(lrdto.enddate,0,10)}</td>
				</tr>
				<tr>
					<th>희망요일</th>
					<th>희망시간</th>
				</tr>
				<tr>
					<td>${lrdto.hopeweek}</td>
					<td>${lrdto.hopetime}</td>
				</tr>

				<tr>
					<th>목적</th>
					<th>방식</th>
				</tr>
				<tr>
					<td>${lrdto.perpose}</td>
					<td>${lrdto.method}</td>
				</tr>
				<tr>
					<th>실력</th>
					<th>기타사항</th>

				</tr>
				<tr>
					<td>${lrdto.skill}</td>
					<td>${lrdto.others==null?"없음":lrdto.others}</td>

				</tr>

			</table>

			<c:if test="${member.state eq '2'}">
				<div class="button-box">
					<button type="submit" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal">신청하기</button>
					<input type='button' class="btn btn-default" value="취소하기"
						onclick="history.back();">
				</div>
			</c:if>
				<!-- Modal -->
				<form method="POST" action="/helpme/lesson/reqlistcheck.action">
				<input type="hidden" value="${lessonSeq}" name="lessonSeq">
				<input type="hidden" value="${id}" name="id">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">신청하기</h4>
							</div>
							<div class="modal-body">
								<label>가격 <input name="price" type="number" class="form-control"
									placeholder="숫자로 입력해주세요." min="10000" step="1000" required></label> 
								<label>경력 <input name="carrer" type="number" class="form-control"
									placeholder="숫자로 입력해주세요." required></label>
									<label for="story">옵션</label>

								<textarea name="optoin" id="story" name="story" rows="5" cols="33">

								</textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소하기</button>
								<button type="submit" class="btn btn-primary">신청완료</button>
							</div>
						</div>
					</div>
				</div>
				</form>
			
		</div>

		<c:if test="${member.state eq '1'}">
			<table class="table table-bordered">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>별점</th>
					<th>가격</th>
					<th>옵션</th>
					<th>상태</th>
					<th>경력</th>
					<th>선택</th>
					<th>채팅</th>
				</tr>
				<c:forEach items="${list}" var="lvdto">
					<tr>
						<td id="lessonreqseq">${lvdto.lessonreqseq}</td>
						<td>${lvdto.id}</td>
						<td><span class="star-prototype">${lvdto.starpoint}</span><small>
								(${lvdto.starpoint})</small></td>
						<td>${lvdto.price}</td>
						<td>${lvdto.optoin}</td>
						<td id="matching">${lvdto.matching}</td>
						<td>${lvdto.carrer}년</td>
						<td><input type="button" class="btn btn-primary check"
							value="선택" id="check" title="원하시는 헬퍼와 매칭합니다."></td>
						<td><input type="button" class="btn btn-primary chat"
							value="채팅" id="chat" disabled onclick="fnchat();"></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

	</div>



	<!-- main-section-lesson -->
</div>

<script>
	if ($('#matching').text() == '매칭완료') {
		$('.btn').attr('disabled', true);
		$('.btn').attr('title', '헬퍼와 채팅이 가능합니다.');
		$('#chat').attr('disabled', false);
	}
	$('.check').click(function() {

		let checkBtn = $(this);
		let tr = checkBtn.parent().parent();
		let td = tr.children();
		let lessonreqseq = td.eq(0).text()

		$.ajax({
			type : 'POST',
			url : '/helpme/lesson/matching.action',
			data : 'lessonreqseq=' + lessonreqseq,
			dataType : 'json',
			success : function(result) {
				//alert(result);
				if (result == 1) {
					$('.btn').attr('disabled', true);
					$('.btn').attr('title', '헬퍼와 채팅이 가능합니다.');
					$('#chat').attr('disabled', false);

					$('#matching').html("매칭완료");
				}
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});

	});

	function fnchat() {
		var pop = window.open("/helpme/chat/chat.action", "pop",
				"width=570,height=500, scrollbars=yes, resizable=yes");
	}

	$.fn.generateStars = function() {
		return this.each(function(i, e) {
			$(e).html($('<span/>').width($(e).text() * 16));
		});
	};

	$('.star-prototype').generateStars();
</script>

