package No16exam11;

/* 부모 클래스가 목적 : 공통 특징 */
abstract class Friend
// abstract : 인스턴스 생성울 위해서 독립적으로 사용하는 것이 아니다. new 생성하는 순간 error!!!
// 부모 클래스가 목적
{
	/* field (필드, 멤버변수) */
	String name;			// 이름
	String phoneNum;	// 휴대폰 번호
	String address;		// 주소
	
	/* Constructor (생성자) */
	Friend(String name, String phoneNum, String address)
	{
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
		// 이름이 동일하기 때문에 문제여서 this를 붙였다.(생성자 안에서는 붙인다.)
	}
	
	/* Method (멤버 메소드) : 친구 기본 정보 출력 : 기본필드에 접근하기 위한 메소드 */
	public String getName() { return name; }
	// 읽어오는 메소드
	// 필드의 값을 반환하겠다.

	public String getPhoneNum() { return phoneNum; }
	// 읽어오는 메소드
	// 필드의 값을 반환하겠다.

	/* Method (멤버 메소드) : 데이터 출력 */
	public void displayFriendInfo()
	{
		System.out.println("이름 : " + name); 
		System.out.println("폰 번호 : " + phoneNum);
		System.out.println("주소 : " + address);
		// this. 붙여도 전혀 문제 안된다. 겹쳐지는 영역이 없어서 this를 안 붙인다. (메소드 안에서는 안 붙인다.)
	}
	
	@Override
	public int hashCode()
	// 검색 1단계. Object 클래스의 hashCode 메소드의 반호나 값을 해시 값으로 활용하여 검색의 그룹을 선택한다.
	{
//		System.out.println("hashCode() 호출");
		return phoneNum.hashCode();
	}
	
	@Override
	public boolean equals(Object obj)
	// 검색 2단계. 그룹내의 인스턴스를 대상으로 Object 클래스의 equals 메소드으 ㅣ반환 값의 결과로 동등을 판단
	{
//		System.out.println("equals() 호출");
		
		Friend comp = (Friend) obj;

//		if(comp.phoneNum == phoneNum)  		// 주소값을 비교 : 다 다를 수 밖에 없다.
		if(comp.phoneNum.equals(phoneNum))  // 내용 비교
		// 인스턴스 변수 phoneNum이 같을 때 동일 인스턴스로 간주한다.
		{
			return true;	
		}
		else
		{
			return false;
		}
	}

	/* Method (멤버 메소드) : 친구 기본 정보 출력 : 메소드 오버라이딩이 목적인 메소드 정의 */
	abstract public void displayBasicFriendInfo();
	// 추상 메소드 : 이 메소드를 상속하려면 반드시 오버라이딩을 해라. 기능을 재정의해서 사용해라.
}
