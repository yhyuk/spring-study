package com.test.spring;

import lombok.Data;

@Data
public class MemoDTO {
	private String seq;
	private String name;
	private String memo;
	private String regdate;
	private String category;
}
