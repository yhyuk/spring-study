package com.project.helpme.design;

import java.util.List;

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

	public List<DesignAppDTO> helperList(String id) {
		return template.selectList("design.helperList", id);
	}

	public void reqOk(String seq) {
		template.update("design.reqOk", seq);
	}

	public void reqNo(String seq) {
		template.update("design.reqNo", seq);
	}

	public void appDel(String seq) {
		template.delete("design.appDel", seq);
	}
	
}
