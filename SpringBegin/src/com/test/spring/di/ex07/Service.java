package com.test.spring.di.ex07;

import java.util.ArrayList;

public class Service {

	// 의존 주입을 구현하는 단계
	
	// 2단계. 의존객체가 저장될 멤버 변수를 만든다.
	private IData data;
	
	// 3단계. 생성자 or Setter를 구현한다.
	public Service(IData data) { // 의존 주입 *********
		this.data = data;
	}
	
	public ArrayList<String> list() {
		
		// 1단계. 직접 의존 객체를 생성하는 코드를 삭제한다.
		// IData data = new DB();
		
		return data.get();
	}
}
