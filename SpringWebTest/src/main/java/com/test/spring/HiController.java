package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 스프링에서는 어노테이션을 많이쓴다.
// 스프링
// - XML 위주의 설정 -> 어노테이션 위주의 설정

@Controller
public class HiController {

	// 요청 메소드(doGet, doPost, handleRequest)
	
	@RequestMapping(value="/hi.action")
	public String test(HttpSession session, HttpServletResponse resp, HttpServletRequest req) {
		aaa();
		bbb();
		
		// DB 작업 -> 결과 -> 출력
		req.setAttribute("num",100);
		
		
		// JSP 호출하기
		return "hi"; // -> "/WEB-INF/views/hi.jsp"
	}
	
	public void aaa() {
		
	}

	public void bbb() {
		
	}
	
}
















