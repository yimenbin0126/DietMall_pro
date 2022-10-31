<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/orderComplet.css" rel="stylesheet">
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
				<div class="c_header_logo">주문/결제</div>
				<div class="r_content_header_content">
					<div><img></div>
					<div class="complet_message">주문이 완료되었습니다.</div>
				</div>
			</div>
			<!-- 내용 -->
			<div class="r_content">
				<table class="content_table">
					<!-- 주문번호 -->
					<tr class="c_table_order">
						<th>주문번호</th>
						<td>
							<div class="t_order_num">1234566555557451125525621</div>
						</td>
					</tr>
					<!-- 구매상품 -->
					<tr class="c_table_items">
						<th>구매상품</th>
						<td>
							<div class="t_items_name">ㅇㅇ아아알널아ㅏ아아아토마토</div>
							<div class="t_items_num">수량 1개</div>
							<div class="t_items_price"><span>55,555</span><span>원</span></div>
						</td>
					</tr>
					<!-- 배송지 정보 -->
					<tr class="c_table_delivery">
						<th>배송지 정보</th>
						<td>
							<div class="t_delivery_post">우편번호 31185</div>
							<div class="t_delivery_address">충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구</div>
							<div class="t_delivery_address_detail">상세주소충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구충청남도 어쩌구</div>
						</td>
					</tr>
					<!-- 결제 수단 -->
					<tr class="c_table_pay">
						<th>결제 수단</th>
						<td>
							<div class="t_pay_card">카드 결제</div>
							<div class="t_pay_cardnum">6666 5555 888 87777</div>
							<div class="t_pay_one">일시불</div>
							<div class="t_pay_date">결제 일시 : 2022-01-22 06:27 PM</div>
						</td>
					</tr>
					<!-- 결제 금액 -->
					<tr class="c_table_money">
						<th>결제 금액</th>
						<td>
							<div class="t_money_all">총 상품 금액 159,000원</div>
							<div class="t_money_delivery">배송비 159,000원</div>
							<div class="t_money_sale">할인 금액 9,000원</div>
							<div class="t_money_result">결제 금액 159,000원</div>
						</td>
					</tr>
				</table>
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