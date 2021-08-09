package com.test.spring.di.ex01;

import java.util.Scanner;

public class Util {
	
	public String getName() {
		
		/*
		 *	그런데,,,,,, Util은 Scanner를 의존한다. ****
		 *	Scanner는 Util의 의존객체라고 부른다. ******
		 *	Util은 PrintStream을 의존한다. (인식 X) -> 이런것 까지 따지면 너무 피곤해짐...
		 */
		Scanner scan = new Scanner(System.in);
		
		System.out.print("이름: ");
		String name = scan.nextLine();
		
		return name;

	}

}