<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script language="javascript">
	function goPopup() {
		var pop = window.open("/helpme/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}

	window.onload = function() {

		if ('${kind}' == '악기')
			$('#kind').val("악기").prop("selected", true);
		else if ('${kind}' == '자격증')
			$('#kind').val("자격증").prop("selected", true);
		else if ('${kind}' == '학업')
			$('#kind').val("학업").prop("selected", true);
		else if ('${kind}' == '스포츠')
			$('#kind').val("스포츠").prop("selected", true);
		else if ('${kind}' == '외국어')
			$('#kind').val("외국어").prop("selected", true);
		else if ('${kind}' == '요리')
			$('#kind').val("요리").prop("selected", true);

		var good_a = [ "피아노", "기타", "베이스", "바이올린", "비올라", "첼로", "콘트라베이스",
				"직접입력" ];
		var good_b = [ "공무원", "간호사", "관세사", "변리사", "속기사", "전기기사", "직접입력" ];
		var good_c = [ "영어", "수학", "국어", "과학", "국사", "직접입력" ];
		var good_d = [ "스키", "수영", "요트", "스노쿨링", "프리다이빙", "줄넘기", "마라톤", "직접입력" ];
		var good_e = [ "영어", "중국어", "일본어", "스페인어", "아랍어", "힌두어", "직접입력" ];
		var good_f = [ "베이킹", "한식", "양식", "일식", "칵테일", "커피", "직접입력" ];
		var target = document.getElementById("subkind");

		if ($('#kind').val() == "악기")
			var d = good_a;
		else if ($('#kind').val() == "자격증")
			var d = good_b;
		else if ($('#kind').val() == "학업")
			var d = good_c;
		else if ($('#kind').val() == "스포츠")
			var d = good_d;
		else if ($('#kind').val() == "외국어")
			var d = good_e;
		else if ($('#kind').val() == "요리")
			var d = good_f;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}

	}
</script>

<style>
#others {
	width: 800px;
	height: 300px;
}

#reqlist {
	margin: 0 auto;
	width: 800px;
	margin-bottom: 200px;
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

#topreqlist{
	margin: 0px auto;	
	width: 600px;
	margin-top:80px;
}

	#helperlist th{
		text-align : center;
	}
	
	#helperlist td:nth-child(1){width:70px; text-align:center;}
	#helperlist td:nth-child(2){width:80px; text-align:center;}
	#helperlist td:nth-child(3){width:200px; text-align:center;}
	#helperlist td:nth-child(4){width:120px; text-align:center;}
	#helperlist td:nth-child(5){width:120px; text-align:center;}
	#helperlist td:nth-child(6){width:120px; text-align:center;}
	#helperlist td:nth-child(7){width:120px; text-align:center;}
	#helperlist td:nth-child(8){width:120px; text-align:center;}
	#helperlist td:nth-child(9){width:100px; text-align:center;}
	#helperlist td:nth-child(10){width:50px; text-align:center;}
	
	#helperlist tr{
		cursor: pointer;
	}
	
	#helperlist{
		margin-bottom:200px;
		
	}
	
	#helperlist{
		margin-top:80px;
	}
	#helperlist > h2{
		margin-bottom:40px;
	}
