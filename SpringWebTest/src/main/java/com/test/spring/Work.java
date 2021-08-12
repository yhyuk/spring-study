package com.test.spring;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/*
 *  의존 객체로서의 자격 부여하기
 *  - 아래 어노테이션을 사용해야 Autowired에 의해서 호출 당할 자격이 생긴다.
 *  - 3가지 모두 똑같이 동작하는데 왜 각각 존재할까? > 의미를 구분하기 위해서.. Role(역할)
 *  1. @Service 	-> 서비스 객체(중간 단계 업무 객체) 
 *  2. @Repository 	-> 저장소 객체(DAO)
 *  3. @Component	-> 일반 객체(모듈)
 */

@Component
public class Work { // DIController의 의존객체
	
	public String doit() {
		System.out.println("메소드 호출");
		
		return "의존 객체의 반환값";
	}

}
