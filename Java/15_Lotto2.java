/*
 문제1)
       (로또 번호 추출) 1~45사이의 숫자를 6개 추출 하는 프로그램을 작성 하세요
       (단, 중복된 숫자는 1번만 출력한다).
 */

package No15;

import java.util.Calendar;
import java.util.Random;

class Lotto
{
	/* 필드 */
	int[] lottoNum;
	int index;
	
	/* 생성자 */
	Lotto()
	{
		lottoNum = new int[7];
		index = 0;
	}
	
	/* 메소드 */
	public void randomLotto()
	{
		Random random = new Random();  // 인스턴스화
		
		for(int i=0; i<lottoNum.length; i++)  // 인덱스 값 저장 : 0부터 5까지 반복
		{
			lottoNum[i] = random.nextInt(45)+1;  // i = 0 > 1~45 중에 랜덤으로 하나 저장
			
			for(int j=0; j<i; j++)
			{
				if(lottoNum[i] == lottoNum[j])
				// 중복 값 제거
				// 1. j=0 > 0<0 아니니까 for문으로
				// 2. j=0 > 0<1 맞으니까 들어가서 이전 값 제거
					i--;  // 새로운 값을 삭제하는 법을 모르니 이전에 값을 제거
			}
		}	
	}
	
	/* 메소드 */
	public void showlotto()
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
		for(int k = 0; k <lottoNum.length-1; k++)  // 로또 값 6개를 넣어줄 배열 생성
		{
			System.out.print("\t" + lottoNum[k] + "\t" );
		}
		System.out.printf("\t\t + \t\t  " + lottoNum[6] +"\t\t\t\t \n");  // 보너스 번호
		
		System.out.printf("\n\n \t\t\t\t\t\t   당첨번호 \t\t\t\t");
		System.out.printf("\t\t\t\t\t 보너스 \t\t\t\t \n");
	}
}

public class No15Lotto2
{
	public static void main(String[] args)
	{
		Lotto lotto = new Lotto();
		lotto.randomLotto();
		lotto.showlotto();
	}
}
