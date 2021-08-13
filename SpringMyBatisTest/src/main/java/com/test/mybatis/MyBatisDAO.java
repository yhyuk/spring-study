package com.test.mybatis;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// JDBC -> MyBatis
@Repository
public class MyBatisDAO {

	@Autowired
	private SqlSessionTemplate template; // Statement + ResultSet + Mapping
	
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
	
	public int add(MyBatisDTO dto) {
		
		// executeUpdate()
		// 매개변수 X, 반환값 X 쿼리
		return template.insert("test.m1");
	}
	
	public int del() {
		// 매개변수 O, 반환값 X 쿼리
		return template.delete("test.m2", 1);
	}
	
	public int update(MyBatisDTO dto) {
		// 매개변수가 O, 반환값 X 쿼리
		return template.update("test.m3", dto);
	}

	public int m2(HashMap<String, String> map) {
		// 매개 변수 N개
		// -> 무조건 상자(DTO, HashMap)에 담아서 넘겨야 한다.
		return template.update("test.m4", map);
	}

	public int m3() {
		// 매개변수 X, 반환값 O 쿼리(selectOne)
		return template.selectOne("test.m5");
	}

	public String m4(String seq) {
		// 매개변수 O, 반환값 O 쿼리(selectOne)
		return template.selectOne("test.m6", seq);
	}

	public MyBatisDTO m5(String seq) {
		// 매개변수 O, 반환값 O 쿼리(selectOne) -> 단일 레코드
		return template.selectOne("test.m7", seq);
	}

	public List<MyBatisDTO> m6() {
		// 매개변수 X, 반환값 O 쿼리(selectList) -> 다중 레코드
		return template.selectList("test.m8");
	}
}
