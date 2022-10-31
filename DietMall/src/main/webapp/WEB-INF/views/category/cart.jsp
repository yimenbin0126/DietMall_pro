<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.CartDTO"
    %>
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
					<%
						List<CartDTO> order_dto_list = new ArrayList<CartDTO>();
						if (request.getAttribute("cart_dto_list")!= null
								|| ((ArrayList<CartDTO>)request.getAttribute("cart_dto_list")).size()!=0){
							order_dto_list = (ArrayList<CartDTO>)request.getAttribute("cart_dto_list");
							for (int i=0; i<order_dto_list.size(); i++) {
								CartDTO c_dto = new CartDTO();
								c_dto = order_dto_list.get(i);
								if (c_dto.getSale_yn().equals("N")){
									// 세일 여부
					%>
					<ul>
						<li><input type="checkbox"></li>
						<li><img src="/resources/image/category/<%=c_dto.getItem_title_img()%>"></li>
						<li>
							<div><%=c_dto.getItem_name()%></div>
							<div><%=c_dto.getItem_num()%></div>
						</li>
						<li><%=c_dto.getOrigin_price()%></li>
						<li><%=c_dto.getItem_num()%></li>
						<li><%=c_dto.getDelivery_fee()%></li>
						<li><%=c_dto.getBuy_sum()%></li>
					</ul>
					<%
								} else {
					%>
					<ul>
						<li><input type="checkbox"></li>
						<li><img src="/resources/image/category/<%=c_dto.getItem_title_img()%>"></li>
						<li>
							<div><%=c_dto.getItem_name()%></div>
							<div><%=c_dto.getItem_num()%></div>
						</li>
						<li>
							<div><%=c_dto.getOrigin_price()%></div>
							<div><%=c_dto.getBuy_sum()%></div>
						</li>
						<li><%=c_dto.getItem_num()%></li>
						<li><%=c_dto.getDelivery_fee()%></li>
						<li><%=c_dto.getBuy_sum()%></li>
					</ul>
					<%
								}
							}
						}
					%>
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
							<span>0</span>
							<span>원</span>
						</li>
						<li>
							<span>+</span>
							<span>0</span>
							<span>원</span>
						</li>
						<li>
							<span>-</span>
							<span>0</span>
							<span>원</span>
						</li>
						<li>
							<span>0</span>
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