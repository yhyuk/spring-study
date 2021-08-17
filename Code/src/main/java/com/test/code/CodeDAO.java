package com.test.code;

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
	
}
