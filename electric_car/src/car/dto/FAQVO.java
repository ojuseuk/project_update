package car.dto;


/** FAQ를 저장하기 위한 클래스 */
public class FAQVO {

	/* 변수 */
	private int fAQNum;
	private String fAQName;
	private String fAQContent;
	private String id;
	
	/** 기본 생성자 */
	public FAQVO() {
		// TODO Auto-generated constructor stub
	}

	/** 생성자 */
	public FAQVO(int fAQNum, String fAQName, String fAQContent, String id) {
		super();
		this.fAQNum = fAQNum;
		this.fAQName = fAQName;
		this.fAQContent = fAQContent;
		this.id = id;
	}

	/** data 추가할때 사용 하는 생성자 */
	public FAQVO(String fAQName, String fAQContent, String id) {
		super();
		this.fAQName = fAQName;
		this.fAQContent = fAQContent;
		this.id = id;
	}

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FAQVO [fAQNum=");
		builder.append(fAQNum);
		builder.append(", fAQName=");
		builder.append(fAQName);
		builder.append(", fAQContent=");
		builder.append(fAQContent);
		builder.append(", id=");
		builder.append(id);
		builder.append("]");
		return builder.toString();
	}
	
	

}//end of FAQ
