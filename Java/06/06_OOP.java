/*
 * 파일 이름 : OOP.java
 * 작성자 : 
 * 작성일 : 2020년 04월 29일 수요일
 * 프로그램 설명 :
 	다음과 같은 데이터가 존재한다고 할 때, 데이터를 검색하여 최대값, 최소값, 평균값을 구하는 프로그램을 OOP로 작성하세요.
 	(단, 배열 이용하지 말 것) 	
 	{17, 53, 84, 73, 49, 27, 90, 85, 75, 50, 85, 92, 78, 98, 68 }
*/

package No06OOP;

import No06OOP.searchMax;  //  최대값
import No06OOP.searchMin;   //  최소값
import No06OOP.searchAvg;   //  평균값

public class OOP
{
	public static void main(String[] args)
	{
		searchMax max = new searchMax();  // 최대값
		System.out.println("최대값 : ");
		max.Max();
		
		searchMin min = new searchMin();    // 최소값
		System.out.println("최소값 : ");
		min.Min();
		
		searchAvg avg = new searchAvg();    // 평균값
		System.out.println("평균값 : ");
		avg.Avg();
	}
}
