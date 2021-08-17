-- db.sql

drop table tblCodeUser;

drop table tblCodeLanguageLink;
drop sequence seqCodeLanguageLink;

drop table tblCodeLanguage;
drop sequence seqCodeLanguage;

drop table tblCodeComment;
drop sequence seqCodeComment;

drop table tblCode;
drop sequence seqCode;









-- 유저

create table tblCodeUser (
    id varchar2(30) primary key,            -- 아이디
    pw varchar2(30) not null,               -- 암호
    name varchar2(30) not null
);

insert into tblCodeUser (id, pw, name) values ('hong', '1111', '홍길동');

select * from tblCodeUser;






-- 언어

create table tblCodeLanguage (
    seq number primary key,                             --번호
    name varchar2(300) null,                        --언어명
    langicon varchar2(300) null,                        --아이콘
    langclass varchar2(300) null,                       --어썸아이콘
    color varchar2(300) null                            --색상
);

create sequence seqCodeLanguage start with 9;

insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (1, 'Java', 'java-icon', 'fas fa-keyboard', '#778899');
insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (2, 'SQL', 'sql-icon', 'fas fa-database', '#DD001C');
insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (3, 'HTML', 'html-icon', 'fab fa-html5', '#E34C20');
insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (4, 'CSS', 'css-icon', 'fab fa-css3-alt', '#EDB41E');
insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (5, 'JavaScript', 'javascript-icon', 'fab fa-js', '#2A97D5');
insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (6, 'Spring', 'spring-icon', 'fas fa-seedling', '#76B339');
insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (7, 'XML', 'xml-icon', 'fas fa-code', '#6495ED');
insert into tblCodeLanguage (seq, name, langicon, langclass, color) values (8, null, 'empty-icon', null, '#DCDCDC');

select * from tblCodeLanguage;






-- 코드

create table tblCode (
    seq number primary key,                                     --번호
    subject varchar2(1000) not null,                            --제목
    content varchar2(4000) not null,                        --내용
    code clob not null,                                         --코드
    regdate date default sysdate not null                       --시간
);

create sequence seqCode start with 4;

