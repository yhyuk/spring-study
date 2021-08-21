package com.test.code;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CodeController {
	
	@Autowired
	private CodeDAO dao;
	
	@RequestMapping(value = "/index.action", method = { RequestMethod.GET })
	public String index (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "index";
	}
	
	@RequestMapping(value = "/signin.action", method = { RequestMethod.POST })
	public void signin (HttpServletRequest req, 
						HttpServletResponse resp, 
						HttpSession session,
						String pw) {

		// 1. 데이터 가져오기(pw)
		
		// 2. DB 작업 > select
		String id = dao.signin(pw);
		
		// 3. 인증 티켓 발급
		if (id != null) {
			session.setAttribute("id", id); // 인증 티켓 발급(로그인)
		}
		
		// 4. 결과 처리
		try {
			resp.sendRedirect("/code/index.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value = "/signout.action", method = { RequestMethod.GET })
	public void signout (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		session.removeAttribute("id"); // 인증 티켓 제거(로그아웃)
		
		try {
			resp.sendRedirect("/code/index.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/list.action", method = { RequestMethod.GET })
	public String list (HttpServletRequest req, 
						HttpServletResponse resp, 
						HttpSession session,
						String lseq) {

		List<CodeDTO> list = dao.list(lseq);
		
		for (CodeDTO dto : list) {
			// 게시물 1개 > 글 번호 조건 > SQL > 언어 목록
			List<CodeLanguageDTO> llist = dao.llist(dto.getSeq());
			dto.setLlist(llist);
			
		}
		
		req.setAttribute("list", list);
		
		return "list";
	}
	
	@RequestMapping(value = "/add.action", method = { RequestMethod.GET })
	public String add (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		List<CodeLanguageDTO> llist = dao.llistAll();
		req.setAttribute("llist", llist);
		
		return "add";
	}
	
	@RequestMapping(value = "/addok.action", method = { RequestMethod.POST })
	public void addok (HttpServletRequest req, 
						HttpServletResponse resp, 
						HttpSession session,
						CodeDTO dto,
						String lseq) {
		
		// 1. 데이터 가져오기(subject, content, code, lseq)
		// 2. DB 작업
		// 	- 게시물 insert x 1
		//	- 언어(링크) insert x N > lseq
		
		// 1.
		dao.add(dto);
		
		// 방금 작성한 게시물 번호 가져오기
		String seq = dao.getSeq();
		
		// 히든 태그로 넘겨받은 N개의 lseq(언어번호)
		String[] temp = lseq.split(",");
		
		CodeLanguageLinkDTO lldto = new CodeLanguageLinkDTO();
		lldto.setCseq(seq);
		
		for (String llseq : temp) {
			// 선택한 언어 번호(llseq) + 방금 작성한 게시물 번호(seq)
			lldto.setLseq(llseq);
			dao.addLink(lldto);
		}
		
		try {
			resp.sendRedirect("/code/list.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/view.action", method = { RequestMethod.GET })
	public String view (HttpServletRequest req, 
						HttpServletResponse resp, 
						HttpSession session,
						String seq) {
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 > select
		//3. DTO 전달 + JSP(tiles definition) 호출
		
		CodeDTO dto = dao.get(seq);
		
		
		// 글내용 개행문자 처리
		// - \r\n : Windows
		// - \r : Mac
		// - \n : Unix(Linux)
		dto.setContent(dto.getContent().replace("\n", "<br>"));
		
		dto.setCode(dto.getCode().replace("&", "&amp;"));
		
		// 코드 탭문자 처리
		dto.setCode(dto.getCode().replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;"));
		
		// 코드 마크업 문자 처리
		//	- 이 작업을 안한다면.. 위에서 탭문자 처리한 &nbsp 및 코드내용을 
		//    HTML이 알아서 해석해버림
		dto.setCode(dto.getCode().replace("<", "&lt;"));
		dto.setCode(dto.getCode().replace(">", "&gt;"));
		
		
		
		// 언어 가져오기
		List<CodeLanguageDTO> llist = dao.llist(seq);
		
		// 7개의 언어 DTO중에서 cseq가 not null인 항목만 남기고 나머지는 삭제
		// 방법1
		/*
		List<CodeLanguageDTO> llist2 = new ArrayList<CodeLanguageDTO>();
		
		for (CodeLanguageDTO d : llist) {
			if (d.getCseq() != null) {
				llist2.add(d);
			}
		}
		*/
		
		// 방법2. 스트림 사용
		llist = llist.stream()
					 .filter(ldto -> ldto.getCseq() != null)
					 .collect(Collectors.toList());
		
		// 댓글 목록 가져오기
		List<CodeCommentDTO> clist = dao.clist(seq);
		
		// 댓글 내용 개행 문자 처리
		for (CodeCommentDTO cdto : clist) {
			cdto.setContent(cdto.getContent().replace("\n", "<br>"));
		}		
		
		req.setAttribute("dto", dto);
		req.setAttribute("llist", llist);
		req.setAttribute("clist", clist);

		return "view";
	}
	
	@RequestMapping(value = "/addcomment.action", method = { RequestMethod.POST })
	public void addcomment (HttpServletRequest req, 
							HttpServletResponse resp, 
							HttpSession session,
							CodeCommentDTO dto) {
		
		// 1. 데이터 가져오기
		
		// 2. DB 작업
		dao.addComment(dto);
		
		// 3. view.action으로 돌아가기
		try {
			resp.sendRedirect("/code/view.action?seq=" + dto.getCseq());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}




