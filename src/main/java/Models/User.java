package Models;

public class User {
	private String userId;
	private String userName;
	private int phone;
	private String address;
	private String roleType;
	private String department;
	
	public User(){
		
	}
	
	public User(String userId, String userName, int phone, String address, String roleType, String department){
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.roleType = roleType;
		this.department = department;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	
}
