package No16exam11;

/* 자식 클래스 : 중학교 친구 주소록 */
class MiddleFriend extends Friend
{
	/* field (필드, 멤버변수) */
	String classNum;		// 반
	
	/* Constructor (생성자) */
	MiddleFriend(String name, String phoneNum, String address, String classNum)
	{
		super(name, phoneNum, address);
		this.classNum = classNum;
	}

	/* Method (멤버 메소드) : 데이터 출력 */
	public void displayFriendInfo()  // 오버라이딩
	{
		super.displayFriendInfo();
		System.out.println("반 :" + classNum);
	}
	
	/* Method (멤버 메소드) : 친구 기본 정보 출력 */
	public void displayBasicFriendInfo()
	{
		System.out.println("이름 : " + getName());
		System.out.println("반 : " + classNum);
	}
}
