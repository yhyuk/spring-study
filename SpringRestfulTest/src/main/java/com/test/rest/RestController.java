package com.test.rest;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
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
	
	
	
	
	
	//요소 삭제
	//1. http://localhost:8090/rest/color/:id
	//2. DELETE
	//3. return int
	
	@RequestMapping(value = "/color/{seq}", method = { RequestMethod.DELETE })
	@ResponseBody
	public int del(@PathVariable("seq") String seq) {
				
		return dao.del(seq);
	}
	
	
	
	
	
	
	@RequestMapping(value = "/page.action", method = { RequestMethod.GET })
	public String page(HttpServletRequest req, HttpServletResponse resp, HttpSession session) 
						throws Exception {
		
		//데이터 수급 역할
		//1. DAO + DB 직접 조작
		//2. DAO + RESTful 조작
		
		//RESTful API 접근 방법
		URL url = new URL("http://localhost:8090/rest/color");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		
		StringBuilder sb = new StringBuilder(); //문자열 래퍼 객체
		
		if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
						
//			String line = "";
//			
//			while ((line = reader.readLine()) != null) {
//				System.out.println(line);
//			}
//			
//			reader.close();
			
			
			
			//돌려받은 JSON 형식의 문자열 > 실제 JSON 형식으로 변환 > JSONArray & JSONObject
			
			//JSON 형식의 문자열을 JSON 관련 객체로 변환
			JSONParser parser = new JSONParser();
			JSONArray list = (JSONArray)parser.parse(reader); // == List<ColorDTO>
			
			reader.close();
			
			req.setAttribute("list", list);			
		}		

		
		return "page";
	}
	
	
	@RequestMapping(value = "/spa.action", method = { RequestMethod.GET })
	public String spa(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		
		return "spa";
	}
	
}




















