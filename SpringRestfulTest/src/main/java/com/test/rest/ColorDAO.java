package com.test.rest;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ColorDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List<ColorDTO> list() {
		return template.selectList("rest.list");
	}

	public ColorDTO get(String seq) {
		return template.selectOne("rest.get", seq);
	}

	public int add(ColorDTO dto) {
		return template.insert("rest.add", dto);
	}

	public int edit(ColorDTO dto) {
		return template.update("rest.edit", dto);
	}

	public int del(String seq) {
		return template.delete("rest.del", seq);
	}
	
}












