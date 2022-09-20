package com.dietmall.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dietmall.DTO.MemberDTO;

@Repository
public class MemberDAOimpl implements MemberDAO {

	@Autowired
	private SqlSession sql;

	// 카카오
	// 회원가입 - 카카오
	@Override
	public void joinKakao(MemberDTO vo) throws Exception {
		sql.insert("memberMapper.join", vo);
	}

	// 로그인 - 카카오
//	@Override
//	public MemberVO loginKakao(MemberVO vo) throws Exception{
//		return sql.selectOne("memberMapper.login", vo);
//	}

	// 아이디 확인 - 카카오
	@Override
	public int idChkKakao(MemberDTO vo) {
		return sql.selectOne("memberMapper.idChkKakao", vo);
	}

	// 일반
	// 회원가입
	@Override
	public void join(MemberDTO vo) throws Exception {
		sql.insert("memberMapper.join", vo);
	}

	// 로그인
	@Override
	public MemberDTO load_MemberDTO(MemberDTO vo) throws Exception {
		return sql.selectOne("memberMapper.load_MemberDTO", vo);
	}

	// 검사
	// 비밀번호 체크
	@Override
	public int passChk(MemberDTO vo) throws Exception {
		return sql.selectOne("memberMapper.passChk", vo);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberDTO vo) throws Exception {
		return sql.selectOne("memberMapper.idChk", vo);
	}

	// 이메일 중복 체크
	@Override
	public int emailChk(MemberDTO vo) throws Exception {
		return sql.selectOne("memberMapper.emailChk", vo);
	}

	// 아이디/비밀번호 찾기
	// 아이디 찾기
	// 실명, 이메일 동일 회원 여부
	public int findidChk_same(MemberDTO vo) throws Exception {
		return sql.selectOne("memberMapper.findidChk_same", vo);
	}

	// 아이디 값 가져오기
	public String findidChk_id(MemberDTO vo) throws Exception{
		return sql.selectOne("memberMapper.findidChk_id", vo);
	}

	// 비밀번호 찾기
	// 아이디 값으로 이메일 찾기
	public String findpwChk_email(MemberDTO vo) throws Exception {
		return sql.selectOne("memberMapper.findpwChk_email", vo);
	}

	// 회원정보 수정
	public void update_MemberDTO(MemberDTO vo) throws Exception {
		sql.selectOne("memberMapper.update_MemberDTO", vo);
	}
}
