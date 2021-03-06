/*
	- 1. 2. 3번의 저장 기능은 중복 데이터 체크를 하지 않고 있다.
   	   폰번호의 중복 여부를 데이터 저장전 체크해서 중복 저장되지 않도록 기능을 구현하세요.
	- 8번의 폰번호를 입력 받아 데이터 삭제 기능도 추가해 보세요.
   
 	*** 메뉴 선택 ***
	0. 프로그램 종료.
	1. 중학교 친구 정보 입력.
	2. 고교 친구 정보 입력.
	3. 대학교 친구 정보 입력.
		+ 회사 친구 정보 입력	
	
	4. 중학교 친구 정보 출력.
	5. 고교 친구 정보 출력.
	6. 대학교 친구 정보 출력.
	7. 중학교/고등학교/대학교 친구 정보 출력.
		+ 회사 친구 정보 출력.
		
		+ 친구 기본정보 출력.
	
	8. 데이터 삭제 기능 (단, 삭제한 자리는 다음 데이터를 한 칸씩 이동시켜 다시 저장).
	
		+ 데이터 검색 기능. : 폰번호를 입력 받아, 해당 폰번호의 친구 전체 정보를 출력하는 기능
*/
package No11to14exam11;

public class AddressBook
{
	/* 프로그램의 시작만 여기 안에 포함된다. */
	public static void main(String[] args) // main 시작 ~ menu 지역변수&참조변수 
	{
		Menu menu = new Menu();   // 1. 출력 테스트용
		menu.displayMenu();   			// 1. 출력 테스트용
	}
}