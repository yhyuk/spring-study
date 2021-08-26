<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>
   	.container {
   		width: 650px;
   	}
   	
   	.table th:nth-child(1) { width: 80px; }
   	.table th:nth-child(2) { width: 60px; }
   	.table th:nth-child(3) { width: auto; }
   	.table th:nth-child(4) { width: 110px; }
   	.table th:nth-child(5) { width: 100px; }
   	
   	.table th, .table td { 
   		text-align: center;
   		vertical-align: middle !important; 
   	}
   	
   	.table td:nth-child(3) { text-align: left; }
   	
   	.emoji {
   		cursor: pointer;
   	}
   	
</style>

</head>
<body>
   	<!-- index.jsp -->
	<div class="container">
		<h1 class="page-header">User</h1>      
   		
   		<table class="table table-bordered">
   			<thead>
   				<tr>
   					<th>이름</th>
   					<th>나이</th>
   					<th>주소</th>
   					<th>생일</th>
   					<th>편집</th>
   				</tr>
   			</thead>
   			<tbody data-empty="1">
   				<!-- 
   				<tr>
   					<td colspan="5">데이터가 없습니다.</td>
   				</tr> 
   				-->
   				<!-- 
   				<tr>
   					<td>홍길동</td>
   					<td>22</td>
   					<td>서울시 강남구</td>
   					<td>2005-01-01</td>
   					<td>
   						<span class="emoji" title="edit" onclick="edit();">🛹</span>				
   						<span class="emoji" title="delete" onclick="del();">🧻</span>				
   					</td>
   				</tr> 
   				-->
   			</tbody>
			<tfoot>
   				<tr>
   					<form id="addForm">
   					<td><input type="text" name="name" id="name" class="form-control" /></td>
   					<td><input type="text" name="age" id="age" class="form-control" /></td>
   					<td><input type="text" name="address" id="address" class="form-control" /></td>
   					<td><input type="text" name="birthday" id="birthday" class="form-control" /></td>
   					<td><input type="button" value="추가하기" class="btn btn-default" id="btnAdd" /></td>
   					</form>
   				</tr>
			</tfoot>
   		</table>
   		
   	</div>   
   
   	<script>
   	
   		// 페이지 로딩 시 > 목록 가져와서 출력
   		$.ajax({
   			type: 'GET',
   			url: '/ajax/crud/list.action',
   			dataType: 'json',
   			success: function(list) {
				
   				$('.table tbody').html('');

   				if (list.length > 0) {
   					$(list).each(function (index, user) {
   						$('.table tbody').append('<tr><td>' + user.name + '</td><td>' + user.age + '</td><td>' + user.address + '</td><td>' + user.birthday + '</td><td><span class="emoji" title="edit" onclick="edit(' + user.seq + ');">🛠</span><span class="emoji" title="delete" onclick="del(' + user.seq + ');">🗑</span></td></tr>');
   					});	
   				} else {
	   				$('.table tbody').append('<tr><td colspan="5">데이터가 없습니다.</td></tr>');
   				}
   				
   			},
   			error: function(a, b, c) {
   				console.log(a, b, c);
   			}
   		});
   		
   		$('#btnAdd').click(function() {
   			//alert($('#addForm').serialize());
   			$.ajax({
   				type: 'POST',
   				url: '/ajax/crud/add.action',
   				data: $('#addForm').serialize(),
   				dataType: 'json',
   				success: function(result) {
   					
   					// 1. 새로 추가한 행을 테이블에 출력하기
   					// 2. 입력 폼 초기화 하기
   					
   					if (result == 1) {
   						
   						$.ajax({
   							type: "GET",
   							url: '/ajax/crud/get.action',
   							dataType: 'json',
   							success: function(seq) {
   								
   								// 화면에 출력
   		   						$('.table tbody').append('<tr><td>' + $('#name').val() + '</td><td>' + $('#age').val() + '</td><td>' + $('#address').val() + '</td><td>' + $('#birthday').val() + '</td><td><span class="emoji" title="edit" onclick="edit(' + seq + ');">🛠</span><span class="emoji" title="delete" onclick="del(' + seq + ');">🗑</span></td></tr>');
   								
   								// 초기화
   								$('#name').val('');
   								$('#age').val('');
   								$('#address').val('');
   								$('#birthday').val('');
   								
   							},
   							error: function(a, b, c) {
   								console.log(a, b, c);
   							}
   						});
   						
   					}
   					
   				},
   				error: function(a, b, c) {
   	   				console.log(a, b, c);
   	   			}
   			});
   			
   		});
   		
   		function del(seq) {
   			
   			// alert(seq);
   			
   			// this -> window
   			let btn = event.srcElement;
   			
   			$.ajax({
   				type: 'POST',
   				url: '/ajax/crud/del.action',
   				data: 'seq=' + seq,
   				dataType: 'json',
   				success: function(result) {
   					if (result == 1) {
   						//this(X)
   						//event.srcElement(X)
   						$(btn).parent().parent().remove();
   					}
   				},
   				error: function(a, b, c) {
   	   				console.log(a, b, c);
   	   			}
   				
   			});
   			
   		}
   		
   		
   		function edit(seq) {
   			
   			let tr = $(event.srcElement).parent().parent();
   			
   			// alert(tr.children().eq(0).text());
   			
   			let name = tr.children().eq(0).text();
   			tr.children().eq(0).html('');
   			tr.children().eq(0).append('<input type="text" class="form-control" id="uname" value="' + name + '">');
   		}
	</script>
</body>
</html>