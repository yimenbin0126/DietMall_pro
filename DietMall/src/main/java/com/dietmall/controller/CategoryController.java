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
		log.info("CategoryController - get all");
	}
	
	// 카데고리 post
	@PostMapping("/all")
	public void postAll(HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("CategoryController - post all");
	}
	
	// 상세보기 get
	@GetMapping("/detail")
	public void getDetail(MemberDTO vo, HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - get detail");
	}

	// 상세보기 post
	@PostMapping("/detail")
	public void postDetail(HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - post detail");
	}
	
	// 장바구니 get
	@GetMapping("/cart")
	public void getCart(MemberDTO vo, HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - get cart");
	}

	// 장바구니 post
	@PostMapping("/cart")
	public void postCart(HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - post cart");
	}
	
	// 주문 get
	@GetMapping("/order")
	public void getOrder(MemberDTO vo, HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - get order");
	}

	// 주문 post
	@PostMapping("/order")
	public void postOrder(HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - post order");
	}
}
