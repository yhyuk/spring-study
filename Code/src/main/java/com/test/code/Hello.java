package com.test.code;

import java.util.Arrays;

public class Hello {
	
	public static void main(String[] args) {
		
		System.out.println("Hello World!!");
		
		
		String str = "안녕하세요.\n반갑습니다.\n홍길동입니다.";
		
		//요구사항] str를 줄단위로 분리시킨 배열(컬렉션)으로 바꾸세요.
		
		//m1.
		String[] list1 = str.split("\n");
		System.out.println(Arrays.toString(list1));
		System.out.println(Arrays.toString(str.split("\n"))); //*****
		
		
		str.lines().forEach(line -> System.out.println(line));
		
		
	}

}












