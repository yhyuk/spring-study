package com.test.spring;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemoController {
	
	@Autowired
	private MemoDAO dao; // 여러업무에서 공통으로 사용할 자원
	
	// 템플릿
	@RequestMapping(value = "/template.memo", method = { RequestMethod.GET })
	public String template(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "template";
	}
	
	// 메모 목록
	@RequestMapping(value = "/list.memo", method = { RequestMethod.GET })
	public String list(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String category) {
		
		// 1. DB 작업 > DAO 위임 > select
		// 2. JSP 호출하기 + 결과 전달
		
		System.out.println("category: " + category);
		
		ArrayList<MemoDTO> list = dao.list(category);
		
		req.setAttribute("list", list);
		
		return "list";
	}
	
	// 메모 쓰기
	@RequestMapping(value = "/add.memo", method = { RequestMethod.GET })
	public String add(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "add";
	}
	
	// 메모 쓰기(처리)
	@RequestMapping(value = "/addok.memo", method = { RequestMethod.POST })
	public String addok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, MemoDTO dto) {

		// 1. 데이터 가져오기
		// 2. DB 작업
		// 3. JSP 호출하기 + 결과 처리
		
		// 1. 매개변수 추가(MemoDTO dto)
		
		// 2. MemoDAO는 다른곳에서도 쓰이므로 멤버로 선언하기(MemoDAO dao)
		int result = dao.add(dto);
		
		// 3.
		req.setAttribute("result", result);
		
		return "addok";
	}
	
	// 메모 삭제(처리) > 페이지 이동 없으니 void로 반환값 X (개발자 마음대로..)
	@RequestMapping(value = "/delok.memo", method = { RequestMethod.GET })
	public void delok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String seq) {
		
		// 1. 데이터 가져오기(seq)
		// 2. DB 작업 > DAO 위임 > delete
		// 3. 결과 처리
		
		// 1. 매개변수 추가(String seq) 
		
		// 2. 
		dao.del(seq);
		
		// 3.
		try {
			resp.sendRedirect("/spring/list.memo");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
