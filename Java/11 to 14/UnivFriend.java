package No11to14exam11;

/* 자식 클래스 : 대학교 친구 주소록 */
class UnivFriend extends Friend
{
	/* field (필드, 멤버변수) */
	String major;		// 전공
	
	/* Constructor (생성자) */
	// UnivFriend() { super(); }  // default 코드
	UnivFriend(String name, String phoneNum, String address, String major)
	{
		super(name, phoneNum, address);
		this.major = major;
	}
	
	/* Method (멤버 메소드) : 데이터 출력 */
//	public void displayUnivFriendInfo()
	public void displayFriendInfo()
	{
		super.displayFriendInfo();
		System.out.println("전공 : " + major);
	}
	
	// (친구 기본 정보 출력)  이름, 전공
	public void displayBasicFriendInfo()
	{
		System.out.println("이름 : " + getName());
		System.out.println("전공 : " + major);
	}
}
