package com.test.spring;

public class DataDAO {

	public void add(DataDTO dto) {
		
		System.out.println(dto.getName());
		System.out.println(dto.getAge());
		System.out.println(dto.getAddress());
		System.out.println(dto.getTel());
		System.out.println(dto.getEmail());
		
	}

}
