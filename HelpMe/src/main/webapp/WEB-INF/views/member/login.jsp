<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.login {
   		text-align: center;
   		margin-top: 200px;
   	}
   	
   	.user {
   		display: inline-block;
   		margin-right: 50px;
   		margin-top: 50px;
   	}
   	.helper {
   		display: inline-block;
   	}
   	
 	.user img, .helper img{
 		border-radius: 40%;
 		cursor: pointer;
 		width: 200px;
 		height: 200px;
	}	
	
	.info {
		
		font-size: 1.4em;
	}
	
</style>

<body>
	
	<div class="login">
	
		<h1>HelpMe Helper!!(로고)</h1>
		
		<div class="info">원하는 사용자로 로그인 해주세요.</div>	
		<div class="user">
			<img src="/helpme/resources/images/user.png" 
				onclick="/helpme/loginok?id=user"/>
			<div>유저 사용자</div>
		</div>
		
		<div class="helper">
			<img src="/helpme/resources/images/helper.png"
				onclick="/helpme/loginok?id=helper"/>
			<div>헬퍼 사용자</div>
		</div>
		
	</div>
   
   	<script>
	</script>
</body>
