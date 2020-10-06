package No11to14exam11;

import java.util.Scanner;

/* View : UI를 안배워서 Text로 구성 */
class Menu
{
	/* field (필드, 멤버변수) */
	FriendInfoController controller;
	
	/* Constructor (생성자) */
	Menu()
	{	
		controller = new FriendInfoController();  // 필드로 정의해주고 필드로 초기화 해주면 어디서든 사용 가능
	}
	
	/* Method (멤버 메소드) : 데이터 출력 */
	public void displayMenu()
	{
		while(true) // 0번이 입력될 때까지 무한 반복문
		{
			System.out.print("\n\t\t\t\t\t *** 메뉴 선택 *** \n");
			System.out.print("\n\t\t\t\t\t 0. 프로그램 종료 \n");
			System.out.print("\n\t\t\t\t\t 1. 중학교 친구 정보 입력 \n");
			System.out.print("\n\t\t\t\t\t 2. 고교 친구 정보 입력 \n");
			System.out.print("\n\t\t\t\t\t 3. 대학 친구 정보 입력 \n");
			System.out.print("\n\t\t\t\t\t 4. 회사 친구 정보 입력 \n");
			
			System.out.print("\n\t\t\t\t\t 5. 중학교 친구 정보 출력 \n");
			System.out.print("\n\t\t\t\t\t 6. 고교 친구 정보 출력\n");
			System.out.print("\n\t\t\t\t\t 7. 대학 친구 정보 출력 \n");
			System.out.print("\n\t\t\t\t\t 8. 회사 친구 정보 출력 \n");
			
			System.out.print("\n\t\t\t\t\t 9. 중학교/고교/대학/회사 친구 정보  출력 \n");
			
			System.out.print("\n\t\t\t\t\t 10. 친구 기본 정보 출력 \n");
			
			System.out.print("\n\t\t\t\t\t 11. 데이터 삭제 기능 \n");
			
			System.out.print("\n\t\t\t\t\t 12. 데이터 검색 기능 \n");
			
			System.out.print("\n 원하는 항목 번호를 선택하세요 >> ");
			
			Scanner keyboard = new Scanner(System.in);

			int choice = keyboard.nextInt();
			
			switch(choice)
			{
			case 0:
				System.out.print("\n\t\t\t\t\t 프로그램을 종료합니다. \n");
				return;
			case 1: 	case 2: case 3: case 4: // 1, 2, 3, 4번 공통 메소드로 수행한다.
				controller.addFriend(choice);
				break;
			case 5:
				controller.displayMiddleInfo();
				break;
			case 6:
				controller.displayHighInfo();
				break;
			case 7:
				controller.displayUnivInfo();
				break;
			case 8:
				controller.displayCompanyInfo();
				break;
			case 9:
				controller.displayFriendInfo();
				break;
			case 10:
				controller.displayBasicFriendInfo();
				break;
			case 11:
				controller.deleteFriendInfo();
				break;
			case 12:
				controller.searchFriendInfo();
				break;
			default:  // 예외처리
				System.out.print("\n\t\t\t\t\t 잘못된 입력을 하셨습니다. \n");
				System.out.print("\n\t\t\t\t\t 번호를 확인하세요 \n");
				break;
			}
		}
	}
}
