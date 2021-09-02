package com.project.helpme.design;

import java.util.HashMap;
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

	public List<DesignDTO> appList(HashMap<String, String> map) {
		return template.selectList("design.appList", map);
	}

	public List<DesignAppDTO> reqList(String seq) {
		return template.selectList("design.reqList", seq);
	}

	public DesignAppDTO appView(String seq) {
		return template.selectOne("design.appView", seq);
	}

	public void appOk(String seq) {
		template.update("design.appOk", seq);
	}

	public void appNo(String seq) {
		template.update("design.appNo", seq);
	}

	public int getTotalCount() {
		return template.selectOne("design.getTotalCount");
	}

	
}
