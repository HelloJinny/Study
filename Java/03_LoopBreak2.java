/*
 * 파일 이름 : LoopBreak.java
 * 작성자 : 
 * 작성일 : 2020년 04월 23일 목요일
 * 프로그램 설명 : [생각] 1~100 사이의 (양의) 5의 배수이면서, 7의 배수인 두번째 정수만 출력
*/

package LoopBreak2;

public class LoopBreak2 {

	public static void main(String[] args) {
		
		System.out.println(" *1~100 사이의 (양의) 5의 배수이면서, 7의 배수인 두번째 정수만 출력");
		
		for(int i=100; i>=1; i--)
		{
			if((i%5 == 0) && (i%7 == 0))
			{
				System.out.println("카운트 변수 : " + i);
				break;  // 반복문을 벗어나라
			}
		}

	}

}
