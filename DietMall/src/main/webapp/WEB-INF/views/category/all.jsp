<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.ItemboardDTO, com.dietmall.DTO.MemberDTO"
    %>
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
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/category/all.js"></script>
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
					<li><a href="/member/join">회원가입</a></li>
				</c:if>
				<!-- 로그인이 되있을 때 -->
				<c:if test="${member != null}">
					<li>${member.userName}님 환영합니다.</li>
					<li><a href="/member/logout">로그아웃</a></li>
				</c:if>
			</ul>
		</form>
		<%@include file="../nav/header.jsp"%>
	</header>
	<!-- 헤더 끝 -->

	<%
		// 값 불러오기
		int page_NowBno = (int)request.getAttribute("page_NowBno");
		String category_type = (String)request.getAttribute("category_type");
		String standard = (String)request.getAttribute("standard");
		List<ItemboardDTO> ib_dto_list = new ArrayList<ItemboardDTO>();
	%>
    <!-- 본문 -->
    <section class="con_selction">
		
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
			<!-- 글쓰기 -->
			<c:if test="${member != null}">
				<%
					MemberDTO m_dto = new MemberDTO();
					m_dto = (MemberDTO)session.getAttribute("member");
					if(m_dto.getUserid().equals("admin")
							&&(!category_type.equals("all")
							|| !category_type.equals("basic_food")
							|| !category_type.equals("etc_food"))){
				%>
				<div class="hidden_write">
					<input type="button" id="write_btn_sub" value="글쓰기"
					onclick="location.href='/category/detail/insert?category_type=<%=category_type%>'">
				</div>
				<%
					}
				%>
			</c:if>
			<!-- 제목 -->
			<div class="con_title">전체 카테고리</div>
			<!-- 정렬 기준 -->
			<div class="con_standard">
				<c:set var="standard" value="<%=standard%>" />
				<div <c:if test="${standard == 'new'}">style="color:black;"</c:if>
				<c:if test="${standard != 'new'}">style="color:lightgray;"</c:if>
				onClick="location.href='/category/all?standard=new&page_NowBno=1&category_type=<%=category_type%>'">신상품순</div>
				<div <c:if test="${standard == 'price_down'}">style="color:black;"</c:if>
				<c:if test="${standard != 'price_down'}">style="color:lightgray;"</c:if>
				onClick="location.href='/category/all?standard=price_down&page_NowBno=1&category_type=<%=category_type%>'">낮은 가격순</div>
				<div <c:if test="${standard == 'price_up'}">style="color:black;"</c:if>
				<c:if test="${standard != 'price_up'}">style="color:lightgray;"</c:if>
				onClick="location.href='/category/all?standard=price_up&page_NowBno=1&category_type=<%=category_type%>'">높은 가격순</div>
			</div>
			<!-- 내용 3개씩 -->
			<div class="content">

				<div class="con_content">
					<!-- 사진, 제목, 할인가격, 가격, 신상품/인기 표시 -->
					<%
						if (request.getAttribute("ib_dto_list") != null){
							ib_dto_list = (ArrayList<ItemboardDTO>)request.getAttribute("ib_dto_list");
							for (int i=0; i<ib_dto_list.size(); i++){
								ItemboardDTO ib_dto = new ItemboardDTO();
								ib_dto = ib_dto_list.get(i);
					%>
					<!-- 상품 사진 -->
					<div class="items_img">
						<img src="/resources/image/category/<%=ib_dto.getItem_title_img()%>">
					</div>
					<!-- 상품 제목 -->
					<div class="items_title"><%=ib_dto.getItem_name()%></div>
					<%
						// 세일 여부
						if (ib_dto.getSale_yn().equals("Y")) {
					%>
					<!-- 상품 할인율, 원가, 할인가격 -->
					<div class="items_price_sale">
						<div class="sale_percent">
							<%
								int sale_price = ib_dto.getOrigin_price() - ib_dto.getOrigin_price()*(ib_dto.getSale_percent()/100);
							%>
							<span class="percent"><%=ib_dto.getSale_percent()%></span> <span class="percent_price"><%=ib_dto.getOrigin_price()%></span>
						</div>
						<div class="sale_price">
							<span class="origin_price"><%=sale_price%></span> <span
								class="origin_price_text">원</span>
						</div>
					</div>
					<%
						} else {
					%>
					<!-- 원가 - 할인 안할때 -->
					<div class="items_price">
						<span class="origin_price"><%=ib_dto.getOrigin_price()%></span> <span
							class="origin_price_text">원</span>
					</div>
					<%
						}
					%>
					<!-- 할인여부, 인기 표시 -->
					<%
						// 여부 확인
						if (ib_dto.getLike_num()>=10 || ib_dto.getSale_yn().equals("Y")){
					%>
					<div class="items_new_best">
						<%
							// 할인중인지
							if (ib_dto.getSale_yn().equals("Y")){
						%>
						<span class="items_new">할인</span> 
						<%
							}
						%>
						<%
							// 인기있는지
							if (ib_dto.getLike_num()>=10){
						%>
						<span class="items_best">인기</span>
						<%
							}
						%>
					</div>
					<%
						}
							}
						} else {
						// 객체가 없을시
					%>
						<span>등록된 상품이 없습니다.</span>
					<%
						}
					%>

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