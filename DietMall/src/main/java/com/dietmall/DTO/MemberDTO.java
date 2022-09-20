package com.dietmall.DTO;

import java.sql.Date;

public class MemberDTO {

	private String userId;
	private String kakaoId;
	private String userPass;
	private String userName;
	private String userBirth;
	private String userGender;
	private String userEmail;
	private String userTel;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", kakaoId=" + kakaoId + ", userPass=" + userPass + ", userName="
				+ userName + ", userBirth=" + userBirth + ", userGender=" + userGender + ", userEmail=" + userEmail
				+ ", userTel=" + userTel + "]";
	}

}
