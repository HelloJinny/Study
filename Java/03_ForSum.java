/*
 * 파일 이름 : ForSum.java
 * 작성자 : 
 * 작성일 : 2020년 04월 23일 목요일
 * 프로그램 설명 : 1~100까지 2의 배수이면서 5의 배수인 숫자를 출력 하고, 그 출력된 숫자들의 합을 구하는 프로그램
*/

package No03;

public class ForSum {

	public static void main(String[] args) {
		
		int sum = 0;
		
		for(int i = 1; i<=100; i++)
		{
			if(i%2==0 && i%5==0)
			{
				System.out.println(i);
				sum+=i;
			}
		}
		
		System.out.println("합 : " + sum);

	}

}
