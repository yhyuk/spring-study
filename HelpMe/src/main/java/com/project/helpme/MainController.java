package com.project.helpme;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@Autowired
	private MemberDAO dao;

	/**
	 * 로그인 페이지 Controller
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/member/login.action", method = { RequestMethod.GET })
	public String login (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "member.login";
	}
	
	/**
	 * 로그인 확인 Controller
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param id
	 * @param pw
	 */
	@RequestMapping(value = "/member/loginok.action", method = { RequestMethod.POST })
	public void loginok (HttpServletRequest req, HttpServletResponse resp, HttpSession session
							, String id, String pw) {

		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pw", pw);
		
		MemberDTO member = dao.login(map);
		
		if (member != null) {
			session.setAttribute("id", id); 
			session.setAttribute("member", member);
		}
		
		try {
			resp.sendRedirect("/helpme/design/list.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 로그아웃 Controller
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 */
	@RequestMapping(value = "/member/logout.action", method = { RequestMethod.GET })
	public void logout (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		session.removeAttribute("id"); 
		
		try {
			resp.sendRedirect("/helpme/design/list.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
