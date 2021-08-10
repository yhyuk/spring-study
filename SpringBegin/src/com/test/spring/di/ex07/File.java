package com.test.spring.di.ex07;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

public class File implements IData {
	
	public ArrayList<String> get() {
		
		// 데이터 소스(member.txt) -> 데이터 가져오기 -> Ex03에게 반환
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader("member.txt"));
			
			String line = "";
			
			while ((line = reader.readLine()) != null) {
				list.add(line);
			}
			
			reader.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

}
