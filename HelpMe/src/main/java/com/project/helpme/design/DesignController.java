package com.project.helpme.design;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.helpme.CheckMember;
import com.project.helpme.MemberDTO;

@Controller
public class DesignController {
	
	@Autowired
	private DesignDAO dao;
	/**
	 * 디자인/개발 카테고리 메인화면
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/design/list.action", method = { RequestMethod.GET })
	public String list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		return "design.list";
	}
	
	/**
	 * 나의 요청서 리스트
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/design/mylist.action", method = { RequestMethod.GET })
	public String mylist(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String id) {
		
		List<DesignDTO> list = dao.myList(id);
		
		req.setAttribute("list", list);
		return "design.mylist";
	}
	
	/**
	 * 요청서 작성하기
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param service
	 * @return
	 */
	@RequestMapping(value = "/design/reqform.action", method = { RequestMethod.GET })
	public String reqform(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String service) {
		
		req.setAttribute("service", service);
		return "design.reqform";
	}
	
	/**
	 * 요청서 작성 완료
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param dto
	 * @param id
	 */
	@RequestMapping(value = "/design/reqformok.action", method = { RequestMethod.POST })
	public void reqformok(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, DesignDTO dto, String id) {
		
		dao.reqAdd(dto);
		
		try {
			resp.sendRedirect("/helpme/design/mylist.action?id=" + id);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 요청서 삭제하기
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 */
	@RequestMapping(value = "/design/delformok.action", method = { RequestMethod.GET })
	public void delformok(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq) {
		
		dao.reqDel(seq);
		try {
			resp.sendRedirect("/helpme/design/mylist.action?id=" + session.getAttribute("id"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	
	
	/**
	 * 요청서 상세보기
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 * @param id
	 */
	@RequestMapping(value = "/design/reqview.action", method = { RequestMethod.GET })
	public String reqView(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq) {
		
		DesignDTO dto = dao.reqView(seq);
		
		String startDay = dto.getStartDay();
		String endDay = dto.getEndDay();
		
		startDay = startDay.substring(0, 10);
		endDay = endDay.substring(0, 10);
		
		dto.setStartDay(startDay);
		dto.setEndDay(endDay);
		
		req.setAttribute("dto", dto);
		return "design.reqview";
		
	}		
	
	
	
	@RequestMapping(value = "/design/appform.action", method = { RequestMethod.GET })
	public String appform(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String service) {
		req.setAttribute("service", service);
		return "design.appform";
	}
	
}
