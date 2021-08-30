package com.test.ajax;

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
	public String count(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String name, String age) {
		
		// 서버 작업 수행 중 에러 발생
		// Random rnd = new Random();
		// System.out.println(100 / rnd.nextInt(3));
		
		/*
		try {
			Thread.sleep(10000); // 하던 일을 잠시 멈춰라
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		*/
		
		int count = dao.getUserCount();
		req.setAttribute("count", count);
		
		return "user/count";
	}
	
	
	// 순수 Ajax
	@RequestMapping(value = "/user/user3.action", method = { RequestMethod.GET })
	public String user3(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "user/user3";
	}
	
	// jQuery Ajax
	@RequestMapping(value = "/user/user4.action", method = { RequestMethod.GET })
	public String user4(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "user/user4";
	}	
	
	//
	@RequestMapping(value = "/basic/basic.action", method = { RequestMethod.GET })
	public String basic(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "basic/basic";
	}	
	
	// 서버의 요청 메소드(*.action)
	// *** 앞으로는 서버측에 요청 메소드(*.action)를 만들때는 용도가 브라우저 호출용인지, ajax 호출용인지 미리 구분하고 구현한다.
	// 1. 브라우저가 요청 > 웹 페이지(소스)를 반환 (JSP 사용)
	// 2. ajax가 요청 > 데이터를 반환 (Java 사용 + 데이터 출력(반환))
	@RequestMapping(value = "/basic/m1.action", method = { RequestMethod.GET })
	public void m1(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		try {
			
			// 브라우저에게 네가 돌려받는 데이터는 순수한 텍스트이다.(통보)
			// 원래는 text/html로 인식한다.
			resp.setContentType("text/plain");
			resp.setCharacterEncoding("UTF-8");
			
			// int count = dao.getUserCount();
			// PrintWriter writer = resp.getWriter();
			// writer.print(count);

			String name = dao.getUserName();

			PrintWriter writer = resp.getWriter();
			writer.print(name);
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	/*
	@RequestMapping(value = "/basic/m2.action", method = { RequestMethod.GET })
	public void m2(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		try {
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			
			UserDTO dto = dao.getUser();
			
			PrintWriter writer = resp.getWriter();
			
			// java -> javascript : json 형식으로 만들기
			writer.printf("{");
			writer.printf("\"seq\": \"%s\",", dto.getSeq());
			writer.printf("\"name\": \"%s\",", dto.getName());
			writer.printf("\"age\": \"%s\",", dto.getAge());
			writer.printf("\"address\": \"%s\",", dto.getAddress());
			writer.printf("\"birthday\": \"%s\"", dto.getBirthday());
			writer.printf("}");
			
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}		
	*/
	
	@RequestMapping(value = "/basic/m2.action", method = { RequestMethod.GET })
	@ResponseBody // UserDTO -> json 변환
	public UserDTO m2(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		UserDTO dto = dao.getUser();
		return dto; 
	}		

	@RequestMapping(value = "/basic/m3.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<UserDTO> m3(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
	
		// ajax 요청 -> tblAjaxUser 전체 목록 반환
	
		/*
		 *	목적: json 형식을 가지는 문자열을 만들어서 반환!!!
		 *
		 *  UserDTO 1개
		 *  	=>
		 *  json 객체 1개
		 *  {
		 *  	"seq": 1,
		 *  	"name": "홍길동",
		 *  	"age": 20
		 *  }
		 *  
		 *  그런데 문제는... UserDTO가 여러개가 필요하다?
		 *  	=>
		 *  List<UserDTO> -> json??
		 *  [ 
		 *  	{
		 *  		"seq": 1,
		 *  		"name": "홍길동",
		 *  		"age": 20
		 *  	},
		 *  	{
		 *  		"seq": 2,
		 *  		"name": "아무개",
		 *  		"age": 20
		 *  	},
		 *  	{
		 *  		"seq": 3,
		 *  		"name": "호호호",
		 *  		"age": 20
		 *  	}
		 *  ]
		 * 
		 */
		
		return dao.getList();
	
	}		
	
	@RequestMapping(value = "/basic/m4.action", method = { RequestMethod.GET })
	public void m4(HttpServletRequest req, HttpServletResponse resp, HttpSession session
					, String seq) {
	
		dao.removeUser(seq);
	}
	
	@RequestMapping(value = "/basic/m5.action", method = { RequestMethod.GET })
	@ResponseBody 
	public UserDTO m5(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String seq) {
		UserDTO dto = dao.getSeqUser(seq);
		return dto; 
	}			
	
	@RequestMapping(value = "/basic/m6.action", method = { RequestMethod.POST })
	@ResponseBody 
	public int m6(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, UserDTO dto) {
		int result = dao.add(dto);
		return result; 
	}		
	
	@RequestMapping(value = "/login/ex01.action", method = { RequestMethod.GET })
	public String ex01(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "login/ex01";
	}
	
	@RequestMapping(value = "/login/idcheck.action", method = { RequestMethod.GET })
	@ResponseBody 
	public int idcheck(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String id) {
		int result = dao.idcheck(id);
		return result; 
	}		
	
	// --------------------------------------------------------------------------
	// AjaxCRUD
	
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
	
	// --------------------------------------------------------------------------
	// AjaxMemo
	
	@RequestMapping(value = "/memo/index.action", method = { RequestMethod.GET })
	public String memoindex(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "memo/index";
	}
	
	
	
	
	
	
	
	
}
