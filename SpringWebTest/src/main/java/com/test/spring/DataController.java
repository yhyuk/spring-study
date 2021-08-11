package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DataController {

	@RequestMapping(value = "/data/add.action", method = { RequestMethod.GET })
	public String add(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "data/add";
	}

	@RequestMapping(value="/data/addok.action", method={ RequestMethod.POST })
	public String addok(
						HttpServletRequest req, 
						HttpServletResponse resp, 
						HttpSession session,
						//String name, // req를 따로하지 않아도 req.getParameter("name");
						//String age,
						//String address,
						//String tel,
						//String email
						DataDTO dto,
						String num
						) {
		
		// 인코딩하기 - 한글깨짐 방지
		// 방법1. req.setCharacterEncoding("UTF-8");
		// 방법2. web.xml에 인코딩 필터설정하기
		
		// 데이터 가져오는 3가지 방법
		// 방법1. 기존 방식
		/*
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		
		DataDTO dto = new DataDTO();
		dto.setName(name);
		dto.setAge(age);
		dto.setAddress(address);
		dto.setTel(tel);
		dto.setEmail(email);
		*/
		
		// 방법2. 요청 메소드(각 매개변수 선언하기)
		/*
		DataDTO dto = new DataDTO();
		dto.setName(name);
		dto.setAge(age);
		dto.setAddress(address);
		dto.setTel(tel);
		dto.setEmail(email);
		*/
		
		// 방법3. 요청 메소드의 매개변수 이용하는 방법
		
		DataDAO dao = new DataDAO();
		dao.add(dto);
		
		System.out.println(num);
		
		return "data/addok";
	}
	
}
