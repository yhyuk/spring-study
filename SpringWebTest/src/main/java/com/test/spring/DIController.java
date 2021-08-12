package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DIController {

	// 2. 
	// private Work work;
	
	// 3.
	// public DIController(Work work) {
	// 		this.work = work;
	//}
	
	// 아래의 변수에 해당 클래스의 객체를 만들어서 의존 주입을 해라!!
	@Autowired
	private Work work;
	
	@RequestMapping(value = "/di/di.action", method = { RequestMethod.GET })
	public String di(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		// Spring MVC Project > DI
		// 1. XML 방식		  -> 콘솔 수업
		// 2. Annotation 방식
		
		// 업무 구현 -> 의존 객체 필요
		
		// 1.
		// Work work = new Work();
		String result = work.doit();
		
		req.setAttribute("result", result);
		
		return "di/di";
	}

}
