<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


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
      background-image: url( "/helpme/resources/images/lesson.jpg" );
      margin-top: 100px; object-fit: cover; width: 100vw; height: 370px; overflow: hidden;
   }

   .img-header h1{
      color: white;
      padding: 150px;
   }

</style>
</head>
<body>
	<div class="img-header">

		<h1>과외/레슨</h1>

	</div>
	
	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="content" />
	<section class="main-section">

		
		<tiles:insertAttribute name="inner" />
    </section>

    <tiles:insertAttribute name="footer" />
</body>
</html>
