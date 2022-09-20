package com.dietmall.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dietmall.DTO.MemberDTO;
import com.dietmall.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService service;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	// 로그인 get
	@GetMapping("/login")
	public void getLogin() throws Exception {
		log.info("get login");
	}

	// 로그인 post
	@PostMapping("/login")
	public String postLogin(MemberDTO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		log.info("post login");

		// 로그인 할 세션 값을 불러옴
		HttpSession session = req.getSession();
		// 사용자 로그인 정보를 서버에 저장 (해당 사용자정보에 맞는 값을 돌려줌 = 없으면 null 반환)
		MemberDTO login = service.load_MemberDTO(vo);
		if (login != null) {
			// 패스워드 확인
			// DB에 저장된 암호화 == 내가 작성한 암호
			boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
			if (login != null && pwdMatch == true) {
				// login 객체를 세션에 반영 (로그인 활성화)
				session.setAttribute("member", login);
				log.info("로그인 완료");
			} else {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false); // 비밀번호 틀림 메시지
				log.info("로그인 실패");
				return "redirect:/member/login";
			}
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false); // 비밀번호 틀림 메시지
			log.info("로그인 실패");
			return "redirect:/member/login";
		}

		return "redirect:/main";
	}

	// 로그아웃 get
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		log.info("get logout");
		session.invalidate();

		return "redirect:/main";
	}

	// 아이디 중복체크
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(@RequestBody MemberDTO vo) throws Exception {
		log.info("post idChk");
		String id = vo.getUserId();
		MemberDTO voNew = new MemberDTO();
		voNew.setUserId(id);
		log.info(id + " - 아이디 체크시작");
		return service.idChk(voNew);
	}

	// 패스워드 체크
	@ResponseBody
	@PostMapping("/passChk")
	public boolean passChk(MemberDTO vo) throws Exception {

		MemberDTO login = service.load_MemberDTO(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		return pwdChk;
	}

	// 이메일 중복체크
	@ResponseBody
	@PostMapping("/emailChk")
	public int emailChk(@RequestBody MemberDTO vo) throws Exception {
		log.info("post emailChk");
		MemberDTO voNew = new MemberDTO();
		voNew.setUserEmail(vo.getUserEmail());
		log.info(vo.getUserEmail() + " - 이메일 체크시작");
		return service.emailChk(voNew);
	}

	// 회원가입 선택 get
	@GetMapping("/join")
	public void getJoin() throws Exception {
		log.info("get join");
	}

	// 회원가입 선택 get
	@GetMapping("/join-detail")
	public void getJoinDetail(MemberDTO vo) throws Exception {
		log.info("get join-detail");
	}

	// 회원가입 선택 (1) - 카카오 (GET)
	@GetMapping("/join-detail-kakao")
	public void kakaoGetJoinDetail(@RequestParam String code) throws Exception {
		log.info("get join-detail-kakao");

	}

	// 회원가입 선택 (1) - 카카오 (POST)
	@PostMapping("/join-detail-kakao")
	public Map<String, Object> kakaoPostJoinDetail(@RequestBody MemberDTO vo) throws Exception {
		log.info("post join-detail-kakao");
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 아이디 체크
		if (service.idChkKakao(vo) == 1) {
			resultMap.put("result", "pass");
		} else if (service.idChkKakao(vo) == 0) {
			resultMap.put("result", "join");
		}

		return resultMap;
	}

	// 회원가입 선택 (1) - 카카오 set (POST)
	@PostMapping("/join-detail-kakao-set")
	public void kakaoPostJoinDetailSet(MemberDTO vo) throws Exception {
		log.info("post join-detail-kakao-set");
		service.join(vo);
		log.info("회원가입 성공 - 카카오");
	}

	// 회원가입 선택 (2) - 다이어터몰 post
	@PostMapping("/join-detail")
	public String postJoinDetail(MemberDTO vo) throws Exception {
		log.info("post join-detail");

		log.info(vo.toString());
		int id_re = service.idChk(vo);
		int email_re = service.emailChk(vo);
		try {
			// 아이디가 이미 있을 경우
			if (id_re == 1 && email_re == 1) {
				log.info("회원가입 실패 - 다이어터몰");
				return "/member/join-detail";
			} else if (id_re == 0 && email_re == 0) {
				// 아이디가 없을 경우
				// 패스워드 저장 전 암호화
				String pwd = pwdEncoder.encode(vo.getUserPass());
				vo.setUserPass(pwd); // DB에 저장
				service.join(vo);
				log.info("회원가입 성공 - 다이어터몰");
				return "/member/joinEnd";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return null;
	}

	// 회원가입 완료 get
	@GetMapping("/joinEnd")
	public void getJoinEnd(MemberDTO vo) throws Exception {
		log.info("get joinEnd");
	}

	// 회원가입 완료 post
	@PostMapping("/joinEnd")
	public void postJoinEnd(MemberDTO vo) throws Exception {
		log.info("post joinEnd");
	}

	// 그 외 기능
	// 아이디/비밀번호 찾기 get
	@GetMapping("/idpsCheck")
	public void getIdpsCheck(MemberDTO vo) throws Exception {
		log.info("get idpsCheck");
	}

	// 아이디/비밀번호 찾기 post
	@PostMapping("/idpsCheck")
	public ModelAndView postIdpsCheck(
			@RequestParam(value = "idpw_find", required = false) String idpw_find,
			MemberDTO vo, HttpServletResponse response) throws Exception {
		log.info("post idpsCheck");
		// 아이디, 비밀번호 타입 체크
		if (idpw_find.equals("id") && service.findidChk_same(vo) == 1) {
			return idCheck_mail(vo);
		} else if (idpw_find.equals("pass") && service.findpwChk_email(vo) != null) {
			MemberDTO vo_new = service.load_MemberDTO(vo);
			return pwdCheck_mail(vo_new);
		} else {
			log.info("에러");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력한 회원정보가 없습니다.')</script>");
			out.flush();
		}
		return null;
	}

	// 아이디 찾기 - 인증코드 발송
	public ModelAndView idCheck_mail(MemberDTO vo) throws Exception {
		log.info("idCheck_mail");
		// 아이디 찾기 - 인증코드 메일로 보내기
		// 아이디 값 가져오기
		String id = service.findidChk_id(vo);
		vo.setUserId(id);
		// 인증코드 발급
		String code = service.sendEmail_findid(vo);
		// 뷰 전달
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/idCheck_code");
		mv.addObject("code", code);
		mv.addObject("vo", vo);

		return mv;
	}
	
	// 아이디 찾기 - 인증코드 재발송
	@ResponseBody
	@PostMapping("/idCheck_code")
	public String idCheck_code(@RequestBody MemberDTO vo) throws Exception {
		log.info("idCheck_code");
		// 아이디 찾기 - 인증코드 메일로 보내기
		// 아이디 값 가져오기
		String id = service.findidChk_id(vo);
		vo.setUserId(id);
		// 인증코드 발급
		String code = service.sendEmail_findid(vo);

		return code;
	}

	// 비밀번호 찾기 - 메일 발송
	public ModelAndView pwdCheck_mail(MemberDTO vo) throws Exception {
		log.info("pwdCheck_mail");
		// 메일 보내기
		service.sendEmail_findpw(vo);
		// 뷰 전달
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/idpsCheck");

		return mv;
	}
}
