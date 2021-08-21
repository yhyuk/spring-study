<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="panel panel-default">
    <div class="panel-heading">${dto.subject}</div>
    <div class="panel-body">${dto.content}</div>
    <div class="regdate">${dto.regdate}</div>
</div>

<div class="code">
	
	<c:forEach items="${dto.code.lines().toArray()}" var="line" varStatus="status">
		<div class="line"><span class="line-number"><fmt:formatNumber value="${status.count}" minIntegerDigits="3" />: </span>${line}</div>
	</c:forEach>
	
   	<div>
   	
   		<!-- 방법1. jsp에서 조건문 걸기 -->
   		<!-- 
   			문제: 넘기지 말아야할 언어까지 7개 전부를 넘기다 보니.. 
   					화면에 출력은 안되지만 빈 공간이 생김..
   		-->
   		<%-- 
   		<c:forEach items="${llist}" var="ldto" varStatus="status">
   			<c:if test="${not empty ldto.cseq}">
   				<i class="${ldto.langclass} category" style="color: ${ldto.color}; right: ${status.index * 55 + 10}px;"></i>
   			</c:if>
   		</c:forEach> 
   		--%>
   		
   		<!-- 방법2. 컨트롤러에서 미리 조건문을 해서 jsp에 넘기기 -->
   		<c:forEach items="${llist}" var="ldto" varStatus="status">
   			<i class="${ldto.langclass} category" 
   			   style="color: ${ldto.color}; 
   			   		  right: ${((llist.size() - 1) * 55 + 20) - (status.index * 55 + 10)}px;"></i>    			
   		</c:forEach> 
    		
	</div>

    <div class="commentForm">
      	<form method="POST" action="/code/addcomment.action">
                <textarea name="content" class="form-control content" required placeholder="1. Submit(Ctrl+Enter)
2. Cancel(ESC)"></textarea>
				<input type="hidden" name="cseq" value="${dto.seq}"> <!-- 현재 보고있는 글번호(부모글) -->
				<input type="hidden" name="beginline"> <!-- 선택한 코드 시작 라인 번호 -->
				<input type="hidden" name="endline"> <!-- 선택한 코드 끝 라인 번호 -->
		</form>
	</div>
</div>

<div class="list">
	<c:forEach items="${clist}" var="cdto">
   	<div class="listitem" data-begin="${cdto.beginline}" data-end="${cdto.endline}">
       	<span class="line-number">
       		<fmt:formatNumber value="${cdto.beginline+1}" minIntegerDigits="3" />: </span>
       ${cdto.content}
   </div>
   </c:forEach>
</div>




<div class="list selected-list"></div>

<div class="btns">
    <button type="button" class="btn btn-default" onclick="location.href='/code/list.action';">Back</button>
</div>


<script src='/code/resources/js/view.js'></script>





















