package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	// 컨트롤러는 JSP호출을 위한 용도라서 사실상 의미가 없음.. 중요한건 Server
	@RequestMapping(value = "/chat.action", method = { RequestMethod.GET })
	public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "chat";
	}
}
