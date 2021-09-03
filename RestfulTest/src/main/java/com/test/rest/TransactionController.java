package com.test.rest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TransactionController {

	@Autowired
	private TransactionService service;
	
	@RequestMapping(value = "/tx.action", method = { RequestMethod.GET })
	public String tx(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String no) {
		service.add(no);
		return "tx";
	}
}
