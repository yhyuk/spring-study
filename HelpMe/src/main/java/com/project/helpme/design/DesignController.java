package com.project.helpme.design;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DesignController {

	@RequestMapping(value = "/design/list.action", method = { RequestMethod.GET })
	public String test(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "design.list";
	}
	
}
