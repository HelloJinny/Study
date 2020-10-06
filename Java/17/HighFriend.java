package No16exam11;

/* 자식 클래스 : 고등학교 친구 주소록 */
class HighFriend extends Friend
{
	/* field (필드, 멤버변수) */
	String work;		// 직업
	
	/* Constructor (생성자) */
	HighFriend(String name, String phoneNum, String address, String work)
	{
		super(name, phoneNum, address);
		this.work = work;
	}
	
	/* Method (멤버 메소드) : 데이터 출력 */
	public void displayFriendInfo()  // 오버라이딩
	{
		super.displayFriendInfo();
		System.out.println("직업 : " + work);
	}
	
	/* Method (멤버 메소드) : 친구 기본 정보 출력 */
	public void displayBasicFriendInfo()
	{
		System.out.println("이름 : " + getName());
		System.out.println("직업 : " + work);
	}
}