Insert into HR.TBLCODE (SEQ,SUBJECT,CONTENT,REGDATE,CODE) values (1,'자바 클래스 수업에서 사용한 Pencil 클래스입니다.','클래스를 선언하는 코드입니다.
멤버 변수를 private으로 선언하고 이에 대해 getter와 setter를 구현합니다.
toString을 재정의해서 내부 데이터를 문자열로 덤프합니다.',to_date('21/08/16','RR/MM/DD'),'package com.test.example;

public class Pencil {
	
	private String color; 	
	private int thickness;	
	private String hardness; 	
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getThickness() {
		return thickness;
	}
	public void setThickness(int thickness) {
		this.thickness = thickness;
	}
	public String getHardness() {
		return hardness;
	}
	public void setHardness(String hardness) {
		this.hardness = hardness;
	}	
	public String info() {
		
		return String.format("%s, %d, %s", color, thickness, hardness);
	}
	
}');
Insert into HR.TBLCODE (SEQ,SUBJECT,CONTENT,REGDATE,CODE) values (2,'Spring MVC Project 설정 파일입니다.','root-context.xml에서 MyBatis를 설정합니다.
오라클 데이터베이스를 사용하였고, log4j 도 추가했습니다.',to_date('21/08/16','RR/MM/DD'),'<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd">

	<bean id="dataSource"
		class="org.apache.commons.dbcp.BasicDataSource">
		<property name="driverClassName"
			value="oracle.jdbc.driver.OracleDriver"></property>
		<property name="url"
			value="jdbc:oracle:thin:@localhost:1521:xe"></property>
		<property name="username" value="hr"></property>
		<property name="password" value="java1234"></property>
	</bean>

	<bean id="log4j" class="net.sf.log4jdbc.Log4jdbcProxyDataSource">
		<constructor-arg ref="dataSource"></constructor-arg>
		<property name="logFormatter">
			<bean class="net.sf.log4jdbc.tools.Log4JdbcCustomFormatter">
				<property name="loggingType" value="MULTI_LINE"></property>
				<property name="sqlPrefix" value="[SQL]"></property>
			</bean>
		</property>
	</bean>

	<bean id="sessionfactory"
		class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="log4j"></property>
		<property name="mapperLocations"
			value="classpath*:com/test/code/mapper/*.xml"></property>
		<property name="configLocation" value="/WEB-INF/mybatis.xml"></property>
	</bean>

	<bean class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg ref="sessionfactory"></constructor-arg>
	</bean>

</beans>');
Insert into HR.TBLCODE (SEQ,SUBJECT,CONTENT,REGDATE,CODE) values (3,'JSP Model 1 페이지','파입 업로드 처리를 하는 JSP Model 1 기반의 페이지입니다.
상단에서 스크립틀릿을 사용해 자바를 처리하고 있고
하단에서 그 결과를 출력하고 마무리합니다.',to_date('21/08/16','RR/MM/DD'),'<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //동작 함.
		
	String path = application.getRealPath("/files");
	
	
	int size = 1024 * 1024 * 100; //100MB
	
	String subject = ""; //제목
	String name = ""; //이름
	String filename = ""; //첨부파일명
	String orgfilename = ""; //첨부파일명
	
	
	try {
		MultipartRequest multi = new MultipartRequest(
					request, //원래 request
					path, //업로드 위치
					size, //최대 크기
					"UTF-8", //인코딩 지정
					new DefaultFileRenamePolicy() //파일명 관리 객체
				);
		
		subject = multi.getParameter("subject");
		name = multi.getParameter("name");
		
		filename = multi.getFilesystemName("attach");
		orgfilename = multi.getOriginalFileName("attach");
		
	} catch(Exception e) {
		
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
</head>
<body>

	<div class="container">
		
		<h1>결과</h1>
		
		<div class="well">
			<strong>제목 : </strong>
			<%= subject %>
		</div>
		
		<div class="well">
			<strong>이름 : </strong>
			<%= name %>
		</div>
		
		<div class="well">
			<strong>파일 : </strong>
			<%= filename %>, <%= orgfilename %>
		</div>
		
		<h2>파일 다운로드</h2>
		
		<div><a href="/jsp/files/<%= filename %>"><%= orgfilename %></a></div>
		
		<div><a href="download.jsp?filename=<%= filename %>orgfilename=<%= orgfilename %>"><%= orgfilename %></a></div>

		<div><a href="/jsp/files/<%= filename %>" download><%= orgfilename %></a></div>
				
	</div>
</body>
</html>');

select * from tblCode;




-- 언어 <-> 코드

create table tblCodeLanguageLink (
    seq number primary key,                                     --번호
    cseq number references tblCode(seq) not null,               --코드번호
    lseq number references tblCodeLanguage(seq) not null       --언어번호
);

create sequence seqCodeLanguageLink start with 10;


Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (1,1,1);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (2,2,2);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (3,2,6);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (4,2,7);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (5,3,1);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (6,3,2);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (7,3,3);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (8,3,4);
Insert into HR.TBLCODELANGUAGELINK (SEQ,CSEQ,LSEQ) values (9,3,5);

select * from tblCodeLanguageLink;





-- 댓글

create table tblCodeComment (
    seq number primary key,                                     --번호
    content varchar2(4000) not null,                            --댓글
    beginline number not null,                                  --시작라인
    endline number not null,                                    --끝라인 
    regdate date default sysdate not null,                      --시간
    cseq number references tblCode(seq) not null                --코드번호
);

create sequence seqCodeComment start with 17;

Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (2,'덤프용 메소드입니다.',26,29,to_date('21/08/16','RR/MM/DD'),1);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (3,'getter와 setter입니다.
멤버변수의 이름과 get, set 접두어를 사용해서 만듭니다.',14,19,to_date('21/08/16','RR/MM/DD'),1);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (4,'패키지 선언입니다.',0,0,to_date('21/08/16','RR/MM/DD'),1);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (5,'String.format 메소드를 사용해서 내부 멤버 데이터를 덤프합니다.',28,28,to_date('21/08/16','RR/MM/DD'),1);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (1,'멤버 변수를 private 접근 지정자로 선언합니다.
private으로 선언하는 이유는 객체의 내부 데이터를 외부로부터 보호하기 위해서입니다.
캡슐화 또는 내부 정보 은닉화라고 하며 클래스를 선언할 때 일반적으로 private을 사용합니다.',4,6,to_date('21/08/16','RR/MM/DD'),1);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (6,'데이터베이스 소스를 설정합니다.
오라클의 연결을 설정하며 JDBC의 Connection 클래스에 지정하는 연결 문자열과 거의 동일합니다.',5,13,to_date('21/08/16','RR/MM/DD'),2);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (7,'log4j 설정입니다.
데이터 소스와 팩토리 중간에서 데이터베이스에서 일어나는 여러가지 일들에 대한 로그를 담당합니다.
데이터베이스에서의 입출력 작업 발생 시 개발자 콘솔 화면에 로그를 출력하는 일을 합니다.
질의와 매개변수를 한눈에 알아보기 쉽게 출력해주기 때문에 개발에 도움을 줍니다.',15,23,to_date('21/08/16','RR/MM/DD'),2);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (8,'질의를 담당하는 객체입니다.
모든 쿼리를 실행하고 반환값을 생성하는 역할을 합니다.',33,35,to_date('21/08/16','RR/MM/DD'),2);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (9,'기존의 request 객체의 일부 기능이 동작하지 않기 때문에 MultipartRequest 객체를 사용한다.
파일 업로드를 하는 기능을 가지고 있다.',19,25,to_date('21/08/16','RR/MM/DD'),3);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (10,'request.getParameter() 메소드가 동작하지 않아서 대신 MultipartRequest 객체의 getParameter()  메소드를 사용해 데이터를 가져온다.',27,31,to_date('21/08/16','RR/MM/DD'),3);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (11,'업로드 결과를 간단하게 출력하고, 다운로드할 수 있는 링크를 생성한다.',67,71,to_date('21/08/16','RR/MM/DD'),3);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (12,'파일 업로드의 최대 크기를 지정한다.',10,10,to_date('21/08/16','RR/MM/DD'),3);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (13,'업로드된 파일을 저장할 서버측의 경로를 지정한다.',7,7,to_date('21/08/16','RR/MM/DD'),3);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (14,'JSP 페이지 상단부에서 스크립틀릿을 사용한 파일 업로드 처리를 한다.
JSP 페이지의 일부에서 스크립틀릿을 사용하는 구현 방식을 JSP Model 1이라고 한다.
초창기 모델이며, 사용하기 편리함이 있긴 하지만 복잡한 스파게티 코드를 만들어내기 때문에 최근에는 MVC 디자인 패턴을 구현한 JSP Model 2 방식을 권장하고 있다.',4,36,to_date('21/08/16','RR/MM/DD'),3);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (15,'이렇게 예외처리부에 아무것도 작성하지 않으면 안된다.
예외가 발생했음에도 불구하고 개발자 콘솔에는 아무것도 출력이 되지 않기 때문에 반드시 알아볼 수 있는 무언가를 출력한다.
이런 안좋은 습관이 생긴 경우 본인과 주변 사람을 힘들게 한다.',33,35,to_date('21/08/16','RR/MM/DD'),3);
Insert into HR.TBLCODECOMMENT (SEQ,CONTENT,BEGINLINE,ENDLINE,REGDATE,CSEQ) values (16,'JSP에서 자바 데이터를 출력하는 용도로 사용하는 표현식이다.
작성한 구문은 나중에 서블릿으로 변환되어 out 객체의 출력 메소드의 인자로 사용된다.',52,52,to_date('21/08/16','RR/MM/DD'),3);

select * from tblCodeComment;

commit;






