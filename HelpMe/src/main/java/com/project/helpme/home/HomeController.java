package com.project.helpme.home;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {

	@Autowired
	private HomeDAO dao;
	
	@RequestMapping(value = "/home/index.action", method = { RequestMethod.GET })
	public String template (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "home.index";
	}
	
	@RequestMapping(value = "/home/add.action", method = { RequestMethod.GET })
	public String add (HttpServletRequest req, 
					   HttpServletResponse resp, 
					   HttpSession session ) {
		

		
		return "home.add";
	}
	
	
	@RequestMapping(value = "/home/addok.action", method = { RequestMethod.POST })
	public void addok (HttpServletRequest req, 
					   HttpServletResponse resp, 
					   HttpSession session,
					   HomeDTO dto) {
		
		System.out.println(dto);
		

		//1. 데이터 가져오기
		//2. DB작업 
		// 게시물 insert x 1
	
		dao.add(dto);
		//homeSeq = dao.getHomeSeq();
		
		try {
			resp.sendRedirect("/helpme/home/index.action");
		} catch (IOException e) {
			e.printStackTrace();
		}

		
	}
	
	
	
	@RequestMapping(value = "/home/list.action", method = { RequestMethod.GET })
	public String list (HttpServletRequest req, 
					   HttpServletResponse resp, 
					   HttpSession session) {
		
		List<HomeDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		return "home.list";
		
	}
		
	
	
	

}
