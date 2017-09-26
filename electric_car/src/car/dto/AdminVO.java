package car.dto;

public class AdminVO {

	private String AdminId;
	private String AdminPassword;
	private String AdminName;
	private String AdminEmail;
	private String AdminAddr;
	private String AdminPhone;
	
	public AdminVO() {
		// TODO Auto-generated constructor stub
	}

	public AdminVO(String adminId, String adminPassword, String adminName, String adminEmail, String adminAddr,
			String adminPhone) {
		super();
		AdminId = adminId;
		AdminPassword = adminPassword;
		AdminName = adminName;
		AdminEmail = adminEmail;
		AdminAddr = adminAddr;
		AdminPhone = adminPhone;
	}

	public String getAdminId() {
		return AdminId;
	}

	public void setAdminId(String adminId) {
		AdminId = adminId;
	}

	public String getAdminPassword() {
		return AdminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		AdminPassword = adminPassword;
	}

	public String getAdminName() {
		return AdminName;
	}

	public void setAdminName(String adminName) {
		AdminName = adminName;
	}

	public String getAdminEmail() {
		return AdminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		AdminEmail = adminEmail;
	}

	public String getAdminAddr() {
		return AdminAddr;
	}

	public void setAdminAddr(String adminAddr) {
		AdminAddr = adminAddr;
	}

	public String getAdminPhone() {
		return AdminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		AdminPhone = adminPhone;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AdminVO [AdminId=");
		builder.append(AdminId);
		builder.append(", AdminPassword=");
		builder.append(AdminPassword);
		builder.append(", AdminName=");
		builder.append(AdminName);
		builder.append(", AdminEmail=");
		builder.append(AdminEmail);
		builder.append(", AdminAddr=");
		builder.append(AdminAddr);
		builder.append(", AdminPhone=");
		builder.append(AdminPhone);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
