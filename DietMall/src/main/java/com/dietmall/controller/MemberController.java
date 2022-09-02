package com.dietmall.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dietmall.service.MemberService;
import com.dietmall.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	// 로그인 get
	@GetMapping("/login")
	public void getLogin() throws Exception {
		logger.info("get login");
	}
	
	// 로그인 post
	@PostMapping("/login")
	public String postLogin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr)
			throws Exception {
		logger.info("post login");
		
		// 로그인 할 세션 값을 불러옴
		HttpSession session = req.getSession();
		// 사용자 로그인 정보를 서버에 저장 (해당 사용자정보에 맞는 값을 돌려줌 = 없으면 null 반환)
		MemberVO login = service.login(vo);
		// 패스워드 확인
		// DB에 저장된 암호화 == 내가 작성한 암호
		boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		if(login != null && pwdMatch == true) {
			// login 객체를 세션에 반영 (로그인 활성화)
			session.setAttribute("member", login);
			logger.info("로그인 완료");
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false); // 비밀번호 틀림 메시지
			logger.info("로그인 실패");
			return "/member/login";
		}
		
		return "redirect:/main";
	}
	
	// 로그아웃 get
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");
		session.invalidate();
		
		return "redirect:/main";
	}

	// 아이디 중복체크
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVO vo) throws Exception {
		logger.info("post idChk");
		logger.info(vo.getUserId());
		return service.idChk(vo);
	}
	
	// 패스워드 체크
	@ResponseBody
	@PostMapping("/passChk")
	public boolean passChk(MemberVO vo) throws Exception {

		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		return pwdChk;
	}
	
	// 회원가입 선택 get
	@GetMapping("/join")
	public void getJoin() throws Exception {
		logger.info("get join");
	}

	// 회원가입 선택 get
	@GetMapping("/join-detail")
	public void getJoinDetail(MemberVO vo) throws Exception {
		logger.info("get join-detail");
	}
	
	// 회원가입 선택 (1) - 카카오 (GET)
	@GetMapping("/join-detail-kakao")
	public void kakaoGetJoinDetail(@RequestParam String code) throws Exception {
		logger.info("get join-detail-kakao");
		
	}
	
	// 회원가입 선택 (1) - 카카오 (POST)
	@PostMapping("/join-detail-kakao")
	public Map<String, Object> kakaoPostJoinDetail(@RequestBody MemberVO vo) throws Exception {
		logger.info("post join-detail-kakao");
		Map <String, Object> resultMap = new HashMap<String, Object>();

		// 아이디 체크
		if(service.idChkKakao(vo)==1) {
			resultMap.put("result", "pass");
		} else if (service.idChkKakao(vo)==0) {
			resultMap.put("result", "join");
		}
		
		return resultMap;
	}

	// 회원가입 선택 (1) - 카카오 set (POST)
	@PostMapping("/join-detail-kakao-set")
	public void kakaoPostJoinDetailSet(MemberVO vo) throws Exception {
		logger.info("post join-detail-kakao-set");
		service.join(vo);
		logger.info("회원가입 성공 - 카카오");
	}

	// 회원가입 선택 (2) - 다이어터몰 post
	@PostMapping("/join-detail")
	public String postJoinDetail(MemberVO vo) throws Exception {
		logger.info("post join-detail");
		
		int result = service.idChk(vo);
		try {
			// 아이디가 이미 있을 경우
			if (result == 1) {
				logger.info("회원가입 실패 - 다이어터몰");
				return "/member/join-detail";
			} else if (result == 0) {
				// 아이디가 없을 경우
				// 패스워드 저장 전 암호화
				String pwd = pwdEncoder.encode(vo.getUserPass());
				vo.setUserPass(pwd); // DB에 저장
				service.join(vo);
				logger.info("회원가입 성공 - 다이어터몰");
				return "/member/joinEnd";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return null;
	}

	
	// 회원가입 완료 get
	@GetMapping("/joinEnd")
	public void getJoinEnd(MemberVO vo) throws Exception {
		logger.info("get joinEnd");
	}
	
	
	// 회원가입 완료 post
	@PostMapping("/joinEnd")
	public void postJoinEnd(MemberVO vo) throws Exception {
		logger.info("post joinEnd");
	}
}
