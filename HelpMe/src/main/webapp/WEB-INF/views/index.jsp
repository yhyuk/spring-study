<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
	.main {
		margin-top: 100px;
		text-align: center;
	}
	
	h2 {
		color: black;
		font-size: 2em;
	}
	
	.txt {
		margin: 0 auto;
		margin-right: 550px;
		width: 400px;
	}
	
	table tr td:hover {
		cursor: pointer;
	}
	
</style>

<div class="main">
	<h2>여러분을 도와줄</h2>
	<h2>헬퍼를 찾아드려요</h2>	
	
	<input type="text" class="form-control txt" placeholder="검색어를 입력하세요."/>
	
	<table style="display: inline-block; margin-left: 50px; margin-top: 30px; margin-bottom: 50px;">
		<tr>
			<td><img src="/helpme/resources/images/logo/lesson.png" 
				onclick="location.href='/helpme/lesson/main.action';"/></td>
			<td style="display: inline-block; margin-right: 20px;"><img src="/helpme/resources/images/logo/home.png" 
				onclick="location.href='/helpme/home/index.action';"/></td>
			<td><img src="/helpme/resources/images/logo/event.png" /></td>
			<td><img src="/helpme/resources/images/logo/business.png" /></td>
		</tr>
		<tr>
			<td><img src="/helpme/resources/images/logo/design.png" 
				onclick="location.href='/helpme/design/list.action';"/></td>
			<td style="display: inline-block; margin-top: 10px;"><img src="/helpme/resources/images/logo/health.png"  
				onclick="location.href='/helpme/health/main.action';"/></td>
			<td><img src="/helpme/resources/images/logo/alba.png" /></td>
			<td style="display: inline-block; margin-top: 10px;"><img src="/helpme/resources/images/logo/other.png" /></td>
		</tr>
	</table>
</div>
