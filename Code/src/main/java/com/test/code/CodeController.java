package com.test.code;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CodeController {
	
	@Autowired
	private CodeDAO dao;
	
	@RequestMapping(value = "/index.action", method = { RequestMethod.GET })
	public String index (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "index";
	}
	
	@RequestMapping(value = "/list.action", method = { RequestMethod.GET })
	public String list (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "list";
	}
	
	@RequestMapping(value = "/add.action", method = { RequestMethod.GET })
	public String add (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "add";
	}
	
	@RequestMapping(value = "/view.action", method = { RequestMethod.GET })
	public String view (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "view";
	}
	
	@RequestMapping(value = "/signin.action", method = { RequestMethod.POST })
	public void signin (HttpServletRequest req, 
						HttpServletResponse resp, 
						HttpSession session,
						String pw) {

		// 1. 데이터 가져오기(pw)
		
		// 2. DB 작업 > select
		String id = dao.signin(pw);
		
		// 3. 인증 티켓 발급
		if (id != null) {
			session.setAttribute("id", id); // 인증 티켓 발급(로그인)
		}
		
		// 4. 결과 처리
		try {
			resp.sendRedirect("/code/index.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value = "/signout.action", method = { RequestMethod.GET })
	public void signout (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		session.removeAttribute("id"); // 인증 티켓 제거(로그아웃)
		
		try {
			resp.sendRedirect("/code/index.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}




