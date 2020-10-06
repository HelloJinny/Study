/*
 * 파일 이름 :No8Array.java
 * 작성자 : 
 * 작성일 : 2020년 05월 01일 금요일
 * 프로그램 설명 : 키보드로 부터 5명의
 * 					- 친구 이름 (String)
 * 					- 핸드폰 번호 (String)
 * 					- 주소 (String)
 * 					- 나이 (int)
 * 					를 입력 받아 저장하고, 입력 받은 데이터를 출력하는
 * 					주소록 관리 프로그램을 배열(참조자료형)을 이용하여 객체 지향적 관점으로 작성해 보세요.
*/

package No08Array;

import java.util.Scanner;

/* 주소록 클래스 */
class AddressBook
{
   String friendName;		// 친구 이름
   String phoneNumber;	// 핸드폰 번호
   String address;				// 주소
   int age;						// 나이
   
   /* 주소록 메소드 */
   public AddressBook(String friendName, String phoneNumber, String address, int age)
   {
      this.friendName =friendName;				// 친구 이름
      this.phoneNumber = phoneNumber;		// 핸드폰 번호
      this.address = address;						// 주소
      this.age = age;									// 나이
   }
   
   public AddressBook()
	{
		this.friendName =null;						// 친구 이름
		this.phoneNumber = null;					// 핸드폰 번호
		this.address = null;							// 주소
		this.age = 0;									// 나이
	}
      
   /* 스캐너 메소드 */
   public  void keyboardScanner()
   {   
      Scanner keyboard = new Scanner(System.in);
      
      /* Scanner */
      System.out.print("이름 : ");
      this.friendName = keyboard.nextLine();            // 이름 입력
      System.out.println("당신의 이름은 " + friendName + " 이군요" + "\n");

      System.out.print("핸드폰 번호 : " );
      this.phoneNumber = keyboard.nextLine();         // 핸드폰 번호 입력
      System.out.println("당신의 번호는 " + phoneNumber + " 이군요" + "\n");

      System.out.print("주소 : " );
      this.address = keyboard.nextLine();               	// 주소 입력
      System.out.println("당신이 살고 있는 곳은 " + address + " 이군요" + "\n");      
      
      System.out.print("나이 : " );
      this.age = keyboard.nextInt();                        // 나이 입력
      System.out.println("당신의 나이는 " + age + " 살 이군요" + "\n");
      
      keyboard.nextLine();
	   
	   /* 메소드 호출 */
      AddressBook result = new AddressBook(friendName, phoneNumber, address, age);         // 생성자 호출
	  System.out.print("--- 입력 받은 데이터 출력 결과 --- \n\n");
	  result.showAddressBook();
	  System.out.print("\n---------------------------------- \n\n");
   }
   
   public void showAddressBook()
   {
	   System.out.print("친구 이름 : " + this.friendName + "\n");
	   System.out.print("핸드폰 번호 : " + this.phoneNumber + "\n");
	   System.out.print("주소 : " + this.address + "\n");
	   System.out.print("나이: " + this.age + "\n");
   }
}

/* 메인 클래스 */
class No08Array
{   
   /* 메인 메소드 - 배열 */
   public static void main(String[] args)
   {      
      AddressBook[] aBook = new AddressBook[5];
      
      aBook[0] = new AddressBook();
      aBook[1] = new AddressBook();
      aBook[2] = new AddressBook();
      aBook[3] = new AddressBook();
      aBook[4] = new AddressBook();
      
       /* 입력 */
      aBook[0].keyboardScanner();
      aBook[1].keyboardScanner();
      aBook[2].keyboardScanner();
      aBook[3].keyboardScanner();
      aBook[4].keyboardScanner();
      
      /* 출력 */
      System.out.print("*** 입력 받은 데이터 출력 결과 *** \n\n");
      aBook[0].showAddressBook();
      System.out.println();
      aBook[1].showAddressBook();
      System.out.println();
      aBook[2].showAddressBook();
      System.out.println();
      aBook[3].showAddressBook();
      System.out.println();
      aBook[4].showAddressBook();
      System.out.print("\n************************ \n\n");

   }
}