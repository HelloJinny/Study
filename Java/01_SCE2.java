/*
 * 파일 이름 : SCE.java
 * 작성자 : 
 * 작성일 : 2020년 04월 23일 목요일
 * 프로그램 설명 : SCE.java (num2 강제 동작 시키기)
 * 	             Short Circuit Evaluation 으로 인해 발생되는 문제점 수정하세요.
 */

package No01SCE2;

public class SCE2 {

	public static void main(String[] args) {
		
		int num1=0, num2=0;
		boolean result;
		
		num1 += 10;  // 수정 - 강제 연산
		num2 += 10;  // 수정 - 강제 연산
		result = (num1 < 0) && (num2 > 0);  // 수정
		System.out.println("result = " +result);
		System.out.println("num1=" + num1 + ", num2 =" + num2);
		
		 // += 연산자가 논리 연산자와 함께 있어서 문제가 된 것이다.	
		
		num1 += 10;  // 수정 - 강제 연산
		num2 += 10;  // 수정 - 강제 연산
		result = (num1 > 0) || (num2 > 0);  // 수정
		System.out.println("result = " +result);
		System.out.println("num1=" + num1 + ", num2 =" + num2);
		
	}

}
