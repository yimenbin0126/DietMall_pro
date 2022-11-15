package com.dietmall.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dietmall.DTO.BuyDeliveryBoard;
import com.dietmall.DTO.BuyItemDTO;
import com.dietmall.DTO.CartDTO;
import com.dietmall.DTO.ItemContentBoardDTO;
import com.dietmall.DTO.ItemEtcBoardDTO;
import com.dietmall.DTO.ItemboardDTO;
import com.dietmall.DTO.LikeYNtableDTO;
import com.dietmall.DTO.MemberDTO;
import com.dietmall.DTO.OrderDTO;
import com.dietmall.DTO.PagingViewDTO;
import com.dietmall.service.CategoryService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
@RequestMapping("/category/*")
public class CategoryController {
	
	@Autowired
	CategoryService c_service;
	
	private static final Logger log = LoggerFactory.getLogger(CategoryController.class);

	// 카데고리 get
	@GetMapping("/all")
	public String getAll(
			@RequestParam(value="standard", defaultValue="new") String standard,
			@RequestParam(value="page_NowBno", defaultValue="1") int page_NowBno,
			@RequestParam(value="category_type", defaultValue="all") String category_type,
			@RequestParam(value="search_type", defaultValue="") String search_type,
			Model model,
			MemberDTO vo, HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("CategoryController - get all");
		// 상품 전체보기
		PagingViewDTO pv_dto_ = new PagingViewDTO();
		pv_dto_.setCategory_type(category_type);
		pv_dto_.setStandard(standard);
		pv_dto_.setSearch_type(search_type);
		int board_AllCount = c_service.item_board_paging_count(pv_dto_);
		PagingViewDTO pv_dto = new PagingViewDTO(board_AllCount, page_NowBno);
		pv_dto.setCategory_type(category_type);
		pv_dto.setStandard(standard);
		pv_dto.setSearch_type(search_type);
		List<ItemboardDTO> ib_dto_list = new ArrayList<ItemboardDTO>();
		ib_dto_list = c_service.item_board_paging(pv_dto);
		// 리뷰 갯수, 별점
		List<Integer> etc_star_list = new ArrayList<Integer>();
		List<Integer> review_sum_list = new ArrayList<Integer>();
		int etc_star = 0;
		int review_sum = 0;
		for (int i=0; i<ib_dto_list.size(); i++) {
			ItemboardDTO ib_dto = new ItemboardDTO();
			ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
			ib_dto = ib_dto_list.get(i);
			ieb_dto.setItem_bno(ib_dto.getItem_bno());
			etc_star = c_service.select_item_board_avg_etc_star(ieb_dto);
			review_sum = c_service.item_etc_board_review_paging_count(ieb_dto);
			etc_star_list.add(etc_star);
			review_sum_list.add(review_sum);
		}
		// 뷰에 값 넘기기
		model.addAttribute("search_type", search_type);
		model.addAttribute("review_sum_list", review_sum_list);
		model.addAttribute("etc_star_list", etc_star_list);
		model.addAttribute("standard", standard);
		model.addAttribute("pv_dto", pv_dto);
		model.addAttribute("page_NowBno", page_NowBno);
		model.addAttribute("category_type", category_type);
		model.addAttribute("ib_dto_list", ib_dto_list);
		return "/category/all";
	}
	
	// 카데고리 post
	@PostMapping("/all")
	public void postAll(HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("CategoryController - post all");
	}
	
