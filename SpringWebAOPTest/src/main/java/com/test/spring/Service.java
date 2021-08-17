package com.test.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

// 원래는 어노테이션이 그냥 @Service지만, Class이름이랑 동일하여 충돌나기 떄문에 풀네임....
@org.springframework.stereotype.Service
public class Service {
	
	@Autowired
	private DAO dao;
	
	// 주 업무.A
	public List<DTO> list() {
		return dao.list();
	}
	
	// 주 업무.B
	public int add() {
		return dao.add();
	}

	// 주 업무.C
	public DTO get() {
		return dao.get();
	}

}
