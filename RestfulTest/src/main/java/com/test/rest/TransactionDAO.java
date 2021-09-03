package com.test.rest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TransactionDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public void addPoint() {
		
		template.update("rest.addPoint");		
	}

	public void addBoard(String subject) {
		
		template.insert("rest.addBoard", subject);
	}

}








