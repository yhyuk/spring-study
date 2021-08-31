package com.project.helpme.design;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DesignDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public void reqAdd(DesignDTO dto) {
		template.insert("design.reqAdd", dto);
	}

	public List<DesignDTO> myList(String id) {
		return template.selectList("design.myList", id);
	}

	public void reqDel(String seq) {
		template.delete("design.reqDel", seq);
	}

	public DesignDTO reqView(String seq) {
		return template.selectOne("design.reqView", seq);
	}

	public List<DesignDTO> rqeList() {
		return template.selectList("design.reqList");
	}

	
	
}
