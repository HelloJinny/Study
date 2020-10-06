package No16exam11;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;

/* 화면 <-> 데이터 처리 */
class FriendInfoController
{
	Friend[] friend;  // 고등학교든 대학교든 구분안하고 친구로 바라보겠다.
	int numOfFriends;
	int MAX_FRIENDS;
	
	HashSet<Friend> set = new HashSet<Friend>();
	
	FriendInfoController()
	{
		numOfFriends = 0;
		MAX_FRIENDS = 20;
		friend = new Friend[MAX_FRIENDS];
	}
	
/* 중복 */
	private boolean overlapCheckName(String phoneNum)
	{	
//		for(int i=0; i<numOfFriends; i++){
//			if(friend[i].getPhoneNum().equals(phoneNum))
//			{
//				return true;
//			}
//		}
//		return false;
		
		Iterator<Friend> itr = set.iterator();  // iterator 메소드가 생성하는 인스턴스를 가리켜 '반복자' 라 한다.
		while(itr.hasNext())
		{
			Friend friend = itr.next();
			if(phoneNum.compareTo(friend.phoneNum)==0)
			{
				return true;
			}
		}
		return false;
	}
	
/* 입력 기능 : 한 글자의 이름은 입력되지 않는다. */
	private void readName(String name) throws NameInputException
	{
		if(name.length() == 1)
		{
			NameInputException nameExcept = new NameInputException();
			throw nameExcept;
		}
	}
	
/* 친구 추가 */
	public void addFriend(int choice)
	{
		if(numOfFriends >= MAX_FRIENDS)
		{
			System.out.println("더 이상 친구를 저장할 공간이 없습니다.");
			return;  // 메세지만 출력되고 빠져나간다.
		}
		
		Scanner keyboard = new Scanner(System.in);

		String name = null, phoneNum = null, address = null,
				classNum = null, work = null, major = null, company = null;

		boolean nameChk = true;
		
		while(nameChk)
		{
			System.out.println("이름을 입력하세요 : ");
			name = keyboard.nextLine();
			
			/* 입력 기능 : 한 글자의 이름은 입력되지 않는다. */
			try
			{
				readName(name);
				nameChk = false;
			} 
			catch (NameInputException e)
			{
				System.out.println(e.getMessage());
				continue;
			}
		}

		System.out.println("폰 번호를 입력하세요 : ");
		phoneNum = keyboard.nextLine();
		
/* 입력 기능 : 중복된 폰 번호 체크 */
		if(overlapCheckName(phoneNum))
		{
			System.out.println("중복된 폰 번호가 존재합니다. ");
			System.out.println("번호를 확인하세요. ");
			return;  // 중복되면 나가!
		}
	
		System.out.println("주소를 입력하세요 : ");
		address = keyboard.nextLine();

		if(choice == 1)  // 중학교
		{
			System.out.println("반을 입력하세요 : ");
			classNum =keyboard.nextLine();
			
			System.out.printf("%s, %s, %s, %s \n", name, phoneNum, address, classNum);

//			friend[numOfFriends++] = new MiddleFriend(name, phoneNum, address, classNum);  // 다형성
			set.add(new MiddleFriend(name, phoneNum, address, classNum));
			
		}
		else if(choice == 2)  // 고등학교 
		{
			System.out.println("직업를 입력하세요 : ");
			work =keyboard.nextLine();
			
			System.out.printf("%s, %s, %s, %s \n", name, phoneNum, address, work);

//			friend[numOfFriends++] = new HighFriend(name, phoneNum, address, work);  // 다형성
			set.add(new HighFriend(name, phoneNum, address, work));
		}
		else if(choice == 3)  // 대학교
		{
			System.out.println("전공 입력하세요 : ");
			major =keyboard.nextLine();
			
			System.out.printf("%s, %s, %s, %s \n", name, phoneNum, address, major);

//			friend[numOfFriends++] = new UnivFriend(name, phoneNum, address, major);  // 다형성
			set.add(new UnivFriend(name, phoneNum, address, major));
		}
		else if(choice == 4) // 회사 
		{
			System.out.println("회사 입력하세요 : ");
			company =keyboard.nextLine();
			
			System.out.printf("%s, %s, %s, %s \n", name, phoneNum, address, company);

//			friend[numOfFriends++] = new CompanyFriend(name, phoneNum, address, company);  // 다형성
			set.add(new CompanyFriend(name, phoneNum, address, company));
		}
		else
		{
			System.out.println("번호를 확인하세요.");
			return;
		}
	}

	/* 검색 기능 : 중학교 친구 데이터 출력  */
	public void displayMiddleInfo()
	{
//		for(int i=0; i < numOfFriends; i++)
//		{
//			if(friend[i] instanceof MiddleFriend)
//				friend[i].displayFriendInfo();
//		}	
		
		for(Friend e : set)
		{
			if(e instanceof MiddleFriend)
				e.displayFriendInfo();
		}
	}
	
