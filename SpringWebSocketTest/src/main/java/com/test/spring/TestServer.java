package com.test.spring;

import java.util.Calendar;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;
// WebSocket 서버
// 종단점(EndPoint)

@ServerEndpoint("/server")
public class TestServer {
	
	private void print(String msg) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
	}
	
	@OnOpen
	public void handleOpne() {
		print("클라이언트가 접속했습니다.");
	}
	
	@OnMessage
	public String handleMessage(String msg) {
		print("클라이언트가 메세지를 전달했습니다.:" + msg);
		return "(응답)" + msg;
	}
	
	@OnClose
	public void handleClose() {
		//ws.close()
		print("클라이언트가 접속을 종료했습니다.");
		
	}
	
	@OnError
	public void handleError(Throwable t) {
		
	}

}
