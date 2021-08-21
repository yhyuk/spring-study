<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="POST" action="/code/addok.action">        
<table class="table table-bordered table-add">
    <tr>
        <td><input type="text" name="subject" class="form-control" required placeholder="Subject" autocomplete="off"></td>
    </tr>
    <tr>
        <td><textarea name="content" class="form-control" required placeholder="Description"></textarea></td>
    </tr>
    <tr>
        <td>
            <div class="language">
            
            	<c:forEach items="${llist}" var="ldto">
	            	<i class="${ldto.langclass} ${ldto.langicon} icon off"
	    			   title="${ldto.name}" 
	    			   data-toggle="tooltip" 
	    			   data-placement="bottom" 
	    			   data-language="${ldto.name.toLowerCase()}"
	    			   data-lseq="${ldto.seq}"></i>
                </c:forEach>
                
            </div>
        </td>
    </tr>
    <tr>
        <td><textarea name="code" class="form-control" required placeholder="Code"></textarea></td>
    </tr>
</table>


<div class="btns">
    <button type="button" class="btn btn-default" onclick="location.href='/code/list.action';">Back</button>
          <button type="submit" class="btn btn-primary">Create Code</button>
      </div>

<input type="hidden" name="lseq">

</form>



<script src='/code/resources/js/add.js'></script>