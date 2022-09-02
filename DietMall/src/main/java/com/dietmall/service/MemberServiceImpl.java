package com.dietmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dietmall.DAO.MemberDAO;
import com.dietmall.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	// 회원가입 - 카카오
	@Override
	public void joinKakao(MemberVO vo) throws Exception {
		dao.join(vo);
	}

	// 로그인 - 카카오
//	@Override
//	public MemberVO loginKakao(MemberVO vo) throws Exception {
//		return dao.login(vo);
//	}
	
	// 아이디 확인 - 카카오
	@Override
	public int idChkKakao(MemberVO vo) throws Exception {
		return dao.idChkKakao(vo);
	}

	// 회원가입 - 일반
	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);
	}

	// 로그인 - 일반
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	// 아이디 확인 - 일반
	@Override
	public int idChk(MemberVO vo) throws Exception {
		return dao.idChk(vo);
	}

	// 비밀번호 확인 - 일반
	@Override
	public int passChk(MemberVO vo) throws Exception {
		return dao.passChk(vo);
	}
}
