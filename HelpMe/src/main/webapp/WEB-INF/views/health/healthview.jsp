<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.image {
	width: 200px;
	height: 200px;
	background-repeat: no-repeat;
	background-size: contain;
}

.emoji {
	font-size: 20px;
	margin-right: 5px;
	cursor: pointer;
}

h2 {
	text-align: center;
}

.modal-content {
	position: relative;
	top: 210px;
	width: 1125px;
	left: -164px;
	height: 1050px;
	width: 1125px;
	left: -164px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- histoty Modal-->
<div class="modal-header">
	<h5 class="modal-title" id="historyModalLabel">요청서 상세보기</h5>
	<button class="close" type="button" data-dismiss="modal"
		aria-label="Close">
		<span>❌</span>
	</button>
</div>
<div class="modal-body">
	<div class="table-responsive">
		<div class="container"></div>
		<table class="table table-hover" id="tbl">
			<thead class="text-center">
				<tr class="content">
					<th class="text-center" style="width: 130px;">제목</th>
					<th class="text-center">내용</th>
					<th class="text-center" style="width: 110px;">세부 카테고리</th>
					<th class="text-center" style="width: 110px;">희망가격(원)</th>
					<th class="text-center" style="width: 100px;">희망 날짜</th>
					<th class="text-center" style="width: 65px;">수정</th>
				</tr>
				<tr class="content">
					<td class="text-center">${dto.subject }</td>
					<td class="text-center">${dto.content }</td>
					<td class="text-center">${dto.subcategory }</td>
					<td class="text-center">${dto.price }</td>
					<td class="text-center">${dto.wishdate }</td>
					<%--  <c:if test="${ dto.id == id }">  --%>
					<td class="text-center"><span class="emoji" title="edit"
						onclick="edit('${dto.healthseq}');">🛠</span></td>
					<%-- 	</c:if> --%>
				</tr>
			</thead>

		</table>
		<c:if test="${not empty dto.img }">
			<button id="button" class="ui-state-default ui-corner-all">이미지
				보기</button>
			<div class="toggler">
				<div id="effect" class="ui-widget-content ui-corner-all">
					<div class="image" style="background-image: url(${dto.img});"></div>
				</div>
			</div>
		</c:if>
	</div>

</div>

<!-- 헬퍼의 신청서 리스트  -->
<h2>신청서 목록</h2>
<div class="modal-body">
	<div class="table-responsive">
		<div class="container"></div>
		<table class="table table-hover" id="tbl">
			<thead class="text-center">
				<tr class="content">
					<th class="text-center" style="width: 20px;">No</th>
					<th class="text-center" style="width: 130px;">작성자</th>
					<th class="text-center">내용</th>
					<th class="text-center" style="width: 110px;">제안가격(원)</th>
					<th class="text-center" style="width: 100px;">작성일자</th>
					<th class="text-center" style="width: 100px;">채팅</th>

				</tr>
				<c:forEach items="${alist }" var="adto" varStatus="vs">
					<tr class="content">
						<td class="text-center">${vs.count }</td>
						<td class="text-center"><a style="cursor: pointer;"
							onclick="helperinfo('${adto.id}')">${adto.id }</a></td>
						<td class="text-center">${adto.content }</td>
						<td class="text-center">${adto.helperprice }</td>
						<td class="text-center" style="font-size: 12px;">${adto.regdate }</td>
						<td class="text-center"><c:if test="${dto.matching eq 'n' && member.state eq '1' }">
								<button type="button" class="btn btn-warning" value="채팅"
									onclick="chat('${adto.id}','${dto.id }','${dto.healthseq }')">채팅하기</button>
							</c:if> <c:if test="${dto.matching eq 'y' }"> 채팅 불가 </c:if></td>
					</tr>

				</c:forEach>

			</thead>
		</table>
	</div>

</div>

<div id="helperinfo">
	<table class="table table-bordered" id="helpertable">

	</table>
</div>



<div class="modal-footer">
	<button class="btn btn-default" type="button" data-dismiss="modal"
		style="float: left;"
		onclick="location.href='/helpme/health/healthlist.action'">닫기</button>
	<c:if test="${dto.matching eq 'n' }">
		 <c:if test="${ member.state eq '2' }">  
		<!-- 헬퍼에게만 보이는 버튼  -->
		<button class="btn btn-primary" type="button" data-dismiss="modal"
			id="btnApply" onclick="apply('${dto.healthseq}')">신청서
			작성(헬퍼용)</button>
		  </c:if> 

		<c:if test="${ dto.id == id }"> 
		<button class="btn btn-danger" type="button" data-dismiss="modal"
			id="btnDel" onclick="delReq('${dto.healthseq}')">요청 취소(삭제하기)</button>
		 </c:if> 
	</c:if>
</div>


<script>
	//이미지보기 클릭시 보여주기 
	$(function() {
		// run the currently selected effect
		function runEffect() {
			// get effect type from
			var selectedEffect = $("#effectTypes").val();

			// Most effect types need no options passed by default
			var options = {};
			// some effects have required parameters
			if (selectedEffect === "scale") {
				options = {
					percent : 50
				};
			} else if (selectedEffect === "size") {
				options = {
					to : {
						width : 280,
						height : 185
					}
				};
			}

			// Run the effect
			$("#effect").show(selectedEffect, options, 500, callback);
		}
		;

		//callback function to bring a hidden box back
		function callback() {
			setTimeout(function() {
				$("#effect:visible").removeAttr("style").fadeOut();
			}, 1000);
		}
		;

		// Set effect from select menu value
		$("#button").on("click", function() {
			runEffect();
		});

		$("#effect").hide();
	});

	//채팅 연결 
	function chat(helpid, userid, healthseq) {
		location.href = '/helpme/health/chat.action?helpid=' + helpid
				+ '&userid=' + userid + '&healthseq=' + healthseq

	}

	//헬퍼의 신청서 작성 
	function apply(healthseq) {
		location.href = '/helpme/health/healthapply.action?healthseq='
				+ healthseq
	}
	// 요청서 삭제 
	function delReq(healthseq) {
		if (confirm("정말 요청서를 삭제 하시겠습니까??") == true) { //확인
			location.href = '/helpme/health/healthdel.action?healthseq='
					+ healthseq
			//해당 글번호를 받아서 전달 
			alert('삭제 완료.');
		} else { //취소
			return false;
		}
	};

	//요청서 수정 
	function edit(healthseq) {

		let tr = $(event.srcElement).parent().parent();

		let subject = tr.children().eq(0).text();
		tr.children().eq(0).html('');
		tr
				.children()
				.eq(0)
				.append(
						'<input type="text" class="form-control" id="usubject" value ="' + subject +'">');

		let content = tr.children().eq(1).text();
		tr.children().eq(1).html('');
		tr
				.children()
				.eq(1)
				.append(
						'<input type="text" class="form-control" id="ucontent" value ="' + content +'">');

		let price = tr.children().eq(3).text();
		tr.children().eq(3).html('');
		tr
				.children()
				.eq(3)
				.append(
						'<input type="text" class="form-control" id="uprice" value ="' + price +'">');

		temp = tr.children().eq(5).html();
		td = tr.children().eq(5).html('');

		tr.children().eq(5).append(
				' <span style="cursor:pointer;" onclick="editok(' + healthseq
						+ ');">⭕️</span> ');
		tr
				.children()
				.eq(5)
				.append(
						' <span style="cursor:pointer;" onclick="restore();">❌</span> ');

	}

	function restore() {
		td.html('');
		td.html(temp);

		td.parent().children().eq(0).text($('#usubject').val());
		td.parent().children().eq(1).text($('#ucontent').val());
		td.parent().children().eq(3).text($('#uprice').val());

	}

	function editok(healthseq) {
		$.ajax({
			type : 'POST',
			url : '/helpme/health/healthedit.action',
			data : 'subject=' + $('#usubject').val() + '&content='
					+ $('#ucontent').val() + '&price=' + $('#uprice').val()
					+ '&healthseq=' + healthseq,
			dataType : 'json',
			success : function(result) {
				if (result == 1) {
					restore();
				}
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		})
	}

	//헬퍼 정보 보기 
	function helperinfo(id) {

		$.ajax({
					type : 'GET',
					url : '/helpme/health/helperinfo.action',
					data : 'id=' + id,
					dataType : 'json',
					success : function(data) {

						$('#helpertable')
								.append(
										'<tr><td>헬퍼 이름</td><td>번호</td><td>주소</td><td>이메일</td><td>성별</td></tr>');
						$('#helpertable').append(
								'<tr><td>' + data.name + '</td><td>' + data.tel
										+ '</td><td>' + data.address
										+ '</td><td>' + data.email
										+ '</td><td>' + data.gender
										+ '</td></tr>');
					},
					error : function(a, b, c) {
						console.log(a, b, c);
					}
				})

	} // helperinfo
</script>



