<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <i class="fas fa-keyboard java-icon icon off" title="Java" data-toggle="tooltip" data-placement="bottom" data-language="java"></i>
                <i class="fas fa-database sql-icon icon off" title="SQL" data-toggle="tooltip" data-placement="bottom" data-language="sql"></i>
                <i class="fab fa-html5 html-icon icon off" title="HTML" data-toggle="tooltip" data-placement="bottom" data-language="html"></i>
                <i class="fab fa-css3-alt css-icon icon off" title="CSS" data-toggle="tooltip" data-placement="bottom" data-language="css"></i>
                <i class="fab fa-js javascript-icon icon off" title="JavaScript" data-toggle="tooltip" data-placement="bottom" data-language="javascript"></i>                
                <i class="fas fa-seedling spring-icon icon off" title="Spring" data-toggle="tooltip" data-placement="bottom" data-language="spring"></i>                
                <i class="fas fa-code xml-icon icon off" title="XML" data-toggle="tooltip" data-placement="bottom" data-language="xml"></i>
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


<script src='/code/resources/js/add.js'></script>




