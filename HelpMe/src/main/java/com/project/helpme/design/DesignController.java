package com.project.helpme.design;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.helpme.CheckMember;

@Controller
public class DesignController {
	
	@Autowired
	private DesignDAO dao;
	
	@Autowired
	private DesignAppDAO hdao;
	
	/**
	 * 디자인/개발 카테고리 메인화면(일반, 헬퍼)
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
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		int nowPage = 0; 		// 현재 페이지번호
		int totalCount = 0;		// 총 게시물
		int pageSize = 10;		// 한 페이지당 출력할 게시물 수
		int totalPage = 0;		// 총 페이지 수
		int begin = 0;			// 가져올 게시물 시작 위치
		int end = 0;			// 가져올 게시물 끝 위치 
		int n = 0;				// 페이지바 제작 (출력되는 페이지 변수)
		int blockSize = 5;		// 페이지바 제작 (출력되는 페이지 변수)
		int loop = 0;			// 페이지바 제작 (루프 변수)
		
		String page = req.getParameter("page");
		
		if (page == null || page.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");

		totalCount = dao.getTotalCount();
		totalPage = (int)Math.ceil( (double)totalCount / pageSize );
		
		String pagebar = "<nav aria-label=\"...\">\r\n"
				+ "			<ul class='pagination'>";
		
		loop = 1;
		n = ( (nowPage - 1) / blockSize ) * blockSize + 1;
		
		// 이전 페이지
		if ( n == 1 ) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!' tabindex='-1'><img src='/helpme/resources/images/previous.png' style='width:14px;'/></a></li> ");
		} else {
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/helpme/design/list.action' tabindex='-1'><img src='/helpme/resources/images/previous.png' style='width:14px;'/></a></li> ", n-1);
		}
		
		// 페이지 글 X
		if (totalPage == 0) {
			pagebar +=  " <li class='page-item active'><a class='page-link' href='#!'>1</a></li> ";
		}
		
		while ( !(loop > blockSize || n > totalPage ) ) {
			if ( n == nowPage ) {
				pagebar += String.format(" <li class='page-item active'><a class='page-link' href='#!'>%d<span class='sr-only'>(current)</span></a></li> ", n);
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/helpme/design/list.action?page=%d' tabindex='-1'>%d</a></li> ", n, n);
			}
			
			loop ++;
			n++;
		}
		
		// 다음 페이지
		if ( n > totalPage ) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!'><img src='/helpme/resources/images/next.png' style='width:14px;'/></a></li> ");
		} else {
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/helpme/design/list.action?page=%d' tabindex='-1'><img src='/helpme/resources/images/next.png' style='width:14px;'/></a></li> ", n);
		}
		
		pagebar += "</ul>\r\n"
				+ "  		</nav>";
		
		List<DesignDTO> list = dao.appList(map);
		
		for (DesignDTO dto : list) {
			
			String regDay = dto.getRegdate();
			String startDay = dto.getStartDay();
			String endDay = dto.getEndDay();
			String title = dto.getTitle();
			
			regDay = regDay.substring(0, 10);
			startDay = startDay.substring(0, 10);
			endDay = endDay.substring(0, 10);
			
			if (title.length() > 15) {
				title = title.substring(0, 15) + "...";
				dto.setTitle(title);
			}
			
			dto.setRegdate(regDay);
			dto.setStartDay(startDay);
			dto.setEndDay(endDay);
		}
		
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("list", list);
		return "design.list";
	}
	
	/**
	 * 나의 요청서 리스트(일반)
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
		
		for (DesignDTO dto : list) {
			
			String title = dto.getTitle();
			String regDay = dto.getRegdate();
			
			regDay = regDay.substring(0, 10);
			
			if (title.length() > 15) {
				title = title.substring(0, 15) + "...";
				dto.setTitle(title);
			}
			dto.setRegdate(regDay);
			
		}
		
		req.setAttribute("list", list);
		return "design.mylist";
	}
	
	/**
	 * 요청서 작성하기(일반)
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
	 * 요청서 작성 완료(일반)
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
	 * 요청서 삭제하기(일반)
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
	 * 요청서 상세보기(일반, 헬퍼)
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
	
	/**
	 * 요청서에 신청한 헬퍼 리스트 보기(일반)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 * @return
	 */
	@RequestMapping(value = "/design/reqlist.action", method = { RequestMethod.GET })
	public String reqList(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String seq) {
		
		List<DesignAppDTO> list = dao.reqList(seq);
		
		for (DesignAppDTO dto : list) {
			String regDay = dto.getRegdate();
			String title = dto.getTitle();
			
			regDay = regDay.substring(0, 10);
			
			if (title.length() > 15) {
				title = title.substring(0, 15) + "...";
				dto.setTitle(title);
			}
			dto.setRegdate(regDay);
		}
		
		req.setAttribute("list", list);
		return "design.reqlist";
	}	
	
