package com.project.helpme.health;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HealthDAO {

	@Autowired
	private SqlSessionTemplate template;

	public void add(HealthDTO dto) {
		
		template.insert("health.add",dto);
		
	}

	public List<HealthDTO> list() {
		
		
		return template.selectList("health.list");
	}

	public HealthDTO get(String healthseq) {
		
		return template.selectOne("health.get",healthseq);
	}

	public void del(String healthseq) {
		
		template.delete("health.del",healthseq);
		
	}

	public int edit(HealthDTO dto) {
		
		return template.update("health.edit",dto);
	}

	public List<HealthApplyDTO> alist(String healthseq) {
		
		return template.selectList("health.applylist",healthseq);
	}

	public void viewcnt(String healthseq) {
		template.update("health.viewcnt",healthseq);
		
	}

	public String applycnt(String healthseq) {
		
		return template.selectOne("health.applycnt", healthseq);
	}

	public void addapply(HealthApplyDTO dto) {
		
		template.insert("health.addapply",dto);
	}

	public MemberDTO gethelper(String id) {
		return template.selectOne("health.gethelper",id);
	}

	public void selecthelper(String healthseq) {
		template.update("health.selecthelper",healthseq);
		
	}
	
	
}
