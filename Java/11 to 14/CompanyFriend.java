package No11to14exam11;

/* 자식 클래스 : 회사 친구 주소록 */
class CompanyFriend extends Friend
{
	/* field (필드, 멤버변수) */
	String company;		// 회사
	
	/* Constructor (생성자) */
	CompanyFriend(String name, String phoneNum, String address, String company)
	{
		super(name, phoneNum, address);
		this.company = company;
	}

	/* Method (멤버 메소드) : 데이터 출력 */
//	public void displayCompanyFriendInfo()
	public void displayFriendInfo()
	{
		super.displayFriendInfo();
		System.out.println("회사 :" + company);
	}
	
	// (친구 기본 정보 출력)  이름, 회사
	public void displayBasicFriendInfo()
	{
		System.out.println("이름 : " + getName());
		System.out.println("회사 : " + company);
	}
}
