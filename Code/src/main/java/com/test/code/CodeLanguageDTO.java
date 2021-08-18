package com.test.code;

import lombok.Data;

@Data
public class CodeLanguageDTO {
	
	private String seq;
	private String name;
	private String langicon;
	private String langclass;
	private String color;
	private String cseq; // outer join용

}
