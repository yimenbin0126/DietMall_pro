<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/cart.css" rel="stylesheet">
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
			<div class="r_content_header">
				<div class="c_header_logo">장바구니</div>
				<div class="c_header_choice_all">
					<input type="checkbox">
					<span>전체 선택</span>
				</div>
			</div>
			<!-- 내용 -->
			<div class="r_content">
				<div class="content_ul">
					<ul>
						<li>선택</li>
						<li>이미지</li>
						<li>상품정보</li>
						<li>가격</li>
						<li>수량</li>
						<li>배송비</li>
						<li>합계</li>
					</ul>
					<ul>
						<li><input type="checkbox"></li>
						<li><img src="/resources/image/category/food.png"></li>
						<li>
							<div>제목제목상품명목제목상품명목제목상품명</div>
							<div>상품갯수</div>
						</li>
						<li>19,000</li>
						<li>2</li>
						<li>3,000</li>
						<li>38,000</li>
					</ul>
					<ul>
						<li><input type="checkbox"></li>
						<li><img src="/resources/image/category/food.png"></li>
						<li>
							<div>제목제목상품명</div>
							<div>상품갯수</div>
						</li>
						<li>19,000</li>
						<li>2</li>
						<li>3,000</li>
						<li>38,000</li>
					</ul>
				</div>
				<!-- 결과 -->
				<div class="content_result">
					<ul>
						<li>총 상품 금액</li>
						<li>총 배송비</li>
						<li>총 할인금액</li>
						<li>총 결제 금액</li>
					</ul>
					<ul>
						<li>
							<span>38,0000</span>
							<span>원</span>
						</li>
						<li>
							<span>+</span>
							<span>3,0000</span>
							<span>원</span>
						</li>
						<li>
							<span>-</span>
							<span>2,0000</span>
							<span>원</span>
						</li>
						<li>
							<span>63,0000</span>
							<span>원</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 구매 -->
			<div class="r_content_buy">
				<input type="submit" value="주문하기">
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