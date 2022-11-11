package com.dietmall.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dietmall.DTO.BuyDeliveryBoard;
import com.dietmall.DTO.BuyItemDTO;
import com.dietmall.DTO.ItemContentBoardDTO;
import com.dietmall.DTO.ItemEtcBoardDTO;
import com.dietmall.DTO.ItemboardDTO;
import com.dietmall.DTO.LikeYNtableDTO;
import com.dietmall.DTO.MainDTO;
import com.dietmall.DTO.PagingViewDTO;

@Repository
public class CategoryDAOimpl implements CategoryDAO {

	@Autowired
	private SqlSession sql;
	
	private static final Logger log = LoggerFactory.getLogger(CategoryDAOimpl.class);
	
	// 상품 게시판 작성
	public void insert_item_board(ItemboardDTO ib_dto) throws Exception {
		log.info("CategoryDAOimpl - insert_item_board");
		sql.insert("itemMapper.insert_item_board", ib_dto);
	}
	
	// 상품 게시판 수정
	public void update_item_board(ItemboardDTO ib_dto) throws Exception {
		log.info("CategoryDAOimpl - update_item_board");
		sql.update("itemMapper.update_item_board", ib_dto);
	}
	
	// 상품 게시판 삭제
	public void delete_buy_item(ItemboardDTO ib_dto) throws Exception {
		log.info("CategoryDAOimpl - delete_buy_item");
		sql.delete("itemMapper.delete_buy_item", ib_dto);
	}
	
	// 상품 게시판 목록 불러오기 : 메인
	public List<ItemboardDTO> main_item_board(MainDTO main_dto) throws Exception {
		System.out.println(main_dto.toString());
		log.info("CategoryDAOimpl - main_item_board");
		return sql.selectList("itemMapper.main_item_board", main_dto);
	}
	
	// 상품 게시판 불러오기
	public ItemboardDTO select_item_board(ItemboardDTO ib_dto) throws Exception {
		log.info("CategoryDAOimpl - select_item_board");
		return sql.selectOne("itemMapper.select_item_board", ib_dto);
	}
	
	// 상품 게시판 시퀀스
	public int sequence_item_board() throws Exception {
		log.info("CategoryDAOimpl - sequence_item_board");
		return sql.selectOne("itemMapper.sequence_item_board");
	}
	
	// 상품 게시판 목록 불러오기 : 페이징
	public List<ItemboardDTO> item_board_paging(PagingViewDTO pv_dto) throws Exception {
		log.info("CategoryDAOimpl - item_board_paging");
		return sql.selectList("itemMapper.item_board_paging", pv_dto);
	}
	
	// 상품 게시판 목록 불러오기 : 갯수
	public int item_board_paging_count(PagingViewDTO pv_dto) throws Exception {
		log.info("CategoryDAOimpl - item_board_paging_count");
		return sql.selectOne("itemMapper.item_board_paging_count", pv_dto);
	}
	
	// 리뷰 게시판 - 별점
	public int select_item_board_avg_etc_star(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - select_item_board_avg_etc_star");
		int result = 0;
		if (sql.selectOne("itemMapper.select_item_board_avg_etc_star", ieb_dto) != null) {
			result = sql.selectOne("itemMapper.select_item_board_avg_etc_star", ieb_dto);
		}
		return result;
	}
	
