<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${list}" var="dto">
<div class="item">
    <div class="language">
    	
    	<c:forEach items="${ dto.llist }" var="ldto">
    		<!-- 관련 언어 O -->
    		<c:if test="${ not empty ldto.cseq }">
    			<i class="${ ldto.langclass} ${ldto.langicon } icon"
    			   title="${ ldto.name }" 
    			   data-toggle="tooltip" 
    			   data-placement="bottom" 
    			   data-language="${ldto.name.toLowerCase() }" 
    			   onclick="location.href='/code/list.action?lseq=${ ldto.seq }';"></i>
    		</c:if>
    		
    		<!-- 관련 언어 X -->
    		<c:if test="${ empty ldto.cseq }">
    			<i class="empty-icon icon"></i>
    		</c:if>
        
        </c:forEach>
        
    </div>
    <div class="desc" onclick="location.href='/code/view.action';">
        <h4>${ dto.subject }</h4>
        <div class="ellipsis">${ dto.content }</div>
    </div>
</div>
</c:forEach>



<div class="btns">
    <button type="button" class="btn btn-default" onclick="location.href='/code/list.action';">All Code</button>
    <button type="button" class="btn btn-primary" onclick="location.href='/code/add.action';">Add Code</button>
</div>



<script src='/code/resources/js/list.js'></script>
















