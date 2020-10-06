/*
 * 파일 이름 : DupLoop2.java
 * 작성자 : 
 * 작성일 : 2020년 04월 23일 목요일
 * 프로그램 설명 : 구구단 옆으로 출력
 */

package No04DupLoop2;

public class DupLoop2 {

	public static void main(String[] args) {
		
		for(int i=1; i<10; i++)
		{
			System.out.print("[" + i + "단] \t\t");  // \t 칸 간격 벌림
		}
		
		System.out.println();
		
		for(int i=1; i<10; i++)  // 바깥 for문 (가로) ( 2단부터 9단까지 있다.)
		{
			for(int j=2; j<10; j++)  // 안쪽 for문 (세로) (1부터 9까지 곱을 진행해야 한다.)
			{				
				System.out.print(i + "x" + j + "=" + (i*j) + "\t");
			}
			System.out.println();	
		}

	}

}