</style>
<div class="main-section-lesson">
<c:if test="${member.state eq '1'}">
	<div id="reqlist">
		
		<form name="form" id="form" method="post"
			action="/helpme/lesson/reqlist.action">
			<input type="hidden" name="id" value ="${id}">
			<input type="hidden" name="kind" value ="${kind}">
			<div id = "topreqlist">
			<div class="from-box">
				<div>종류</div>
				<select id="kind" disabled class="form-control">
					<option value="악기">악기</option>
					<option value="자격증">자격증</option>
					<option value="학업">학업</option>
					<option value="스포츠">스포츠</option>
					<option value="외국어">외국어</option>
					<option value="요리">요리</option>
				</select>
			</div>

			<div class="from-box">
				<div>세부종류</div>
				<select id="subkind" class="form-control" name="subkind">
					<option>세부사항을 선택해주세요.</option>
				</select>
			</div>
			<div class="from-box">
				<div>시작날짜</div>
				<input type='date' name='begindate' class="form-control" />
			</div>

			<div class="from-box">
				<div>종료날짜</div>
				<input type='date' name='enddate' class="form-control" />
			</div>

			<div class="from-box">
				<div>희망요일</div>
				<label><input type="checkbox" name="hopeweek" value="월요일">
					월요일</label> <label><input type="checkbox" name="hopeweek"
					value="화요일"> 화요일</label> <label><input type="checkbox"
					name="hopeweek" value="수요일"> 수요일</label> <label><input
					type="checkbox" name="hopeweek" value="목요일"> 목요일</label> <label><input
					type="checkbox" name="hopeweek" value="금요일"> 금요일</label> <label><input
					type="checkbox" name="hopeweek" value="토요일"> 토요일</label> <label><input
					type="checkbox" name="hopeweek" value="일요일"> 일요일</label>
			</div>

			<div class="from-box">
				<div>희망시작시간</div>
				<input type='time' name='hopebegintime' class="form-control" />
			</div>
			<div class="from-box">
				<div>희망종료시간</div>
				<input type='time' name='hopeendtime' class="form-control" />
			</div>

			<div class="from-box">
				<div>목적</div>
				<select id="perpose" class="form-control" name="perpose">
					<option>목적을 선택해주세요.</option>
					<option>취미</option>
					<option>발표</option>
					<option>초/중/고 입시</option>
					<option>시험/면접</option>
					<option>자기개발</option>
					<option>기타(기타사항입력해주세요.)</option>
				</select>
			</div>
			<div class="from-box">
				<div>방식</div>
				<select id="method" class="form-control" name="method">
					<option>방식을 선택해주세요.</option>
					<option>장소대여</option>
					<option>온라인</option>
					<option>집</option>
					<option>무관</option>
					<option>기타(기타사항입력해주세요.)</option>
				</select>
			</div>
			<div class="from-box">
				<div>실력</div>
				<select id="skill" class="form-control" name="skill">
					<option>실력을 선택해주세요.</option>
					<option>상</option>
					<option>중</option>
					<option>하</option>

				</select>
			</div>
			<table id="">


				<tr>
					<td>우편번호</td>
					<td><input type="hidden" id="confmKey" name="confmKey"
						value=""> <input type="text" id="zipNo" name="zipNo"
						readonly style="width: 100px; margin-left:10px; margin-bottom:10px;"> <input type="button"
						value="주소검색" onclick="goPopup();" class="chkbtn"></td>
				</tr>
				<tr>
					<td>도로명주소</td>
					<td><input type="text" id="roadAddrPart1"
						class="form-control from-box" name="address1" readonly style="margin-left:10px;"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" id="addrDetail"
						class="form-control from-box" value="" name="address2" style="margin-left:10px;"> <input
						type="text" id="roadAddrPart2" class="form-control from-box"
						value="" name="address3" style="margin-left:10px;"></td>
				</tr>

				</tbody>
			</table>
			</div>
			<div>기타사항</div>
			<input type="text" name="others" id="others" class="form-control"
				placeholder="기타사항을 입력해주세요.">
			<div class="checkBtns">
				<input type="button" value="취소" class="btn btn-default"
					onclick="location.href='/helpme/lesson/main.action';"> <input
					type="submit" value="완료" class="btn btn-primary">
			</div>

		</form>
	</div>
	</c:if>
	<c:if test="${member.state eq '2'}">
	<div id="helperlist">
	<h2>신청하고 싶은 글을 선택해주세요.</h2>
	
	
	<table class="table table-bordered table-hover">
		<tr>
			
			<th>종류</th>
			<th>세부종류</th>
			<th>주소</th>
			<th>시작날짜</th>
			<th>종료날짜</th>
			<th>희망요일</th>
			<th>희망시간</th>
			<th>기타사항</th>
			<th>목적</th>
			<th>실력</th>

		</tr>
		
		<c:forEach items="${list}" var="lrdto">
		
		<tr onclick="location.href='/helpme/lesson/reqlistdetail.action?lessonSeq=${lrdto.lessonSeq}';">
			
			<td>${lrdto.kind}</td>
			<td>${lrdto.subkind}</td>
			<td>${lrdto.address}</td>
			<td>${fn:substring(lrdto.begindate,0,10)}</td>
			<td>${fn:substring(lrdto.enddate,0,10)}</td>
			<td>${lrdto.hopeweek}</td>
			<td>${lrdto.hopetime}</td>
			<td>${lrdto.others}</td>
			<td>${lrdto.perpose}</td>
			<td>${lrdto.skill}</td>
			

		</tr>
		
		</c:forEach>
	
	</table>
	
	
	</div>
	</c:if>
</div>