	// 상세보기 get
	@GetMapping("/detail")
	public String getDetail(
			@RequestParam(value="page_NowBno_r", defaultValue="1") int page_NowBno_r,
			@RequestParam(value="page_NowBno_q", defaultValue="1") int page_NowBno_q,
			@RequestParam(value="standard_r", defaultValue="new") String standard_r,
			@RequestParam(value="standard_q", defaultValue="new") String standard_q,
			@RequestParam int item_bno,
			Model model,
			HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - get detail");
		// 별점 불러오기
		ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
		ieb_dto.setItem_bno(item_bno);
		int etc_star = c_service.select_item_board_avg_etc_star(ieb_dto);
		// 찜 테이블 유무 확인
		LikeYNtableDTO lyn_dto = new LikeYNtableDTO();
		MemberDTO m_dto = new MemberDTO();
		if ((MemberDTO)session.getAttribute("member")!=null) {
			m_dto = (MemberDTO)session.getAttribute("member");
			lyn_dto.setUserno(m_dto.getUserno());
			lyn_dto.setItem_bno(item_bno);
			lyn_dto = c_service.load_like_YN_table(lyn_dto);
		}
		// 리뷰 갯수
		int review_sum = c_service.item_etc_board_review_paging_count(ieb_dto);
		// 상품 게시판
		ItemboardDTO ib_dto = new ItemboardDTO();
		ib_dto.setItem_bno(item_bno);
		ib_dto = c_service.select_item_board(ib_dto);
		// 그외 상세설명
		ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
		icb_dto.setItem_bno(item_bno);
		icb_dto = c_service.select_item_content_board(icb_dto);
		// QnA 리스트
		List<ItemEtcBoardDTO> qna_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
		ItemEtcBoardDTO ieb_dto_q = new ItemEtcBoardDTO();
		ieb_dto_q.setItem_bno(item_bno);
		PagingViewDTO pv_dto_qna = new PagingViewDTO(c_service.item_etc_board_QnA_paging_count(ieb_dto_q), page_NowBno_q);
		pv_dto_qna.setItem_bno(item_bno);
		qna_ieb_dto_list = c_service.item_etc_board_QnA_paging(pv_dto_qna);
		// 리뷰 리스트
		List<ItemEtcBoardDTO> review_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
		ItemEtcBoardDTO ieb_dto_r = new ItemEtcBoardDTO();
		ieb_dto_r.setItem_bno(item_bno);
		PagingViewDTO pv_dto_review = new PagingViewDTO(c_service.item_etc_board_review_paging_count(ieb_dto_r), page_NowBno_r);
		pv_dto_review.setItem_bno(item_bno);
		pv_dto_review.setStandard(standard_r);
		review_ieb_dto_list = c_service.item_etc_board_review_paging(pv_dto_review);
		// 뷰에 값 넘기기
		model.addAttribute("lyn_dto", lyn_dto);
		model.addAttribute("review_sum", review_sum);
		model.addAttribute("etc_star", etc_star);
		model.addAttribute("ib_dto", ib_dto);
		model.addAttribute("icb_dto", icb_dto);
		model.addAttribute("pv_dto_qna", pv_dto_qna);
		model.addAttribute("pv_dto_review", pv_dto_review);
		model.addAttribute("qna_ieb_dto_list", qna_ieb_dto_list);
		model.addAttribute("review_ieb_dto_list", review_ieb_dto_list);
		return "/category/detail";
	}
	
	@GetMapping("/insert")
	public String get_insert(
			Model model,
			@RequestParam String category_type) throws Exception{
		// 뷰에 값 넘기기
		model.addAttribute("category_type", category_type);
		return "/category/insert";
	}

