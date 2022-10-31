package com.dietmall.DAO;

import java.util.List;

import com.dietmall.DTO.BuyItemDTO;
import com.dietmall.DTO.ItemContentBoardDTO;
import com.dietmall.DTO.ItemEtcBoardDTO;
import com.dietmall.DTO.ItemboardDTO;
import com.dietmall.DTO.LikeYNtableDTO;
import com.dietmall.DTO.PagingViewDTO;

public interface CategoryDAO {

	// 상품 게시판 작성
	public void insert_item_board(ItemboardDTO ib_dto) throws Exception;
	
	// 상품 게시판 수정
	public void update_item_board(ItemboardDTO ib_dto) throws Exception;
	
	// 상품 게시판 삭제
	public void delete_buy_item(ItemboardDTO ib_dto) throws Exception;
	
	// 상품 게시판 불러오기
	public ItemboardDTO select_item_board(ItemboardDTO ib_dto) throws Exception;
	
	// 상품 게시판 시퀀스
	public int sequence_item_board() throws Exception;
	
	// 상품 게시판 목록 불러오기 : 페이징
	public List<ItemboardDTO> item_board_paging(PagingViewDTO pv_dto) throws Exception;
	
	// 리뷰 게시판 갯수
	public int item_etc_board_review_paging_count(ItemEtcBoardDTO ieb_dto) throws Exception;
	
	// 리뷰, QnA 그외 게시판 작성
	public void insert_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception;
	
	// 리뷰, QnA 그외 게시판 - 전체 삭제
	public void delete_all_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception;
	
	// 리뷰, QnA 그외 게시판 - 삭제
	public void delete_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception;
	
	// 리뷰, QnA 그외 게시판 - 수정
	public void update_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception;
	
	// 상품 게시판 - 상세 불러오기
	public ItemEtcBoardDTO select_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception;
	
	// 리뷰 게시판 - 별점
	public int select_item_board_avg_etc_star(ItemEtcBoardDTO ieb_dto) throws Exception;
	
	// 리뷰 게시판 목록 불러오기 : 페이징
	public List<ItemEtcBoardDTO> item_etc_board_review_paging(PagingViewDTO pv_dto) throws Exception;
	
	// QnA 게시판 목록 불러오기 : 페이징
	public List<ItemEtcBoardDTO> item_etc_board_QnA_paging(PagingViewDTO pv_dto) throws Exception;
	
	// 리뷰, QnA 그외 게시판 - 시퀀스
	public int sequence_item_etc_board() throws Exception;
	
	// 그외상세설명 작성
	public void insert_item_content_board(ItemContentBoardDTO icb_dto) throws Exception;
	
	// 그외상세설명 - 수정
	public void update_item_content_board(ItemContentBoardDTO icb_dto) throws Exception;
	
	// 그외상세설명 - 삭제
	public void delete_item_content_board(ItemContentBoardDTO icb_dto) throws Exception;
	
	// 그외상세설명 - 불러오기
	public ItemContentBoardDTO select_item_content_board(ItemContentBoardDTO icb_dto) throws Exception;
	
	// 찜 테이블 생성
	public void insert_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 찜 테이블 - 삭제
	public void delete_all_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 찜 테이블 - 삭제
	public void delete_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 찜 테이블 - 불러오기
	public LikeYNtableDTO load_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 찜 증가 - 찜
	public void update_likeup_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 찜 감소 - 찜
	public void update_likedown_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 찜 증가 - 상품
	public void update_likeup_item_board(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 찜 감소 - 상품
	public void update_likedown_item_board(LikeYNtableDTO lyn_dto) throws Exception;
	
	// 결제
	// 결제 테이블 생성
	public void insert_buy_item(BuyItemDTO bi_dto) throws Exception;
	
	// 결제 테이블 - 시퀀스
	public int sequence_buy_item() throws Exception;
	
	// 결제 테이블 - 시퀀스 (상품 번호 순서)
	public int sequence_buy_item_buy_item_order_SEQUENCE() throws Exception;
	
	// 결제 테이블 - 장바구니 불러오기
	public List<BuyItemDTO> load_buy_item_N(BuyItemDTO bi_dto) throws Exception;
	
	// 결제 테이블 - 결제 불러오기
	public List<BuyItemDTO> load_buy_item_M(BuyItemDTO bi_dto) throws Exception;
	
	// 결제 테이블 - 결제 완료 표시
	public void update_buy_yn_Y(BuyItemDTO bi_dto) throws Exception;
	
	// 결제 테이블 - 수정 (상품 갯수)
	public void update_buy_item(BuyItemDTO bi_dto) throws Exception;
	
	// 결제 테이블 - 삭제
	public void delete_buy_item(BuyItemDTO bi_dto) throws Exception;
}
