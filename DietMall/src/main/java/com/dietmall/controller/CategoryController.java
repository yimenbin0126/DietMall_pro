package com.dietmall.controller;



import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dietmall.DTO.BuyItemDTO;
import com.dietmall.DTO.CartDTO;
import com.dietmall.DTO.ItemContentBoardDTO;
import com.dietmall.DTO.ItemEtcBoardDTO;
import com.dietmall.DTO.ItemboardDTO;
import com.dietmall.DTO.LikeYNtableDTO;
import com.dietmall.DTO.MemberDTO;
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
			Model model,
			MemberDTO vo, HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("CategoryController - get all");
		// 상품 전체보기
		PagingViewDTO pv_dto = new PagingViewDTO();
		pv_dto.setCategory_type(category_type);
		pv_dto.setPage_NowBno(page_NowBno);
		pv_dto.setStandard(standard);
		List<ItemboardDTO> ib_dto_list = new ArrayList<ItemboardDTO>();
		ib_dto_list = c_service.item_board_paging(pv_dto);
		// 뷰에 값 넘기기
		model.addAttribute("standard", standard);
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
			@RequestParam int item_bno,
			@RequestParam String category_type,
			Model model,
			HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - get detail");
		// 별점 불러오기
		ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
		ieb_dto.setItem_bno(item_bno);
		int etc_star = c_service.select_item_board_avg_etc_star(ieb_dto);
		// 리뷰 갯수
		int review_sum = c_service.item_etc_board_review_paging_count(ieb_dto);
		// 상품 게시판
		ItemboardDTO ib_dto = new ItemboardDTO();
		ib_dto.setItem_bno(item_bno);
		ib_dto.setCategory_type(category_type);
		ib_dto = c_service.select_item_board(ib_dto);
		// 그외 상세설명
		ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
		icb_dto.setItem_bno(item_bno);
		icb_dto = c_service.select_item_content_board(icb_dto);
		// QnA 리스트
		List<ItemEtcBoardDTO> qna_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
		PagingViewDTO pv_dto_qna = new PagingViewDTO();
		pv_dto_qna.setItem_bno(item_bno);
		qna_ieb_dto_list = c_service.item_etc_board_QnA_paging(pv_dto_qna);
		// 리뷰 리스트
		List<ItemEtcBoardDTO> review_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
		PagingViewDTO pv_dto_review = new PagingViewDTO();
		pv_dto_review.setItem_bno(item_bno);
		review_ieb_dto_list = c_service.item_etc_board_review_paging(pv_dto_review);
		// 뷰에 값 넘기기
		model.addAttribute("review_sum", review_sum);
		model.addAttribute("etc_star", etc_star);
		model.addAttribute("ib_dto", ib_dto);
		model.addAttribute("icb_dto", icb_dto);
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
			@RequestParam String category_type,
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
	@PostMapping("/detail/delete")
	public void postDetail_delete(
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
	}
	
	// 상품 글 수정 get
	@GetMapping("/detail-update")
	public String getDetail_update(
			Model model,
			@RequestParam int item_bno,
			HttpSession session, HttpServletRequest req) throws Exception {
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
		return "/detail-update";
	}
	
	// 상품 글 수정 post
	@ResponseBody
	@PostMapping("/detail-update")
	public String postDetail_update(
			@RequestParam String category_type,
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
	@PostMapping("/detail/update/like")
	public String postDetail_update_like(
			@RequestParam int item_bno,
			@RequestParam String like_yn,
			HttpSession session, HttpServletRequest req) throws Exception {
		log.info("CategoryController - postDetail_update");
		MemberDTO m_dto = new MemberDTO();
		m_dto = (MemberDTO)session.getAttribute("member");
		// 찜 테이블 있는지 확인
		LikeYNtableDTO lyn_dto = new LikeYNtableDTO();
		lyn_dto.setItem_bno(item_bno);
		lyn_dto.setUserno(m_dto.getUserno());
		if (c_service.load_like_YN_table(lyn_dto) != null) {
			// 있으면
			lyn_dto = c_service.load_like_YN_table(lyn_dto);
			// 서로 이니셜이 같다면
			if ((like_yn.equals("Y") && lyn_dto.getLike_yn().equals("Y"))
					||(like_yn.equals("N") && lyn_dto.getLike_yn().equals("N"))) {
				return "X";
			} 
		} else {
			// 없으면 생성
			c_service.insert_like_YN_table(lyn_dto);
		}
		return "O";
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
			// 합계
			int sum = 0;
			sum += delevery_price;
			cart_dto.setOrigin_price(ib_dto.getOrigin_price());
			// 세일 유무
			if (ib_dto.getSale_yn().equals("Y")) {
				sum += (ib_dto.getOrigin_price() - ib_dto.getOrigin_price()*(ib_dto.getSale_percent()/100))*_bi_dto.getItem_num();
				cart_dto.setSale_yn("Y");
			} else {
				sum += ib_dto.getOrigin_price();
				cart_dto.setSale_yn("N");
			}
			cart_dto.setBuy_sum(sum);
			cart_dto_list.add(cart_dto);
		}
		model.addAttribute("cart_dto_list", cart_dto_list);
		return "/category/order";
	}

	// 장바구니 post
	@PostMapping("/cart")
	public void postCart(
			Model model,
			HttpServletRequest req) throws Exception {
		log.info("CategoryController - post cart");
		
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
			// 합계
			int sum = 0;
			sum += delevery_price;
			cart_dto.setOrigin_price(ib_dto.getOrigin_price());
			// 세일 유무
			if (ib_dto.getSale_yn().equals("Y")) {
				sum += (ib_dto.getOrigin_price() - ib_dto.getOrigin_price()*(ib_dto.getSale_percent()/100))*_bi_dto.getItem_num();
				cart_dto.setSale_yn("Y");
			} else {
				sum += ib_dto.getOrigin_price();
				cart_dto.setSale_yn("N");
			}
			cart_dto.setBuy_sum(sum);
			cart_dto_list.add(cart_dto);
		}
		model.addAttribute("order_dto_list", cart_dto_list);
		return "/category/cart";
	}

	// 주문 post
	@PostMapping("/order")
	public void postOrder(HttpServletRequest request) throws Exception {
		log.info("CategoryController - post order");
	}
	
	// 주문완료 get
	@GetMapping("/orderComplet")
	public void getOrderComplet(HttpServletRequest request) throws Exception {
		log.info("CategoryController - get orderComplet");
	}

	// 주문완료 post
	@PostMapping("/orderComplet")
	public void postOrderComplet(HttpServletRequest request) throws Exception {
		log.info("CategoryController - post orderComplet");
	}
}
