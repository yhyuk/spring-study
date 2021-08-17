package com.test.other;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	// No mapping found for HTTP request with URI [/spring/test.action]
	// -> 현재 스프링이 아래의 "/test.action"이라는 URI를 인식하고 있지 못함
	@RequestMapping(value = "/test.action", method = { RequestMethod.GET })
	public void test(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		System.out.println("com.test.other");
	}
}
