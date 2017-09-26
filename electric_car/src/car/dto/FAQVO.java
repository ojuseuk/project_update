package car.dto;


/** FAQ를 저장하기 위한 클래스 */
public class FAQVO {

	/* 변수 */
	private int FAQNum;
	private String FAQName;
	private String FAQContent;
	private String id;
	
	/* 생성자 */
	public FAQVO() {
		// TODO Auto-generated constructor stub
	}
	public FAQVO(int fAQNum, String fAQName, String fAQContent, String id) {
		super();
		FAQNum = fAQNum;
		FAQName = fAQName;
		FAQContent = fAQContent;
		this.id = id;
	}
	
	/* 접근자, 수정자 */

	public int getFAQNum() {
		return FAQNum;
	}
	public void setFAQNum(int fAQNum) {
		FAQNum = fAQNum;
	}
	public String getFAQName() {
		return FAQName;
	}
	public void setFAQName(String fAQName) {
		FAQName = fAQName;
	}
	public String getFAQContent() {
		return FAQContent;
	}
	public void setFAQContent(String fAQContent) {
		FAQContent = fAQContent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	/* 함수 */
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FAQVO [FAQNum=");
		builder.append(FAQNum);
		builder.append(", FAQName=");
		builder.append(FAQName);
		builder.append(", FAQContent=");
		builder.append(FAQContent);
		builder.append(", id=");
		builder.append(id);
		builder.append("]");
		return builder.toString();
	}
	

	
}//end of FAQ
