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

		/*
		 * 기존의 스프링 방식 : 컨트롤러 호출 -> 뷰 이름 반환 -> JSP 검색 -> JSP 호출
		 * tiles 방식: 컨트롤러 호출 -> <definition> 이름 반환 -> (ViewResolver) -> <definition> 검색
		 * 				-> JSP 검색 -> JSP 호출
		 * 
		 */
		
		// InternalResourceViewResolver
		//	-> JSP 경로 검색
		// return "member/info"; // tiles로 지정해줬기 때문에 이제 쓰지못한다. > info.jsp X
		
		// UrlBasedViewResolver
		//	-> <definition>을 검색
		
		return "member.info";
	}

	@RequestMapping(value = "/member/point.action", method = { RequestMethod.GET })
	public String point(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		// return "member/point";
		return "member.point";
	}
	
	@RequestMapping(value = "/member/history.action", method = { RequestMethod.GET })
	public String history(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		// return "member/history";
		return "member.history";
	}
	
	@RequestMapping(value = "/member/pic.action", method = { RequestMethod.GET })
	public String pic(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "member.pic";
	}
	
	// 관리자 페이지 =============================================================================
	
	@RequestMapping(value = "/admin/log.action", method = { RequestMethod.GET })
	public String log(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "admin.log";
	}
	
	@RequestMapping(value = "/admin/chart.action", method = { RequestMethod.GET })
	public String chart(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "admin.chart";
	}
	
}
