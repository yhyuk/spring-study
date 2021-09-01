package com.test.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RestController {

	@Autowired
	private ColorDAO dao;
	

	@RequestMapping(value = "/test.action", method = { RequestMethod.GET })
	public String test(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "test";
	}
	
	
	//color > CRUD
	
	//목록보기(R)
	//1. http://localhost:8090/rest/color
	//2. GET
	//3. return JSON
	
	@RequestMapping(value = "/color", method = { RequestMethod.GET })
	@ResponseBody
	public List<ColorDTO> list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return dao.list();
	}
	
	
	//단일 요소 보기 > 특정 색상 가져오기
	//1. http://localhost:8090/rest/color/:id
	//2. GET
	//3. return JSON
	@RequestMapping(value = "/color/{seq}", method = { RequestMethod.GET })
	@ResponseBody
	public ColorDTO get(@PathVariable("seq") String seq) {
		return dao.get(seq);
	}
	
	
	
	//요소 추가
	//1. http://localhost:8090/rest/color
	//2. POST
	//3. return int
	@RequestMapping(value = "/color", method = { RequestMethod.POST })
	@ResponseBody
	public int add(@RequestBody ColorDTO dto) {
		return dao.add(dto);
	}
	
	
	
	//요소 수정
	//1. http://localhost:8090/rest/color/:id
	//2. PUT
	//3. return int
	
	@RequestMapping(value = "/color/{seq}", method = { RequestMethod.PUT })
	@ResponseBody
	public int edit(@PathVariable("seq") String seq, @RequestBody ColorDTO dto) {
		
		dto.setSeq(seq);
		
		return dao.edit(dto);
	}
}
