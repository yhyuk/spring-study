<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 일반사용자 > 요청 리스트 화면(메인) -->
<style>
	.head {
		font-size: 1.6em;
		font-weight: bold;
		text-align: center;
		margin-bottom: 10px;
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
	
	table {
		width:1200px;
		margin-left:auto; 
    	margin-right:auto;
		border-collapse: separate;
		border-spacing: 20px 10px;
		text-align: center;
	}
	
	table tr td {
		border: 1px solid #CCC;
		cursor: pointer;
	}
	
	.img {
		height: 200px;
	}
	.title {
		height: 50px;
	}
	
</style>


<div class="head">서비스</div>
<div class="service">

	<div class="my">
		<input type="button" value="내가 쓴 글 보기" class="btn btn-primary" 
			onclick="location.href='/helpme/design/mylist.action?id=testid';"/>
		<input type="button" value="요청 목록 보기" class="btn btn-primary"
			onclick="location.href='/helpme/design/reqlist.action';"/>
	</div>
	
	<table>
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
