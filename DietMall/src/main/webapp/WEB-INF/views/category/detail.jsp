<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.ItemboardDTO, com.dietmall.DTO.MemberDTO, com.dietmall.DTO.LikeYNtableDTO,
    com.dietmall.DTO.PagingViewDTO, com.dietmall.DTO.ItemContentBoardDTO, com.dietmall.DTO.ItemEtcBoardDTO"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/detail.css" rel="stylesheet">
    <link href="/resources/css/nav/header.css" rel="stylesheet">
    <link href="/resources/css/nav/footer.css" rel="stylesheet">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/category/detail.js"></script>
	<script type="text/javascript" src="../resources/js/nav/header.js"></script>
</head>

<body>
    <!-- 헤더 시작 -->
	<header>
		<!-- 상단 -->
		<form id="fir_header_admin" name='mainForm' method="post">
			<ul>
				<!-- 로그인이 안되있을 때 -->
				<c:if test="${member == null}">
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/join-detail">회원가입</a></li>
				</c:if>
				<!-- 로그인이 되있을 때 -->
				<c:if test="${member != null}">
					<li>${member.username}님 환영합니다.</li>
					<li><a href="/member/logout">로그아웃</a></li>
					<li><a href="/category/cart">장바구니</a></li>
				</c:if>
			</ul>
		</form>
		<%@include file="../nav/header.jsp"%>
	</header>
	<!-- 헤더 끝 -->

	<%
		// 값 불러오기
		// 상품 게시판
		ItemboardDTO ib_dto = new ItemboardDTO();
		ib_dto = (ItemboardDTO)request.getAttribute("ib_dto");
		// 그외 상세설명
		ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
		icb_dto = (ItemContentBoardDTO)request.getAttribute("icb_dto");
		// 별점
		int etc_star = (int)request.getAttribute("etc_star");
	%>
	<!-- 본문 -->
	<section class="con_selction">

		<!-- 왼쪽 카데고리 -->
		<div class="nav">
			<div class="nav_all" onclick="location.href='/category/all?page_NowBno=1&category_type=all'">전체카데고리</div>
			<!-- 간편 요리 -->
			<div class="nav_category" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food'">간편 요리</div>
			<div class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_chicken'">· 닭가슴살</div>
			<div class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_box'">· 도시락</div>
			<div class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_salad'">· 샐러드</div>
			<div class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_sub'">· 구독 식품</div>
			<!-- 보조 식품 -->
			<div class="nav_category" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food'">보조 식품</div>
			<div class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food_snack'">· 간식</div>
			<div class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food_penut'">· 견과류</div>
			<div class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food_pill'">· 영양제</div>
		</div>
		
		<!-- 오른쪽 컨텐츠 -->
		<div class="right_content">
			<!-- 상단 -->
			<div class="s_header">
				<!-- 이미지 -->
				<div class="s_header_image">
					<img src="/category/load-image?fileName=<%=ib_dto.getItem_title_img()%>">
				</div>
				<!-- 결제 -->
				<div class="s_header_pay">
					<!-- 제목, 설명 -->
					<div class="h_pay_title"><%=ib_dto.getItem_name()%></div>
					<!-- 별점 -->
					<div class="h_pay_star">
						<span class="s_text">총 별점</span> 
						<span class="s_star">
							<c:set var="etc_star" value="<%=etc_star%>" />
							<c:if test="${etc_star == 5}">★★★★★</c:if>
							<c:if test="${etc_star == 4}">★★★★☆</c:if>
							<c:if test="${etc_star == 3}">★★★☆☆</c:if>
							<c:if test="${etc_star == 2}">★★☆☆☆</c:if>
							<c:if test="${etc_star == 1}">★☆☆☆☆</c:if>
							<c:if test="${etc_star == 0}">☆☆☆☆☆</c:if>
						</span> 
						<span class="s_num"><%=etc_star%></span>
					</div>
					<!-- 가격 -->
					<div class="h_pay_price">
						<%
							int sale_price = 0;
							// 세일 여부
							if (ib_dto.getSale_yn().equals("Y")) {
								sale_price = ib_dto.getOrigin_price() - (int)(ib_dto.getOrigin_price()*(ib_dto.getSale_percent()*0.01));
						%>
						<!-- 상품 할인율, 원가, 할인가격 -->
						<div class="items_price_sale">
							<div class="sale_percent">
								<span class="percent"><%=ib_dto.getSale_percent()%>%</span>
								<input type="hidden" class="p_price" value="<%=ib_dto.getOrigin_price()%>">
								<span class="percent_price">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto.getOrigin_price()%>" />
								</span>
							</div>
							<div class="sale_price">
								<input type="hidden" class="o_price" value="<%=sale_price%>">
								<span class="origin_price">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sale_price%>" />
								</span>
								<span class="origin_price_text">원</span>
							</div>
						</div>
						<%
							} else {
								sale_price = ib_dto.getOrigin_price();
						%>
						<!-- 원가 - 할인 안할때 -->
						<div class="items_price">
							<input type="hidden" class="o_price" value="<%=ib_dto.getOrigin_price()%>">
							<span class="origin_price">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto.getOrigin_price()%>" />
							</span> <span
								class="origin_price_text">원</span>
						</div>
						<%
							}
						%>
					</div>
					<!-- 배송정보 -->
					<div class="h_pay_delivery_content">
						<div class="c_title">
							<span>배송정보</span> <span><%=icb_dto.getDelivery_content()%></span>
						</div>
					</div>
					<!-- 배송비 -->
					<div class="h_pay_delivery_price">
						<div class="d_content_top">
						<%
							int delevery_price = 0;
							String delevery_content = "";
							if (icb_dto.getDelivery_content().equals("로젠택배")){
								delevery_content = "로젠택배";
								delevery_price = 3000;
							} else if (icb_dto.getDelivery_content().equals("cj택배")){
								delevery_content = "로젠택배";
								delevery_price = 5000;
							} else if (icb_dto.getDelivery_content().equals("한진택배")){
								delevery_content = "한진택배";
								delevery_price = 2000;
							}
						%>
							<input type="hidden" class="delevery_price" value="<%=delevery_price%>">
							<span><b>택배 배송</b> | </span> 
							<span class="delivery_pr">
								<input type="hidden" class="deli_price" value="<%=delevery_price%>">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=delevery_price%>" />
							</span>
							<span>원</span> <span>· <%=delevery_content%></span>
						</div>
						<div class="d_content_bottom">
							<div>제주 추가 10,000원 · 도서지역 2,000원 추가</div>
							<div><%=icb_dto.getFree_type()%></div>
						</div>
					</div>
					<!-- 구입할 상품 수량 추가 -->
					<div class="h_pay_items_add">
						<div class="add_btn_minus">-</div>
						<div class="add_btn_num">1</div>
						<div class="add_btn_plus">+</div>
					</div>
					<!-- 총 상품 금액 -->
					<div class="h_pay_items_price">
						<input type="hidden" class="final_price" value="<%=sale_price%>">
						<div class="i_price_all_title">총 상품 금액</div>
						<div class="i_price_all_content">
							<span>합계</span> <span class="final_items_price">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sale_price%>" />
							</span> <span>원</span>
						</div>
					</div>
					<!-- 구매하기 버튼 -->
					<div class="h_pay_buy_button">
						<form name="buy_form">
							<!-- 구매 가격, 수량, 전송버튼 -->
							<input type="hidden" id="buy_price">
							<input type="hidden" id="buy_number">
							<input type="submit" value="구매하기" id="buy_button_sub">
						</form>
					</div>
					<!-- 장바구니 담기 -->
					<div class="h_pay_cart">장바구니 담기</div>
					<!-- 찜하기 -->
					<%
						String like_heart = "♡";
						String like_yn = "N";
						if (session.getAttribute("member") != null){
							if (request.getAttribute("lyn_dto")!=null){
								LikeYNtableDTO lyn_dto = new LikeYNtableDTO();
								lyn_dto = (LikeYNtableDTO)request.getAttribute("lyn_dto");	
								if (lyn_dto.getLike_yn()!=null
										&& lyn_dto.getLike_yn().equals("Y")){
									like_heart = "♥";
									like_yn = "Y";
								}
							}
						
					%>
					<div class="h_pay_wish" id="h_pay_wish_y">
						<input type="hidden" id="h_p_wish_yn" value="<%=like_yn%>">
						<span class="wish_text"><%=like_heart%></span> <span class="wish_span">찜하기</span> <span class="wish_num"><%=ib_dto.getLike_num()%></span>
					</div>
					<%
						} else {
					%>
					<div class="h_pay_wish" id="h_pay_wish_n" onClick="alert('로그인 후에 가능합니다.');">
						<input type="hidden" id="h_p_wish_yn" value="<%=like_yn%>">
						<span class="wish_text"><%=like_heart%></span> <span class="wish_span">찜하기</span> <span class="wish_num"><%=ib_dto.getLike_num()%></span>
					</div>
					<%
						}
					%>
				</div>
			</div>
			<%
				// 리뷰 갯수
				int review_sum = (int)request.getAttribute("review_sum");
				// 리뷰 게시물
				List<ItemEtcBoardDTO> review_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
				int review_count = 0;
				if (request.getAttribute("review_ieb_dto_list") != null
						&& ((ArrayList<ItemEtcBoardDTO>)request.getAttribute("review_ieb_dto_list")).size() > 0){
					review_ieb_dto_list = (ArrayList<ItemEtcBoardDTO>)request.getAttribute("review_ieb_dto_list");
				} 
			%>
			<!-- 고정 카데고리 -->
			<div class="section_pick_category">
				<div class="p_category_items_btn"
				onClick="location.href='#section_middle_detail'">
					상품 설명
				</div>
				<div class="p_category_review_btn"
				onClick="location.href='#section_footer_review'">
					<span>리뷰</span> <span class="review_sum"><%=review_sum%></span>
				</div>
				<div class="p_category_QnA_btn"
				onClick="location.href='#section_footer_QnA'">QnA</div>
				<div class="p_category_replace_btn"
				onClick="location.href='#section_footer_exchange'">반품/교환 정보</div>
			</div>

			<!-- 상품 설명 -->
			<div class="section_middle_detail" id="section_middle_detail">
				<!-- 상품 설명 - 이미지 -->
				<div class="s_middle_detail_image">
					<img src="/category/load-image?fileName=<%=ib_dto.getItem_content_img()%>">
				</div>

				<!-- 상품 설명 - 상품 정보 -->
				<div class="section_detail_item">
					<div class="s_detail_title">상품정보</div>
					<table>
						<tr>
							<th>품목, 용량</th>
							<td><%=icb_dto.getItem_sum()%></td>
						</tr>
						<tr>
							<th>보관 방법</th>
							<td><%=icb_dto.getItem_keep()%></td>
						</tr>
						<tr>
							<th>식품유형</th>
							<td><%=icb_dto.getFood_type()%></td>
						</tr>
						<tr>
							<th>생산지</th>
							<td><%=icb_dto.getMade_by()%></td>
						</tr>
						<tr>
							<th>영양성분표시</th>
							<td><%=icb_dto.getNutition()%></td>
						</tr>
						<tr>
							<th>소비자 상담 전화번호</th>
							<td><%=icb_dto.getCall_num()%></td>
						</tr>
					</table>
				</div>
				
				<%
					// 글쓰기 줄바꿈 보이게 저장
					icb_dto.setDelivery_guide(icb_dto.getDelivery_guide().replace("\r\n", "<br>"));
					icb_dto.setExchange_con(icb_dto.getExchange_con().replace("\r\n", "<br>"));
				%>
				<!-- 상품 설명 - 배송 안내 -->
				<div class="section_detail_delivery">
					<div class="s_delivery_title">배송 안내</div>
					<p><%=icb_dto.getDelivery_guide()%></p>
				</div>
			</div>

			<!-- 리뷰 -->
			<div class="section_footer_review" id="section_footer_review">
				<!-- 리뷰 건수 -->
				<div class="f_review_num">
					<span>리뷰</span> <span><%=review_sum%></span> <span>개</span>
				</div>
				<%
					MemberDTO m_dto = new MemberDTO();
					m_dto = (MemberDTO)session.getAttribute("member");
					if (m_dto !=null){
				%>
				<input type="hidden" id="m_dto_userid" value="<%=m_dto.getUserid()%>">
				<!-- 리뷰 작성하기 -->
				<div class="r_write_content">
					<!-- 리뷰 버튼 -->
					<div class="r_w_c_btn" id="r_w_c_btn_y">
						<input type="button" value="리뷰 작성하기">
					</div>
				</div>
				<%
					} else {
				%>
				<input type="hidden" id="m_dto_userid" value="">
				<!-- 리뷰 작성하기 (로그인 x) -->
				<div class="r_write_content">
					<!-- 리뷰 버튼 -->
					<div class="r_w_c_btn" id="r_w_c_btn_n"">
						<input type="button" value="리뷰 작성하기" onClick="alert('로그인 후 작성이 가능합니다.');">
					</div>
				</div>
				<%
					}
				%>
				<!-- 리뷰 기준 -->
				<div class="f_review_standard">
					<span class="frs_new">최신순</span> <span>|</span>
					<span class="frs_star_top">평점 높은순</span> <span>|</span>
					<span class="frs_star_low">평점 낮은순</span>
				</div>
				<!-- 리뷰 -->
				<div class="f_review_content">
					<%
						// 리뷰 존재 여부
						if (review_ieb_dto_list.size() != 0){
							for(int i=0; i<review_ieb_dto_list.size(); i++){
								ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
								ieb_dto = review_ieb_dto_list.get(i);
					%>
					<!-- 리뷰 상단 -->
					<%
							if (ieb_dto.getBoard_type().equals("review")){
					%>
					<!-- 리뷰 내용 -->
					<div class="r_content">
						<div class="r_content_top">
							<!-- 상단 - 별점 -->
							<div class="c_top_star">
								<span>
									<c:set var="_etc_star" value="<%=ieb_dto.getEtc_star()%>" />
									<c:if test="${_etc_star == 5}">★★★★★</c:if>
									<c:if test="${_etc_star == 4}">★★★★☆</c:if>
									<c:if test="${_etc_star == 3}">★★★☆☆</c:if>
									<c:if test="${_etc_star == 2}">★★☆☆☆</c:if>
									<c:if test="${_etc_star == 1}">★☆☆☆☆</c:if>
								</span>
								 <span><%=ieb_dto.getEtc_star()%></span>
							</div>
							<!-- 상단 - 아이디, 날짜 -->
							<div class="c_top_date">
								<span><%=ieb_dto.getUserid()%></span> <span><%=ieb_dto.getCreate_time()%></span>
							</div>
						</div>
						<!-- 리뷰 내용 -->
						<div class="r_content_middle">
							<!-- 리뷰 내용 - 이미지 -->
							<div class="c_middle_image">
								<img src="/category/load-image?fileName=<%=ieb_dto.getImg_name()%>">
							</div>
							<!-- 리뷰 내용 - 글내용 -->
							<div class="c_middle_detail">
								<%=ieb_dto.getEtc_content()%>
							</div>
							<input type="hidden" class="hidden_img_name" value="<%=ieb_dto.getImg_name()%>">
						</div>
						<%
							if (m_dto !=null){
						%>
						<!-- 답글, 수정, 삭제 -->
						<div class="r_content_btn">
							<%
								if(m_dto.getUserid().equals("admin")){
							%>
							<!-- 답글 -->
							<div class="r_c_btn_reply">
								답글
							</div>
							<%
								}
								if(m_dto.getUserid().equals(ieb_dto.getUserid())){
							%>
							<!-- 수정 -->
							<div class="r_c_btn_update">
								수정
							</div>
							<!-- 삭제 -->
							<div class="r_c_btn_delete">
								삭제
							</div>
							<%
									}
							%>
						</div>
						<%
							}
						%>
					</div>
					<%
								}else if (ieb_dto.getBoard_type().equals("review_reply")){
					%>
					<!-- 리뷰 내용 - 답변 -->
					<div class="c_answer">
						<!-- 답변 - 리뷰 -->
						<div class="answer_review">
							<div class="answer_writer">
								<div><%=ieb_dto.getUserid()%></div>
								<div><%=ieb_dto.getCreate_time()%></div>
							</div>
							<div class="answer_content">
								<%=ieb_dto.getEtc_content()%>
							</div>
						</div>
						<%
							if (m_dto !=null
							&& m_dto.getUserid().equals(ieb_dto.getUserid())){
						%>
						<!-- 수정, 삭제 -->
						<div class="answer_btn">
							<!-- 수정 -->
							<div class="a_btn_update">
								수정
							</div>
							<!-- 삭제 -->
							<div class="a_btn_delete">
								삭제
							</div>
						</div>
						<%
							}
						%>
					</div>
					<%
								}
							}
						} else {
					%>
					<div style="font-size:13px; padding-top:10px; padding-bottom: 10px;">등록된 게시물이 없습니다.</div>
					<%
						}
					%>
				</div>
				<!-- 페이징 시작 -->
				<div class="e_paging" id="e_paging_review">
					<%
						PagingViewDTO pv_dto_review = new PagingViewDTO();
						pv_dto_review = (PagingViewDTO)request.getAttribute("pv_dto_review");
						// 클릭 가능 여부
						if (pv_dto_review.isPage_prev()){
					%>
					<div onclick="location.href='/category/all?page_NowBno_r=<%=pv_dto_review.getPage_StartBno()-5%>&standard=<%=pv_dto_review.getStandard()%>'"
					 class="e_paging_btnleft" id="e_paging_btnleft_yes">&lt;</div>
					<%
						} else {
					%>
					<div onclick="alert('첫 페이지 입니다.');"
					 class="e_paging_btnleft" id="e_paging_btnleft_no">&lt;</div>
					<%
						}
					%>
					<div class="e_paging_num">
					<%
						// 첫 번호, 마지막 번호
						int page_StartBno_r = pv_dto_review.getPage_StartBno();
						int page_EndBno_r = pv_dto_review.getPage_EndBno();
						// 현재 번호
						for (int j=page_StartBno_r; j <= page_EndBno_r; j++) {
							if(j==pv_dto_review.getPage_NowBno()){									
					%>
						<a id="page_NowBno"><%=j%></a>
					<%
							} else {
					%>
						<a href="/category/all?page_NowBno_r=<%=j%>
						&standard=<%=pv_dto_review.getStandard()%>"
						class="page_Bno" id="page_Bno<%=j%>"><%=j%></a>
					<%
							}
						}
					%>
					</div>
					<%
						// 클릭 가능 여부
						if (pv_dto_review.isPage_next()){
					%>
					<div onclick="location.href='/category/all?page_NowBno_r=<%=pv_dto_review.getPage_EndBno()+1%>&standard=<%=pv_dto_review.getStandard()%>'"
					class="e_paging_btnright" id="e_paging_btnright_yes">&gt;</div>
					<%
						} else {
					%>
					<div onclick="alert('마지막 페이지 입니다.');"
					 class="e_paging_btnright" id="e_paging_btnright_no">&gt;</div>
					<%
						}
					%>
				</div>
				<!-- 페이징 끝 -->
			</div>
			<!-- QnA -->
			<div class="section_footer_QnA" id="section_footer_QnA">
				<!-- QnA - 상단 -->
				<div class="f_QnA_header">
					<div class="s_footer_title">QnA</div>
					<div class="s_footer_content">고객분들의 건의와 1:1 QnA 상담을 진행할 수 있습니다.</div>
					<div class="s_footer_write_button">상품 QnA 작성하기</div>
				</div>
				<!-- QnA - 내용 -->
				<div class="f_QnA_content">
					<ul>
						<li>답변상태</li>
						<li>제목</li>
						<li>작성자</li>
						<li>작성일</li>
					</ul>
					<%
						List<ItemEtcBoardDTO> qna_ieb_dto_list = new ArrayList<ItemEtcBoardDTO>();
						qna_ieb_dto_list = (List<ItemEtcBoardDTO>)request.getAttribute("qna_ieb_dto_list");
						if (qna_ieb_dto_list.size()==0){
					%>
					<ul>
						등록된 게시물이 없습니다.
					</ul>
					<%
						} else {
							for(int k=0; k<qna_ieb_dto_list.size(); k++){
								ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
								ieb_dto = qna_ieb_dto_list.get(k);
								String userid_update = ieb_dto.getUserid();
								userid_update = userid_update.substring(0,3);
								for (int l=3; l<userid_update.length(); l++){
									userid_update += "*";
								}
					%>
					<ul>
						<li><%=ieb_dto.getEtc_reply_type()%></li>
						<li><%=ieb_dto.getEtc_title()%></li>
						<li><%=userid_update%></li>
						<li><%=ieb_dto.getCreate_time()%></li>
					</ul>
					<%
							}
						}
					%>
				</div>
				<!-- 페이지 -->
				<div class="e_paging">
					<%
						PagingViewDTO pv_dto_qna = new PagingViewDTO();
						pv_dto_qna = (PagingViewDTO)request.getAttribute("pv_dto_qna");
						// 클릭 가능 여부
						if (pv_dto_qna.isPage_prev()){
					%>
					<div onclick="location.href='/category/all?page_NowBno_q=<%=pv_dto_qna.getPage_StartBno()-5%>&standard=<%=pv_dto_qna.getStandard()%>'"
					 class="e_paging_btnleft" id="e_paging_btnleft_yes">&lt;</div>
					<%
						} else {
					%>
					<div onclick="alert('첫 페이지 입니다.');"
					 class="e_paging_btnleft" id="e_paging_btnleft_no">&lt;</div>
					<%
						}
					%>
					<div class="e_paging_num">
					<%
						// 첫 번호, 마지막 번호
						int page_StartBno_q = pv_dto_qna.getPage_StartBno();
						int page_EndBno_q = pv_dto_qna.getPage_EndBno();
						// 현재 번호
						for (int a=page_StartBno_q; a <= page_EndBno_q; a++) {
							if(a==page_EndBno_q){									
					%>
						<a id="page_NowBno"><%=a%></a>
					<%
							} else {
					%>
						<a href="/category/all?page_NowBno_q=<%=a%>
						&standard=<%=pv_dto_qna.getStandard()%>"
						class="page_Bno" id="page_Bno<%=a%>"><%=a%></a>
					<%
							}
						}
					%>
					</div>
					<%
						// 클릭 가능 여부
						if (pv_dto_qna.isPage_next()){
					%>
					<div onclick="location.href='/category/all?page_NowBno_q=<%=pv_dto_qna.getPage_EndBno()+1%>&standard=<%=pv_dto_qna.getStandard()%>'"
					class="e_paging_btnright" id="e_paging_btnright_yes">&gt;</div>
					<%
						} else {
					%>
					<div onclick="alert('마지막 페이지 입니다.');"
					 class="e_paging_btnright" id="e_paging_btnright_no">&gt;</div>
					<%
						}
					%>
				</div>
				
			</div>
			<!-- 반품/교환 정보 -->
			<div class="section_footer_exchange" id="section_footer_exchange">
				<!-- 제목 -->
				<div class="footer_e_title">반품/교환 정보</div>
				<div class="footer_e_content">
					<p><%=icb_dto.getExchange_con()%></p>
				</div>
			</div>

			<input type="hidden" id="item_bno" name="item_bno" value="<%=ib_dto.getItem_bno()%>">
			<%
				if(m_dto != null){
					if(m_dto.getUserid().equals("admin")){
			%>
			<!-- 버튼 -->
			<div class="pp_btn_up_del">
				<!-- 글수정 -->
				<div class="pp_update_btn">
					글 수정
				</div>
				<!-- 글삭제 -->
				<div class="pp_delete_btn">
					글 삭제
				</div>
			</div>
			<%
					}
				}
			%>
		</div>

		<!-- 하단 여백 -->
		<div class="right_content_bottom"></div>
	</section>

	<!-- 푸터 -->
    <footer style="color:rgb(50,50,50);">
    	<div style="display:flex; justify-content: center;">
	        <div style="text-align: left;">
	        	<div style="font-size:15px; font-weight:bold; color:rgb(20,20,20);">고객다이어터센터</div>
	        	<div style="display:flex; font-size:20px; font-weight:bold; margin-top:3px;">
		            <div style="color:rgb(20,20,20);">(주) 다이어터몰</div>
		            <div style="color:rgb(20,20,20); margin-left: 3px;">1666-1111</div>
	        	</div>
	        	<div style="display:flex; margin-top:10px;">
	        		<div style="font-weight:bold; font-size:14px; padding:7px; border: 1px solid gray;">카카오톡 문의</div>
	        		<div style="margin-left:6px;">
	        			<div style="font-size:12px;">월-토요일 : 오전9시~오후4시</div>
	        			<div style="font-size:12px;">일/공휴일 : 오전9시~오후1시</div>
	        		</div>
	        	</div>
	        	<div style="display:flex; margin-top:10px;">
	        		<div style="font-weight:bold; font-size:14px; padding:7px; border: 1px solid gray;">1:1 문의</div>
	        		<div style="margin-left:6px;">
	        			<div style="font-size:12px;">월-토요일 : 오전10시~오후4시</div>
	        			<div style="font-size:12px;">일/공휴일 : 오전9시~오후1시</div>
	        		</div>
	        	</div>
	        	<div style="display:flex; margin-top:10px;">
	        		<div style="font-weight:bold; font-size:14px; padding:7px; border: 1px solid gray;">그 외 문의</div>
	        		<div style="margin-left:6px;">
	        			<div style="font-size:12px;">월-토요일 : 오전11시~오후4시</div>
	        			<div style="font-size:12px;">일/공휴일 : 오전9시~오후1시</div>
	        		</div>
	        	</div>
	        </div>
	        <div style="text-align: left; margin-left: 60px;">
	        	<div style="color:rgb(20,20,20); font-size: 13px; font-weight:bold;">
	        		다이어터몰소개 | 다이어터몰소개영상 | 인재채용 | 이용약관 | 개인정보처리방침 | 이용안내
	        	</div>
	        	<div>
	        		<p style="font-size: 12px; padding-bottom:1px; padding-top:2px; ">법인명 : (주) 다이어터몰 | 사업자등록번호 222-22-22222</p>
	        		<p style="font-size: 12px; padding-bottom:1px;">통신판매업 : 제 2022-서울서울 호 | 개인정보보호책임자 : 모리</p>
	        		<p style="font-size: 12px; padding-bottom:1px;">주소 : 서울서울시 특별구 특별로 111, 11층(특별동) | 대표이사 : 모리</p>
	        		<p style="font-size: 12px; padding-bottom:1px;">입점문의 : 입점문의하기 | 제휴문의 : dietmall_b@gggg.com</p>
	        		<p style="font-size: 12px; padding-bottom:1px;">채용문의 : dietmall@gggg.com</p>
	        		<p style="font-size: 12px; padding-bottom:1px;">채용문의 : dietmall@gggg.com</p>
	        		<p style="font-size: 12px; padding-bottom:1px;">채용문의 : dietmall@gggg.com</p>
	        		<p style="font-size: 12px; padding-bottom:1px;">채용문의 : dietmall@gggg.com</p>
	        		<p style="font-size: 12px;">fax : 070 - 0000 - 3065</p>
	        	</div>
	        </div>
    	</div>
    	<div style="display:flex; justify-content: center; margin-top:30px;">
    		<div style="text-align: center;">
	    		<p style="font-size: 12px; padding-bottom:1px;">· 5만원 이상 구매시 무료 배송입니다. · 교환 반품을 원하시면 일주일 내에 연락 주세요. 5만원 이상 구매시 무료 배송입니다. 5만원 이상 구매시 무료 배송입니다.</p>
	    		<p style="font-size: 12px; padding-bottom:1px;">· 10만원 이상 구매시도 무료 배송입니다. · 교환 반품을 원하시면 일주일 내에 연락 주세요. 5만원 이상 구매시 무료 배송입니다. 5만원 이상 구매시 무료 배송입니다.</p>
	    		<p style="font-size: 12px; padding-bottom:1px;">· 예쁘게 포장되어 보내드립니다. · 교환 반품을 원하시면 일주일 내에 연락 주세요. 5만원 이상 구매시 무료 배송입니다. 5만원 이상 구매시 무료 배송입니다.</p>
	    		<p style="font-size: 12px; padding-bottom:1px;">· 사과잼은 국산이므로 배송 시간에 영향을 주지 않습니다. · 교환 반품을 원하시면 일주일 내에 연락 주세요. 5만원 이상 구매시 무료 배송입니다. 5만원 이상 구매시 무료 배송입니다.</p>
	    		<p style="font-size: 12px; padding-bottom:1px;">· 사과잼은 국산이므로 배송 시간에 영향을 주지 않습니다. · 교환 반품을 원하시면 일주일 내에 연락 주세요. 5만원 이상 구매시 무료 배송입니다. 5만원 이상 구매시 무료 배송입니다.</p>
	    		<p style="font-size: 12px; padding-bottom:1px;">· 안전운전을 주 원칙으로 배송됩니다. · 교환 반품을 원하시면 일주일 내에 연락 주세요. 5만원 이상 구매시 무료 배송입니다. 5만원 이상 구매시 무료 배송입니다.</p>
    		</div>
    	</div>
    </footer>
    <!-- 푸터 끝 -->
</body>

</html>