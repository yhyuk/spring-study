package com.test.file;

public class FileDTO {
	
	// 텍스트 입력
	private String name;
	private String subject;
	// 파일? > 바이너리 데이터 > DTO 수신 불가
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	

}
