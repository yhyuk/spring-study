package com.project.helpme;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public MemberDTO login(HashMap<String, String> map) {
		return template.selectOne("member.login", map);
	}

}