	// 리뷰, QnA 그외 게시판 작성
	public void insert_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - insert_item_etc_board");
		sql.insert("itemMapper.insert_item_etc_board", ieb_dto);
	}
	
	// 리뷰 게시판 갯수
	public int item_etc_board_review_paging_count(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - item_etc_board_review_paging_count");
		int result = 0;
		if (sql.selectOne("itemMapper.item_etc_board_review_paging_count", ieb_dto) != null) {
			result = sql.selectOne("itemMapper.item_etc_board_review_paging_count", ieb_dto);
		}
		return result;
	}
	
	// qna 갯수
	public int item_etc_board_QnA_paging_count(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - item_etc_board_review_paging_count");
		int result = 0;
		if (sql.selectOne("itemMapper.item_etc_board_QnA_paging_count", ieb_dto) != null) {
			result = sql.selectOne("itemMapper.item_etc_board_QnA_paging_count", ieb_dto);
		}
		return result;
	}
	
	// 리뷰, QnA 그외 게시판 - 전체 삭제
	public void delete_all_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - delete_all_item_etc_board");
		sql.delete("itemMapper.delete_all_item_etc_board", ieb_dto);
	}
	
	// 리뷰, QnA 그외 게시판 - 삭제
	public void delete_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - delete_item_etc_board");
		sql.delete("itemMapper.delete_item_etc_board", ieb_dto);
	}
	
	// 리뷰, QnA 그외 게시판 - 수정
	public void update_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - update_item_etc_board");
		sql.update("itemMapper.update_item_etc_board", ieb_dto);
	}
	
	// 상품 게시판 - 상세 불러오기
	public ItemEtcBoardDTO select_item_etc_board(ItemEtcBoardDTO ieb_dto) throws Exception {
		log.info("CategoryDAOimpl - select_item_etc_board");
		return sql.selectOne("itemMapper.select_item_etc_board", ieb_dto);
	}
	
	// 리뷰 게시판 목록 불러오기 : 페이징
	public List<ItemEtcBoardDTO> item_etc_board_review_paging(PagingViewDTO pv_dto) throws Exception {
		log.info("CategoryDAOimpl - item_etc_board_review_paging");
		return sql.selectList("itemMapper.item_etc_board_review_paging", pv_dto);
	}
	
	// QnA 게시판 목록 불러오기 : 페이징
	public List<ItemEtcBoardDTO> item_etc_board_QnA_paging(PagingViewDTO pv_dto) throws Exception {
		log.info("CategoryDAOimpl - item_etc_board_QnA_paging");
		return sql.selectList("itemMapper.item_etc_board_QnA_paging", pv_dto);
	}
	
	// 리뷰, QnA 그외 게시판 - 시퀀스
	public int sequence_item_etc_board() throws Exception {
		log.info("CategoryDAOimpl - sequence_item_etc_board");
		return sql.selectOne("itemMapper.sequence_item_etc_board");
	}
	
	// 그외상세설명 작성
	public void insert_item_content_board(ItemContentBoardDTO icb_dto) throws Exception {
		log.info("CategoryDAOimpl - insert_item_content_board");
		sql.insert("itemMapper.insert_item_content_board", icb_dto);
	}
	
	// 그외상세설명 - 수정
	public void update_item_content_board(ItemContentBoardDTO icb_dto) throws Exception {
		log.info("CategoryDAOimpl - update_item_content_board");
		sql.update("itemMapper.update_item_content_board", icb_dto);
	}
	
	// 그외상세설명 - 삭제
	public void delete_item_content_board(ItemContentBoardDTO icb_dto) throws Exception {
		log.info("CategoryDAOimpl - delete_item_content_board");
		sql.delete("itemMapper.delete_item_content_board", icb_dto);
	}
	
	// 그외상세설명 - 불러오기
	public ItemContentBoardDTO select_item_content_board(ItemContentBoardDTO icb_dto) throws Exception {
		log.info("CategoryDAOimpl - select_item_content_board");
		return sql.selectOne("itemMapper.select_item_content_board", icb_dto);
	}
	
	// 찜 테이블 생성
	public void insert_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception {
		log.info("CategoryDAOimpl - insert_like_YN_table");
		sql.selectOne("itemMapper.insert_like_YN_table", lyn_dto);
	}
	
	// 찜 테이블 - 전체 삭제
	public void delete_all_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception {
		log.info("CategoryDAOimpl - delete_all_like_YN_table");
		sql.delete("itemMapper.delete_like_YN_table", lyn_dto);
	}
	
	// 찜 테이블 - 삭제
	public void delete_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception {
		log.info("CategoryDAOimpl - delete_like_YN_table");
		sql.selectOne("itemMapper.delete_like_YN_table", lyn_dto);
	}
	
	// 찜 테이블 - 불러오기
	public LikeYNtableDTO load_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception {
		log.info("CategoryDAOimpl - load_like_YN_table");
		return sql.selectOne("itemMapper.load_like_YN_table", lyn_dto);
	}
	
	// 찜 증가 - 찜
	public void update_likeup_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception {
		log.info("CategoryDAOimpl - update_likeup_like_YN_table");
		sql.update("itemMapper.update_likeup_like_YN_table", lyn_dto);
	}
	// 찜 감소 - 찜
	public void update_likedown_like_YN_table(LikeYNtableDTO lyn_dto) throws Exception {
		log.info("CategoryDAOimpl - update_likedown_like_YN_table");
		sql.selectOne("itemMapper.update_likedown_like_YN_table", lyn_dto);
	}
	// 찜 증가 - 상품
	public void update_likeup_item_board(ItemboardDTO ib_dto) throws Exception {
		log.info("CategoryDAOimpl - update_likeup_item_board");
		sql.selectOne("itemMapper.update_likeup_item_board", ib_dto);
	}
	// 찜 감소 - 상품
	public void update_likedown_item_board(ItemboardDTO ib_dto) throws Exception {
		log.info("CategoryDAOimpl - update_likedown_item_board");
		sql.selectOne("itemMapper.update_likedown_item_board", ib_dto);
	}
	
	// 결제
	// 결제 테이블 생성
	public void insert_buy_item(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - insert_buy_item");
		sql.insert("buyMapper.insert_buy_item", bi_dto);
	}
	
	// 결제 테이블 - 시퀀스
	public int sequence_buy_item() throws Exception {
		log.info("CategoryDAOimpl - sequence_buy_item");
		return sql.selectOne("buyMapper.sequence_buy_item");
	}
	
	// 결제 테이블 - 시퀀스 (상품 번호 순서)
	public int sequence_buy_item_buy_item_order_SEQUENCE() throws Exception {
		log.info("CategoryDAOimpl - sequence_buy_item_buy_item_order_SEQUENCE");
		return sql.selectOne("buyMapper.sequence_buy_item_buy_item_order_SEQUENCE");
	}
	
	// 결제 테이블 - 장바구니 불러오기
	public List<BuyItemDTO> load_buy_item_N(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - load_buy_item_N");
		return sql.selectList("buyMapper.load_buy_item_N", bi_dto);
	}
	
	// 결제 테이블 - 장바구니 유무 확인
	public BuyItemDTO load_buy_item_N_yn(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - load_buy_item_N_yn");
		return sql.selectOne("buyMapper.load_buy_item_N_yn", bi_dto);
	}
	
	// 결제 테이블 - 결제 불러오기
	public List<BuyItemDTO> load_buy_item_M(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - load_buy_item_M");
		return sql.selectList("buyMapper.load_buy_item_M", bi_dto);
	}
	
	// 결제 테이블 - 결제 완료 표시
	public void update_buy_yn_Y(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - update_buy_yn_Y");
		sql.update("buyMapper.update_buy_yn_Y", bi_dto);
	}
	
	// 결제 테이블 - 결제 완료 불러오기
	public List<BuyItemDTO> load_buy_item_Y(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - load_buy_item_Y");
		return sql.selectList("buyMapper.load_buy_item_Y", bi_dto);
	}
	
	// 결제 테이블 - 수정 (상품 갯수)
	public void update_buy_item(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - update_buy_item");
		sql.update("buyMapper.update_buy_item", bi_dto);
	}
	
	// 결제 테이블 - 삭제
	public void delete_buy_item(BuyItemDTO bi_dto) throws Exception {
		log.info("CategoryDAOimpl - delete_buy_item");
		sql.delete("buyMapper.delete_buy_item", bi_dto);
	}
	
	// 배송지 테이블 생성
	public void insert_buy_delivery(BuyDeliveryBoard bdb_dto) throws Exception {
		log.info("CategoryDAOimpl - insert_buy_delivery");
		sql.insert("buyMapper.insert_buy_delivery", bdb_dto);
	}
	
	// 배송지 테이블 - 불러오기
	public BuyDeliveryBoard load_buy_delivery(BuyDeliveryBoard bdb_dto) throws Exception {
		log.info("CategoryDAOimpl - load_buy_delivery");
		return sql.selectOne("buyMapper.load_buy_delivery", bdb_dto);
	}
}
