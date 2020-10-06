/*
 * 파일 이름 : No10Calculator.java
 * 작성자 : 
 * 작성일 : 2020년 05월 06일 수요일
 * 프로그램 설명 :
 * 				chap06의 exal06의 전자 계산기 기능 (+, -, *, /, %)을 업그레이드하되,
 * 				정수, 실수 연산이 모두 가능한 기능을 메서드 오버로딩을 이용하여 수현하고,
 * 				다음 연산 결과를 출력하세요.
 * 				1) 345 + 417.14
 * 				2) 25859.7142 - 345
 * 				3) 487 * 25
 * 				4) 345.25 / 12
 * 				5) 412 % 4
*/

package No10Main.Cal;

import No10Main.No10Main;

public class No10Calculator
{	
	private Adder adder;					// 덧셈
	private Subtractor subtractor;		// 뺄셈
	private Multiple multiple;				// 곱셈
	private Division division;				// 나눗셈
	private Mod mod;						// 나머지
	
	public No10Calculator() {				// 오버로딩
		adder = new Adder();
		subtractor = new Subtractor();
		multiple = new Multiple();
		division = new Division();
		mod = new Mod();
	}
	
	public int addNum(int n1, int n2) {							// 덧셈
		return adder.addTwoNumber(n1, n2);
	}
	
//	public double addNum(int n1, double n2) {
//		return adder.addTwoNumber(n1, n2);
//	}
//	
//	public double addNum(double n1, int n2) {
//		return adder.addTwoNumber(n1, n2);
//	}
	
	public double addNum(double n1, double n2) {
		return adder.addTwoNumber(n1, n2);
	}
	
	public int subNum(int n1, int n2) {							// 뺄셈
		return subtractor.subTwoNumber(n1, n2);
	}
	
//	public double subNum(int n1, double n2) {
//		return subtractor.subTwoNumber(n1, n2);
//	}
//	
//	public double subNum(double n1, int n2) {	
//		return subtractor.subTwoNumber(n1, n2);
//	}
	
	public double subNum(double n1, double n2) {
		return subtractor.subTwoNumber(n1, n2);
	}

	public int multNum(int n1, int n2) {						// 곱셈
		return multiple.multTwoNumber(n1, n2);
	}
	
//	public double multNum(int n1, double n2) {
//		return multiple.multTwoNumber(n1, n2);
//	}
//	
//	public double multNum(double n1, int n2) {
//		return multiple.multTwoNumber(n1, n2);
//	}
	
	public double multNum(double n1, double n2) {
		return multiple.multTwoNumber(n1, n2);
	}
	
	public int divNum(int n1, int n2) {							// 나눗셈
		return division.divTwoNumber(n1, n2);
	}
	
//	public double divNum(int n1, double n2) {
//		return division.divTwoNumber(n1, n2);
//	}
//	
//	public double divNum(double n1, int n2) {
//		return division.divTwoNumber(n1, n2);
//	}
	
	public double divNum(double n1, double n2) {
		return division.divTwoNumber(n1, n2);
	}
	
	public int modNum(int n1, int n2) {						// 나머지
		return mod.modTwoNumber(n1, n2);
	}
	
//	public double modNum(int n1, double n2) {	
//		return mod.modTwoNumber(n1, n2);
//	}
//	
//	public double modNum(double n1, int n2) {
//		return mod.modTwoNumber(n1, n2);
//	}
	
	public double modNum(double n1, double n2) {
		return mod.modTwoNumber(n1, n2);
	}
}

class Adder {			// 덧셈
	
//	Adder() {}
	
	int addTwoNumber(int num1, int num2) {
		return num1 + num2;
	}
//	double addTwoNumber(double num1, int num2) { return num1 + num2; }
//	double addTwoNumber(int num1, double num2) { return num1 + num2; }
	double addTwoNumber(double num1, double num2) { return num1 + num2; }
}

class Subtractor {			// 뺄셈
	
//	Subtractor() {}
	
	int subTwoNumber(int num1, int num2) {
		return num1 - num2;
	}
//	double subTwoNumber(double num1, int num2) { return num1 - num2; }
//	double subTwoNumber(int num1, double num2) { return num1 - num2; }
	double subTwoNumber(double num1, double num2) { return num1 - num2; }
}

class Multiple {			// 곱셈
	
//	Multiple() {}
	
	int multTwoNumber(int num1, int num2) {
		return num1 * num2;
	}
//	double multTwoNumber(double num1, int num2) { return num1 * num2; }
//	double multTwoNumber(int num1, double num2) { return num1 * num2; }
	double multTwoNumber(double num1, double num2) { return num1 * num2; }
}

class Division {			// 나눗셈

//	Division() {}
	
	int divTwoNumber(int num1, int num2) {
		return num1 / num2;
	}
//	double divTwoNumber(double num1, int num2) { return num1 / num2; }
//	double divTwoNumber(int num1, double num2) { return num1 / num2; }
	double divTwoNumber(double num1, double num2) { return num1 / num2; }
}

class Mod {			// 나머지
	
//	Mod() {}
	
	int modTwoNumber(int num1, int num2) {
		return num1 % num2;
	}
//	double modTwoNumber(double num1, int num2) { return num1 % num2; }
//	double modTwoNumber(int num1, double num2) { return num1 % num2; }
	double modTwoNumber(double num1, double num2) { return num1 % num2; }
}
