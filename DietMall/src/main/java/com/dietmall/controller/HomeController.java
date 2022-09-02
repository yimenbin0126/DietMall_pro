package com.dietmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dietmall.service.MemberService;
import com.dietmall.vo.MemberVO;


@Controller
public class HomeController {
	
	@Autowired
	MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 메인 화면
	@GetMapping("/main")
	public void getMain(MemberVO vo, HttpSession session, HttpServletRequest req)
			throws Exception {
		logger.info("get main");
		
	}
	
	// 메인화면 post - 로그인여부
	@PostMapping("/main")
	public void postMain(HttpSession session, HttpServletRequest req)
			throws Exception {
		logger.info("post main");
	}
	
}
