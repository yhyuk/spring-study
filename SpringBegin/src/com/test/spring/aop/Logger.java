package com.test.spring.aop;

import java.util.Calendar;

import org.aspectj.lang.ProceedingJoinPoint;


public class Logger {
	
	// 보조 업무 - 로그 기록
	public void log(String message) {
		
		// 시간 기록(DB)
		System.out.printf("[log] %tT %s\n", Calendar.getInstance(), message);
		
	}
	
	public void log() {
		
		// 시간 기록(DB)
		System.out.printf("[log] %tT \n", Calendar.getInstance());
		
	}
	
	
	public void before() {
		System.out.println("[log] 주업무 전에 보조업무를 실행합니다.");
	}

	public void after() {
		System.out.println("[log] 주업무 후에 보조업무를 실행합니다.");
	}
	
	public void around(ProceedingJoinPoint joinPoint) {

		//보조업무 -> 주업무 -> 보조업무

		long start = System.currentTimeMillis();
		System.out.println("[log] 시간 기록을 시작합니다.");

		//주업무 -> 참조
		try {

			//포인트컷의 호출을 대리 참조
			// -> memo.add("")와 동일한 참조
			joinPoint.proceed();

		} catch (Throwable e) {
			System.out.println("Logger.around()");
			e.printStackTrace();
		}

		long end = System.currentTimeMillis();
		System.out.println("[log] 시간 기록을 종료합니다.");

		System.out.printf("[log] 주업무 실행 소요 시간: %s\n", (end - start) + "ms");


	}
	
	public void afterthrowing(Exception e) {
		System.out.printf("[log] '%s' 예외 발생으로 관리자에게 메일을 발송했습니다.\n", e.getMessage());
	}
	
	public void afterreturning(Object obj) {
		System.out.printf("[log] %s번 메모를 검색했습니다.\n", obj);
	}

}
