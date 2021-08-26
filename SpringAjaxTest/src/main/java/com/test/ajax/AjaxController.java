package com.test.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {
	
	@Autowired
	private AjaxDAO dao;
	
	// 버튼 누르기 전,후 전부 1페이지로 작성. 
	@RequestMapping(value = "/user/user.action", method = { RequestMethod.GET })
	public String user(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String btn) {

		// 구분
		if (btn != null && btn != "") {
			int count = dao.getUserCount();
			req.setAttribute("count", count);
		}

		return "user/user";
	}
	
	
	// 버튼 누르기 전
	@RequestMapping(value = "/user/user2.action", method = { RequestMethod.GET })
	public String user2(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "user/user2";
	}
	
	// 버튼 누른 후
	@RequestMapping(value = "/user/count.action", method = { RequestMethod.GET })
	public String count(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		int count = dao.getUserCount();
		req.setAttribute("count", count);
		
		return "user/count";
	}
	
	// GET http://localhost:8090/ajax/crud/list.action
	// 1. 유저 목록 보기
	@RequestMapping(value = "/crud/list.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<UserDTO> list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return dao.list();
	}
	
	// POST http://localhost:8090/ajax/crud/add.action
	// 2. 유저 등록하기
	@RequestMapping(value = "/crud/add.action", method = { RequestMethod.POST })
	@ResponseBody
	public int add(HttpServletRequest req, HttpServletResponse resp, HttpSession session
					, UserDTO dto) {
		
		return dao.add(dto);
	}
	
	// 3. 특정 유저 가져오기
	@RequestMapping(value = "/crud/get.action", method = { RequestMethod.GET })
	@ResponseBody
	public UserDTO get(HttpServletRequest req, HttpServletResponse resp, HttpSession session
					, String seq) {
		
		return dao.get(seq);
	}

	// 4. 특정 수정하기
	@RequestMapping(value = "/crud/edit.action", method = { RequestMethod.POST })
	@ResponseBody
	public int edit(HttpServletRequest req, HttpServletResponse resp, HttpSession session
					, UserDTO dto) {
		
		return dao.edit(dto);
	}

	// 5. 특정 삭제하기
	@RequestMapping(value = "/crud/del.action", method = { RequestMethod.POST })
	@ResponseBody
	public int del(HttpServletRequest req, HttpServletResponse resp, HttpSession session
					, String seq) {
		
		return dao.del(seq);
	}
	
	// 6. 유저 검색하기(주소)
	@RequestMapping(value = "/crud/search.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<UserDTO> search(HttpServletRequest req, HttpServletResponse resp, HttpSession session
								, String word) {
		
		return dao.search(word);
	}
	
	// 7. 페이지
	@RequestMapping(value = "/crud/index.action", method = { RequestMethod.GET })
	public String index(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "crud/index";
	}
	
	@RequestMapping(value = "/crud/getseq.action", method = { RequestMethod.GET })
	@ResponseBody
	public String getSeq(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return dao.getSeq();
	}
}
