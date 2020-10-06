/*
 문제1)
       (로또 번호 추출) 1~45사이의 숫자를 6개 추출 하는 프로그램을 작성 하세요
       (단, 중복된 숫자는 1번만 출력한다).
 */

package No15;

import java.util.Calendar;

public class No15Lotto
{
	public static void main(String[] args)
	{
		System.out.printf("\n\n \t\t\t\t\t 당 \t 첨 \t 결 \t 과 \t\t\t\t \n");
		
		// 현재 날짜/시간
		Calendar today = Calendar.getInstance();
				
		// 년, 월, 일 구하기
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH)+1;
		// 1월인 경우 0의 값으로 반환한다. 따라서 +1을 해줘야 한다.
		int day = today.get(Calendar.DAY_OF_MONTH);
				
		System.out.printf("\t\t\t\t\t (%d년 %d월 %d일 추첨) \n\n\n", year, month, day);	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		int[] lotto = new int[7];  // 로또 값 6개를 넣어줄 배열 생성 + 보너스 배열 1개

		for(int i = 0; i < lotto.length; i++)  // 0부터 6까지 반복
		{
			lotto[i] = (int) (Math.random() * 45 /* 최대값 */+ 1 /* 최소값 */);  // 1부터 45 인덱스 생성
			// 이미 정의되어있는 Math클래스의 random 메소드 
			
			for(int j = 0; j < i; j++)
			{
				if(lotto[j] == lotto[i])  // 중복 값 체크
				{
					i--;  // 이전 값 지우기
					break;  // 바깥 for문 돌면서 다시 i++ 해준다. 그러면 i-- 하기 전 i와 같은 값이 된다.
				}
			}
		}
		
		for(int k = 0; k <lotto.length-1; k++)  // 로또 값 6개를 넣어줄 배열 생성
		{
			System.out.print("\t" + lotto[k] + "\t" );
		}
		System.out.printf("\t\t + \t\t  " + lotto[6] +"\t\t\t\t \n");  // 보너스 번호
		
		System.out.printf("\n\n \t\t\t\t\t\t   당첨번호 \t\t\t\t");
		System.out.printf("\t\t\t\t\t 보너스 \t\t\t\t \n");
	}
}

