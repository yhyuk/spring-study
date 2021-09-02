<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.place-img {
	width: 350px;
	height: 170px;
	overflow: hidden;
	border: 1px solid #f0f1f2;
	text-align: center;
	border-radius: 10px 10px 0 0;
}

.single-place .place-img img {
	object-fit: cover;
	width: 350px;
	height: 250px;
	text-aling: center;
	-webkit-transform: scale 1;
	-moz-transform: scale 1;
	-ms-transform: scale 1;
	-o-transform: scale 1;
	transform: scale 1;
	transition: all 0.5s ease-out 0s;
}

.place-cap {
    padding: 10px 130px;
    border: 1px solid #f0f1f2;
    border-top: 0;
    width: 350px;
    border-radius: 0 0 10px 10px ;
    margin-bottom: 50px;
}

body > .main-section {
	width: 1100px;

}

img {
 	cursor: pointer;
}

</style>
</head>
<body>
	<button type="button">내가쓴글리스트</button>
	<button type="button" onclick="location.href='/helpme/home/list.action';">요청목록보기</button>

	<h1 style="margin-top: 100px;">서비스</h1>
	<br>
	<br>
	<div class="col-xl-4 col-lg-4 col-md-6">
		<div class="single-place mb-30">
			<div class="place-img">
				<img src="/helpme/resources/images/home/1.png" onclick="location.href='/helpme/home/add.action';" alt="">
			</div>
			<div class="place-cap">
				<div class="place-cap-top">
					<h3>
						<a href="/helpme/home/add.action">인테리어</a>
					</h3>

				</div>
			</div>
		</div>
	</div>
	
	<div class="col-xl-4 col-lg-4 col-md-6">
		<div class="single-place mb-30">
			<div class="place-img">
				<img src="/helpme/resources/images/home/2.jpg" onclick="location.href='/helpme/home/add.action';" alt="">
			</div>
			<div class="place-cap">
				<div class="place-cap-top">
					<h3>
						<a href="/helpme/home/add.action">해충방역</a>
					</h3>

				</div>
			</div>
		</div>
	</div>
	
	
	<div class="col-xl-4 col-lg-4 col-md-6">
		<div class="single-place mb-30">
			<div class="place-img">
				<img src="/helpme/resources/images/home/3.png" onclick="location.href='/helpme/home/add.action';" alt="">
			</div>
			<div class="place-cap">
				<div class="place-cap-top">
					<h3>
						<a href="/helpme/home/add.action">입주청소</a>
					</h3>

				</div>
			</div>
		</div>
	</div>
	
		<div class="col-xl-4 col-lg-4 col-md-6">
		<div class="single-place mb-30">
			<div class="place-img">
				<img src="/helpme/resources/images/home/5.jpg" onclick="location.href='/helpme/home/add.action';" alt="">
			</div>
			<div class="place-cap">
				<div class="place-cap-top">
					<h3>
						<a href="/helpme/home/add.action">세탁기청소</a>
					</h3>

				</div>
			</div>
		</div>
	</div>
	
	<div class="col-xl-4 col-lg-4 col-md-6">
		<div class="single-place mb-30">
			<div class="place-img">
				<img src="/helpme/resources/images/home/4.jpg" onclick="location.href='/helpme/home/add.action';" alt="">
			</div>
			<div class="place-cap">
				<div class="place-cap-top">
					<h3>
						<a href="/helpme/home/add.action">에어컨청소</a>
					</h3>

				</div>
			</div>
		</div>
	</div>
	
	
	<div class="col-xl-4 col-lg-4 col-md-6">
		<div class="single-place mb-30">
			<div class="place-img">
				<img src="/helpme/resources/images/home/6.png" onclick="location.href='/helpme/home/add.action';" alt="">
			</div>
			<div class="place-cap">
				<div class="place-cap-top">
					<h3>
						<a href="/helpme/home/add.action">도배/장판</a>
					</h3>

				</div>
			</div>
		</div>
	</div>
	
	
	
	



</body>
</html>