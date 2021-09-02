package com.project.helpme.home;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String signin(String pw) {

		return template.selectOne("home.signin", pw);
	}

	public void add(HomeDTO dto) {
	
		template.insert("home.add", dto);
	}

	public List<HomeDTO> list() {
		
		return template.selectList("home.list");
	}

	
}
