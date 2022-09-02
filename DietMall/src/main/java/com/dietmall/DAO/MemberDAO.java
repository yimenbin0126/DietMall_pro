package com.dietmall.DAO;

import com.dietmall.vo.MemberVO;

public interface MemberDAO {

	// 회원가입 - 카카오
	public void joinKakao(MemberVO vo) throws Exception;

	// 로그인 - 카카오
//	public MemberVO loginKakao(MemberVO vo) throws Exception;

	// 아이디 확인 - 카카오
	public int idChkKakao(MemberVO vo);
	
	// 회원가입
	public void join(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;

	// 아이디 확인
	public int idChk(MemberVO vo) throws Exception;

	// 비밀번호 확인
	public int passChk(MemberVO vo) throws Exception;

}
