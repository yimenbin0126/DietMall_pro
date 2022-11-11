<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/insert.css" rel="stylesheet">
    <link href="/resources/css/nav/header.css" rel="stylesheet">
    <link href="/resources/css/nav/footer.css" rel="stylesheet">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/category/insert.js"></script>
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

		<%
			String category_type = (String)request.getAttribute("category_type");
		%>
		<!-- 왼쪽 카데고리 -->
		<div class="nav">
			<c:set var="category_type" value="<%=category_type%>" />
			<div class="nav_all" onclick="location.href='/category/all?page_NowBno=1&category_type=all'">전체카데고리</div>
			<!-- 간편 요리 -->
			<div <c:if test="${category_type == 'basic_food'}">style="background-color:gray;"</c:if>
			 class="nav_category" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food'">간편 요리</div>
			<div <c:if test="${category_type == 'basic_food_chicken'}">style="background-color:lightgray;"</c:if>
			class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_chicken'">· 닭가슴살</div>
			<div <c:if test="${category_type == 'basic_food_box'}">style="background-color:lightgray;"</c:if>
			 class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_box'">· 도시락</div>
			<div <c:if test="${category_type == 'basic_food_salad'}">style="background-color:lightgray;"</c:if>
			 class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_salad'">· 샐러드</div>
			<div <c:if test="${category_type == 'basic_food_sub'}">style="background-color:lightgray;"</c:if>
			 class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=basic_food_sub'">· 구독 식품</div>
			<!-- 보조 식품 -->
			<div <c:if test="${category_type == 'etc_food'}">style="background-color:gray;"</c:if>
			 class="nav_category" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food'">보조 식품</div>
			<div <c:if test="${category_type == 'etc_food_snack'}">style="background-color:lightgray;"</c:if>
			 class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food_snack'">· 간식</div>
			<div <c:if test="${category_type == 'etc_food_penut'}">style="background-color:lightgray;"</c:if>
			 class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food_penut'">· 견과류</div>
			<div <c:if test="${category_type == 'etc_food_pill'}">style="background-color:lightgray;"</c:if>
			 class="category_content_list" onclick="location.href='/category/all?page_NowBno=1&category_type=etc_food_pill'">· 영양제</div>
		</div>

		<!-- 오른쪽 컨텐츠 -->
		<div class="right_content">
			<h2 style="padding-top:100px;">상품 글 작성</h2>
			<form name="form_insert" id="form_insert" enctype="multipart/form-data">
			<input type="hidden" name="category_type" id="category_type_id" value="<%=category_type%>">
			<!-- 상단 -->
			<div class="s_header">
				<!-- 이미지 -->
				<div class="s_header_image">
					<div>
						<img class="header_img_preview">
					</div>
					<div>
						<input type="file" name="item_title_img" id="shi_file" accept=".jpg, .jpeg, .png">
					</div>
				</div>
				<!-- 결제 -->
				<div class="s_header_pay">
					<!-- 제목, 설명 -->
					<div class="h_pay_title">
						<div class="h_p_title">
							상품 제목
						</div>
						<div>
							<input type="text" name="item_name" id="h_pay_item_name"
							placeholder="상품 제목을 적어주세요." onfocus="this.placeholder=''"
								onblur="this.placeholder='상품 제목을 적어주세요.'">
						</div>
					</div>
					<!-- 가격 -->
					<div class="h_pay_price">
						<div class="h_p_title">
							상품 가격
						</div>
						<!-- 상품 할인율, 원가, 할인가격 -->
						<div class="sale_percent">
							<div class="percent"><input type="text" name="sale_percent" id="sp_p_sale_percent_"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							placeholder="할인 퍼센트(%)를 적어주세요. 없으면 0." onfocus="this.placeholder=''"
							onblur="this.placeholder='할인 퍼센트(%)를 적어주세요. 없으면 0.'">%</div>
							
							<div class="percent_price"><input type="text" name="origin_price" id="sp_p_sale_percent_price"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							placeholder="상품의 원가를 적어주세요.(1000원 이상)" onfocus="this.placeholder=''"
							onblur="this.placeholder='상품의 원가를 적어주세요.(1000원 이상)'"></div>
						</div>
					</div>
					<!-- 배송정보 -->
					<div class="h_pay_delivery_content">
						<div class="c_title">
							<span>배송정보</span> 
							<div><input type="text" name="delivery_content" id="del_c_delivery_content"
							placeholder="로젠택배, cj택배, 한진택배 중 택해서 입력" onfocus="this.placeholder=''"
							onblur="this.placeholder='로젠택배, cj택배, 한진택배 중 택해서 입력'"></div>
						</div>
					</div>
					<!-- 배송비 -->
					<div class="h_pay_delivery_price">
						<div class="d_content_top">
							<span>택배 배송 </span>
						</div>
						<div class="d_content_bottom">
							<div>제주 추가 10,000원 · 도서지역 2,000원 추가</div>
							<div><input type="text" name="free_type" id="del_c_free_type"
							placeholder="ex) 5만원 이상 무료.(무료 조건 적기)" onfocus="this.placeholder=''"
							onblur="this.placeholder='ex) 5만원 이상 무료.(무료 조건 적기)'"></div>
						</div>
					</div>
				</div>
			</div>

			<!-- 상품 설명 -->
			<div class="section_middle_detail">
				<!-- 상품 설명 - 이미지 -->
				<div class="s_middle_detail_image">
					<div>
						<img class="middle_img_preview">
					</div>
					<div>
						<input type="file" name="item_content_img" id="middle_file" accept=".jpg, .jpeg, .png"
						style="margin-top:10px;">
					</div>
				</div>

				<!-- 상품 설명 - 상품 정보 -->
				<div class="section_detail_item">
					<div class="s_detail_title">상품정보</div>
					<table>
						<tr>
							<th>품목, 용량</th>
							<td>
								<input type="text" name="item_sum" id="sdt_item_sum"
								placeholder="ex) 사과잼, 통밀면, 올리고당 150ml" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 사과잼, 통밀면, 올리고당 150ml'">
							</td>
						</tr>
						<tr>
							<th>보관 방법</th>
							<td>
								<input type="text" name="item_keep" id="sdt_item_keep"
								placeholder="ex) 수령 후 즉시 냉동보관" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 수령 후 즉시 냉동보관'">
							</td>
						</tr>
						<tr>
							<th>식품유형</th>
							<td>
								<input type="text" name="food_type" id="sdt_food_type"
								placeholder="ex) 즉석조리식품(가열하여 섭취하는 냉동식품)" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 즉석조리식품(가열하여 섭취하는 냉동식품)'">
							</td>
						</tr>
						<tr>
							<th>생산지</th>
							<td>
								<input type="text" name="made_by" id="sdt_made_by"
								placeholder="ex) 한국" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 한국'">
							</td>
						</tr>
						<tr>
							<th>영양성분표시</th>
							<td>
								<input type="text" name="nutition" id="sdt_nutition"
								placeholder="ex) 상품 상세 정보 참조" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 상품 상세 정보 참조'">
							</td>
						</tr>
						<tr>
							<th>소비자 상담 전화번호</th>
							<td>
								<input type="text" name="call_num" id="sdt_call_num"
								placeholder="ex) 011-1111-1111" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 011-1111-1111'">
							</td>
						</tr>
					</table>
				</div>

				<!-- 상품 설명 - 배송 안내 -->
				<div class="section_detail_delivery">
					<div class="s_delivery_title">배송 안내</div>
					<textarea id="sdd_delivery_guide" name="delivery_guide" wrap="hard"
					placeholder="ex) 5만원 이상 구매시 무료배송입니다." onfocus="this.placeholder=''"
					onblur="this.placeholder='ex) 5만원 이상 구매시 무료배송입니다.'"></textarea>
				</div>
			</div>

			<!-- 반품/교환 정보 -->
			<div class="section_footer_exchange">
				<!-- 제목 -->
				<div class="footer_e_title">반품/교환 정보</div>
				<div class="footer_e_content">
					<textarea id="sdd_exchange_con" name="exchange_con" wrap="hard"
					placeholder="ex) 교환 반품을 원하시면 일주일 내에 연락 주세요." onfocus="this.placeholder=''"
					onblur="this.placeholder='ex) 교환 반품을 원하시면 일주일 내에 연락 주세요.'"></textarea>
				</div>
			</div>
			
			<!-- 글쓰기 버튼 -->
			<div class="pp_write_btn">
				글쓰기
			</div>
			</form>
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