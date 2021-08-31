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
	
	.memo .txtMemo::-webkit-scrollbar {
    	width: 10px;
  	}
  	.memo .txtMemo::-webkit-scrollbar-thumb {
    	background-color: #FFF;
    	border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
 	 }
  	..memo .txtMemo::-webkit-scrollbar-track {
    	background-color: grey;
    	border-radius: 10px;
    	box-shadow: inset 0px 0px 5px white;
  	}
	
   
</style>

</head>
<body>
   	<!-- memo.jsp -->
	<h1 class="page-header">Memo <button type="button" id="addMemo" class="btn btn-default"><span class="glyphicon glyphicon-plus"> memo</span></button></h1>      
	 		
	<!-- 	
	<div class="memo" id="m3" style="background-image: url(/ajax/resources/images/03.png)">
		<div class="btnClose">&times;</div>
		<textarea class="txtMemo" ></textarea>
	</div>
 	-->   		
   		   
   	<script>
   	
		function getLeft() {
			let left = 0;
			while (left < 100) {
				left = Math.random() * $(document).width() - 250;
			}
			return left;
		}
		
		function getTop() {
			let top = 0;
			while (top < 100) {
				top = Math.random() * $(document).height() - 250;
			}
			return top;
		}
   	
   		// 아래의 2개의 이벤트를 실행할 시점에는 .memo 라는 태그가 화면에 존재하지 않음
   		/*
   		// 첫번째 이벤트
   		$('.memo').draggable().css('position', 'absolute');
   		
   		// 두번째 이벤트
   		$('.memo .btnClose').click(function() {
   			$(this).parent().remove();
   		});
   		*/
   		
   		
   		let no = ${no + 1}; 	// id값
   		let back = ${back + 1}; 	// 이미지 파일명
   		let zindex = ${zindex + 1};	// 클릭한 postit 가장 앞으로
   		
   		// 1. 버튼 클릭시 새 메모 추가하기
   		$('#addMemo').click(function() {
   			
   			if (back > 6) back = 1;
   			
   			// post-it 위치를 화면 내에 무작위로 배치하기
   			let left = getLeft();
			let top = getTop();
   			
   			// 화면에 메모지 1개 추가하기
   			$('body').append('<div class="memo" id="m' + no + '" style="background-image: url(/ajax/resources/images/0' + back + '.png);" data-back="0' + back + '"><div class="btnClose">&times;</div><textarea class="txtMemo" ></textarea></div>')
   				.children()
   				.last()
   				.draggable({
   					stop: function(event, ui) {
   						
   						let left = ui.position.left;
   						let top = ui.position.top;
   						let id = this.id;
   						let zindex = $(this).css('z-index');
   						let memo = $(this).find('textarea').val();
   						
   			   			$.ajax({
   			   				type: 'POST',
   			   				url: '/ajax/memo/edit.action',
   			   				data: 'left=' + left + '&top=' + top + '&id=' + id + '&zindex=' + zindex + '&memo=' + memo,
   			   				dataType: 'json',
   			   				success: function(result) {
   			   					if (result == 1) {}
   			   					else {}
   			   				},
   			   				error: function(a, b, c) {
   			   					console.log(a, b, c);
   			   				}
   			   			});
   						
   					}
   				}) // 메모 객체
   				.css('position', 'absolute')  // 메모객체
   				.css('left', left + 'px')
   				.css('top', top + 'px')
   				.mousedown(function() { // 메모객체
					$(this).css('z-index', zindex);
				
					let left = parseFloat($(this).css('left'));
					let top = parseFloat($(this).css('top'));
					let id = this.id;
					let memo = $(this).find('textarea').val();
					
		   			$.ajax({
		   				type: 'POST',
		   				url: '/ajax/memo/edit.action',
		   				data: 'left=' + left + '&top=' + top + '&id=' + id + '&zindex=' + zindex + '&memo=' + memo,
		   				dataType: 'json',
		   				success: function(result) {
		   					if (result == 1) {}
		   					else {}
		   				},
		   				error: function(a, b, c) {
		   					console.log(a, b, c);
		   				}
		   			});
		   			
					zindex++;
				})
   				.find('.btnClose').click(function() { // 메모객체의 닫기버튼
   					
   					let id = this.parentNode.id;					
					 
					$.ajax({
						type: 'POST',
						url: '/ajax/memo/del.action',
						data: 'id=' + id,
						dataType: 'json',
						success: function(result) {
							if (result == 1) {
								
							} else {
								
							}
						},
						error: function(a,b,c) {
							console.log(a,b,c);
						}
					}); 
					
   		   			$(this).parent().remove();
   		   		})
   		   		.next().blur(function() { //메모 객체의 텍스트 박스
						
						let left = parseFloat($(this).parent().css('left'));
						let top = parseFloat($(this).parent().css('top'));
						let id = this.parentNode.id;
						let memo = $(this).val();
												 
						$.ajax({
							type: 'POST',
							url: '/ajax/memo/edit.action',
							data: 'left=' + left + '&top=' + top + '&id=' + id + '&zindex=' + zindex + '&memo=' + memo,
							dataType: 'json',
							success: function(result) {
								if (result == 1) {
									
								} else {
									
								}
							},
							error: function(a,b,c) {
								console.log(a,b,c);
							}
							
						}); 
						
					});
   			
   			
   			// 2. 새로 추가된 메모의 정보를 DB에 전송 + Ajax 사용
   			$.ajax({
   				type: 'POST',
   				url: '/ajax/memo/add.action',
   				data: 'id=m' + no + '&background=0' + back + '&left=' + left + '&top=' + top + '&zindex=0',
   				dataType: 'json',
   				success: function(result) {
   					// 메모 추가 성공 유무 확인용
   					if (result == 1) {} 
   					else {}
   				},
   				error: function(a, b, c) {
   					console.log(a, b, c);
   				}
   			});
   			
   			
   			no++;
   			back++;
   			
   		});
   		
		<c:forEach items="${list}" var="dto">
		$('body').append(`<div class="memo" id="${dto.id}" style="background-image: url(/ajax/resources/images/${dto.background}.png);z-index:${dto.zindex};" data-back="${dto.background}"><div class="btnClose">&times;</div><textarea class="txtMemo">${dto.memo}</textarea></div>`)
			.children()
			.last()
			.draggable({
  				stop: function(event, ui) {
   						
					let left = ui.position.left;
					let top = ui.position.top;
					let id = this.id;
					let zindex = $(this).css('z-index');
					let memo = $(this).find('textarea').val();
					
		   			$.ajax({
		   				type: 'POST',
		   				url: '/ajax/memo/edit.action',
		   				data: 'left=' + left + '&top=' + top + '&id=' + id + '&zindex=' + zindex + '&memo=' + memo,
		   				dataType: 'json',
		   				success: function(result) {
		   					if (result == 1) {}
		   					else {}
		   				},
		   				error: function(a, b, c) {
		   					console.log(a, b, c);
		   				}
		   			});
   						
   				}
   			}) // 메모 객체
			.css('position', 'absolute')  // 메모객체
			.css('left', '${ dto.left }px')
			.css('top', '${ dto.top }px')
			.mousedown(function() { // 메모객체
				
				$(this).css('z-index', zindex);
			
				let left = parseFloat($(this).css('left'));
				let top = parseFloat($(this).css('top'));
				let id = this.id;
				let memo = $(this).find('textarea').val();
				
	   			$.ajax({
	   				type: 'POST',
	   				url: '/ajax/memo/edit.action',
	   				data: 'left=' + left + '&top=' + top + '&id=' + id + '&zindex=' + zindex + '&memo=' + memo,
	   				dataType: 'json',
	   				success: function(result) {
	   					if (result == 1) {}
	   					else {}
	   				},
	   				error: function(a, b, c) {
	   					console.log(a, b, c);
	   				}
	   			});
	   			
				zindex++;
			})
			.find('.btnClose').click(function() { // 메모객체의 닫기버튼
				
				let id = this.parentNode.id;					
				 
				$.ajax({
					type: 'POST',
					url: '/ajax/memo/del.action',
					data: 'id=' + id,
					dataType: 'json',
					success: function(result) {
						if (result == 1) {
							
						} else {
							
						}
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
					
				}); 
				
	 			$(this).parent().remove();
	 		})
			.next().blur(function() { // 메모 객체의 텍스트 박스
				
				let left = parseFloat($(this).parent().css('left'));
				let top = parseFloat($(this).parent().css('top'));
				let id = this.parentNode.id;
				let memo = $(this).val();
										 
				$.ajax({
					type: 'POST',
					url: '/ajax/memo/edit.action',
					data: 'left=' + left + '&top=' + top + '&id=' + id + '&zindex=' + zindex + '&memo=' + memo,
					dataType: 'json',
					success: function(result) {
						if (result == 1) {} 
						else {}
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
					
				}); 
				
			});
   		</c:forEach>
   		
	</script>
</body>
</html>