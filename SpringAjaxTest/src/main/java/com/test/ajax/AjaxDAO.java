package com.test.ajax;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxDAO {

	@Autowired
	private SqlSessionTemplate template;

	public int getUserCount() {
		return template.selectOne("ajax.getUserCount");
	}
	
	public String getSeq() {
		return template.selectOne("ajax.getSeq");
	}

	public String getUserName() {
		return template.selectOne("ajax.getUserName");
	}

	public UserDTO getUser() {
		return template.selectOne("ajax.getUser");
	}
	
	public List<UserDTO> getList() {
		return template.selectList("ajax.getList");
	}
	
	public void removeUser(String seq) {
		template.delete("ajax.removeUser", seq);
	}
	
	public UserDTO getSeqUser(String seq) {
		return template.selectOne("ajax.getSeqUser", seq);
	}
	
	public int add(UserDTO dto) {
		return template.insert("ajax.add", dto);
	}
	
	
	// CRUD
	// 1. 유저 목록보기
	public List<UserDTO> list() {
		return template.selectList("ajax.list");
	}
	
	// 2. 유저 등록하기
	/*
	public int add(UserDTO dto) {
		return template.insert("ajax.add", dto);
	}
	*/
	
	// 3. 특정 유저 가져오기
	public UserDTO get(String seq) {
		return template.selectOne("ajax.get", seq);
	}
	
	// 4. 유저 수정하기
	public int edit(UserDTO dto) {
		return template.update("ajax.update", dto);
	}
	
	// 5. 유저 삭제하기
	public int del(String seq) {
		return template.delete("ajax.del", seq);
	}
	
	// 6. 유저 검색하기(주소)
	public List<UserDTO> search(String word) {
		return template.selectList("ajax.search", word);
	}

}
