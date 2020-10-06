package No11to14exam11;

/* 자식 클래스 : 고등학교 친구 주소록 */
class HighFriend extends Friend
{
	/* field (필드, 멤버변수) */
	String work;		// 직업
	
	/* Constructor (생성자) */
	// HighFriend() { super(); }  // default 코드
	HighFriend(String name, String phoneNum, String address, String work)
	{
		super(name, phoneNum, address);
		this.work = work;
	}
	
	/* Method (멤버 메소드) : 데이터 출력 */
//	public void displayHighFriendInfo()
	public void displayFriendInfo()
	// 부모클래스와 똑같이 정의했다. (오버라이딩)
	{
//		displayFriendInfo();
		// super. 붙여도되고 안붙여도된다. 
		// 하지만 오버라이딩된 메소드인 경우 내 자신을 호출하는 거니까 반드시 붙여야한다.
		
		super.displayFriendInfo();
		System.out.println("직업 : " + work);
	}
	
	// (친구 기본 정보 출력)  이름, 직업
	public void displayBasicFriendInfo()
	{
		System.out.println("이름 : " + getName());
		System.out.println("직업 : " + work);
	}
}
