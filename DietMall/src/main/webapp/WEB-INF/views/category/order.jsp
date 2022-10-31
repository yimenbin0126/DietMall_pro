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
    <link href="/resources/css/category/order.css" rel="stylesheet">
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
									// 세일 여부
					%>
					<ul>
						<li><%=i%></li>
						<li><img src="/resources/image/category/<%=o_dto.getItem_title_img()%>"></li>
						<li>
							<div><%=o_dto.getItem_name()%></div>
							<div><%=o_dto.getItem_num()%></div>
						</li>
						<li><%=o_dto.getOrigin_price()%></li>
						<li><%=o_dto.getItem_num()%></li>
						<li><%=o_dto.getDelivery_fee()%></li>
						<li><%=o_dto.getBuy_sum()%></li>
					</ul>
					<%
								} else {
					%>
					<ul>
						<li><%=i%></li>
						<li><img src="/resources/image/category/<%=o_dto.getItem_title_img()%>"></li>
						<li>
							<div><%=o_dto.getItem_name()%></div>
							<div><%=o_dto.getItem_num()%></div>
						</li>
						<li>
							<div><%=o_dto.getOrigin_price()%></div>
							<div><%=o_dto.getBuy_sum()%></div>
						</li>
						<li><%=o_dto.getItem_num()%></li>
						<li><%=o_dto.getDelivery_fee()%></li>
						<li><%=o_dto.getBuy_sum()%></li>
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
							<input type="text" placeholder="홍길동"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='홍길동'">
						</td>
					</tr>
					<!-- 휴대전화 -->
					<tr class="orderform_tel">
						<th>주문하는 분 휴대전화<span class="input_must">*</span></th>
						<td>
							<select>
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<span>-</span>
							<input type="tel" placeholder="1234"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='1234'">
							<span>-</span>
							<input type="tel" placeholder="5678"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='5678'">
						</td>
					</tr>
					<!-- 이메일 -->
					<tr class="orderform_email">
						<th>이메일<span class="input_must">*</span></th>
						<td>
							<input type="email" placeholder="dietmaill@diet.com"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='dietmaill@diet.com'">
						</td>
					</tr>
				</table>
				
				<!-- 배송지 정보 -->
				<div class="c_orderform_delivery">
					<!-- 배송지 선택 -->
					<table>
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
								<input type="text">
							</td>
						</tr>
						<!-- 주소 -->
						<tr class="o_delivery_address">
							<th>주소</th>
							<td>
								<div>
									<input type="text">
									<button type="button">우편 번호</button>
								</div>
								<div>
									<input type="text">
									<span>기본 주소</span>
								</div>
								<div>
									<input type="text">
									<span>나머지 주소</span>
								</div>
							</td>
						</tr>
						<!-- 휴대전화 -->
						<tr class="o_delivery_tel">
							<th>휴대전화</th>
							<td>
								<select>
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
								<textarea></textarea>
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
								<span>0</span>
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
								<div>보유</div>
								<div>
									<span>0</span>
									<span>원</span>
								</div>
							</div>
							<div class="p_content_result">
								<div>사용</div>
								<div>
									<span>0</span>
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
						<div>
							<button type="button">카드 결제</button>
						</div>
						<div>
							<button type="button">실시간 계좌이체</button>
						</div>
						<div>
							<button type="button">무통장 입금</button>
						</div>
						<div>
							<button type="button">카카오 페이</button>
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