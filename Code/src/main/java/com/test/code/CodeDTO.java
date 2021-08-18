package com.test.code;

import java.util.List;

import lombok.Data;

@Data
public class CodeDTO {
	
	private String seq;
	private String subject;
	private String content;
	private String code;
	private String regdate;
	
	private List<CodeLanguageDTO> llist; // 현재 게시물에 관련된 언어 목록

}
