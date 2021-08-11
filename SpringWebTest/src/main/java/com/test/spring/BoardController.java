package com.test.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 컨트롤러 역할을 부여하기 위한 자격 증명
@Controller
public class BoardController {
	
	private BoardDAO dao = new BoardDAO();
	
	// Servlet                          Spring
	// http://localhost:8090/spring/ == @RequestMapping(value="/")
	
	// 목록보기 http://localhost:8090/spring/board/list.action
	@RequestMapping(value = "/board/list.action")
	public String list() {
		
		// 업무
		// BoardDAO dao = new BoardDAO();
		
		// JSP 페이지 호출하기 + ViewResolver 동작 -> "/WEB-INF/views/" + "board/list" + ".jsp"
		return "board/list";
	}
	
	@RequestMapping(value = "/board/add.action")
	public String add() {
		
		// BoardDAO dao = new BoardDAO();
		
		return "board/add";
	}
	
	@RequestMapping(value = "/board/view.action")
	public String view() {
		
		// BoardDAO dao = new BoardDAO();
		
		return "board/view";
	}
	
}
