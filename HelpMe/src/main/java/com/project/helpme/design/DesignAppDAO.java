package com.project.helpme.design;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DesignAppDAO {

	@Autowired
	private SqlSessionTemplate template;

	public void appAdd(DesignAppDTO dto) {
		template.insert("design.appAdd", dto);
	}
	
}
