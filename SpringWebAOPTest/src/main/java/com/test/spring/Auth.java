package com.test.spring;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Auth {
	
	// 주 업무 지정
	@Pointcut("execution(public String com.test.spring.AOPController.member*(..))")
	public void member() {}
	
	// 보조 업무 지정
	@Before("member()")
	public void check(JoinPoint joinPoint) {
		// System.out.println("로그인 유무를 검사합니다.");
		
		// 글 쓰기에 접속한 사람이 로그인을 했는지 유무?
		// -> session 필요... -> JoinPoint
		
		Object[] args = joinPoint.getArgs();
		
		//for (Object obj : args ) {
		//	System.out.println(obj);
		//}
		// for문 출력값 req, resp, session
		// org.apache.catalina.connector.RequestFacade@583e6a4a
		// org.apache.catalina.connector.ResponseFacade@3baa1149e
		// org.apache.catalina.session.StandardSessionFacade@6a4b3a0
		
		// 보조 업무 객체 내에서 request, response, session 등을 얻어오는 방법!!
		HttpServletResponse resp = (HttpServletResponse)joinPoint.getArgs()[1];
		HttpSession session = (HttpSession)joinPoint.getArgs()[2];
		
		// 미 인증 사용자 일때.. 
		if (session.getAttribute("id") == null) {
			try {
				
				resp.setCharacterEncoding("UTF-8");
				PrintWriter writer = resp.getWriter();
				
				writer.print("<html>");
				writer.print("<head>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("</head");
				writer.print("<body>");
				writer.print("<script>");
				writer.print("alert('회원 전용 기능입니다.');");
				writer.print("location.href='/spring/list.action';");
				writer.print("</script>");
				writer.print("</body>");
				writer.print("</html>");
				
				writer.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
