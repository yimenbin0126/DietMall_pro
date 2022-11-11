<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.CartDTO"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/cart.css" rel="stylesheet">
    <link href="/resources/css/nav/header.css" rel="stylesheet">
    <link href="/resources/css/nav/footer.css" rel="stylesheet">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/category/cart.js"></script>
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
				<div class="c_header_group">
					<div class="c_header_choice_all">
						<input type="checkbox">
						<span>전체 선택</span>
					</div>
					<div class="c_header_del">
						선택상품 삭제
					</div>
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
						if (((ArrayList<CartDTO>)request.getAttribute("cart_dto_list")).size()!=0){
							order_dto_list = (ArrayList<CartDTO>)request.getAttribute("cart_dto_list");
							for (int i=0; i<order_dto_list.size(); i++) {
								CartDTO c_dto = new CartDTO();
								c_dto = order_dto_list.get(i);
								System.out.println(c_dto.toString());
								if (c_dto.getSale_yn().equals("N")){
									int buy_sum = c_dto.getOrigin_price() * c_dto.getItem_num();
									// 세일 여부
					%>
					<ul class="sale_ul">
						<li><input type="checkbox" name="check_del" class="check_del" value="<%=c_dto.getBuy_bno()%>"></li>
						<li><img src="/category/load-image?fileName=<%=c_dto.getItem_title_img()%>"></li>
						<li>
							<div><%=c_dto.getItem_name()%></div>
						</li>
						<li class="buy_sum_val" value="<%=buy_sum%>">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=c_dto.getOrigin_price()%>" /></li>
						<li class="sale_sum_val" value="<%=0%>"><%=c_dto.getItem_num()%></li>
						<li class="delivery_fee_val" value="<%=c_dto.getDelivery_fee()%>">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=c_dto.getDelivery_fee()%>" /></li>
						<li><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=buy_sum%>" /></li>
					</ul>
					<%
								} else {
									int sale_price = c_dto.getOrigin_price() - (int)(c_dto.getOrigin_price()*(c_dto.getSale_percent()*0.01));
									int buy_sum = sale_price * c_dto.getItem_num();
									int origin_sum = c_dto.getOrigin_price() * c_dto.getItem_num();
									int sale_sum = origin_sum - buy_sum;
					%>
					<ul class="sale_ul">
						<li><input type="checkbox" name="check_del" class="check_del" value="<%=c_dto.getBuy_bno()%>"></li>
						<li><img src="/category/load-image?fileName=<%=c_dto.getItem_title_img()%>"></li>
						<li>
							<div><%=c_dto.getItem_name()%></div>
						</li>
						<li class="buy_sum_val" value="<%=buy_sum%>">
							<div style="color:rgb(190,190,190); text-decoration: line-through;">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=c_dto.getOrigin_price()%>" /></div>
							<div><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sale_price%>" /></div>
						</li>
						<li class="sale_sum_val" value="<%=sale_sum%>"><%=c_dto.getItem_num()%></li>
						<li class="delivery_fee_val" value="<%=c_dto.getDelivery_fee()%>">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=c_dto.getDelivery_fee()%>" /></li>
						<li><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=buy_sum%>" /></li>
					</ul>
					<%
								}
							}
						} else {
					%>
					<ul>
						<div class="cart_blank">장바구니가 비어있습니다.</div>
					</ul>
					<%
						}
					%>
					
				</div>
				<!-- 결과 -->
				<div class="content_result">
					<ul class="c_r_title">
						<li>총 상품 금액</li>
						<li>총 배송비</li>
						<li>총 할인 금액</li>
						<li>총 결제 금액</li>
					</ul>
					<ul class="c_r_price">
						<li class="c_r_p_item">
							<span class="money">0</span>
							<span>원</span>
						</li>
						<li class="c_r_p_delivery">
							<span>+</span>
							<span class="money">0</span>
							<span>원</span>
						</li>
						<li class="c_r_p_sale">
							<span>-</span>
							<span class="money">0</span>
							<span>원</span>
						</li>
						<li class="c_r_p_sum">
							<span class="money">0</span>
							<span>원</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 주문하기 -->
			<div class="r_content_buy">
				<input type="submit" value="주문하기">
			</div>
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