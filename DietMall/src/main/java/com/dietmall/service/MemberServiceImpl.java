package com.dietmall.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dietmall.DAO.MemberDAO;
import com.dietmall.DTO.MailDTO;
import com.dietmall.DTO.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private MemberDAO dao;

	// 회원가입 - 일반
	@Override
	public void join(MemberDTO vo) throws Exception {
		dao.join(vo);
	}

	// 로그인 - 일반
	// 아이디로 회원정보 불러오기
	public MemberDTO load_id_MemberDTO(MemberDTO vo) throws Exception {
		return dao.load_id_MemberDTO(vo);
	}
	
	// 회원번호로 회원정보 불러오기
	public MemberDTO load_userno_MemberDTO(MemberDTO vo) throws Exception {
		return dao.load_userno_MemberDTO(vo);
	}

	// 아이디 확인 - 일반
	@Override
	public int idChk(MemberDTO vo) throws Exception {
		return dao.idChk(vo);
	}

	// 비밀번호 확인 - 일반
	@Override
	public int passChk(MemberDTO vo) throws Exception {
		return dao.passChk(vo);
	}

	// 이메일 확인 - 일반
	@Override
	public int emailChk(MemberDTO vo) throws Exception {
		return dao.emailChk(vo);
	}

	// 아이디/비밀번호 찾기
	// 아이디 찾기
	// 실명, 이메일 동일 회원 여부
	public int findidChk_same(MemberDTO vo) throws Exception {
		return dao.findidChk_same(vo);
	}

	// 인증코드 메일링
	public String sendEmail_findid(MemberDTO vo) throws Exception {
		// 인증코드 생성
		String code = "";
		Random random = new Random();
		for(int i=0; i<4; i++) {
			int num = random.nextInt(9);
			code += num;
		}
		
		// 데이터 담을 객체 선언
		MailDTO mailDTO = new MailDTO();
		
		// 메일 내용 설정
		SimpleMailMessage smm = new SimpleMailMessage();
		// 출력할 메세지
		String title = "[다이어터몰] 인증코드 발송 메일입니다.";
		String msg = "고객님의 인증코드는 "+code+" 입니다.\n";
		msg += "홈페이지로 돌아가 인증을 진행해주세요.";
		mailDTO.setToAddress(vo.getUseremail());
		mailDTO.setTitle(title);
		mailDTO.setMessage(msg);
		smm.setTo(mailDTO.getToAddress());
		smm.setSubject(mailDTO.getTitle());
		smm.setText(mailDTO.getMessage());
		
		mailSender.send(smm);
		
		return code;
	}
	
	// 아이디 값 가져오기
	public String findidChk_id(MemberDTO vo) throws Exception {
		return dao.findidChk_id(vo);
	}
	

	// 비밀번호 찾기
	// 아이디 값으로 이메일 찾기
	public String findpwChk_email(MemberDTO vo) throws Exception {
		return dao.findpwChk_email(vo);
	}

	// 임시 비밀번호 반환 메일링
	public void sendEmail_findpw(MemberDTO vo) throws Exception {
		SimpleMailMessage smm = new SimpleMailMessage();
		MailDTO mailDTO = new MailDTO();
		
		// 임시 비밀번호 만들기
		String code = "";
		// 특수문자
		String special_chList = "!@#*";
		for(int i=0; i<3; i++) {
			// 특수문자 랜덤
			int sp_num = (int)(Math.random()*4);
			char special_ch = special_chList.charAt(sp_num);
			// 숫자
			int num = (int)(Math.random()*10);
			// 대문자
			char big_ch = (char)((int)(Math.random()*26)+65);
			// 소문자
			char small_ch = (char)((int)(Math.random()*26)+97);
			code += String.valueOf(num)+String.valueOf(big_ch)
			+String.valueOf(small_ch)+String.valueOf(special_ch);
		}
		
		// 임시 비밀번호를 회원 비밀번호에 암호화
		String pwd = pwdEncoder.encode(code);
		vo.setUserpass(pwd);
		// 회원 정보에 저장
		update_MemberDTO(vo);
		
		// 출력할 메세지
		String title = "[다이어터몰] 임시 비밀번호 발송 메일입니다.";
		String msg = "고객님의 임시 비밀번호는 " + code + " 입니다.\n";
		msg += "홈페이지로 돌아가 로그인을 진행해주세요.";
		mailDTO.setToAddress(vo.getUseremail());
		mailDTO.setTitle(title);
		mailDTO.setMessage(msg);
		smm.setTo(mailDTO.getToAddress());
		smm.setSubject(mailDTO.getTitle());
		smm.setText(mailDTO.getMessage());
		
		mailSender.send(smm);
	}

	// 회원정보 수정
	public void update_MemberDTO(MemberDTO vo) throws Exception {
		dao.update_MemberDTO(vo);
	}

}
