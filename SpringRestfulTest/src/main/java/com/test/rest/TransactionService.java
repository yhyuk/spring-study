package com.test.rest;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//Service 객체
// - 컨트롤러 <-> 서비스 객체 <-> DAO
// - 컨트롤러의 업무 집중 현상을 막기 위해서 컨트롤러의 대부분의 비즈니스 업무를 분산시키기 위한 위임 객체


//@Autowired > 의존 주입

//의존 주입 객체 자격
//@Component
//  - @Service
//	- @Repository
//	- @XXX

@Service
public class TransactionService {
	
	@Autowired
	private TransactionDAO dao;

	@Transactional
	public void add(String no) {
		
		//tx.action > 글쓰기 성공
		//tx.action?no=1 > 글쓰기 실패
		
		//트랜잭션 업무
		//1. 포인트 증가 > 성공
		//2. 글쓰기 > 실패
		
		dao.addPoint();
		
		String subject = "";
		
		if (no != null && no.equals("1")) {
			subject = "가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가";
		} else {
			Random rnd = new Random();
			subject = "게시판입니다." + rnd.nextInt();
		}
		
		
		dao.addBoard(subject);
		
	}
	
}







