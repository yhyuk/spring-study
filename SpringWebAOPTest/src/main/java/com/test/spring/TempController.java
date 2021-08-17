package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TempController {

	@RequestMapping(value = "/temp.action", method = { RequestMethod.GET })
	public void temp(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		System.out.println("com.test.spring");
	}
	
}
