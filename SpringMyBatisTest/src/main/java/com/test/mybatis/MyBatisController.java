package com.test.mybatis;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyBatisController {
	
	// MyBatisController -> (의존 주입) -> MyBatisDAO 객체 생성 -> (의존 주입) -> 
	// SqlSessionTemplate 객체 생성 -> (의존 주입) -> SqlSessionFactoryBean 객체 생성 -> (의존 주입)
	// -> BasicDataSource 객체 생성
	
	@Autowired
	private MyBatisDAO dao;

	@RequestMapping(value = "/test.action", method = { RequestMethod.GET })
	public String test(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "result";
	}
	
	@RequestMapping(value = "/m1.action", method = { RequestMethod.GET })
	public String m1(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		MyBatisDTO dto = new MyBatisDTO();
		
		dto.setSeq("3");
		dto.setName("김홍삼");
		dto.setMemo("메모입니당.");
		dto.setCategory("Mybatis");
		
		// 반환값이 없는 쿼리
		int result = dao.add(dto);
		
		req.setAttribute("result", result);
		
		return "result";
	}
	
	@RequestMapping(value = "/m2.action", method = { RequestMethod.GET })
	public String m2(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		// 상자 -> DTO, HashMap
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("category", "스프링");
		map.put("newcategory", "spring");
		
		int result = dao.m2(map);
		
		req.setAttribute("result", result);
		
		return "result";
	}
	
}
