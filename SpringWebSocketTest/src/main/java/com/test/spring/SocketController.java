package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SocketController {

	@RequestMapping(value = "/ex01.action", method = { RequestMethod.GET })
	public String ex01 (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "ex01";
	}
	
}
