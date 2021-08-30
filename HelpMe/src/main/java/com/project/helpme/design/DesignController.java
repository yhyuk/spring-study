package com.project.helpme.design;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DesignController {
	
	@Autowired
	private DesignDAO dao;

	@RequestMapping(value = "/design/list.action", method = { RequestMethod.GET })
	public String list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "design.list";
	}
	
	@RequestMapping(value = "/design/mylist.action", method = { RequestMethod.GET })
	public String mylist(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String id) {
		
		List<DesignDTO> list = dao.myList(id);
		
		req.setAttribute("list", list);
		return "design.mylist";
	}
	
	@RequestMapping(value = "/design/reqform.action", method = { RequestMethod.GET })
	public String reqform(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String service) {
		
		req.setAttribute("service", service);
		return "design.reqform";
	}

	@RequestMapping(value = "/design/reqformok.action", method = { RequestMethod.POST })
	public void reqformok(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, DesignDTO dto) {
		
		int result = dao.reqAdd(dto);
		System.out.println(dto);
		
		if ( result == 1 ) {
			try {
				resp.sendRedirect("/helpme/design/list.action");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
		}
		
	}
	
	
	
	
	@RequestMapping(value = "/design/appform.action", method = { RequestMethod.GET })
	public String appform(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String service) {
		req.setAttribute("service", service);
		return "design.appform";
	}
	
}
