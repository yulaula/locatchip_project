package member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId;
	private String password;
	private String memberName;
	private String email;
	private String phone;
	private String address;
	//private String nickname;
	//private java.sql.Date enrollDate;

	public Member() {
		super();
	}

	public Member(String memberId, String password, String memberName, String email, String phone, String address) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		//this.nickname = nickname;
		//this.enrollDate = enrollDate;
	}
	
	@Override
	public String toString() {
		return "user [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + "]";
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

		
}
