/*
 문제2)
       윤년의 정의
	  - 1년 365.242374
	  - 평년 = 365일 (2월달 - 28일까지)
	  - 윤년 = 366일 (2월달 - 29일까지)

	1. 해당 연도를 4로 나누어 떨어지면 윤년.
	2. 그 중에서 100으로 나누어 떨어지면 윤년이 아님.
	3. 그 중에서 400으로 나누어 떨어지면 윤년.
	>> 1번과 2번은 AND / 3번은 OR
 */

package No15;

import java.util.Scanner;

public class No15LeapYear
{
	public static void main(String[] args)
	{
			Scanner input = new Scanner(System.in);  // 키보드로 부터 연도를 입력받기
		
			System.out.println("연도를 입력하세요 : ");
			int leapYear = input.nextInt();
		
//			if(leapYear%4 == 0)
//				System.out.printf("윤년입니다. \n\n");
//			else if(leapYear%4 == 0 && leapYear%100 == 0)
//				System.out.printf("윤년이 아닙니다.\n\n");		
//			else if(leapYear%400 == 0)
//				System.out.printf("윤년 \n\n");
//			else
//				System.out.printf("윤년이 아닙니다. \n\n");
			
			if((leapYear % 4 == 0 && leapYear % 100 != 0) || leapYear % 400 == 0){
				System.out.println(leapYear + "은 윤년");
			}else{
				System.out.println(leapYear + "은 평년");
			}	
	}
}
