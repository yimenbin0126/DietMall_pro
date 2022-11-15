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
    <link href="/resources/css/category/order.css" rel="stylesheet">
    <link href="/resources/css/nav/header.css" rel="stylesheet">
    <link href="/resources/css/nav/footer.css" rel="stylesheet">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/category/order.js"></script>
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
				<div class="c_header_logo">주문/결제</div>
			</div>
			<!-- 내용 -->
			<div class="r_content">
				<div class="content_ul">
					<ul>
						<li>구분</li>
						<li>이미지</li>
						<li>상품정보</li>
						<li>가격</li>
						<li>수량</li>
						<li>배송비</li>
						<li>합계</li>
					</ul>
					<%
						List<CartDTO> order_dto_list = new ArrayList<CartDTO>();
						if (request.getAttribute("order_dto_list")!= null
								|| ((ArrayList<CartDTO>)request.getAttribute("order_dto_list")).size()!=0){
							order_dto_list = (ArrayList<CartDTO>)request.getAttribute("order_dto_list");
							for (int i=0; i<order_dto_list.size(); i++) {
								CartDTO o_dto = new CartDTO();
								o_dto = order_dto_list.get(i);
								if (o_dto.getSale_yn().equals("N")){
									int buy_sum = o_dto.getOrigin_price() * o_dto.getItem_num();
									// 세일 여부
					%>
					<ul class="buy_bno_ul">
						<li class="buy_bno_li" value="<%=o_dto.getBuy_bno()%>"><%=i%></li>
						<li><img src="/category/load-image?fileName=<%=o_dto.getItem_title_img()%>"></li>
						<li value="<%=o_dto.getItem_num()%>">
							<div><%=o_dto.getItem_name()%></div>
						</li>
						<li class="buy_sum_val" value="<%=buy_sum%>">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=o_dto.getOrigin_price()%>" /></li>
						<li class="sale_sum_val" value="<%=0%>"><%=o_dto.getItem_num()%></li>
						<li class="delivery_fee_val" value="<%=o_dto.getDelivery_fee()%>">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=o_dto.getDelivery_fee()%>" /></li>
						<li value="<%=buy_sum%>"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=buy_sum%>" /></li>
					</ul>
					<%
								} else {
									int sale_price = o_dto.getOrigin_price() - (int)(o_dto.getOrigin_price()*(o_dto.getSale_percent()*0.01));
									int buy_sum = sale_price * o_dto.getItem_num();
									int origin_sum = o_dto.getOrigin_price() * o_dto.getItem_num();
									int sale_sum = origin_sum - buy_sum;
					%>
					<ul class="buy_bno_ul">
						<li class="buy_bno_li" value="<%=o_dto.getBuy_bno()%>"><%=i%></li>
						<li><img src="/category/load-image?fileName=<%=o_dto.getItem_title_img()%>"></li>
						<li value="<%=o_dto.getItem_num()%>">
							<div><%=o_dto.getItem_name()%></div>
						</li>
						<li class="buy_sum_val" value="<%=origin_sum%>">
							<div style="color:rgb(190,190,190); text-decoration: line-through;">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=o_dto.getOrigin_price()%>" /></div>
							<div><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sale_price%>" /></div>
						</li>
						<li class="sale_sum_val" value="<%=sale_sum%>"><%=o_dto.getItem_num()%></li>
						<li class="delivery_fee_val" value="<%=o_dto.getDelivery_fee()%>">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=o_dto.getDelivery_fee()%>" /></li>
						<li value="<%=buy_sum%>"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=buy_sum%>" /></li>
					</ul>
					<%
								}
							}
						}
					%>
				</div>
			</div>
			
			<!-- 주문폼 -->
			<div class="r_content_orderform">
				<!-- 주문자 정보 -->
				<!-- 제목 -->
				<div class="orderform_title">주문자 정보</div>
				<div class="orderform_must_input"><span>*</span><span>필수 입력 사항입니다.</span></div>
				<table class="c_orderform_orderer">
					<!-- 이름 -->
					<tr class="orderform_name">
						<th>주문하는 분<span class="input_must">*</span></th>
						<td>
							<input type="text" id="input_order_person" placeholder="홍길동"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='홍길동'">
						</td>
					</tr>
					<!-- 휴대전화 -->
					<tr class="orderform_tel">
						<th>주문하는 분 휴대전화<span class="input_must">*</span></th>
						<td>
							<select class="o_tel_select">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<span>-</span>
							<input type="tel" id="input_tel_mid" placeholder="1234"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='1234'">
							<span>-</span>
							<input type="tel" id="input_tel_last" placeholder="5678"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='5678'">
						</td>
					</tr>
					<!-- 이메일 -->
					<tr class="orderform_email">
						<th>이메일<span class="input_must">*</span></th>
						<td>
							<input type="email" id="input_email" placeholder="dietmaill@diet.com"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='dietmaill@diet.com'">
						</td>
					</tr>
				</table>
				
				<!-- 배송지 정보 -->
				<div class="o_delivery">
					<!-- 배송지 선택 -->
					<table class="c_orderform_deli">
						<tr class="o_delivery_choice">
							<th>배송지 선택</th>
							<td>
								<input type="radio"><label>주문자 정보와 동일</label>
								<input type="radio"><label>새로운 배송지</label>
							</td>
						</tr>
						<!-- 받으시는 분 -->
						<tr class="o_delivery_geter">
							<th>받으시는 분</th>
							<td>
								<input type="text" id="input_o_d_geter">
							</td>
						</tr>
						<!-- 주소 -->
						<tr class="o_delivery_address">
							<th>주소<span class="input_must">*</span></th>
							<td>
								<div>
									<input type="text" id="input_o_d_address_first">
									<button type="button" style="font-size:11px; color: gray;">우편 번호</button>
								</div>
								<div>
									<input type="text" id="input_o_d_address_mid">
									<span>기본 주소</span>
								</div>
								<div>
									<input type="text" id="input_o_d_address_last">
									<span>나머지 주소</span>
								</div>
							</td>
						</tr>
						<!-- 휴대전화 -->
						<tr class="o_delivery_tel">
							<th>휴대전화<span class="input_must">*</span></th>
							<td>
								<select class="o_delivery_tel_select">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
								<span>-</span>
								<input type="tel">
								<span>-</span>
								<input type="tel">
							</td>
						</tr>
						<!-- 배송 메시지 -->
						<tr class="o_delivery_message">
							<th>배송 메시지</th>
							<td>
								<textarea class="o_d_m_textarea"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<!-- 할인 정보 -->
				<div class="c_orderform_sale">
					<!-- 쿠폰 할인 -->
					<div class="o_sale_coupon">
						<div class="coupon_title">쿠폰 할인</div>
						<div class="coupon_content">
							<span class="c_content_price">
								<span class="money">0</span>
								<span>원</span>
							</span>
							<button type="button">쿠폰사용</button>
						</div>
					</div>
					<!-- 포인트 할인 -->
					<div class="o_sale_point">
						<div class="point_title">포인트 할인</div>
						<div class="point_content">
						
							<div class="p_content_price">
								<div style="margin-right:3px;">보유</div>
								<div>
									<span class="money">0</span>
									<span>원</span>
								</div>
							</div>
							<div class="p_content_result">
								<div style="margin-right:3px;">사용</div>
								<div>
									<span class="money">0</span>
									<span>원</span>
								</div>
								<div>
									<button type="button">전액사용</button>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<!-- 결제 수단 -->
				<div class="c_orderform_pay_way">
					<div class="op_pay_title">결제 상세</div>
					<div class="op_pay_content">
						<input type="hidden" id="pay_way_choice">
						<div>
							<button type="button" class="p_w_c_card">카드 결제</button>
						</div>
						<div>
							<button type="button" class="p_w_c_live">실시간 계좌이체</button>
						</div>
						<div>
							<button type="button" class="p_w_c_deposit">무통장 입금</button>
						</div>
						<div>
							<button type="button" class="p_w_c_kakao">카카오 페이</button>
						</div>
					</div>
				</div>
				<!-- 결제 상세 -->
				<div class="c_orderform_pay_detail">
					<div class="op_detail_title">결제 상세</div>
					<!-- 결과 -->
					<div class="op_detail_content">
						<ul>
							<li>총 상품 금액</li>
							<li>총 배송비</li>
							<li>총 할인금액</li>
							<li>총 결제 금액</li>
						</ul>
						<ul>
							<li class="d_c_item">
								<input type="hidden" id="d_c_item_money">
								<span class="money">0</span>
								<span>원</span>
							</li>
							<li class="d_c_delivery">
								<input type="hidden" id="d_c_delivery_money">
								<span>+</span>
								<span class="money">0</span>
								<span>원</span>
							</li>
							<li class="d_c_sale">
								<input type="hidden" id="d_c_sale_money">
								<span>-</span>
								<span class="money">0</span>
								<span>원</span>
							</li>
							<li class="d_c_sum">
								<input type="hidden" id="d_c_sum_money">
								<span class="money">0</span>
								<span>원</span>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
			
			<!-- 구매 -->
			<div class="r_content_buy">
				<input type="button" value="주문하기">
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