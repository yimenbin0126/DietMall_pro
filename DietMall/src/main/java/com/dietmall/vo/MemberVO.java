package com.dietmall.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberVO {
	
	private String userId;
	private String kakaoId;
	private String userPass;
	private String userName;
	private String userBirthyy;
	private String userBirthmm;
	private String userBirthdd;
	private String userGender;
	private String userEmail;
	private String userTell;
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", kakaoId=" + kakaoId + ", userPass=" + userPass + ", userName="
				+ userName + ", userBirthyy=" + userBirthyy + ", userBirthmm=" + userBirthmm + ", userBirthdd="
				+ userBirthdd + ", userGender=" + userGender + ", userEmail=" + userEmail + ", userTell=" + userTell
				+ "]";
	}
}
