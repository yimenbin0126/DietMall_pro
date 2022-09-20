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
@RequestMapping("/category/*")
public class CategoryController {
	
	@Autowired
	MemberService service;
	
	private static final Logger log = LoggerFactory.getLogger(CategoryController.class);
	
	// 카데고리 get
	@GetMapping("/all")
	public void getAll(MemberDTO vo, HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("AllController - get all");
	}
	
	// 카데고리 post
	@PostMapping("/all")
	public void postAll(HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("AllController - post all");
	}
}
