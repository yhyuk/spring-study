package com.test.spring.di.ex04;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DB implements IData {

	public ArrayList<String> get() {
		
		// DB로부터 회원 명단 가져오기
		
		try {
			
			Connection conn = null;
			Statement stat = null;
			ResultSet rs = null;
			
			
			String sql = "select name from tblUser order by name asc";
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<String> list = new ArrayList<String>();
			
			while (rs.next()) {
				list.add(rs.getString("name"));
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
