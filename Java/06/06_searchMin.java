package No06OOP;

/* 최소값 구하는 메소드 : 17 */
public class searchMin
{
	int num1=17, num2=53, num3= 84, num4=73, num5=49, 
			num6=27, num7=90, num8=85, num9=75, num10=50,
			 num11=85, num12=92, num13=78, num14=98, num15=68;  // 변수 15개 선언
	int resultMin = 0;
	
	public void Min()
	{
		for(int i=1; i<15; i++)				// 1 ~ 15 반복
		{
			if(num1<num2)					// num1과 num2를 비교해서
				resultMin = num1;			// num1가 작으면 resultMin에 num1를 저장 ▶ 17
			
			if(resultMin < num3)
				resultMin = resultMin;		// 17
				
			if(resultMin < num4)
				resultMin = resultMin;		// 17
			
			if(resultMin < num5)
				resultMin = resultMin;		// 17

			if(resultMin < num6)
				resultMin = resultMin;		// 17

			if(resultMin < num7)
				resultMin = resultMin;		// 17

			if(resultMin < num8)
				resultMin = resultMin;		// 17

			if(resultMin < num9)
				resultMin = resultMin;		// 17

			if(resultMin < num10)
				resultMin = resultMin;		// 17

			if(resultMin < num11)
				resultMin = resultMin;		// 17

			if(resultMin < num12)
				resultMin = resultMin;		// 17

			if(resultMin < num13)
				resultMin = resultMin;		// 17

			if(resultMin < num14)
				resultMin = resultMin;		// 17

			if(resultMin < num15)
				resultMin = resultMin;		// 17
		}
		System.out.println(resultMin);
	}
}
