<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/all.css" rel="stylesheet">
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
			<div class="hidden_write">
				<form name="write_btn">
					<input type="submit" name="write_btn_sub" id="write_btn_sub" value="글쓰기">
				</form>
			</div>
			<!-- 제목 -->
			<div class="con_title">전체 카테고리</div>
			<!-- 정렬 기준 -->
			<div class="con_standard">
				<div>인기순</div>
				<div>신상품순</div>
			</div>
			<!-- 내용 3개씩 -->
			<div class="content">

				<div class="con_content">
					<!-- 사진, 제목, 할인가격, 가격, 신상품/인기 표시 -->
					<!-- 상품 사진 -->
					<div class="items_img">
						<img src="/resources/image/category/food.png">
					</div>
					<!-- 상품 제목 -->
					<div class="items_title">맛있는 토마토 파스타1</div>
					<!-- 상품 할인율, 원가, 할인가격 -->
					<div class="items_price_sale">
						<div class="sale_percent">
							<span class="percent">5%</span> <span class="percent_price">19,000</span>
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
					<!-- 신상품, 인기 표시 -->
					<div class="items_new_best">
						<span class="items_new">신상품</span> <span class="items_best">인기</span>
					</div>
				</div>

				<!-- 사진, 제목, 할인가격, 가격, 신상품/인기 표시 -->
				<div class="con_content">
					<!-- 상품 사진 -->
					<div class="items_img">
						<img src="/resources/image/category/food.png">
					</div>
					<!-- 상품 제목 -->
					<div class="items_title">맛있는 토마토 파스타1</div>
					<!-- 상품 할인율, 원가, 할인가격 -->
					<div class="items_price_sale">
						<div class="sale_percent">
							<span class="percent">5%</span> <span class="percent_price">19,000</span>
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
						<!-- 신상품, 인기 표시 -->
						<div class="items_new_best">
							<span class="items_new">신상품</span> <span class="items_best">인기</span>
						</div>
					</div>
				</div>

				<div class="con_content">
					<!-- 사진, 제목, 할인가격, 가격, 신상품/인기 표시 -->
					<!-- 상품 사진 -->
					<div class="items_img">
						<img src="/resources/image/category/food.png">
					</div>
					<!-- 상품 제목 -->
					<div class="items_title">맛있는 토마토 파스타1</div>
					<!-- 상품 할인율, 원가, 할인가격 -->
					<div class="items_price_sale">
						<div class="sale_percent">
							<span class="percent">5%</span> <span class="percent_price">19,000</span>
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
						<!-- 신상품, 인기 표시 -->
						<div class="items_new_best">
							<span class="items_new">신상품</span> <span class="items_best">인기</span>
						</div>
						<!-- 하단 여백 -->
						<div class="right_content_bottom"></div>
						</div>
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