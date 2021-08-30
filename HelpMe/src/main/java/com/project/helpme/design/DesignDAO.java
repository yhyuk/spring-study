package com.project.helpme.design;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DesignDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int reqAdd(DesignDTO dto) {
		return template.insert("design.reqAdd", dto);
	}

//	public List<DesignDTO> myList(String id) {
//		return template.selectList("design.myList", id);
//	}

	
	
}
