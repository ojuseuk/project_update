package car.dto;


/** FAQ를 저장하기 위한 클래스 */
public class FAQVO {

	/* 변수 */
	private int fAQNum;
	
	private String fAQName;
	private String fAQContent;
	private String MemberId;
	
	private String AdminId;
	private String AdminName;
	private String AdminContext;
	
	/** 기본 생성자 */
	public FAQVO() {
	}

	/** admin 생성자 */

	/** 생성자 */
	public FAQVO(int fAQNum, String fAQName, String fAQContent, String memberId, String adminId, String adminName,
			String adminContext) {
		super();
		this.fAQNum = fAQNum;
		this.fAQName = fAQName;
		this.fAQContent = fAQContent;
		this.MemberId = memberId;
		this.AdminId = adminId;
		this.AdminName = adminName;
		this.AdminContext = adminContext;
	}
	
	public FAQVO(String adminId, String adminName, String adminContext, int fAQNum) {
		super();
		
		this.AdminId = adminId;
		this.AdminName = adminName;
		this.AdminContext = adminContext;
		this.fAQNum = fAQNum;
	}

	/** data 추가할때 사용 하는 생성자 */
	public FAQVO(int fAQNum, String fAQName, String fAQContent, String memberId) {
		super();
		this.fAQNum = fAQNum;
		this.fAQName = fAQName;
		this.fAQContent = fAQContent;
		this.MemberId = memberId;

	}
	
	
	
	// 관리자가 답변한 내용을 보기 위한 생성자
	public FAQVO(String adminId, String adminName, String adminContext) {
		super();
		this.AdminId = adminId;
		this.AdminName = adminName;
		this.AdminContext = adminContext;

	}

	
	/** 접근자, 수정자 */
	
	public int getfAQNum() {
		return fAQNum;
	}

	public void setfAQNum(int fAQNum) {
		this.fAQNum = fAQNum;
	}

	public String getfAQName() {
		return fAQName;
	}

	public void setfAQName(String fAQName) {
		this.fAQName = fAQName;
	}

	public String getfAQContent() {
		return fAQContent;
	}

	public void setfAQContent(String fAQContent) {
		this.fAQContent = fAQContent;
	}

	public String getMemberId() {
		return MemberId;
	}

	public void setMemberId(String memberId) {
		MemberId = memberId;
	}

	public String getAdminId() {
		return AdminId;
	}

	public void setAdminId(String adminId) {
		AdminId = adminId;
	}

	public String getAdminName() {
		return AdminName;
	}

	public void setAdminName(String adminName) {
		AdminName = adminName;
	}

	public String getAdminContext() {
		return AdminContext;
	}

	public void setAdminContext(String adminContext) {
		AdminContext = adminContext;
	}

	
	/* 함수 */
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FAQVO [fAQNum=");
		builder.append(fAQNum);
		builder.append(", fAQName=");
		builder.append(fAQName);
		builder.append(", fAQContent=");
		builder.append(fAQContent);
		builder.append(", MemberId=");
		builder.append(MemberId);
		builder.append(", AdminId=");
		builder.append(AdminId);
		builder.append(", AdminName=");
		builder.append(AdminName);
		builder.append(", AdminContext=");
		builder.append(AdminContext);
		builder.append("]");
		return builder.toString();
	}


	
	
	
	
}//end of FAQ
