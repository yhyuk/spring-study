package com.test.spring.di.ex03;

import java.util.ArrayList;

public class Ex03 {
	
	public static void main(String[] args) {
		
		// 회원 명단 관리
		// 1. 데이터 저장소 > 텍스트 파일 사용(member.txt)
		// 	-> 저장소 전환...
		// 2. 데이터 저장소 > 데이터베이스 사용(Oracle)
		
		// 객체간의 관계
		// Ex02 -> (의존, 위임) -> Util -> (의존, 위임) -> Scanner
		// Ex03 -> (의존, 위임) -> Service -> (의존, 위임) -> File or DB
		
		// 직접 고용(DI를 구현하지 않고, 의존 객체를 직접 생성)
		Service service = new Service();
		
		ArrayList<String> list = service.list();
		
		for (String name : list) {
			System.out.println(name);
		}
	}

}
