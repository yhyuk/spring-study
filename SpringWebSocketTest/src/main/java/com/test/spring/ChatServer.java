package com.test.spring;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatserver")
public class ChatServer {
	
	// 현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
	// static 붙여야함!!
	private static List<Session> list = new ArrayList<Session>();
	
	private void print(String msg) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
	}
	
	// Session
	// - 기존 우리가 알던 Session과 다르지만 비슷하다.
	// - 클라이언트를 정보를 가지고 있다.
	@OnOpen
	public void handleOpen(Session session) {
		print("클라이언트 연결");
		
		list.add(session); // 접속자 관리(****)
		
		/*
		for (Session s : list) {
			if (s != session) { // 현재 접속자가 아닌 나머지 사람들
				
				try {
					s.getBasicRemote().sendText("다른 유저가 접속했습니다.");
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		*/
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		
		// 로그인할 때: 1#유저명
		// 대화  할 때: 2유저명#메세지
		// System.out.println(msg);
		
		int index = msg.indexOf("#", 2);
		String no = msg.substring(0, 1); 
		String user = msg.substring(2, index);
		String txt = msg.substring(index + 1);
		
		if (no.equals("1")) {
			// 누군가 접속 > 1#아무개
			for (Session s : list) {
				if (s != session) { // 현재 접속자가 아닌 나머지 사람들
					
					try {
						s.getBasicRemote().sendText("1#" + user + "#");
					} catch (IOException e) {
						e.printStackTrace();
					}
					
				}
			}
			
		} else if (no.equals("2")) {
			// 누군가 메세지를 전송
			for (Session s : list) {
				
				if (s != session) { // 현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("2#" + user + ":" + txt);
					} catch (IOException e) {
						e.printStackTrace();
					}
					
				}
				
			} 
		} else if (no.equals("3")) {
			// 누군가 접속 > 3#아무개
			for (Session s : list) {
				
				if (s != session) { // 현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("3#" + user + "#");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
			}
			list.remove(session);
		}
		
		
		/*
		if (txt != null && txt != "") {
			
			// 유저 중 하나가 메세지를 전송했다.
			
		}
		*/
		
	}
	
	@OnClose
	public void handleClose() {
		
	}
	
	@OnError
	public void handleError(Throwable t) {
		
	}

}
