/*
 * 파일 이름 : AppleMain2.java
 * 작성자 : 
 * 작성일 : 2020년 04월 24일 금요일
 * 프로그램 설명 : 객체 지향 개념없이 사과 판매 프로그램을 작성해보기 ▶ 판매자에 포커스
 * 					 (메인 안에서 별도의 참조 자료형을 정의하지 않고 진행)
 * 		- 어머니가 e-mart에 가셔서 사과를 5,000원어치 사오셨다.
 * 		- e-mart의 이윤과 사과의 재고를 관리하자. (단, 개당 사과의 값은 1,000원)
 * 		- 아버지가 homeplus에 가셔서 사과를 7,000원어치 사오셨다.
 * 		- homeplus의 이윤과 사과의 재고를 관리하자. (단, 개당 사과의 값은 1,000원)
 */

package No05AppleMain2;

public class AppleMain2 {
	
	/* 마트의 재고 메소드 */
	public static int stock(int money, int priceOfApple, int numOfApple)
	{
		numOfApple -= money/priceOfApple;		// 사과의 수는 감소
		System.out.println("남은 사과 (재고) : " + numOfApple);
		return numOfApple;
	}
	
	/* 마트의 이윤 메소드 */
	public static int BNF(int money, int benefit)
	{
		benefit += money; 								// 판매의 수익은 발생
		System.out.println("판매 수익 : " + benefit);
		return benefit;
	}
	
	/* 메인 메소드 */
	public static void main(String[] args)
	{
		/* 이마트 재고와 이익 */
		int eMartStock = 1000;			// 이마트 재고 1000개	
		int eMartBnf = 0;					// 이마트 이익 초기화

		/* 홈플러스 재고와 이익 */
		int HomeStock = 1000;			// 홈플러스 재고 1000개	
		int HomeBnf = 0;				// 홈플러스 이익 초기화
		
		int money;
		
		/* 실행 결과 */
		System.out.println("\n\t * 이마트 * \n");
		
		money=5000;
		System.out.println("사과 "+money+"원 구매");
		eMartStock = stock(money,1000,eMartStock);
		eMartBnf = BNF(money,eMartBnf);
		
		System.out.println("\n\t * 홈플러스 * \n");
		
		money=7000;
		System.out.println("사과 "+money+"원 구매");
		HomeStock = stock(money,1000,HomeStock);
		HomeBnf = BNF(money,HomeBnf);
	}
}