	/**
	 * 신청서 상세보기(일반)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 * @return
	 */
	@RequestMapping(value = "/design/appview.action", method = { RequestMethod.GET })
	public String appView(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String seq) {
		
		DesignAppDTO dto = dao.appView(seq);
		
		req.setAttribute("dto", dto);
		return "design.appview";
	}
	
	/**
	 * 신청서 수락하기(일반)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 * @param pseq
	 */
	@RequestMapping(value = "/design/appok.action", method = { RequestMethod.GET })
	public void appOk(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq, String pseq) {
		
		dao.appOk(seq);
		
		try {
			resp.sendRedirect("/helpme/design/reqlist.action?seq=" + pseq);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	
	
	/**
	 * 신청서 거절하기(일반)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 * @param pseq
	 */
	@RequestMapping(value = "/design/appno.action", method = { RequestMethod.GET })
	public void appNo(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq, String pseq) {
		
		dao.appNo(seq);
		
		try {
			resp.sendRedirect("/helpme/design/reqlist.action?seq=" + pseq);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	
	
	
	/**
	 * 신청서 작성하기(헬퍼)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 * @return
	 */
	@RequestMapping(value = "/design/appform.action", method = { RequestMethod.GET })
	public String appform(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq) {
		req.setAttribute("seq", seq);
		return "design.appform";
	}
	
	/**
	 * 신청서 작성완료(헬퍼)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param dto
	 * @param id
	 */
	@RequestMapping(value = "/design/appformok.action", method = { RequestMethod.POST })
	public void appformok(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, DesignAppDTO dto, String id) {
		
		hdao.appAdd(dto);
		
		try {
			resp.sendRedirect("/helpme/design/list.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 나의 신청서 리스트(헬퍼)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/design/helperlist.action", method = { RequestMethod.GET })
	public String helperList(HttpServletRequest req, HttpServletResponse resp, HttpSession session
						, String id) {
		
		List<DesignAppDTO> list = hdao.helperList(id);
		
		req.setAttribute("list", list);
		return "design.helperlist";
	}
	
	/**
	 * 요청서 수락하기(헬퍼)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 */
	@RequestMapping(value = "/design/reqok.action", method = { RequestMethod.GET })
	public void reqOk(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq) {
		
		hdao.reqOk(seq);
		
		try {
			resp.sendRedirect("/helpme/design/helperlist.action?id=" + session.getAttribute("id"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	
	
	/**
	 * 요청서 거절하기(헬퍼)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 */
	@RequestMapping(value = "/design/reqno.action", method = { RequestMethod.GET })
	public void reqNo(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq) {
		
		hdao.reqNo(seq);
		
		try {
			resp.sendRedirect("/helpme/design/helperlist.action?id=" + session.getAttribute("id"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	
	
	/**
	 * 신청서 삭제하기(헬퍼)
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param seq
	 */
	@RequestMapping(value = "/design/appdelformok.action", method = { RequestMethod.GET })
	public void appdelformok(HttpServletRequest req, HttpServletResponse resp, HttpSession session
			, String seq) {
		
		hdao.appDel(seq);
		try {
			resp.sendRedirect("/helpme/design/helperlist.action?id=" + session.getAttribute("id"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
}
