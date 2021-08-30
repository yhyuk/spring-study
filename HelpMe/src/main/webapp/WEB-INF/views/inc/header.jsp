<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
@import
	url(‘https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&subset=devanagari,latin-ext’)
	;

/* #Primary
================================================== */
body {
	font-family: ‘Poppins’, sans-serif;
	font-size: 16px;
	line-height: 24px;
	font-weight: 400;
	color: #212112;
	background-image:
		url(‘https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/pat-back.svg’);
	background-position: center;
	background-repeat: repeat;
	background-size: 7%;
	background-color: #fff;
	overflow-x: hidden;
	transition: all 200ms linear;
}

::selection {
	color: #fff;
	background-color: #8167a9;
}

::-moz-selection {
	color: #fff;
	background-color: #8167a9;
}

/* #Navigation
================================================== */
.start-header {
	opacity: 1;
	transform: translateY(0);
	padding: 10px 0;
	box-shadow: 0 10px 30px 0 rgba(138, 155, 165, 0.15);
	-webkit-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}

.start-header.scroll-on {
	box-shadow: 0 5px 10px 0 rgba(138, 155, 165, 0.15);
	padding: 10px 0;
	-webkit-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}

.start-header.scroll-on .navbar-brand img {
	height: 24px;
	-webkit-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}

.navigation-wrap {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 1000;
	-webkit-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}

.navbar {
	padding: 0;
}

.navbar-brand img {
	height: 28px;
	width: auto;
	display: block;
	filter: brightness(10%);
	-webkit-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}

.navbar-toggler {
	float: right;
	border: none;
	padding-right: 0;
}

.navbar-toggler:active, .navbar-toggler:focus {
	outline: none;
}

.navbar-light .navbar-toggler-icon {
	width: 24px;
	height: 17px;
	background-image: none;
	position: relative;
	border-bottom: 1px solid #000;
	transition: all 300ms linear;
}

.navbar-light .navbar-toggler-icon:after, .navbar-light .navbar-toggler-icon:before
	{
	width: 24px;
	position: absolute;
	height: 1px;
	background-color: #000;
	top: 0;
	left: 0;
	content: ”;
	z-index: 2;
	transition: all 300ms linear;
}

.navbar-light .navbar-toggler-icon:after {
	top: 8px;
}

.navbar-toggler[aria-expanded="true"] .navbar-toggler-icon:after {
	transform: rotate(45deg);
}

.navbar-toggler[aria-expanded="true"] .navbar-toggler-icon:before {
	transform: translateY(8px) rotate(-45deg);
}

.navbar-toggler[aria-expanded="true"] .navbar-toggler-icon {
	border-color: transparent;
}

.nav-link {
	color: #212121 !important;
	font-weight: 500;
	transition: all 200ms linear;
	margin: 13px;
}

.nav-item:hover .nav-link {
	color: #8167a9 !important;
}

.nav-item.active .nav-link {
	color: #777 !important;
}

.nav-link {
	position: relative;
	padding: 5px 0 !important;
	display: inline-block;
}

.nav-item:after {
	position: absolute;
	bottom: -5px;
	left: 0;
	width: 100%;
	height: 2px;
	content: ”;
	background-color: #8167a9;
	opacity: 0;
	transition: all 200ms linear;
}

.nav-item:hover:after {
	bottom: 0;
	opacity: 1;
}

.nav-item.active:hover:after {
	opacity: 0;
}

.nav-item {
	position: relative;
	transition: all 200ms linear;
}

/* #Primary style
================================================== */
.bg-light {
	background-color: #fff !important;
	transition: all 200ms linear;
}

.section {
	position: relative;
	width: 100%;
	display: block;
}

.full-height {

}

.over-hide {
	overflow: hidden;
}

.absolute-center {
	position: absolute;
	top: 50%;
	left: 0;
	width: 100%;
	margin-top: 40px;
	transform: translateY(-50%);
	z-index: 20;
}

h1 {
	font-size: 48px;
	line-height: 1.2;
	font-weight: 700;
	color: #212112;
	text-align: center;
}

p {
	text-align: center;
	margin: 0;
	padding-top: 10px;
	opacity: 1;
	transform: translate(0);
	transition: all 300ms linear;
	transition-delay: 1700ms;
}

body.hero-anime p {
	opacity: 0;
	transform: translateY(40px);
	transition-delay: 1700ms;
}

h1 span {
	display: inline-block;
	transition: all 300ms linear;
	opacity: 1;
	transform: translate(0);
}

body.hero-anime h1 span:nth-child(1) {
	opacity: 0;
	transform: translateY(-20px);
}

body.hero-anime h1 span:nth-child(2) {
	opacity: 0;
	transform: translateY(-30px);
}

