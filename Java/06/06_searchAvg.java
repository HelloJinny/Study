package No06OOP;

/* 평균값을 구하는 메소드 : 68 */
public class searchAvg
{
	int num1=17, num2=53, num3= 84, num4=73, num5=49, 
			num6=27, num7=90, num8=85, num9=75, num10=50,
			 num11=85, num12=92, num13=78, num14=98, num15=68;  // 변수 15개 선언
	int sum = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9 + num10
			 + num11 + num12 + num13 + num14 + num15;
	int resultAvg = 0;
	
	public void Avg()
	{
		resultAvg = sum/15;
		
		System.out.println(resultAvg);
	}

}
