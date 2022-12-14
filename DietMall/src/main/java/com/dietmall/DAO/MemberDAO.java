package com.dietmall.DAO;

import com.dietmall.DTO.MemberDTO;

public interface MemberDAO {

	// 회원가입
	public void join(MemberDTO vo) throws Exception;

	// 로그인
	// 아이디로 회원정보 불러오기
	public MemberDTO load_id_MemberDTO(MemberDTO vo) throws Exception;

	// 회원번호로 회원정보 불러오기
	public MemberDTO load_userno_MemberDTO(MemberDTO vo) throws Exception;
	
	// 검사
	// 아이디 확인
	public int idChk(MemberDTO vo) throws Exception;

	// 비밀번호 확인
	public int passChk(MemberDTO vo) throws Exception;

	// 이메일 확인
	public int emailChk(MemberDTO vo) throws Exception;

	// 아이디/비밀번호 찾기
	// 아이디 찾기
	// 실명, 이메일 동일 회원 여부
	public int findidChk_same(MemberDTO vo) throws Exception;

	// 아이디 값 가져오기
	public String findidChk_id(MemberDTO vo) throws Exception;

	// 비밀번호 찾기
	// 아이디 값으로 이메일 찾기
	public String findpwChk_email(MemberDTO vo) throws Exception;
	
	// 회원정보 수정
	public void update_MemberDTO(MemberDTO vo) throws Exception;
}
