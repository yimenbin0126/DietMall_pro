<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


	<!-- 본문 -->
	<section class="con_selction">

		<!-- 왼쪽 카데고리 -->
		<div class="nav">
			<div class="nav_all">전체카데고리</div>
			<!-- 간편 요리 -->
			<div class="nav_category">간편 요리</div>
			<div class="category_content_list">· 닭가슴살</div>
			<div class="category_content_list">· 도시락</div>
			<div class="category_content_list">· 샐러드</div>
			<div class="category_content_list">· 구독 식품</div>
			<!-- 보조 식품 -->
			<div class="nav_category">보조 식품</div>
			<div class="category_content_list">· 간식</div>
			<div class="category_content_list">· 견과류</div>
			<div class="category_content_list">· 영양제</div>
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
					<div class="h_pay_title">토마토 파스타 [냉동식품] 160g</div>
					<div class="h_pay_explan">파스타는 정말 좋은 식품입니다. 라랄랄랄랄 정말 좋은 식품식품
						조아조아</div>
					<!-- 별점 -->
					<div class="h_pay_star">
						<span class="s_text">총 별점</span> 
						<span class="s_star">★★★★★</span> 
						<span class="s_num">5</span>
					</div>
					<!-- 가격 -->
					<div class="h_pay_price">
						<!-- 상품 할인율, 원가, 할인가격 -->
						<div class="items_price_sale">
							<div class="sale_percent">
								<span class="percent">5%</span>
								<span class="percent_price">19,000</span>
							</div>
							<div class="sale_price">
								<span class="origin_price">18,000</span> <span
									class="origin_price_text">원</span>
							</div>
						</div>
						<!-- 원가 - 할인 안할때 -->
						<div class="items_price">
							<span class="origin_price">19,000</span> <span
								class="origin_price_text">원</span>
						</div>
					</div>
					<!-- 배송정보 -->
					<div class="h_pay_delivery_content">
						<div class="c_title">
							<span>배송정보</span> <span>택배 배송</span>
						</div>
						<div class="c_content">
							<span>지금 출발시 9/22 도착 예정</span>
						</div>
					</div>
					<!-- 배송비 -->
					<div class="h_pay_delivery_price">
						<div class="d_content_top">
							<span>택배 배송 </span> <span>| 3,000원</span> <span>· 로젠택배</span>
						</div>
						<div class="d_content_bottom">
							<div>제주 추가 10,000원 · 도서지역 2,000원 추가</div>
							<div>5만원 이상 무료</div>
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
							<span>합계</span> <span>18,000</span> <span>원</span>
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
						<span class="wish_text">♥ 찜하기</span> <span class="wish_num">0</span>
					</div>
				</div>
			</div>

			<!-- 고정 카데고리 -->
			<div class="section_pick_category">
				<div class="p_category_items_btn">상품 설명</div>
				<div class="p_category_review_btn">
					<span>리뷰</span> <span>300</span>
				</div>
				<div class="p_category_QnA_btn">QnA</div>
				<div class="p_category_replace_btn">반품/교환 정보</div>
			</div>

			<!-- 상품 설명 -->
			<div class="section_middle_detail">
				<!-- 상품 설명 - 이미지 -->
				<div class="s_middle_detail_image">
					<img src="/resources/image/category/food.png">
				</div>

				<!-- 상품 설명 - 상품 정보 -->
				<div class="section_detail_item">
					<div class="s_detail_title">상품정보</div>
					<table>
						<tr>
							<th>품목, 용량</th>
							<td>상세 정보 참고</td>
						</tr>
						<tr>
							<th>보관 방법</th>
							<td>수령 후 즉시 냉동보관</td>
						</tr>
						<tr>
							<th>식품유형</th>
							<td>즉석조리식품(가열하여 섭취하는 냉동식품)</td>
						</tr>
						<tr>
							<th>생산지</th>
							<td>한국</td>
						</tr>
						<tr>
							<th>영양성분표시</th>
							<td>상품 상세 정보 참조</td>
						</tr>
						<tr>
							<th>소비자 상담 전화번호</th>
							<td>011-1111-1111</td>
						</tr>
					</table>
				</div>

				<!-- 상품 설명 - 배송 안내 -->
				<div class="section_detail_delivery">
					<div class="s_delivery_title">배송 안내</div>
					<p>·5만원 이상 구매시 무료배송입니다.</p>
					<p>·5만원 이상 구매시 무료배송입니다.</p>
					<p>·5만원 이상 구매시 무료배송입니다.</p>
					<p>·5만원 이상 구매시 무료배송입니다.</p>
					<p>·5만원 이상 구매시 무료배송입니다.</p>
				</div>
			</div>

			<!-- 리뷰 -->
			<div class="section_footer_review">
				<!-- 리뷰 건수 -->
				<div class="f_review_num">
					<span>리뷰</span> <span>333</span> <span>건</span>
				</div>
				<!-- 리뷰 기준 -->
				<div class="f_review_standard">
					<span>최신순</span> <span>|</span> <span>평점 높은순</span> <span>|</span>
					<span>평점 낮은순</span>
				</div>
				<!-- 리뷰 -->
				<div class="f_review_content">
					<!-- 리뷰 내용 -->
					<div class="r_content">
						<!-- 리뷰 상단 -->
						<div class="r_content_top">
							<!-- 상단 - 별점 -->
							<div class="c_top_star">
								<span>★★★★★</span> <span>5</span>
							</div>
							<!-- 상단 - 아이디, 날짜 -->
							<div class="c_top_date">
								<span>nab***</span> <span>22.08.02</span>
							</div>
						</div>
						<!-- 리뷰 내용 -->
						<div class="r_content_middle">
							<!-- 리뷰 내용 - 이미지 -->
							<div class="c_middle_image">
								<img src="/resources/image/category/food.png">
							</div>
							<!-- 리뷰 내용 - 글내용 -->
							<div class="c_middle_detail">dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요</div>
							<!-- 리뷰 내용 - 답변 -->
							<div class="c_answer">
								<!-- 답변 - 리뷰 -->
								<div class="answer_review">
									<div class="answer_writer">
										<div>관리자</div>
										<div>2022.02.02</div>
									</div>
									<div class="answer_content">
									dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요dfdfsfdfsf좋았어요
									</div>
								</div>
							</div>
						</div>
					</div>
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
					<ul>
						등록된 게시물이 없습니다.
					</ul>
					<ul>
						<li>답변완료</li>
						<li class="QnA_c_secret">비밀글입니다. <img src=""></li>
						<li>dfsfd*****</li>
						<li>2021.03.02</li>
					</ul>
					<ul>
						<li>미답변</li>
						<li>랄랄라라라라ㅏㅏㅏㅏㅏㅏㅏㅏㅏ</li>
						<li>dfsfd***</li>
						<li>2021.03.02</li>
					</ul>
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
					<p><span>· </span><span>교환 반품을 원하시면 일주일 내에 연락 주세요.</span></p>
					<p><span>· </span><span>교환 반품을 원하시면 일주일 내에 연락 주세요.</span></p>
					<p><span>· </span><span>교환 반품을 원하시면 일주일 내에 연락 주세요.</span></p>
					<p><span>· </span><span>교환 반품을 원하시면 일주일 내에 연락 주세요.</span></p>
					<p><span>· </span><span>교환 반품을 원하시면 일주일 내에 연락 주세요.</span></p>
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