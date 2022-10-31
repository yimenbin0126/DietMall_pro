package com.dietmall.DTO;

import java.sql.Date;

public class MemberDTO {

	private int userno;
	private String userid;
	private String userpass;
	private String username;
	private String userbirth;
	private String usergender;
	private String useremail;
	private String usertel;
	
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserbirth() {
		return userbirth;
	}
	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUsertel() {
		return usertel;
	}
	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [userno=" + userno + ", userid=" + userid + ", userpass=" + userpass + ", username="
				+ username + ", userbirth=" + userbirth + ", usergender=" + usergender + ", useremail=" + useremail
				+ ", usertel=" + usertel + "]";
	}
}