body.hero-anime h1 span:nth-child(3) {
	opacity: 0;
	transform: translateY(-50px);
}

body.hero-anime h1 span:nth-child(4) {
	opacity: 0;
	transform: translateY(-10px);
}

body.hero-anime h1 span:nth-child(5) {
	opacity: 0;
	transform: translateY(-50px);
}

body.hero-anime h1 span:nth-child(6) {
	opacity: 0;
	transform: translateY(-20px);
}

body.hero-anime h1 span:nth-child(7) {
	opacity: 0;
	transform: translateY(-40px);
}

body.hero-anime h1 span:nth-child(8) {
	opacity: 0;
	transform: translateY(-10px);
}

body.hero-anime h1 span:nth-child(9) {
	opacity: 0;
	transform: translateY(-30px);
}

body.hero-anime h1 span:nth-child(10) {
	opacity: 0;
	transform: translateY(-20px);
}

h1 span:nth-child(1) {
	transition-delay: 1000ms;
}

h1 span:nth-child(2) {
	transition-delay: 700ms;
}

h1 span:nth-child(3) {
	transition-delay: 900ms;
}

h1 span:nth-child(4) {
	transition-delay: 800ms;
}

h1 span:nth-child(5) {
	transition-delay: 1000ms;
}

h1 span:nth-child(6) {
	transition-delay: 700ms;
}

h1 span:nth-child(7) {
	transition-delay: 900ms;
}

h1 span:nth-child(8) {
	transition-delay: 800ms;
}

h1 span:nth-child(9) {
	transition-delay: 600ms;
}

h1 span:nth-child(10) {
	transition-delay: 700ms;
}

body.hero-anime h1 span:nth-child(11) {
	opacity: 0;
	transform: translateY(30px);
}

body.hero-anime h1 span:nth-child(12) {
	opacity: 0;
	transform: translateY(50px);
}

body.hero-anime h1 span:nth-child(13) {
	opacity: 0;
	transform: translateY(20px);
}

body.hero-anime h1 span:nth-child(14) {
	opacity: 0;
	transform: translateY(30px);
}

body.hero-anime h1 span:nth-child(15) {
	opacity: 0;
	transform: translateY(50px);
}

h1 span:nth-child(11) {
	transition-delay: 1300ms;
}

h1 span:nth-child(12) {
	transition-delay: 1500ms;
}

h1 span:nth-child(13) {
	transition-delay: 1400ms;
}

h1 span:nth-child(14) {
	transition-delay: 1200ms;
}

h1 span:nth-child(15) {
	transition-delay: 1450ms;
}

#switch, #circle {
	cursor: pointer;
	-webkit-transition: all 300ms linear;
	transition: all 300ms linear;
}

#switch {
	width: 60px;
	height: 8px;
	border: 2px solid #8167a9;
	border-radius: 27px;
	background: #000;
	position: relative;
	display: block;
	margin: 0 auto;
	text-align: center;
	opacity: 1;
	transform: translate(0);
	transition: all 300ms linear;
	transition-delay: 1900ms;
}

body.hero-anime #switch {
	opacity: 0;
	transform: translateY(40px);
	transition-delay: 1900ms;
}

#circle {
	position: absolute;
	top: -11px;
	left: -13px;
	width: 26px;
	height: 26px;
	border-radius: 50%;
	background: #000;
}

.switched {
	border-color: #000 !important;
	background: #8167a9 !important;
}

.switched #circle {
	left: 43px;
	box-shadow: 0 4px 4px rgba(26, 53, 71, 0.25), 0 0 0 1px
		rgba(26, 53, 71, 0.07);
	background: #fff;
}

.nav-item .dropdown-menu {
	transform: translate3d(0, 10px, 0);
	visibility: hidden;
	opacity: 0;
	max-height: 0;
	display: block;
	padding: 0;
	margin: 0;
	transition: all 200ms linear;
}

.nav-item.show .dropdown-menu {
	opacity: 1;
	visibility: visible;
	max-height: 999px;
	transform: translate3d(0, 0px, 0);
}

.dropdown-menu {
	padding: 10px !important;
	margin: 0;
	font-size: 13px;
	letter-spacing: 1px;
	color: #212121;
	background-color: #fcfaff;
	border: none;
	border-radius: 3px;
	box-shadow: 0 5px 10px 0 rgba(138, 155, 165, 0.15);
	transition: all 200ms linear;
}

.dropdown-toggle::after {
	display: none;
}

.dropdown-item {
	padding: 3px 15px;
	color: #212121;
	border-radius: 2px;
	transition: all 200ms linear;
}

.dropdown-item:hover, .dropdown-item:focus {
	color: #fff;
	background-color: rgba(129, 103, 169, .6);
}

