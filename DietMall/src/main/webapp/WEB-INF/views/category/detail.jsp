<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.ItemboardDTO, com.dietmall.DTO.ItemContentBoardDTO, com.dietmall.DTO.ItemEtcBoardDTO"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/detail.css" rel="stylesheet">
    <link href="/resources/css/nav/header.css" rel="stylesheet">
    <link href="/resources/css/nav/footer.css" rel="stylesheet">
</head>

<body>
    <!-- 헤더 시작 -->
	<header>
		<!-- 상단 -->
		<form id="fir_header_admin" name='mainForm' method="post">
			<ul>
				<!-- 로그인이 안되있을 때 -->
				<c:if test="${member == null}">
					<li><a href="member/login">로그인</a></li>
					<li><a href="member/join">회원가입</a></li>
				</c:if>
				<!-- 로그인이 되있을 때 -->
				<c:if test="${member != null}">
					<li>${member.userName}님 환영합니다.</li>
					<li><a href="member/logout">로그아웃</a></li>
				</c:if>
				<li><a href="mypage.html">마이페이지</a></li>
				<li><a href="contact.html">고객센터</a></li>
			</ul>
		</form>
		<%@include file="../nav/header.jsp"%>
	</header>
	<!-- 헤더 끝 -->

	<%
		// 값 불러오기
		int page_NowBno = (int)request.getAttribute("page_NowBno");
		String category_type = (String)request.getAttribute("category_type");
		String standard = (String)request.getAttribute("standard");
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
					<img src="/resources/image/category/food.png">
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
						</span> 
						<span class="s_num"><%=etc_star%></span>
					</div>
					<!-- 가격 -->
					<div class="h_pay_price">
						<%
							int sale_price = 0;
							// 세일 여부
							if (ib_dto.getSale_yn().equals("Y")) {
						%>
						<!-- 상품 할인율, 원가, 할인가격 -->
						<div class="items_price_sale">
							<div class="sale_percent">
							<%
								sale_price = ib_dto.getOrigin_price() - ib_dto.getOrigin_price()*(ib_dto.getSale_percent()/100);
							%>
								<span class="percent"><%=ib_dto.getSale_percent()%>%</span>
								<span class="percent_price"><%=ib_dto.getOrigin_price()%></span>
							</div>
							<div class="sale_price">
								<span class="origin_price"><%=sale_price%></span> <span
									class="origin_price_text">원</span>
							</div>
						</div>
						<%
							} else {
								sale_price = ib_dto.getOrigin_price();
						%>
						<!-- 원가 - 할인 안할때 -->
						<div class="items_price">
							<span class="origin_price"><%=ib_dto.getOrigin_price()%></span> <span
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
							<span>택배 배송 </span> <span>| <%=delevery_price%>원</span> <span>· <%=delevery_content%></span>
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
						<div class="i_price_all_title">총 상품 금액</div>
						<div class="i_price_all_content">
							<span>합계</span> <span><%=sale_price%></span> <span>원</span>
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
					<div class="h_pay_wish">
						<span class="wish_text">♥ 찜하기</span> <span class="wish_num"><%=ib_dto.getLike_num()%></span>
					</div>
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
				<div class="p_category_items_btn">상품 설명</div>
				<div class="p_category_review_btn">
					<span>리뷰</span> <span><%=review_sum%></span>
				</div>
				<div class="p_category_QnA_btn">QnA</div>
				<div class="p_category_replace_btn">반품/교환 정보</div>
			</div>

			<!-- 상품 설명 -->
			<div class="section_middle_detail">
				<!-- 상품 설명 - 이미지 -->
				<div class="s_middle_detail_image">
					<img src="/resources/image/category/<%=ib_dto.getItem_title_img()%>">
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

				<!-- 상품 설명 - 배송 안내 -->
				<div class="section_detail_delivery">
					<div class="s_delivery_title">배송 안내</div>
					<p><%=icb_dto.getDelivery_guide()%></p>
				</div>
			</div>

			<!-- 리뷰 -->
			<div class="section_footer_review">
				<!-- 리뷰 건수 -->
				<div class="f_review_num">
					<span>리뷰</span> <span><%=review_sum%></span> <span>개</span>
				</div>
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
					<!-- 리뷰 내용 -->
					<div class="r_content">
						<!-- 리뷰 상단 -->
						<%
								if (ieb_dto.getBoard_type().equals("review")){
						%>
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
								<img src="/resources/image/category/food.png">
							</div>
							<!-- 리뷰 내용 - 글내용 -->
							<div class="c_middle_detail">
								<%=ieb_dto.getEtc_content()%>
							</div>
						</div>
					</div>
					<!-- 리뷰 내용 - 답변 -->
					<%
								}else if (ieb_dto.getBoard_type().equals("review_reply")){
					%>
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
					</div>
					<%
							}
					%>
					<%
								
							}
						}
					%>
					<!-- 이미지 -->
					<!-- 페이지 -->
					<div class="f_review_page">
						<div class="r_page_left">&lt;</div>
						<div class="r_page_num">1</div>
						<div class="f_review_right">&gt;</div>
					</div>
				</div>
			</div>
			<!-- QnA -->
			<div class="section_footer_QnA">
				<!-- QnA - 상단 -->
				<div class="f_QnA_header">
					<div class="s_footer_title">QnA</div>
					<div class="s_footer_content">설명설명설명 QNA 서렴ㅇ</div>
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
							for(int i=0; i<qna_ieb_dto_list.size(); i++){
								ItemEtcBoardDTO ieb_dto = new ItemEtcBoardDTO();
								ieb_dto = qna_ieb_dto_list.get(i);
								String userid_update = ieb_dto.getUserid();
								userid_update = userid_update.substring(0,3);
								for (int j=3; j<userid_update.length(); j++){
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
				<div class="f_review_page">
					<div class="r_page_left">&lt;</div>
					<div class="r_page_num">1</div>
					<div class="f_review_right">&gt;</div>
				</div>
			</div>
			<!-- 반품/교환 정보 -->
			<div class="section_footer_exchange">
				<!-- 제목 -->
				<div class="footer_e_title">반품/교환 정보</div>
				<div class="footer_e_content">
					<p><%=icb_dto.getExchange_con()%></p>
				</div>
			</div>
		</div>

		<!-- 하단 여백 -->
		<div class="right_content_bottom"></div>
	</section>

	<!-- 푸터 -->
    <footer>
        <div>
            2022. 다이어터몰<br>
            Tel. 041-4242-4242
        </div>
    </footer>
</body>

</html>