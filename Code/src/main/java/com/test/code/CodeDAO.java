package com.test.code;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDAO {

	@Autowired
	private SqlSessionTemplate template;

	public String signin(String pw) {
		return template.selectOne("code.signin", pw);
	}
	
	public List<CodeDTO> list(String lseq) {
		//결과셋 레코드 > N개 > selectList() > mapper
		return template.selectList("code.list", lseq);
	}

	public List<CodeLanguageDTO> llist(String seq) {
		return template.selectList("code.llist", seq);
	}
	
	public List<CodeLanguageDTO> llistAll() {
		return template.selectList("code.llistAll");
	}

	public void add(CodeDTO dto) {
		template.insert("code.add", dto);
	}

	public String getSeq() {
		return template.selectOne("code.getSeq");
	}

	public void addLink(CodeLanguageLinkDTO lldto) {
		template.insert("code.addLink", lldto);
	}

	public void addComment(CodeCommentDTO dto) {
		template.insert("code.addComment", dto);
	}

	public List<CodeCommentDTO> clist(String seq) {
		return template.selectList("code.clist", seq);
	}
	
	
	
}