body.dark {
	color: #fff;
	background-color: #1f2029;
}

body.dark .navbar-brand img {
	filter: brightness(100%);
}

body.dark h1 {
	color: #fff;
}

body.dark h1 span {
	transition-delay: 0ms !important;
}

body.dark p {
	color: #fff;
	transition-delay: 0ms !important;
}

body.dark .bg-light {
	background-color: #14151a !important;
}

body.dark .start-header {
	box-shadow: 0 10px 30px 0 rgba(0, 0, 0, 0.15);
}

body.dark .start-header.scroll-on {
	box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.15);
}

body.dark .nav-link {
	color: #fff !important;
}

body.dark .nav-item.active .nav-link {
	color: #999 !important;
	margin-right: 30px;
}

body.dark .dropdown-menu {
	color: #fff;
	background-color: #1f2029;
	box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.25);
}

body.dark .dropdown-item {
	color: #fff;
}

body.dark .navbar-light .navbar-toggler-icon {
	border-bottom: 1px solid #fff;
}

body.dark .navbar-light .navbar-toggler-icon:after, body.dark .navbar-light .navbar-toggler-icon:before
	{
	background-color: #fff;
}

body.dark .navbar-toggler[aria-expanded="true"] .navbar-toggler-icon {
	border-color: transparent;
}

/* #Media
================================================== */
@media ( max-width : 767px) {
	h1 {
		font-size: 38px;
	}
	.nav-item:after {
		display: none;
	}
	.nav-item::before {
		position: absolute;
		display: block;
		top: 15px;
		left: 0;
		width: 11px;
		height: 1px;
		content: "";
		border: none;
		background-color: #000;
		vertical-align: 0;
	}
	.dropdown-toggle::after {
		position: absolute;
		display: block;
		top: 10px;
		left: -23px;
		width: 1px;
		height: 11px;
		content: "";
		border: none;
		background-color: #000;
		vertical-align: 0;
		transition: all 200ms linear;
	}
	.dropdown-toggle[aria-expanded="true"]::after {
		transform: rotate(90deg);
		opacity: 0;
	}
	.dropdown-menu {
		padding: 0 !important;
		background-color: transparent;
		box-shadow: none;
		transition: all 200ms linear;
	}
	.dropdown-toggle[aria-expanded="true"]+.dropdown-menu {
		margin-top: 10px !important;
		margin-bottom: 20px !important;
	}
	body.dark .nav-item::before {
		background-color: #fff;
	}
	body.dark .dropdown-toggle::after {
		background-color: #fff;
	}
	body.dark .dropdown-menu {
		background-color: transparent;
		box-shadow: none;
	}
}

/* #Link to page
================================================== */
.logo {
	position: absolute;
	bottom: 30px;
	right: 30px;
	display: block;
	z-index: 100;
	transition: all 250ms linear;
}

.logo img {
	height: 26px;
	width: auto;
	display: block;
	filter: brightness(10%);
	transition: all 250ms linear;
}

body.dark .logo img {
	filter: brightness(100%);
}

.category {

	margin-right: 100px;

}
</style>



<div class="navigation-wrap bg-light start-header start-style">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="navbar navbar-expand-md navbar-light">

					<a class="navbar-brand" href="https://front.codes/" target="_blank"><img
						src="https://assets.codepen.io/1462889/fcy.png" alt=""></a>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
							
							
							<c:if test="${ not empty id }">
								<div style="float: right;">
									<c:if test="${ member.state eq '1' }">
									<span>안녕하세요 ${ member.name }님(일반 사용자)</span>
									</c:if>
									<c:if test="${ member.state eq '2' }">
									<span>안녕하세요 ${ member.name }님(헬퍼 사용자)</span>
									</c:if>
									<a class="nav-link" href="/helpme/member/logout.action">로그아웃</a>
								</div>
							</c:if>
							<c:if test="${ empty id }">
								<div style="float: right;">
									<a class="nav-link" href="/helpme/member/login.action">로그인</a>
									<a class="nav-link" href="#">회원가입</a>
								</div>
							</c:if>

					</div>

				</nav>
			</div>
		</div>
	</div>
</div>
<!-- header이미지 -->
<div class="section full-height">
	<div style="text-align:center; padding: 25px; background-color: #FAFAFA;">

			<a class="category" href="#">홈/리빙</a>
			<a class="category" href="#">과외/레슨</a>
			<a class="category" href="#">이벤트</a>
			<a class="category" href="/helpme/design/list.action">디자인/개발</a>
			<a class="category" href="#">건강/미용</a>
		    <a class="category" href="#">알바</a>

	</div>
	<div class="absolute-center">
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-12">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="my-5 py-5"></div>