	// 상품 글 작성 post
	@ResponseBody
	@PostMapping(path="/insert", produces="application/text;charset=utf-8")
	public String post_insert(
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("CategoryController - post_insert");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 파일 경로
		String savePath = "C:\\dietmall_file";
		// 파일 크기 15MB
		int sizeLimit = 1024 * 1024 * 15;
		// 파라미터를 전달해줌 (같은 이름의 파일명 방지)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8",
				new DefaultFileRenamePolicy());
		// getFilesystemName() : 파일 이름 받아오기
		String fileName_title = multi.getFilesystemName("item_title_img");
		String item_content_img = multi.getFilesystemName("item_content_img");
		// 입력, 유효성 검사
		if (fileName_title==null || fileName_title.equals("")
				|| multi.getParameter("item_name").equals("")
				|| multi.getParameter("origin_price").equals("")
				|| multi.getParameter("sale_percent").equals("")
				|| multi.getParameter("category_type").equals("")
				|| multi.getParameter("delivery_content").equals("")
				|| multi.getParameter("free_type").equals("")
				|| multi.getParameter("item_sum").equals("")
				|| multi.getParameter("item_keep").equals("")
				|| multi.getParameter("food_type").equals("")
				|| multi.getParameter("made_by").equals("")
				|| multi.getParameter("nutition").equals("")
				|| multi.getParameter("call_num").equals("")
				|| multi.getParameter("delivery_guide").equals("")
				|| multi.getParameter("exchange_con").equals("")
				) {
			return "no";
		}
		// 상품 게시판 등록
		ItemboardDTO ib_dto = new ItemboardDTO();
		int item_bno = c_service.sequence_item_board();
		ib_dto.setItem_bno(item_bno);
		ib_dto.setItem_name(multi.getParameter("item_name"));
		ib_dto.setOrigin_price(Integer.valueOf(multi.getParameter("origin_price")));
		if (Integer.valueOf(multi.getParameter("sale_percent")) == 0) {
			ib_dto.setSale_yn("N");
		} else {
			ib_dto.setSale_yn("Y");
		}
		ib_dto.setSale_percent(Integer.valueOf(multi.getParameter("sale_percent")));
		ib_dto.setCategory_type(multi.getParameter("category_type"));
		ib_dto.setItem_title_img(fileName_title);
		ib_dto.setItem_content_img(item_content_img);
		c_service.insert_item_board(ib_dto);
		// 그외상세설명 등록
		ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
		icb_dto.setItem_bno(item_bno);
		icb_dto.setDelivery_content(multi.getParameter("delivery_content"));
		icb_dto.setFree_type(multi.getParameter("free_type"));
		icb_dto.setItem_sum(multi.getParameter("item_sum"));
		icb_dto.setItem_keep(multi.getParameter("item_keep"));
		icb_dto.setFood_type(multi.getParameter("food_type"));
		icb_dto.setMade_by(multi.getParameter("made_by"));
		icb_dto.setNutition(multi.getParameter("nutition"));
		icb_dto.setCall_num(multi.getParameter("call_num"));
		icb_dto.setDelivery_guide(multi.getParameter("delivery_guide"));
		icb_dto.setExchange_con(multi.getParameter("exchange_con"));
		c_service.insert_item_content_board(icb_dto);
		return "통과";
	}
	
	// 상품 글 삭제 post
	@ResponseBody
	@PostMapping("/detail-delete")
	public String postDetail_delete(
			@RequestParam int item_bno,
			HttpServletRequest request) throws Exception {
		log.info("CategoryController - postDetail_delete");
		// 상품게시판 삭제
		// item_bno
		ItemboardDTO ib_dto = new ItemboardDTO();
		ib_dto.setItem_bno(item_bno);
		c_service.delete_buy_item(ib_dto);
		// 그외상세설명 전체 삭제
		ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
		icb_dto.setItem_bno(item_bno);
		c_service.delete_item_content_board(icb_dto);
		// 찜테이블 삭제
		LikeYNtableDTO lyn_dto = new LikeYNtableDTO();
		lyn_dto.setItem_bno(item_bno);
		c_service.delete_all_like_YN_table(lyn_dto);
		// 그외 게시판 삭제
		ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
		ieb_dto.setItem_bno(item_bno);
		c_service.delete_all_item_etc_board(ieb_dto);
		return "O";
	}
	
	// 상품 글 수정 get
	@GetMapping("/detail-update")
	public String getDetail_update(
			Model model,
			@RequestParam int item_bno) throws Exception {
		log.info("CategoryController - getDetail_update");
		// 상품 글 불러오기
		ItemboardDTO ib_dto = new ItemboardDTO();
		ib_dto.setItem_bno(item_bno);
		ib_dto = c_service.select_item_board(ib_dto);
		// 그외상세설명 불러오기
		ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
		icb_dto.setItem_bno(item_bno);
		icb_dto = c_service.select_item_content_board(icb_dto);
		// 뷰에 값 넘기기
		model.addAttribute("ib_dto", ib_dto);
		model.addAttribute("icb_dto", icb_dto);
		return "/category/detail-update";
	}
	
	// 상품 글 수정 post
	@ResponseBody
	@PostMapping(path="/detail-update", produces="application/text;charset=utf-8")
	public String postDetail_update(
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("CategoryController - postDetail_update");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 파일 경로
		String savePath = "C:\\dietmall_file";
		// 파일 크기 15MB
		int sizeLimit = 1024 * 1024 * 15;
		// 파라미터를 전달해줌 (같은 이름의 파일명 방지)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8",
				new DefaultFileRenamePolicy());
		// getFilesystemName() : 파일 이름 받아오기
		String fileName_title = multi.getFilesystemName("item_title_img");
		String item_content_img = multi.getFilesystemName("item_content_img");
		if(fileName_title==null) {
			fileName_title = "nofile";
		}
		if(item_content_img==null) {
			item_content_img = "nofile";
		}
		System.out.println(fileName_title);
		System.out.println(item_content_img);
		// 입력, 유효성 검사
		if (fileName_title==null || fileName_title.equals("")
				|| item_content_img==null || item_content_img.equals("")
				|| multi.getParameter("item_name").equals("")
				|| multi.getParameter("origin_price").equals("")
				|| multi.getParameter("sale_percent").equals("")
				|| multi.getParameter("category_type").equals("")
				|| multi.getParameter("delivery_content").equals("")
				|| multi.getParameter("free_type").equals("")
				|| multi.getParameter("item_sum").equals("")
				|| multi.getParameter("item_keep").equals("")
				|| multi.getParameter("food_type").equals("")
				|| multi.getParameter("made_by").equals("")
				|| multi.getParameter("nutition").equals("")
				|| multi.getParameter("call_num").equals("")
				|| multi.getParameter("delivery_guide").equals("")
				|| multi.getParameter("exchange_con").equals("")
				) {
			return "no";
		}
		// 상품 게시판 등록
		ItemboardDTO ib_dto = new ItemboardDTO();
		int item_bno = Integer.valueOf(multi.getParameter("item_bno"));
		ib_dto.setItem_bno(item_bno);
		ib_dto.setItem_name(multi.getParameter("item_name"));
		ib_dto.setOrigin_price(Integer.valueOf(multi.getParameter("origin_price")));
		if (Integer.valueOf(multi.getParameter("sale_percent")) == 0) {
			ib_dto.setSale_yn("N");
		} else {
			ib_dto.setSale_yn("Y");
		}
		ib_dto.setSale_percent(Integer.valueOf(multi.getParameter("sale_percent")));
		ib_dto.setCategory_type(multi.getParameter("category_type"));
		ib_dto.setItem_title_img(fileName_title);
		ib_dto.setItem_content_img(item_content_img);
		c_service.update_item_board(ib_dto);
		// 그외상세설명 등록
		ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
		icb_dto.setItem_bno(item_bno);
		icb_dto.setDelivery_content(multi.getParameter("delivery_content"));
		icb_dto.setFree_type(multi.getParameter("free_type"));
		icb_dto.setItem_sum(multi.getParameter("item_sum"));
		icb_dto.setItem_keep(multi.getParameter("item_keep"));
		icb_dto.setFood_type(multi.getParameter("food_type"));
		icb_dto.setMade_by(multi.getParameter("made_by"));
		icb_dto.setNutition(multi.getParameter("nutition"));
		icb_dto.setCall_num(multi.getParameter("call_num"));
		icb_dto.setDelivery_guide(multi.getParameter("delivery_guide"));
		icb_dto.setExchange_con(multi.getParameter("exchange_con"));
		c_service.update_item_content_board(icb_dto);
		return "통과";
	}
	
	// 찜 누르기 - 증가
	@ResponseBody
	@PostMapping("/detail-update-like")
	public String postDetail_update_like(
			@RequestParam int item_bno,
			@RequestParam String like_yn,
			HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - postDetail_update_like");
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		// 찜 테이블 있는지 확인
		LikeYNtableDTO lyn_dto = new LikeYNtableDTO();
		lyn_dto.setItem_bno(item_bno);
		lyn_dto.setUserno(m_dto.getUserno());
		// 상품 테이블 불러오기
		ItemboardDTO ib_dto = new ItemboardDTO();
		ib_dto.setItem_bno(item_bno);
		ib_dto = c_service.select_item_board(ib_dto);
		if (c_service.load_like_YN_table(lyn_dto) != null) {
			// 있으면
			lyn_dto = c_service.load_like_YN_table(lyn_dto);
			// 서로 이니셜이 같다면
			if ((like_yn.equals("N") && lyn_dto.getLike_yn().equals("Y"))
					||(like_yn.equals("Y") && lyn_dto.getLike_yn().equals("N"))) {
				return "X";
			} else if (like_yn.equals("N") && lyn_dto.getLike_yn().equals("N")) {
				// 찜 증가
				c_service.update_likeup_like_YN_table(lyn_dto);
				ib_dto.setLike_num(ib_dto.getLike_num()+1);
				// 찜 갯수
				if (ib_dto.getLike_num()>=3) {
					ib_dto.setItem_type("best");
				} else {
					ib_dto.setItem_type("basic");
				}
				c_service.update_likeup_item_board(ib_dto);
			} else if (like_yn.equals("Y") && lyn_dto.getLike_yn().equals("Y")) {
				// 찜 감소
				c_service.update_likedown_like_YN_table(lyn_dto);
				ib_dto.setLike_num(ib_dto.getLike_num()-1);
				// 찜 갯수
				if (ib_dto.getLike_num()<3) {
					ib_dto.setItem_type("basic");
				} else {
					ib_dto.setItem_type("best");
				}
				c_service.update_likedown_item_board(ib_dto);
			}
		} else {
			// 없으면 생성
			c_service.insert_like_YN_table(lyn_dto);
			ib_dto.setLike_num(ib_dto.getLike_num()+1);
			ib_dto.setItem_type("basic");
			c_service.update_likeup_item_board(ib_dto);
		}
		return "O";
	}
	
	// 리뷰 게시판 생성
	@PostMapping(path="/review-insert", produces="application/json;charset=utf-8")
	public @ResponseBody List<HashMap<String,Object>> postReview_insert(
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("CategoryController - postReview_insert");
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		// 파일 경로
		String savePath = "C:\\dietmall_file";
		// 파일 크기 15MB
		int sizeLimit = 1024 * 1024 * 15;
		// 파라미터를 전달해줌 (같은 이름의 파일명 방지)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8",
				new DefaultFileRenamePolicy());
		// 이미지 파일
		ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
		ieb_dto.setImg_name(multi.getFilesystemName("img_name"));
		// 그외
		ieb_dto.setEtc_content(multi.getParameter("etc_content"));
		ieb_dto.setEtc_star(Integer.valueOf(multi.getParameter("etc_star")));
		ieb_dto.setBoard_type("review");
		ieb_dto.setItem_bno(Integer.valueOf(multi.getParameter("item_bno")));
		int sequence = c_service.sequence_item_etc_board();
		ieb_dto.setEtc_board_bno(sequence);
		ieb_dto.setOrigin_bno(sequence);
		// 회원 관련
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		ieb_dto.setUserno(m_dto.getUserno());
		ieb_dto.setUserid(m_dto.getUserid());
		// 리뷰 작성
		c_service.insert_item_etc_board(ieb_dto);
		// 리뷰 갯수
		int review_sum = c_service.item_etc_board_review_paging_count(ieb_dto);
		// 리뷰 리스트
		List<ItemEtcBoardDTO> review_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
		PagingViewDTO pv_dto_review = new PagingViewDTO(review_sum,1);
		pv_dto_review.setItem_bno(Integer.valueOf(multi.getParameter("item_bno")));
		review_ieb_dto_list = c_service.item_etc_board_review_paging(pv_dto_review);
		// json 전달
		List<HashMap<String, Object>> map_list = new ArrayList<HashMap<String,Object>>();
		for (int i=0; i<review_ieb_dto_list.size(); i++) {
			ItemEtcBoardDTO ieb_dto__ = new ItemEtcBoardDTO();
			ieb_dto__ = review_ieb_dto_list.get(i);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("review_dto", ieb_dto__);
			map_list.add(map);
		}
		return map_list;
	}
	
	// 리뷰 삭제 post
	@PostMapping(path="/review-delete", produces="application/json;charset=utf-8")
	public @ResponseBody List<HashMap<String,Object>> postReview_delete(
			HttpSession session,
			HttpServletRequest request
			) throws Exception {
		log.info("CategoryController - postReview_delete");
		request.setCharacterEncoding("utf-8");
		int etc_board_bno = Integer.valueOf(request.getParameter("etc_board_bno"));
		int item_bno = Integer.valueOf(request.getParameter("item_bno"));
		// 게시물 삭제
		ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
		ieb_dto.setEtc_board_bno(etc_board_bno);
		ieb_dto.setItem_bno(item_bno);
		c_service.delete_item_etc_board(ieb_dto);
		// 리뷰 갯수
		int review_sum = c_service.item_etc_board_review_paging_count(ieb_dto);
		// 리뷰 리스트
		List<ItemEtcBoardDTO> review_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
		PagingViewDTO pv_dto_review = new PagingViewDTO(review_sum,1);
		pv_dto_review.setItem_bno(item_bno);
		review_ieb_dto_list = c_service.item_etc_board_review_paging(pv_dto_review);
		// json 전달
		List<HashMap<String, Object>> map_list = new ArrayList<HashMap<String,Object>>();
		for (int i=0; i<review_ieb_dto_list.size(); i++) {
			ItemEtcBoardDTO ieb_dto__ = new ItemEtcBoardDTO();
			ieb_dto__ = review_ieb_dto_list.get(i);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("review_dto", ieb_dto__);
			map_list.add(map);
		}
		return map_list;
	}
	
	// 장바구니 get
	@GetMapping("/cart")
	public String getCart(Model model, HttpServletRequest request) throws Exception {
		log.info("CategoryController - get cart");
		// 결제 테이블 목록 불러오기
		BuyItemDTO bi_dto = new BuyItemDTO();
		HttpSession session = request.getSession();
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		// 값 대입
		bi_dto.setUserno(m_dto.getUserno());
		List<BuyItemDTO> bi_dto_list = new ArrayList<BuyItemDTO>();
		bi_dto_list = c_service.load_buy_item_N(bi_dto);
		// orderDTO 에 저장
		List<CartDTO> cart_dto_list = new ArrayList<CartDTO>();
		for (int i=0; i<bi_dto_list.size(); i++) {
			CartDTO cart_dto = new CartDTO();
			BuyItemDTO _bi_dto = new BuyItemDTO();
			_bi_dto = bi_dto_list.get(i);
			cart_dto.setBuy_bno(_bi_dto.getBuy_bno());
			cart_dto.setItem_num(_bi_dto.getItem_num());
			cart_dto.setUserno(_bi_dto.getUserno());
			// 상품 테이블 가져오기
			ItemboardDTO ib_dto = new ItemboardDTO();
			ib_dto.setItem_bno(_bi_dto.getItem_bno());
			ib_dto = c_service.select_item_board(ib_dto);
			cart_dto.setItem_title_img(ib_dto.getItem_title_img());
			cart_dto.setItem_name(ib_dto.getItem_name());
			cart_dto.setOrigin_price(ib_dto.getOrigin_price());
			// 그외 테이블 가져오기 - 배송비
			ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
			icb_dto.setItem_bno(_bi_dto.getItem_bno());
			icb_dto = c_service.select_item_content_board(icb_dto);
			String delivery_content = icb_dto.getDelivery_content();
			int delevery_price = 0;
			String delevery_content = "";
			if (delivery_content.equals("로젠택배")){
				delevery_content = "로젠택배";
				delevery_price = 3000;
			} else if (delivery_content.equals("cj택배")){
				delevery_content = "로젠택배";
				delevery_price = 5000;
			} else if (delivery_content.equals("한진택배")){
				delevery_content = "한진택배";
				delevery_price = 2000;
			}
			cart_dto.setDelivery_fee(delevery_price);
			// 세일 유무, 퍼센트
			cart_dto.setSale_yn(ib_dto.getSale_yn());
			cart_dto.setSale_percent(ib_dto.getSale_percent());
			cart_dto_list.add(cart_dto);
		}
		model.addAttribute("cart_dto_list", cart_dto_list);
		return "/category/cart";
	}

	// 장바구니 post
	@ResponseBody
	@PostMapping("/cart")
	public String postCart(
			Model model,
			@RequestParam int item_bno,
			@RequestParam int item_num,
			HttpSession session,
			HttpServletRequest req) throws Exception {
		log.info("CategoryController - post cart");
		// 장바구니 담기
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		if (m_dto == null) {
			return "nologin";
		}
		// 장바구니 유무 확인
		BuyItemDTO bi_dto = new BuyItemDTO();
		bi_dto.setUserno(m_dto.getUserno());
		bi_dto.setItem_bno(item_bno);
		if (c_service.load_buy_item_N_yn(bi_dto)!=null) {
			return "X";			
		} else {
			bi_dto.setBuy_bno(c_service.sequence_buy_item());
			bi_dto.setBuy_item_order(c_service.sequence_buy_item_buy_item_order_SEQUENCE());
			bi_dto.setItem_num(item_num);
			c_service.insert_buy_item(bi_dto);
			return "O";			
		}
	}
	
	// 장바구니 삭제 post
	@ResponseBody
	@PostMapping("/cart-delete")
	public String postCart_delete(
			HttpSession session,
			@RequestBody List<String> del_list
			) throws Exception {
		log.info("CategoryController - postCart_delete");
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		// 값이 제대로 안넘어 왔을 경우
		if(del_list==null || del_list.size()==0) {
			return "X";
		} else {
			// 삭제
			int buy_bno = 0;
			for(int i=0; i<del_list.size(); i++) {
				buy_bno = Integer.valueOf(del_list.get(i));
				// 결제테이블 삭제
				BuyItemDTO bi_dto = new BuyItemDTO();
				bi_dto.setBuy_bno(buy_bno);
				bi_dto.setUserno(m_dto.getUserno());
				c_service.delete_buy_item(bi_dto);
			}
			return "O";
		}
	}
	
	// 리뷰 페이징
	@PostMapping(path="/review-paging", produces="application/json;charset=utf-8")
	public @ResponseBody List<List<HashMap<String,Object>>> postReview_paging(
			@RequestBody Map<String, String> param,
			HttpSession session, HttpServletRequest request) throws Exception {
		log.info("CategoryController - postReview_paging");
		request.setCharacterEncoding("utf-8");
		// 값 불러오기
		int item_bno = Integer.valueOf(param.get("item_bno"));
		int page_NowBno_r = Integer.valueOf(param.get("page_NowBno_r"));
		String standard_r = param.get("standard_r");
		// 리뷰 갯수
		ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
		ieb_dto.setItem_bno(item_bno);
		int review_sum = c_service.item_etc_board_review_paging_count(ieb_dto);
		// 리뷰 리스트
		List<ItemEtcBoardDTO> review_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
		PagingViewDTO pv_dto_review = new PagingViewDTO(review_sum, page_NowBno_r);
		pv_dto_review.setItem_bno(item_bno);
		pv_dto_review.setStandard(standard_r);
		review_ieb_dto_list = c_service.item_etc_board_review_paging(pv_dto_review);
		// json 전달
		List<List<HashMap<String, Object>>> map_list_group = new ArrayList<List<HashMap<String,Object>>>();
		List<HashMap<String, Object>> map_list_r = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String, Object>> map_list_p = new ArrayList<HashMap<String,Object>>();
		for (int i=0; i<review_ieb_dto_list.size(); i++) {
			ItemEtcBoardDTO ieb_dto__ = new ItemEtcBoardDTO();
			ieb_dto__ = review_ieb_dto_list.get(i);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("review_dto", ieb_dto__);
			map_list_r.add(map);
		}
		HashMap<String, Object> map_p = new HashMap<String, Object>();
		map_p.put("review_paging", pv_dto_review);
		map_list_p.add(map_p);
		map_list_group.add(map_list_r);
		map_list_group.add(map_list_p);
		return map_list_group;
	}
	
	// 주문 get
	@GetMapping("/order")
	public String getOrder(
			Model model,
			HttpServletRequest request) throws Exception {
		log.info("CategoryController - get order");
		// 결제 테이블 목록 불러오기
		BuyItemDTO bi_dto = new BuyItemDTO();
		HttpSession session = request.getSession();
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		// 값 대입
		bi_dto.setUserno(m_dto.getUserno());
		List<BuyItemDTO> bi_dto_list = new ArrayList<BuyItemDTO>();
		bi_dto_list = c_service.load_buy_item_N(bi_dto);
		// orderDTO 에 저장
		List<CartDTO> cart_dto_list = new ArrayList<CartDTO>();
		for (int i=0; i<bi_dto_list.size(); i++) {
			CartDTO cart_dto = new CartDTO();
			BuyItemDTO _bi_dto = new BuyItemDTO();
			_bi_dto = bi_dto_list.get(i);
			cart_dto.setBuy_bno(_bi_dto.getBuy_bno());
			cart_dto.setItem_num(_bi_dto.getItem_num());
			cart_dto.setUserno(_bi_dto.getUserno());
			// 상품 테이블 가져오기
			ItemboardDTO ib_dto = new ItemboardDTO();
			ib_dto.setItem_bno(_bi_dto.getItem_bno());
			ib_dto = c_service.select_item_board(ib_dto);
			cart_dto.setItem_title_img(ib_dto.getItem_title_img());
			cart_dto.setItem_name(ib_dto.getItem_name());
			// 그외 테이블 가져오기 - 배송비
			ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
			icb_dto.setItem_bno(_bi_dto.getItem_bno());
			icb_dto = c_service.select_item_content_board(icb_dto);
			String delivery_content = icb_dto.getDelivery_content();
			int delevery_price = 0;
			String delevery_content = "";
			if (delivery_content.equals("로젠택배")){
				delevery_content = "로젠택배";
				delevery_price = 3000;
			} else if (delivery_content.equals("cj택배")){
				delevery_content = "로젠택배";
				delevery_price = 5000;
			} else if (delivery_content.equals("한진택배")){
				delevery_content = "한진택배";
				delevery_price = 2000;
			}
			cart_dto.setDelivery_fee(delevery_price);
			cart_dto.setOrigin_price(ib_dto.getOrigin_price());
			// 세일 유무, 퍼센트
			cart_dto.setSale_yn(ib_dto.getSale_yn());
			cart_dto.setSale_percent(ib_dto.getSale_percent());
			cart_dto_list.add(cart_dto);
		}
		model.addAttribute("order_dto_list", cart_dto_list);
		return "/category/order";
	}

	// 주문 post
	@ResponseBody
	@PostMapping("/order-list")
	public String postOrder(
			Model model,
			@RequestBody List<Map<String, String>> order_list,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		log.info("CategoryController - post order");
		// 상품 값 꺼내기
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		List<OrderDTO> o_dto_list = new ArrayList<OrderDTO>();
		for (int i=0; i<order_list.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			map = order_list.get(i);
			OrderDTO o_dto = new OrderDTO();
			if(i!=order_list.size()-1) {
				OrderDTO o_dto_ = new OrderDTO();
				o_dto_.setItem_name(map.get("item_name"));
				o_dto_.setItem_num(Integer.valueOf(map.get("item_num")));
				o_dto_.setItem_price(Integer.valueOf(map.get("item_price")));
				o_dto_list.add(o_dto_);
				// 결제상품 - 결제완료 표시
				BuyItemDTO bi_dto = new BuyItemDTO();
				bi_dto.setUserno(m_dto.getUserno());
				bi_dto.setBuy_bno(Integer.valueOf(map.get("buy_bno")));
				// 결제 완료 표시
				c_service.update_buy_yn_Y(bi_dto);
			} else {
				// 배송지 등 정보
				BuyDeliveryBoard bdb_dto = new BuyDeliveryBoard();
				bdb_dto.setDelivery_post(map.get("delivery_post"));
				bdb_dto.setDelivery_address(map.get("delivery_address"));
				bdb_dto.setDelivery_address_detail(map.get("delivery_address_detail"));
				bdb_dto.setPay_card(map.get("pay_card"));
				// 현재시간
				java.util.Date date = new java.util.Date();
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
				String formattedDate = simpleDateFormat.format(date);
				bdb_dto.setPay_date(formattedDate);
				bdb_dto.setMoney_all(Integer.valueOf(map.get("money_all")));
				bdb_dto.setMoney_delivery(Integer.valueOf(map.get("money_delivery")));
				bdb_dto.setMoney_sale(Integer.valueOf(map.get("money_sale")));
				bdb_dto.setMoney_result(Integer.valueOf(map.get("money_result")));
				bdb_dto.setUserno(m_dto.getUserno());
				c_service.insert_buy_delivery(bdb_dto);
			}
		}
		return "O";
	}
	
	// 주문완료 get
	@GetMapping("/orderComplet")
	public String getOrderComplet(
			Model model,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		log.info("CategoryController - get orderComplet");
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		// 결제 완료 불러오기
		BuyDeliveryBoard bdb_dto = new BuyDeliveryBoard();
		bdb_dto.setUserno(m_dto.getUserno());
		bdb_dto = c_service.load_buy_delivery(bdb_dto);
		// 상품 값 꺼내기
		List<BuyItemDTO> bi_dto_list = new ArrayList<BuyItemDTO>();
		BuyItemDTO bi_dto = new BuyItemDTO();
		bi_dto.setUserno(m_dto.getUserno());
		bi_dto_list = c_service.load_buy_item_Y(bi_dto);
		// 값 옮기기
		List<OrderDTO> o_dto_list = new ArrayList<OrderDTO>();
		for (int i=0; i<bi_dto_list.size(); i++) {
			BuyItemDTO bi_dto_ = new BuyItemDTO();
			OrderDTO o_dto = new OrderDTO();
			bi_dto_ = bi_dto_list.get(i);
			o_dto.setItem_num(bi_dto_.getItem_num());
			// 나머지 값
			ItemboardDTO ib_dto = new ItemboardDTO();
			ib_dto.setItem_bno(bi_dto_.getItem_bno());
			ib_dto = c_service.select_item_board(ib_dto);
			o_dto.setItem_name(ib_dto.getItem_name());
			// 세일 여부
			if (ib_dto.getSale_yn().equals("Y")) {
				o_dto.setItem_price(ib_dto.getOrigin_price() - (int)((ib_dto.getOrigin_price()*(ib_dto.getSale_percent()*0.01)) * bi_dto_.getItem_num()));
			} else {
				o_dto.setItem_price(ib_dto.getOrigin_price()* bi_dto_.getItem_num());
			}
			o_dto_list.add(o_dto);
		}
		// 값 보내기
		model.addAttribute("bdb_dto", bdb_dto);
		model.addAttribute("o_dto_list", o_dto_list);
		return "/category/orderComplet";
	}
	
	// 파일 이미지 불러오기
	@GetMapping("/load-image")
	public void getLoad_proimg(
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam String fileName
			)
			throws Exception {
		log.info("CategoryController - getLoad_proimg");
		
		// 객체에서 정보 가져오기 (이름, 경로)
		String filePath = "C:\\dietmall_file";
		// 파일 객체 선언 (파일 경로, 파일 이름)
        File file = new File(filePath, fileName);
        int fileLength = (int)file.length();
        
        if (fileLength > 0) {
        	// 파일 학장자 체크
        	if (file.getName().endsWith(".jpg") || file.getName().endsWith(".jpeg")) {
        		response.setContentType("image/jpeg");
        		} else if (file.getName().endsWith(".png")) {
        		response.setContentType("image/png");
        		} 
        	response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");
            response.setHeader("Content-Length", "" + fileLength);
            response.setHeader("Pragma", "no-cache;");
            response.setHeader("Expires", "-1;");
            
            // FileInputStream : 파일을 바이트 스트림으로 읽어줌
			try (FileInputStream fis = new FileInputStream(file);
					OutputStream out = response.getOutputStream();) {
				int readCount = 0;
				byte[] buffer = new byte[1024];
				// fis.read(buffer) : 파일 바이트 타입으로 읽기
				// -1 : 파일 다 읽었을 때
				// write : 읽어들인 파일의 바이트를 출력
				while ((readCount = fis.read(buffer)) != -1) {
					out.write(buffer, 0, readCount);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
	}
}
