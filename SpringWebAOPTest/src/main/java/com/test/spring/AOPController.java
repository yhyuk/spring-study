package com.test.spring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AOPController {

	// 게시판: 목록, 쓰기, 보기
	
	// 주 업무 객체
	// - 컨트롤러가 비지니스 코드를 담당해도 되지만, 규모가 커지면 컨트롤러에서 모든 업무 구현하기 힘들다.
	// - 컨트롤러의 업무를 분산(위임)하기 위해서 만든 객체
	@Autowired
	private Service service;
	
	// 목록
	@RequestMapping(value = "/list.action", method = { RequestMethod.GET })
	public String list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		List<DTO> list = service.list();
		
		return "result";
	}
	
	// 쓰기
	@RequestMapping(value = "/add.action", method = { RequestMethod.GET })
	public String memberadd(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		// 미 인증 사용자 검사 -> 경고 + 내보내기
		
		// 예전 Servlet/JSP 방법
		// Auth auth = new Auth();
		// auth.check();
		
		int result = service.add();
		
		return "result";
	}
	
	// 보기
	@RequestMapping(value = "/view.action", method = { RequestMethod.GET })
	public String memberview(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		DTO dto = service.get();
		
		return "result";
	}
	
	// 로그인
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		// 회원 인증 구현
		session.setAttribute("id", "hong"); // 인증 티켓 발급 > 로그인
		
		return "result";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.action", method = { RequestMethod.GET })
	public String logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		// 로그아웃 성공
		session.removeAttribute("id");
		
		return "result";
	}
	
}
