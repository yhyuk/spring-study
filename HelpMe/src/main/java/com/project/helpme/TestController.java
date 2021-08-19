package com.project.helpme;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	@RequestMapping(value = "/layout/template.action", method = { RequestMethod.GET })
	public String template (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "template.design";
	}
	

}
