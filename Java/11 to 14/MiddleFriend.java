package No11to14exam11;

/* 자식 클래스 : 중학교 친구 주소록 */
class MiddleFriend extends Friend
{
	/* field (필드, 멤버변수) */
	String ban;		// 반
	
	/* Constructor (생성자) */
	MiddleFriend(String name, String phoneNum, String address, String ban)
	{
		super(name, phoneNum, address);
		this.ban = ban;
	}

	/* Method (멤버 메소드) : 데이터 출력 */
	public void displayFriendInfo()
	{
		super.displayFriendInfo();
		System.out.println("반 :" + ban);
	}
	
	// (친구 기본 정보 출력) 이름, 반
	public void displayBasicFriendInfo()
	{
		System.out.println("이름 : " + getName());
		System.out.println("반 : " + ban);
	}
}

