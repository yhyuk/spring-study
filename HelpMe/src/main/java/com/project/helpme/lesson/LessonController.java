package com.project.helpme.lesson;

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
public class LessonController {
	@Autowired
	private LessonDAO dao;
	
	@RequestMapping(value = "/lesson/main.action", method = { RequestMethod.GET })
	public String main(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "lesson.main";
	}
	@RequestMapping(value = "/lesson/subject.action", method = { RequestMethod.GET })
	public String subject(HttpServletRequest req, HttpServletResponse resp, HttpSession session,LessonReqDTO lrdto, String kind) {

		List<LessonReqDTO> list = dao.helperlist(kind);
		
		
		req.setAttribute("list", list);
		req.setAttribute("kind", lrdto.getKind());

		return "lesson.subject";
	}
	
	
	@RequestMapping(value = "/lesson/reqlist.action", method = { RequestMethod.POST })
	public String subjectok(HttpServletRequest req, 
			HttpServletResponse resp, 
			HttpSession session,
			LessonReqDTO lrdto,
			String address1,
			String address2,
			String hopebegintime,
			String hopeendtime,
			String id) {
		
		lrdto.setAddress(address1+' '+address2);
		lrdto.setHopetime(hopebegintime+'~'+hopeendtime);

		
		int result = dao.add(lrdto);

		List<LessonReqDTO> list = dao.reqlist(id);
		
		
		req.setAttribute("list", list);
		
		
		return "lesson.reqlist";

	}
	
	@RequestMapping(value = "/lesson/reqlist.action", method = { RequestMethod.GET})
	public String subjectok(HttpServletRequest req, 
			HttpServletResponse resp, 
			HttpSession session,
			LessonReqDTO lrdto,
			String id) {


		List<LessonReqDTO> list = dao.reqlist(id);
		
		
		req.setAttribute("list", list);
		
		
		return "lesson.reqlist";

	}
	
	@RequestMapping(value = "/lesson/reqlistdetail.action", method = { RequestMethod.GET})
	public String reqlistdetail(HttpServletRequest req, 
			HttpServletResponse resp, 
			HttpSession session,
			LessonReqDTO lrdto,
			String lessonSeq) {


		lrdto = dao.reqlistdetail(lessonSeq);
		
		List <LessonReviewDTO> list = dao.helplist(lessonSeq);
		
		req.setAttribute("list", list);
		req.setAttribute("lessonSeq", lessonSeq);
		req.setAttribute("lrdto", lrdto);

		
		return "lesson.reqlistdetail";
		
		

	}
	
	
	@RequestMapping(value = "chat/chat.action", method = { RequestMethod.GET })
	public String chat(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		return "chat.chat";
	}
	
	
	@RequestMapping(value = "/lesson/matching.action", method = { RequestMethod.POST })
	@ResponseBody
	public int matching(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String lessonreqseq) {
	
		
		
		return dao.matching(lessonreqseq);
	}
	
	@RequestMapping(value = "/lesson/reqlistcheck.action", method = { RequestMethod.POST })	
	public String reqlistcheck(LessonReqDTO lrdto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		int result = dao.addlist(lrdto);
		List <LessonReviewDTO> listcheck = dao.listcheck(lrdto.getId());
		
		req.setAttribute("listcheck", listcheck);

		return "lesson.reqlistcheck";
	}
	
	@RequestMapping(value = "/lesson/reqlistcheck.action", method = { RequestMethod.GET })	
	public String reqlistcheck2(LessonReqDTO lrdto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		Object id = session.getAttribute("id");
		List <LessonReviewDTO> listcheck = dao.listcheck(id);
		
		req.setAttribute("listcheck", listcheck);

		return "lesson.reqlistcheck";
	}

}
