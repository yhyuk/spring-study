package com.project.helpme;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/member/login.action", method = { RequestMethod.GET })
	public String login (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "member.login";
	}
	
	@RequestMapping(value = "/member/loginok.action", method = { RequestMethod.GET })
	public void loginok (HttpServletRequest req, HttpServletResponse resp, HttpSession session
							, String id) {

		
		
	}
	
	
}
