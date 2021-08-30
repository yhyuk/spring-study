<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>
<link rel="stylesheet" href="/ajax/resources/css/jquery-ui.css" />
<script src="/ajax/resources/js/jquery-ui.js"></script>

<style>

	.page-header {
		margin: 30px;
	}

	.memo {
		background-size: 100% 100%;
		width: 200px;
		height: 200px;
	}
	
	.memo .btnClose {
		width: 10px;
		color: white;
		cursor: pointer;
		float: right;
		margin-top: 5px;
		margin-right: 18px;
	}
	
	.memo .txtMemo {
		margin-left: 5px;
		margin-top: 10px;
		width: 180px;
		height: 150px;
		resize: none;
		border: 0;
		outline: none;
		background-color: transparent;
	}
   
</style>

</head>
<body>
   	<!-- memo.jsp -->
	<h1 class="page-header">Memo</h1>      
	 		
	<div class="memo" id="m1" style="background-image: url(/ajax/resources/images/01.png)">
		<div class="btnClose">&times;</div>
	</div>
	<div class="memo" id="m2" style="background-image: url(/ajax/resources/images/02.png)">
		<div class="btnClose">&times;</div>
	</div>
	<div class="memo" id="m3" style="background-image: url(/ajax/resources/images/03.png)">
		<div class="btnClose">&times;</div>
		<textarea class="txtMemo" ></textarea>
	</div>
   		
   		   
   	<script>
   		$('.memo').draggable().css('position', 'absolute');
   		
   		$('.memo .btnClose').click(function() {
   			$(this).parent().remove();
   		});
	</script>
</body>
</html>