	/* 검색 기능 : 고등학교 친구 데이터 출력  */
	public void displayHighInfo()
	{
//		for(int i=0; i < numOfFriends; i++)
//		{
//			if(friend[i] instanceof HighFriend)
//				friend[i].displayFriendInfo();
//		}
		
		for(Friend e : set)
		{
			if(e instanceof HighFriend)
				e.displayFriendInfo();
		}
	}
	
	/* 검색 기능 : 대학교 친구 데이터 출력  */
	public void displayUnivInfo()
	{
//		for(int i=0; i < numOfFriends; i++)
//		{
//			if(friend[i] instanceof UnivFriend)
//				friend[i].displayFriendInfo();
//		}
		
		for(Friend e : set)
		{
			if(e instanceof UnivFriend)
				e.displayFriendInfo();
		}
	}
	
	/*검색 기능 :  회사 친구 데이터 출력  */
	public void displayCompanyInfo()
	{
//		for(int i=0; i < numOfFriends; i++)
//		{
//			if(friend[i] instanceof CompanyFriend)
//				friend[i].displayFriendInfo();
//		}
		
		for(Friend e : set)
		{
			if(e instanceof CompanyFriend)
				e.displayFriendInfo();
		}
	}
	
/* 검색 기능 : 친구 데이터 전체 출력 */
	public void displayFriendInfo()
	{
//		for(int i=0; i < numOfFriends; i++)
//			friend[i].displayFriendInfo();  // 고등학교 친구일땐 오버라이딩 된 고등학교 친구
		
		for(Friend e : set)
		{
			e.displayFriendInfo();
		}
		
	}
	
	/* 검색 기능 : 친구 기본 정보 출력 */
	public void displayBasicFriendInfo()
	{
//		for(int i = 0; i < numOfFriends; i++ )
//			friend[i].displayBasicFriendInfo();
		
		for(Friend e : set)
		{
			e.displayBasicFriendInfo();
		}
	}
	
/* 검색 기능 : 폰 번호를 입력 받아,  해당 폰 번호의 친구 전체 정보를 출력 */
	public void searchFriendInfo()
	{
		Scanner keyboard = new Scanner(System.in);
		
		System.out.print("검색할 친구의 폰 번호를 입력하세요 : ");
		String phoneNum = keyboard.nextLine();

//		for(int i=0; i<numOfFriends; i++)
//		{
//			if((friend[i].getPhoneNum()).equals(phoneNum))
//			// 1. 기본(기준).equals키보드로 입력받는 값
//			// 2. 키보드로 입력받는 값(기준).equals기본
//			// 비교하는 건 똑같다... 하지만 2번은 아무 의미가 없다~ 1번 추천!!!
//			{
//				friend[i].displayFriendInfo();
//				System.out.println("폰 번호 검색이 완료되었습니다. ");
//				return;
//			}
//		}
//		System.out.println("일치하는 폰 번호가 없습니다. ");	
		
		Iterator<Friend> itr = set.iterator();  // iterator 메소드가 생성하는 인스턴스를 가리켜 '반복자' 라 한다.
		while(itr.hasNext())
		{
			Friend friend = itr.next();
			if(phoneNum.compareTo(friend.phoneNum)==0)
			{
				friend.displayFriendInfo();
				System.out.println("폰 번호 검색이 완료되었습니다. ");
				return;
			}
		}
		System.out.println("일치하는 폰 번호가 없습니다. ");
	}
	
/* 데이터 삭제 기능 */
	public void deleteFriendInfo()
	{
		Scanner keyboard = new Scanner(System.in);
		
		System.out.print(" 삭제할 친구의 폰 번호를 입력하세요 : ");
		String phoneNum = keyboard.nextLine();

//		for(int i=0; i<numOfFriends; i++)
//		{
//			if(friend[i].getPhoneNum().compareTo(phoneNum) == 0)
//			{
//				for(int j=i; j<numOfFriends; j++)
//				{
//					friend[j]=friend[j+1];  // 한 칸을 지우겠다!!! 
//				}
//				numOfFriends--;
//				System.out.println("폰 번호 삭제가 완료되었습니다. \n");
//				return;
//			}
//			System.out.println(" 해당하는 번호가 없습니다. ");
//			return;
//		}
		
		Iterator<Friend> itr = set.iterator();  // iterator 메소드가 생성하는 인스턴스를 가리켜 '반복자' 라 한다.
		while(itr.hasNext())  // 참조할 다음 번 요소가 존재하면 true를 반환
		{
			Friend friend = itr.next();  // 다음번 요소를 반환
			if(phoneNum.compareTo(friend.phoneNum)==0)
			{
				itr.remove();  // 현재 위치의 요소를 삭제
				System.out.println("번호 삭제가 완료되었습니다. \n");
				return;
			}
		}
		System.out.println(" 해당하는 번호가 없습니다. ");
	}

/* 입력 기능 : 예외처리 */
	class NameInputException extends Exception
	{
		public NameInputException() { super("유효하지 않은 이름을 입력하셨습니다. "); }
	}
}