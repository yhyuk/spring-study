package com.test.spring.di.ex07;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex07 {
	
	public static void main(String[] args) {
		
		// 데이터 저장소 교체
		// File -> DB 
		
		// IData data = new DB(); 
		
		// Service 객체는 File(DB) 객체를 의존한다.
		// -> File(DB)는 Service 객체의 의존 객체이다.
		// -> 스프링에서는 의존 객체를 직접 생성하지 않고, 의존 주입을 통해서 생성한다.
		// Service service = new Service(data); // 의존 주입(생성자)
		
		
		ApplicationContext context = new ClassPathXmlApplicationContext("config07.xml");
		
		// Error: No default constructor found, 기본 생성자가 없습니다.

		// 아래 코드는 Service 객체만 생성한게 아니다.
		//	-> 내부적으로 Service 객체의 의존 객체인 File 객체도 만들어서 Service 객체에게 의존 주입까지 한다.
		//	-> 겉으로는 Service 객체만 만든것처럼 보이지만, 실제로는 Service 객체와 File 객체를 모두 생성한다.
		
		/*
		 * 자바 방식: Ex07 입장에서는 Service 객체만 필요하다. 하지만 Service 객체의 의존 객체인 File 객체까지 만들어야 한다.
		 * 				-> 가독성이 떨어진다. 
		 * 				-> why? File 객체의 존재가 애매하기 때문에..
		 * 				-> 		File 객체는 Ex07에겐 직접적으로 필요하지 않은 객체라서..
		 * 
		 * 스프링 방식: Ex07이 Service 객체만 만들었다. File 객체의 생성과 Service 객체하고의 관계는 전부 XML에서 처리한다.
		 * 				Ex07이 Service 객체에만 집중할 수 있는 환경을 만들어 준다.
		 */
		Service service = (Service)context.getBean("service"); // new Service()
		
		ArrayList<String> list = service.list();
		
		for (String name : list) {
			System.out.println(name);
		}
		
		
	}

}
