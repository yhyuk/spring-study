package com.test.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AjaxController {
	
	@Autowired
	private AjaxDAO dao;
	
	// 버튼 누르기 전,후 전부 1페이지로 작성. 
	@RequestMapping(value = "/user/user.action", method = { RequestMethod.GET })
	public String user(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String btn) {

		// 구분
		if (btn != null && btn != "") {
			int count = dao.getUserCount();
			req.setAttribute("count", count);
		}

		return "user/user";
	}
	
	
	// 버튼 누르기 전
	@RequestMapping(value = "/user/user2.action", method = { RequestMethod.GET })
	public String user2(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "user/user2";
	}
	
	// 버튼 누른 후
	@RequestMapping(value = "/user/count.action", method = { RequestMethod.GET })
	public String count(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		int count = dao.getUserCount();
		req.setAttribute("count", count);
		
		return "user/count";
	}

}
