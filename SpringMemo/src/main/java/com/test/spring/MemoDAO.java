package com.test.spring;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

// 저장소
@Repository
public class MemoDAO {
	
	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemoDAO() {
		conn = DBUtil.open();
	}

	public int add(MemoDTO dto) {
		
		try {
			
			String sql = "insert into tblMemo (seq, name, memo, regdate, category) "
					+ "values(seqMemo.nextVal, ?, ?, default, ?)";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getMemo());
			pstat.setString(3, dto.getCategory());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<MemoDTO> list(String category) {
		
		try {
			
			String where = "";
			
			if (category != null) {
				where = " where category = '" + category + "' ";
			}
			
			String sql = "select * from tblMemo " + where + " order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
			
			while ( rs.next() ) {
				MemoDTO dto = new MemoDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCategory(rs.getString("category"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int del(String seq) {
		
		try {
			
			String sql = "delete from tblMemo where seq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
}
