package com.test.spring;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class DAO {

	public List<DTO> list() {
		System.out.println("list()");
		return null;
	}

	public int add() {
		System.out.println("add()");
		return 0;
	}

	public DTO get() {
		System.out.println("get()");
		return null;
	}

}
