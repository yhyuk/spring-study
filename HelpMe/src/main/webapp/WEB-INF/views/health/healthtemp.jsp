<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도와줘 헬퍼</title>
<tiles:insertAttribute name="asset" />

<style>
.img-header {
	background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/requestForm/df092d5a-88e2-4549-9565-e9de88d6d62e.jpg);
	margin-top: 100px;
	object-fit: cover;
	width: 100vw;
	height: 370px;
	overflow: hidden;
}

.img-header h1 {
	color: white;
	padding: 150px;
}

#searchbox {
	/* position: relative; */
	width: 350px;
	height: 40px;
	border-radius: 5px;
}

#search {
	position: relative;
	left: 195px;
	top: -250px;
}

#searchbtn {
	position: relative;
	left: -4px;
	height: 38px;
	background-color: #01c7ae;
    color: white;
    border-color: #252121;
}
</style>
</head>
<body>
	<div class="img-header">

		<h1>건강/미용</h1>



	</div>



	<tiles:insertAttribute name="header" />
	<section class="main-section" style="position: static; width: 897px;">
		
		<tiles:insertAttribute name="content" />
		<hr>
		<tiles:insertAttribute name="inner" />
	</section>

	<tiles:insertAttribute name="footer" />
</body>
</html>
