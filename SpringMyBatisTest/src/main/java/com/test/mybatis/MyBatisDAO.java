package com.test.mybatis;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

// JDBC -> MyBatis
@Repository
public class MyBatisDAO {

	private SqlSessionTemplate template; // Statement + ResultSet + Mapping
	
	public int add(MyBatisDTO dto) {
		
		// 반환값이 없는 쿼리 > insert
		
		/*
		 * stat.executeUpdate();
		 * - template.insert();
		 * - template.insert();
		 * - template.delete();
		 * 
		 * stat.executeQuery()
		 * - template.selectXXX();
		 */
		
		// template.insert("") 		: 인자가 없는 쿼리 
		// template.insert("", obj) : 인자가 있는 쿼리
		
		
		// MyBatis 특징: SQL을 XML로 작성한다
		
		// executeUpdate(), 매개변수가 없는 반환값 없는 쿼리
		// return template.insert("test.m1");
		
		// 매개변수가 있는 반환값 없는 쿼리
		// return template.delete("test.m2", 5); 
		
		// 매개변수가 있는 반환값 없는 쿼리
		
		return template.update("test.m3", dto);
	}

	public int m2(HashMap<String, String> map) {
		
		// 매개 변수 N개
		// -> 무조건 상자(DTO, HashMap)에 담아서 넘겨야 한다.
		
		return template.update("test.m4", map);
	}
}
