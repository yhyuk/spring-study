package com.project.helpme.health;

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

@ServerEndpoint("/health/chatserver")
public class ChatServer {
	
	//현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
	private static List<Session> list = new ArrayList<Session>();
	//private static List<List<Session>> list = new ArrayList<List<Session>>();
	
	private void print(String msg) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
	}
	
	@OnOpen
	public void handleOpen(Session session) {
		print("클라이언트 연결");
		
		list.add(session); //접속자 관리(********)
		
//		for (Session s : list) {
//			if (s != session) { //현재 접속자가 아닌 나머지 사람들
//				
//				try {
//					s.getBasicRemote().sendText("다른 유저가 접속했습니다.");
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//				
//			}
//		}
		
	}

	@OnMessage
	public void handleMessage(String msg, Session session) {
				
		//1#유저명
		//2#유저명#메시지
		//System.out.println(msg);

		int index = msg.indexOf("#", 2);
		String no = msg.substring(0, 1); 
		String user = msg.substring(2, index);
		String txt = msg.substring(index + 1);
		
		
		if (no.equals("1")) {
			//누군가 접속 > 1#아무개
			for (Session s : list) {
				if (s != session) { //현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("1#" + user + "#");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			
		} else if (no.equals("2")) {
			//누군가 메시지를 전송
			for (Session s : list) {
				if (s != session) { //현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("2#" + user + "#" + txt);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			
		} else if (no.equals("3")) {
			//누군가 접속 > 3#아무개
			for (Session s : list) {
				if (s != session) { //현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("3#" + user + "#");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			
			list.remove(session);
			
		}
		
//		if (txt != null && txt != "") {
//			
//			//유저중 하나가 메시지를 전송했다!!!
//			
//		}
		
	}
	
	@OnClose
	public void handleClose() {
	}

	@OnError
	public void handleError(Throwable t) {
	}

}







