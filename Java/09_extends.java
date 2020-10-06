/*
 * 파일 이름 : No9extends.java
 * 작성자 : 
 * 작성일 : 2020년 05월 04일 월요일
 * 프로그램 설명 :
 * 		- 중학교 친구 정보 		- 이름 / 폰번호 / 주소 / 반
 * 		- 고등학교 친구 정보 	- 이름 / 폰번호 / 주소 / 직업
 * 		위의 데이터를 관리 할 주소록 작성 프로그램을, 상속의 관계로 자료형을 정의하고,
 * 		키보드를 통해 데이터를 입력받아 보관하고, 출력하는 기능을 구현해보세요.
*/

package No09extends;

import java.util.Scanner;

/* 주소록 관리 작성 프로그램 */
class AddressBook
{
	String name;			// 이름
	String number;		// 핸드폰 번호
	String address;		// 주소
	
	public AddressBook(String name, String number, String address)
	{
		this.name = name;
		this.number = number;
		this.address = address;
	}
	
	public AddressBook()
	{
		this.name = null;
		this.number = null;
		this.address = null;
	}
	
	/* 입력 */
	public  void keyboardScanner()
	{
		Scanner keyboard = new Scanner(System.in);
		     
		System.out.print("이름 : ");
		this.name = keyboard.nextLine();          // 이름 입력
		System.out.println("당신의 이름은 " + name + " 이군요" + "\n");
		   
		System.out.print("핸드폰 번호 : " );
		this.number = keyboard.nextLine();        // 핸드폰 번호 입력
		System.out.println("당신의 번호는 " + number + " 이군요" + "\n");

		System.out.print("주소 : " );
		this.address = keyboard.nextLine();        // 주소 입력
		System.out.println("당신이 살고 있는 곳은 " + address + " 이군요" + "\n");      
	}
	
	 /* 입력한 값 바로 출력 */
	public void showkeyboard()
	{
		AddressBook result = new AddressBook(name, number, address);         // 생성자 호출
		System.out.print("--- 친구 입력 받은 데이터 출력 결과 --- \n\n");
		result.showAddressBook();
		System.out.print("\n---------------------------------- \n\n");
	}

	/* 맨 밑 출력 */
	public void showAddressBook()
	{
		System.out.print("이름 : " + this.name + "\n");
		System.out.print("핸드폰 번호 : " + this.number + "\n");
		System.out.print("주소 : " + this.address + "\n");
	}
}

/* 중학교 친구 정보 */
class AddressMiddle extends AddressBook
{
	String ban;			// 반
	
	public AddressMiddle(String name, String number, String address, String ban)
	{
		super(name, number, address);
		this.ban = ban;
	}
	
	public AddressMiddle()
	{
		super(null, null, null);
		this.ban = null;
	}
	
	/* 입력 */
	public  void keyboardScannerMiddle()
	{
		super.keyboardScanner();  // 상위 클래스 호출
		
		Scanner keyboard = new Scanner(System.in);
		
		System.out.print("반 : " );
		this.ban = keyboard.nextLine();        // 반 입력
		System.out.println("당신 반은 " + ban + " 이군요" + "\n");
	}
	
	 /* 입력한 값 바로 출력 */
	public void showkeyboardMiddle()
	{
		AddressMiddle result1 = new AddressMiddle(name, number, address, ban);         // 생성자 호출
		System.out.print("--- 중학교 친구 입력 받은 데이터 출력 결과 --- \n\n");
		result1.showAddressMiddle();
		System.out.print("\n---------------------------------- \n\n");
	}
	
	/* 맨 밑 출력 */
	public void showAddressMiddle()
	{
		super.showAddressBook();
		System.out.print("반 : " + this.ban + "\n\n");
	}
}

/* 고등학교 친구 정보 */
class AddressHigh extends AddressBook
{
	String job;			// 직업
	
	public AddressHigh(String name, String number, String address, String job)
	{
		super(name, number, address);
		this.job = job;
	}
	
	public AddressHigh()
	{
		super(null, null, null);
		this.job = null;
	}
	
	/* 입력 */
	public  void keyboardScannerHigh()
	{
		super.keyboardScanner();  // 상위 클래스 호출
		
		Scanner keyboard = new Scanner(System.in);
		
		System.out.print("직업 : " );
		this.job = keyboard.nextLine();        // 직업 입력
		System.out.println("당신 직업은 " + job + " 이군요" + "\n");
	}
	
