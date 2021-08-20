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
		width: 500px;
	}
	
	#list {
		height: 300px;
		padding: 15px;
		overflow: auto;
	}
   
</style>

</head>
<body>
   	<!-- chat.jsp -->
	<div class="container">
		<h1 class="page-header">Chat</h1>      
   		
   		<table class="table table-bordered">
   			<tr>
   				<td><input type="text" name="user" id="user" class="form-control" placeholder="유저명" /></td>
   				<td>
   					<button type="button" class="btn btn-default" id="btnConnect">연결</button>
   					<button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2">
   					<div id="list"></div>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2">
   					<input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" disabled />
   				</td>
   			</tr>
   		</table>
   		
   		   
   	</div>   
   
   	<script>
   	
   		// 채팅 서버 주소
   		let url = "ws://localhost:8090/spring/chatserver";
   		
   		// 웹 소켓
   		let ws;
   		
   		// 연결하기
   		$('#btnConnect').click(function() {
   			
   			// 유저명 확인
   			if ($('#user').val().trim() != '') {
   				
	   			// 연결
	   			ws = new WebSocket(url);
	   			
	   			// 소켓 이벤트 매핑
	   			ws.onopen = function (evt) {
	   				// console.log('서버 연결 성공');
	   				print($('#user').val(), '입장했습니다.');
	   				
	   				// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
	   				// -> 1#유저명
	   				ws.send('1#' + ${'#user'}.val() + '#');
	   				
	   				$('#user').attr('readonly', true);
	   				$('#btnConnect').attr('disabled', true);
	   				$('#btnDisconnect').attr('disabled', false);
	   				$('#msg').attr('disabled', false);
	   				$('#msg').focus();
	   			};
	
	   			ws.onmessage = function (evt) {
	   				// print('', evt.data);
	   				let index = msg.indexOf("#", 2);
	   				let no = msg.substring(0, 1);
	   				let user = msg.substring(2, index);
	   				let txt = msg.substring(index + 1);
	   				
	   				if (no == '1') {
	   					print2(user);
	   				} else if (no == '2') {
	   					print(uesr, txt);
	   				} else if (no == '3') {
	   					print3(user);
	   				}
	   				
	   				$('#list').scrollTop($('#list').prop('scrollHeight'));
	   			};
	   			
	   			ws.onclose = function (evt) {
	   			};
	   			
	   			ws.onerror = function (evt) {
	   				console.log(evt.data);
	   			};
	   			
   			} else {
   				alert('유저명을 입력하세요.');
   				$('#user').focus();
   			}
   			
   		});
   		
   		function print(user, txt) {
   			
   			let temp = '';
   			temp += '<div style="margin-bottom:3px;">';
   			temp += '[' + user + '] ';
   			
   			
   			
   			$('#list').append(temp);
   		}
   		
   		function print2(txt) {
   			let temp = '';
   			temp += '<div style="margin-bottom:3px;">';
   			temp += "'" + user + "' 이(가) 접속했습니다.";
   			temp += ' <span style="font-size:11px; color:#777;">' + new.Date().toLocaleTimeString() + '</span>';
   			
   			temp += '</div>';
   		}

   		function print3(txt) {
   			let temp = '';
   			temp += '<div style="margin-bottom:3px;">';
   			temp += "'" + user + "' 이(가) 접속했습니다.";
   			temp += ' <span style="font-size:11px; color:#777;">' + new.Date().toLocaleTimeString() + '</span>';
   			
   			temp += '</div>';
   		}
   		
   		$('#user').keydown(function() {
   			if (event.keyCode == 13) {
   				$('#btnConnect').click();
   			}
   		});

   		$('#msg').keyup(function() {
   			if (event.keyCode == 13) {
   				
   				// 서버에게 메세지 전달
   				// 2#유저명#메시지
   				ws.send('2#' + $('#user').val() + '#' + $(this).val());
   			}
   		});
   		
   		$('#btnDisConnect').click(function() {
   			ws.send('3#' + $('#user').val() + '#');
   			ws.close();
   			
			$('#user').attr('readonly', false);
			$('#user').val('');
			
			$('#btnConnect').attr('disabled', true);
			$('#btnDisconnect').attr('disabled', false);
			
			$('#msg').attr('disabled', false);
			$('#msg').focus();
   			
   			
   		});
   		
   		
	</script>
</body>
</html>