<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.ItemboardDTO, com.dietmall.DTO.MemberDTO, com.dietmall.DTO.ItemContentBoardDTO"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/category/detail-update.css" rel="stylesheet">
    <link href="/resources/css/nav/header.css" rel="stylesheet">
    <link href="/resources/css/nav/footer.css" rel="stylesheet">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/category/detail-update.js"></script>
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

		<%
			ItemboardDTO ib_dto = new ItemboardDTO();
			ib_dto = (ItemboardDTO)request.getAttribute("category_type");
			ItemContentBoardDTO icb_dto = new ItemContentBoardDTO();
			icb_dto = (ItemContentBoardDTO)request.getAttribute("icb_dto");
			String category_type = ib_dto.getCategory_type();
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
			<h2 style="padding-top:100px;">상품 글 수정</h2>
			<form name="form_insert" id="form_insert" enctype="multipart/form-data">
			<input type="hidden" name="item_bno" id="category_type_id" value="<%=ib_dto.getItem_bno()%>">
			<!-- 상단 -->
			<div class="s_header">
				<!-- 이미지 -->
				<div class="s_header_image">
					<div>
						<img class="header_img_preview">
					</div>
					<div>
						<input type="file" name="item_title_img" id="shi_file" accept=".jpg, .jpeg, .png" value="<%=ib_dto.getItem_title_img()%>">
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
							<input type="text" name="item_name" value="<%=ib_dto.getItem_name()%>" id="h_pay_item_name"
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
							<div class="percent"><input type="text" name="sale_percent" value="<%=ib_dto.getSale_percent()%>" id="sp_p_sale_percent_"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							placeholder="할인 퍼센트(%)를 적어주세요. 없으면 0." onfocus="this.placeholder=''"
							onblur="this.placeholder='할인 퍼센트(%)를 적어주세요. 없으면 0.'">%</div>
							
							<div class="percent_price"><input type="text" name="origin_price" value="<%=ib_dto.getOrigin_price()%>" id="sp_p_sale_percent_price"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							placeholder="상품의 원가를 적어주세요.(1000원 이상)" onfocus="this.placeholder=''"
							onblur="this.placeholder='상품의 원가를 적어주세요.(1000원 이상)'"></div>
						</div>
						<div class="sale_price">
							<span class="origin_price">0</span> <span
								class="origin_price_text">원</span>
						</div>
					</div>
					<!-- 배송정보 -->
					<div class="h_pay_delivery_content">
						<div class="c_title">
							<span>배송정보</span> 
							<div><input type="text" name="delivery_content" value="<%=icb_dto.getDelivery_content()%>" id="del_c_delivery_content"
							placeholder="로젠택배, cj택배, 한진택배 중 택해서 입력" onfocus="this.placeholder=''"
							onblur="this.placeholder='로젠택배, cj택배, 한진택배 중 택해서 입력'"></div>
						</div>
					</div>
					<!-- 배송비 -->
					<div class="h_pay_delivery_price">
						<div class="d_content_top">
							<span>택배 배송 </span> <span>0<span>원</span></span>
						</div>
						<div class="d_content_bottom">
							<div>제주 추가 10,000원 · 도서지역 2,000원 추가</div>
							<div><input type="text" name="free_type" value="<%=icb_dto.getFree_type()%>" id="del_c_free_type"
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
						<input type="file" name="item_content_img" value="<%=ib_dto.getItem_content_img()%>" id="middle_file" accept=".jpg, .jpeg, .png"
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
								<input type="text" name="item_sum" value="<%=icb_dto.getItem_sum()%>" id="sdt_item_sum"
								placeholder="ex) 사과잼, 통밀면, 올리고당 150ml" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 사과잼, 통밀면, 올리고당 150ml'">
							</td>
						</tr>
						<tr>
							<th>보관 방법</th>
							<td>
								<input type="text" name="item_keep" value="<%=icb_dto.getItem_keep()%>" id="sdt_item_keep"
								placeholder="ex) 수령 후 즉시 냉동보관" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 수령 후 즉시 냉동보관'">
							</td>
						</tr>
						<tr>
							<th>식품유형</th>
							<td>
								<input type="text" name="food_type" value="<%=icb_dto.getFood_type()%>" id="sdt_food_type"
								placeholder="ex) 즉석조리식품(가열하여 섭취하는 냉동식품)" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 즉석조리식품(가열하여 섭취하는 냉동식품)'">
							</td>
						</tr>
						<tr>
							<th>생산지</th>
							<td>
								<input type="text" name="made_by" value="<%=icb_dto.getMade_by()%>" id="sdt_made_by"
								placeholder="ex) 한국" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 한국'">
							</td>
						</tr>
						<tr>
							<th>영양성분표시</th>
							<td>
								<input type="text" name="nutition" value="<%=icb_dto.getNutition()%>" id="sdt_nutition"
								placeholder="ex) 상품 상세 정보 참조" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 상품 상세 정보 참조'">
							</td>
						</tr>
						<tr>
							<th>소비자 상담 전화번호</th>
							<td>
								<input type="text" name="call_num" value="<%=icb_dto.getCall_num()%>" id="sdt_call_num"
								placeholder="ex) 011-1111-1111" onfocus="this.placeholder=''"
								onblur="this.placeholder='ex) 011-1111-1111'">
							</td>
						</tr>
					</table>
				</div>

				<!-- 상품 설명 - 배송 안내 -->
				<div class="section_detail_delivery">
					<div class="s_delivery_title">배송 안내</div>
					<textarea id="sdd_delivery_guide" name="delivery_guide" value="<%=icb_dto.getDelivery_guide()%>" wrap="hard"
					placeholder="ex) 5만원 이상 구매시 무료배송입니다." onfocus="this.placeholder=''"
					onblur="this.placeholder='ex) 5만원 이상 구매시 무료배송입니다.'"></textarea>
				</div>
			</div>

			<!-- 반품/교환 정보 -->
			<div class="section_footer_exchange">
				<!-- 제목 -->
				<div class="footer_e_title">반품/교환 정보</div>
				<div class="footer_e_content">
					<textarea id="sdd_exchange_con" name="exchange_con" value="<%=icb_dto.getExchange_con()%>" wrap="hard"
					placeholder="ex) 교환 반품을 원하시면 일주일 내에 연락 주세요." onfocus="this.placeholder=''"
					onblur="this.placeholder='ex) 교환 반품을 원하시면 일주일 내에 연락 주세요.'"></textarea>
				</div>
			</div>
			
			<!-- 글수정 버튼 -->
			<div class="pp_write_btn">
				수정완료
			</div>
			</form>
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