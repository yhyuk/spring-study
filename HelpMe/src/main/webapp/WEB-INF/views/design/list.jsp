<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 일반사용자 > 요청 리스트 화면(메인) -->
<style>
	.head {
		font-size: 1.6em;
		font-weight: bold;
		text-align: center;
		margin-bottom: 20px;
		margin-top: 30px;
	}
	
	.service {
		font-size: 18px;
		margin-bottom: 50px;
	}
	
	.my {
		text-align: right;
		margin-bottom: 30px;
		margin-right: 20px;
	}
	
	#usertbl {
		width:1200px;
		margin-left:auto; 
    	margin-right:auto;
		border-collapse: separate;
		border-spacing: 20px 10px;
		text-align: center;
	}
	
	#usertbl tr td {
		border: 1px solid #CCC;
		cursor: pointer;
	}
	
	.img {
		height: 200px;
	}
	.title {
		height: 50px;
	}
	
	#helpertbl tr th:nth-child(1) { width: 70px; }
	#helpertbl tr th:nth-child(2) { width: 200px; }
	#helpertbl tr th:nth-child(3) { width: auto; }
	#helpertbl tr th:nth-child(4) { width: 200px; }
	#helpertbl tr th:nth-child(5) { width: 100px; }
	#helpertbl tr th:nth-child(6) { width: 70px; }
	#helpertbl tr th:nth-child(7) { width: 100px; }
	
</style>


<!-- 일반 사용자 -->
<c:if test="${ member.state eq '1' }">

<div class="head">서비스</div>
<div class="service">

	<div class="my">
		<input type="button" value="나의 요청 리스트" class="btn btn-primary" 
			onclick="location.href='/helpme/design/mylist.action?id=${ id }';"/>
		<input type="button" value="헬퍼 신청 리스트" class="btn btn-primary"
			onclick="location.href='/helpme/design/reqlist.action';"/>
	</div>
	
	<table id="usertbl">
		<tr class="img">
			<td style="background-image: url( '/helpme/resources/images/design/development1.jpg' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=소프트웨어 개발';"></td>
			<td style="background-image: url( '/helpme/resources/images/design/development2.jpg' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=모바일/웹 개발';">></td>
			<td style="background-image: url( '/helpme/resources/images/design/design3.jpg' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=모바일/앱 디자인';">></td>
		</tr>
		<tr class="title">
			<td>소프트웨어 개발</td>
			<td>모바일/웹 개발</td>
			<td>모바일/앱 디자인</td>
		</tr>
		<tr class="img">
			<td style="background-image: url( '/helpme/resources/images/design/design1.png' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=일러스트 디자인';">></td>
			<td style="background-image: url( '/helpme/resources/images/design/design2.jpg' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=인쇄물 디자인';">></td>
			<td style="background-image: url( '/helpme/resources/images/design/design4.jpg' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=제품 디자인';">></td>
		</tr>
		<tr class="title">
			<td>일러스트 디자인</td>
			<td>인쇄물 디자인</td>
			<td>제품 디자인</td>
		</tr>
		<tr class="img">
			<td style="background-image: url( '/helpme/resources/images/design/design5.jpg' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=명함/간판 디자인';">></td>
			<td style="background-image: url( '/helpme/resources/images/design/design6.jpg' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=패키지 디자인';">></td>
			<td style="background-image: url( '/helpme/resources/images/design/design7.png' ); background-size: cover;"
						onclick="location.href='/helpme/design/reqform.action?service=라벨 디자인';">></td>
		</tr>
		<tr class="title">
			<td>명함/간판 디자인</td>
			<td>패키지 디자인</td>
			<td>라벨 디자인</td>
		</tr>
	</table>
	
</div>

</c:if>

<!-- 헬퍼 사용자 -->
<c:if test="${ member.state eq '2' }">

<div class="head">요청 리스트</div>
<div class="service">

	<table id="helpertbl" class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>처리상태</th>
			<th>숙련도</th>
			<th>신청하기</th>
		</tr>
		<c:forEach items="${ list }" var="list">
		<tr>
			<td>${ list.designSeq }</td>
			<td>${ list.category }</td>
			<td>
				<a href="/helpme/design/reqview.action?seq=${ list.designSeq }">${ list.title }</a>
			</td>
			<td style="font-size: 14px; ">${ list.regdate }</td>
			<td>
				<c:if test="${ list.isPass eq 'n' }">처리 대기</c:if>
				<c:if test="${ list.isPass eq 'y' }">처리 완료</c:if>
			</td>
			<td>${ list.ability }</td>
			<td>
				<c:if test="${ list.isPass eq 'n' }">
				<input type="button" class="btn btn-primary" value="신청하기"
					onclick="location.href='/helpme/design/appform.action?seq=${ list.designSeq }';"/>
				</c:if>
				<c:if test="${ list.isPass eq 'y' }">
				<input type="button" class="btn btn-danger" value="신청불가" disabled />
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>

</div>	
</c:if>
