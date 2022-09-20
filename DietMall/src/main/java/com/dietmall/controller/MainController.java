package com.dietmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dietmall.DTO.MemberDTO;
import com.dietmall.service.MemberService;


@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	MemberService service;
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	// 메인 화면
	@GetMapping("/home")
	public void getMain(MemberDTO vo, HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("MainController - get home");
	}
	
	// 메인화면 post - 로그인여부
	@PostMapping("/home")
	public void postMain(HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("MainController - post home");
	}
	
}
