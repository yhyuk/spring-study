package com.test.spring;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

// 보조 업무 객체
// -> Service(주 업무 객체)에 연결하기

@Aspect // 보조 업무 객체 자격 부여
@Component // 의존 주입 대상
public class Cross {
	
	// 주 업무 지정 -> 포인트 컷 지정하기
	@Pointcut("execution(public * com.test.spring.Service.*(..))")
	public void pc1() {
		// 구현X
	}
	
	// 보조 업무 생성 + 주 업무 결합(Advice)
	@Before("pc1()") // pc1()을 참조하겠다. 라는 뜻
	public void m1() {
		System.out.println("보조 업무를 실행합니다.");
	}
	
	@After("pc1()") 
	public void m2() {
		System.out.println("보조 업무2를 실행합니다.");
	}

}
