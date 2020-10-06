package No06OOP;

/* 최대값 구하는 메소드 : 98 */
public class searchMax
{
	int num1=17, num2=53, num3= 84, num4=73, num5=49, 
			num6=27, num7=90, num8=85, num9=75, num10=50,
			 num11=85, num12=92, num13=78, num14=98, num15=68;  // 변수 15개 선언
	int resultMax = 0;
	
	public void Max()
	{
		for(int i=1; i<15; i++)			// 1 ~ 15 반복
		{
			if(num1<num2)				// num1과 num2를 비교해서
				resultMax = num2;		// num2가 크면 resultMax에 num2를 저장 ▶ 53
			
			if(resultMax < num3)
				resultMax = num3;		// 84
				
			if(resultMax < num4)
				resultMax = num4;		// 84 (num3가 크기 때문에 저장 값 안바뀐다.)
			
			if(resultMax < num5)
				resultMax = num5;		// 84

			if(resultMax < num6)
				resultMax = num6;		// 84

			if(resultMax < num7)
				resultMax = num7;		// 90

			if(resultMax < num8)
				resultMax = num8;		// 90

			if(resultMax < num9)
				resultMax = num9;		// 90

			if(resultMax < num10)
				resultMax = num10;		// 90

			if(resultMax < num11)
				resultMax = num11;		// 90

			if(resultMax < num12)
				resultMax = num12;		// 92

			if(resultMax < num13)
				resultMax = num13;		// 92

			if(resultMax < num14)
				resultMax = num14;		// 98

			if(resultMax < num15)
				resultMax = num15;		// 98
		}
		System.out.println(resultMax);
	}
}
