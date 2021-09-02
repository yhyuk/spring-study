package com.project.helpme.lesson;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LessonDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public int add(LessonReqDTO lrdto) {
		// TODO Auto-generated method stub
		return template.insert("lesson.addkind",lrdto);
	}

	public List<LessonReqDTO> reqlist(String id) {
		// TODO Auto-generated method stub
		return template.selectList("lesson.reqlist",id);
	}

	public LessonReqDTO reqlistdetail(String lessonSeq) {
		// TODO Auto-generated method stub
		return template.selectOne("lesson.reqlistdetail",lessonSeq);
	}

	public List<LessonReviewDTO> helplist(String lessonSeq) {
		// TODO Auto-generated method stub
		return template.selectList("lesson.helplist",lessonSeq);
	}

	public int matching(String lessonreqseq) {
		// TODO Auto-generated method stub
		return template.update("lesson.matching",lessonreqseq);
	}

	public List<LessonReqDTO> helperlist(String kind) {
		// TODO Auto-generated method stub
		return template.selectList("lesson.helperlist",kind);
	}

	public int addlist(LessonReqDTO lrdto) {
		// TODO Auto-generated method stub
		return template.insert("lesson.addlist",lrdto);
	}

	public List<LessonReviewDTO> listcheck(Object id) {
		// TODO Auto-generated method stub
		return template.selectList("lesson.listcheck",id);
	}



}
