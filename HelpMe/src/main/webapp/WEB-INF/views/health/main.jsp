<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
section[data-name=popular-services] .card div.card-image[data-v-34120883]
	{
	background-size: cover;
	background-position: 50% 50%;
	height: 150px;
}

section[data-name=popular-services] .card h4.card-title[data-v-34120883]
	{
	text-align: center;
	margin: 1rem 0;
	font-size: 1.7rem;
}

.h4, .swal2-container.sg-swal .swal2-header .swal2-title, h4 {
	font-size: 1.375rem;
	line-height: 2.0625rem;
	font-weight: 500;
	letter-spacing: -.025rem;
}

section[data-name=all-services] h2[data-v-34120883], section[data-name=popular-services] h2[data-v-34120883]
	{
	text-align: center;
	font-weight: 500;
	margin-bottom: 3.125rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1.25rem;
}

.card {
	border: none;
	border-radius: 4px;
	box-shadow: 0 1px 5px 0 rgb(0 0 0/ 20%);
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	margin-bottom: 1rem;
	overflow: hidden;
}

#listbtn {
	background-color: #01c7ae;
	color: white;
	border-color: #999;
	height: 40px;
	width: 140px;
	border: 1px solid #ccc;
	font-size: 16px;
}

#quickbtn {
	float: right;
	background-color: #01c7ae;
	color: white;
	border-color: #999;
	height: 40px;
	width: 100px;
	border: 1px solid #ccc;
	font-size: 16px;
}

h2 {
	padding-bottom: 20px;
}
</style>

<div id="search">
	<form action="/helpme/health/healthreq.action" method="get">
	<input type="text" id="searchbox" name="subcategory" placeholder="어떤 분야의 전문가를 찾으시나요?">
	<span>
		<button type="submit" class="btn btn-default" id="searchbtn">
			<img
				src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0Q4RDhEOCIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAwaDE4djE4SDB6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTE0Ljk0NCAxMy44ODdsNC44MzcgNC44MzhhLjc0Ny43NDcgMCAxIDEtMS4wNTYgMS4wNTZsLTQuODM4LTQuODM3YTguNDU4IDguNDU4IDAgMSAxIDEuMDU3LTEuMDU3em0tMS41MDUtLjU2M2E2Ljk2NCA2Ljk2NCAwIDEgMC0uMTE0LjExNC43NTUuNzU1IDAgMCAxIC4xMTQtLjExNHoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
				class="search-icon" data-v-d914393c=""> 고수 찾기
		</button>
	</span>
	</form>
</div>

<div>
	
	<button id="listbtn" type="button" class="btn"
		onclick="location.href='/helpme/health/healthlist.action'">요청
		목록 보기</button>
	
</div>
<section data-name="popular-services" data-v-34120883="">
	<h2 data-v-34120883="" style="">인기 서비스</h2>
	<div class="row" data-v-34120883="">
		<div class="col-md-6 col-lg-4 col-12" data-v-34120883="">
			<a href="/helpme/health/healthreq.action?subcategory=헤어"
				data-v-34120883="" class=""><div class="card" data-v-34120883="">
					<!---->
					<!---->
					<div class="card-body" data-v-34120883="">
						<!---->
						<!---->
						<div class="card-image"
							style="background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/service-bg/service_81dd394c-a9b3-4a7b-92f5-b58aa10fc2b2.png);"
							data-v-34120883=""></div>
						<h4 class="card-title" data-v-34120883="">헤어</h4>
					</div>
					<!---->
					<!---->
				</div></a>
		</div>
		<div class="col-md-6 col-lg-4 col-12" data-v-34120883="">
			<a href="/helpme/health/healthreq.action?subcategory=퍼스널트레이닝"
				data-v-34120883="" class=""><div class="card" data-v-34120883="">
					<!---->
					<!---->
					<div class="card-body" data-v-34120883="">
						<!---->
						<!---->
						<div class="card-image"
							style="background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/service-bg/service_c25568ec-ba1c-427e-bac3-b68537f1a4be.jpg);"
							data-v-34120883=""></div>
						<h4 class="card-title" data-v-34120883="">퍼스널트레이닝(PT)</h4>
					</div>
					<!---->
					<!---->
				</div></a>
		</div>
		<div class="col-md-6 col-lg-4 col-12" data-v-34120883="">
			<a href="/helpme/health/healthreq.action?subcategory=심리검사"
				data-v-34120883="" class=""><div class="card" data-v-34120883="">
					<!---->
					<!---->
					<div class="card-body" data-v-34120883="">
						<!---->
						<!---->
						<div class="card-image"
							style="background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/service/featured_service_0150fc63-f9da-4cf1-8dd2-30fed6f1aacd.jpg);"
							data-v-34120883=""></div>
						<h4 class="card-title" data-v-34120883="">심리검사</h4>
					</div>
					<!---->
					<!---->
				</div></a>
		</div>
		<div class="col-md-6 col-lg-4 col-12" data-v-34120883="">
			<a href="/helpme/health/healthreq.action?subcategory=네일"
				data-v-34120883="" class=""><div class="card" data-v-34120883="">
					<!---->
					<!---->
					<div class="card-body" data-v-34120883="">
						<!---->
						<!---->
						<div class="card-image"
							style="background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/service/af14eba6-eec8-4662-a07d-7dd78304c620.jpg);"
							data-v-34120883=""></div>
						<h4 class="card-title" data-v-34120883="">네일</h4>
					</div>
					<!---->
					<!---->
				</div></a>
		</div>
		<div class="col-md-6 col-lg-4 col-12" data-v-34120883="">
			<a href="/helpme/health/healthreq.action?subcategory=성인상담"
				data-v-34120883="" class=""><div class="card" data-v-34120883="">
					<!---->
					<!---->
					<div class="card-body" data-v-34120883="">
						<!---->
						<!---->
						<div class="card-image"
							style="background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/service/featured_service_b8d8b8bb-3128-484b-b621-6110eb7240d4.jpg);"
							data-v-34120883=""></div>
						<h4 class="card-title" data-v-34120883="">성인 상담</h4>
					</div>
					<!---->
					<!---->
				</div></a>
		</div>
		<div class="col-md-6 col-lg-4 col-12" data-v-34120883="">
			<a href="/helpme/health/healthreq.action?subcategory=필라테스"
				data-v-34120883="" class=""><div class="card" data-v-34120883="">
					<!---->
					<!---->
					<div class="card-body" data-v-34120883="">
						<!---->
						<!---->
						<div class="card-image"
							style="background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/service/277c9829-2d29-4529-b408-877a3a9d0720.jpg);"
							data-v-34120883=""></div>
						<h4 class="card-title" data-v-34120883="">필라테스</h4>
					</div>
					<!---->
					<!---->
				</div></a>
		</div>

		

	</div>
</section>