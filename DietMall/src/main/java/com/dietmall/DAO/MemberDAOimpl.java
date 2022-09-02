package com.dietmall.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dietmall.vo.MemberVO;

@Repository
public class MemberDAOimpl implements MemberDAO {

	@Autowired
	private SqlSession sql;

	// 회원가입 - 카카오
	@Override
	public void joinKakao(MemberVO vo) throws Exception{
		sql.insert("memberMapper.join", vo);
	}

	// 로그인 - 카카오
//	@Override
//	public MemberVO loginKakao(MemberVO vo) throws Exception{
//		return sql.selectOne("memberMapper.login", vo);
//	}

	// 아이디 확인 - 카카오
	@Override
	public int idChkKakao(MemberVO vo) {
		return sql.selectOne("memberMapper.idChkKakao", vo);
	}
	
	// 회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		sql.insert("memberMapper.join", vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.login", vo);
	}

	// 아이디 확인
	@Override
	public int idChk(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.idChk", vo);
	}

	// 비밀번호 확인
	@Override
	public int passChk(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.passChk", vo);
	}
}