	 /* 입력한 값 바로 출력 */
	public void showkeyboardHigh()
	{
		AddressHigh result2 = new AddressHigh(name, number, address, job);         // 생성자 호출
		System.out.print("--- 고등학교 친구 입력 받은 데이터 출력 결과 --- \n\n");
		result2.showAddressHigh();
		System.out.print("\n---------------------------------- \n\n");
	}
	
	/* 맨 밑 출력 */
	public void showAddressHigh()
	{
		super.showAddressBook();
		System.out.print("직업 : " + this.job + "\n\n");
	}
}

/* 메인 클래스 */
class No09extends
{	
	/* 메인 메소드 */
	public static void main(String[] args)
	{	
/* 1. 메소드 호출 */
		AddressBook a = new AddressBook();			// 생성자 호출
		AddressBook b = new AddressBook();
//		AddressBook c = new AddressBook();
//		AddressBook d = new AddressBook();
//		AddressBook e = new AddressBook();

		/* 입력 */ /* 입력한 값 바로 출력 */
		a.keyboardScanner();
		a.showkeyboard();
		b.keyboardScanner();
		b.showkeyboard();
//		c.keyboardScanner();
//		c.showkeyboard();
//		d.keyboardScanner();
//		d.showkeyboard();
//		e.keyboardScanner();
//		e.showkeyboard();
		
		/* 맨 밑 출력 */
		System.out.print("*** 입력 받은 데이터 출력 결과 *** \n\n");
		a.showAddressBook();
		System.out.println();
		b.showAddressBook();
//		System.out.println();
//		c.showAddressBook();
//		System.out.println();
//		d.showAddressBook();
//		System.out.println();
//		e.showAddressBook();
		System.out.print("\n************************ \n\n");
		
/* 2. 메소드 호출 */
		AddressMiddle f = new AddressMiddle();			// 생성자 호출
		AddressMiddle g = new AddressMiddle();
//		AddressMiddle h = new AddressMiddle();
//		AddressMiddle i = new AddressMiddle();
//		AddressMiddle j = new AddressMiddle();

		/* 입력 */ /* 입력한 값 바로 출력 */
		f.keyboardScannerMiddle();
		f.showkeyboardMiddle();
		g.keyboardScannerMiddle();
		g.showkeyboardMiddle();
//		h.keyboardScannerMiddle();
//		h.showkeyboardMiddle();
//		i.keyboardScannerMiddle();
//		i.showkeyboardMiddle();
//		j.keyboardScannerMiddle();
//		j.showkeyboardMiddle();
		
		/* 맨 밑 출력 */
		System.out.print("*** 입력 받은 데이터 출력 결과 *** \n\n");
		f.showAddressMiddle();
		System.out.println();
		g.showAddressMiddle();
//		System.out.println();
//		h.showAddressMiddle();
//		System.out.println();
//		i.showAddressMiddle();
//		System.out.println();
//		j.showAddressMiddle();
		System.out.print("\n************************ \n\n");
		
/* 3. 메소드 호출 */
		AddressHigh o = new AddressHigh();			// 생성자 호출
		AddressHigh p = new AddressHigh();
//		AddressHigh q = new AddressHigh();
//		AddressHigh r = new AddressHigh();
//		AddressHigh s = new AddressHigh();

		/* 입력 */ /* 입력한 값 바로 출력 */
		o.keyboardScannerHigh();
		o.showkeyboardHigh();
		p.keyboardScannerHigh();
		p.showkeyboardHigh();
//		q.keyboardScannerHigh();
//		q.showkeyboardHigh();
//		r.keyboardScannerHigh();
//		r.showkeyboardHigh();
//		s.keyboardScannerHigh();
//		s.showkeyboardHigh();
			
		/* 맨 밑 출력 */
		System.out.print("*** 입력 받은 데이터 출력 결과 *** \n\n");
		o.showAddressHigh();
		System.out.println();
		p.showAddressHigh();
//		System.out.println();
//		q.showAddressHigh();
//		System.out.println();
//		r.showAddressHigh();
//		System.out.println();
//		s.showAddressHigh();
		System.out.print("\n************************ \n\n");
	}
}