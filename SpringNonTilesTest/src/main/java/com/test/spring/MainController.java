package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	// 회원 페이지 =============================================================================
	
	@RequestMapping(value = "/member/info.action", method = { RequestMethod.GET })
	public String info(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "member/info";
	}

	@RequestMapping(value = "/member/point.action", method = { RequestMethod.GET })
	public String point(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "member/point";
	}
	
	@RequestMapping(value = "/member/history.action", method = { RequestMethod.GET })
	public String history(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "member/history";
	}
	
	// 관리자 페이지 =============================================================================
	
	@RequestMapping(value = "/admin/log.action", method = { RequestMethod.GET })
	public String log(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "admin/log";
	}
	
	@RequestMapping(value = "/admin/chart.action", method = { RequestMethod.GET })
	public String chart(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "admin/chart";
	}
	
}
