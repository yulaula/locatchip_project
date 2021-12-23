package member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId;
	private String password;
	private String memberName;
	private String phone;
	private String address;
	private String email;
	//private java.sql.Date enrollDate;

	public Member() {
		super();
	}

	public Member(String memberId, String password, String memberName, String phone, String address, String email) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", phone="
				+ phone + ", address=" + address + ", email=" + email + "]";
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
		
}
