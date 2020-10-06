/*
 * 파일 이름 : No10Main.java
 * 작성자 : 
 * 작성일 : 2020년 05월 06일 수요일
 * 프로그램 설명 :
 * 				chap06의 exal06의 전자 계산기 기능 (+, -, *, /, %)을 업그레이드하되,
 * 				정수, 실수 연산이 모두 가능한 기능을 메서드 오버로딩을 이용하여 수현하고,
 * 				다음 연산 결과를 출력하세요.
 * 				1) 345 + 417.14
 * 				2) 25859.7142 - 345
 * 				3) 487 * 25
 * 				4) 345.25 / 12
 * 				5) 412 % 4
*/

package No10Main;

import No10Main.Cal.No10Calculator;

public class No10Main {

	public static void main(String[] args)
	{
		No10Calculator calc = new No10Calculator();
		
		System.out.println(calc.addNum(345, 417.14));			// 덧셈
		System.out.println(calc.subNum(25859.7142, 345));		// 뺄셈
		System.out.println(calc.multNum(487, 25));				// 곱셈
		System.out.println(calc.divNum(345.25, 12));				// 나눗셈
		System.out.println(calc.modNum(412, 4));					// 나머지
	}

}
