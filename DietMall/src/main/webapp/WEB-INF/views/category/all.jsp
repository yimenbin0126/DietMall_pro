<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.ItemboardDTO, com.dietmall.DTO.MemberDTO,
    com.dietmall.DTO.PagingViewDTO"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
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
	<script type="text/javascript" src="../resources/js/nav/header.js"></script>
</head>

<body>

	<%
		// 값 불러오기
		int page_NowBno = (int)request.getAttribute("page_NowBno");
		String category_type = (String)request.getAttribute("category_type");
		String search_type = (String)request.getAttribute("search_type");
		String standard = (String)request.getAttribute("standard");
		List<ItemboardDTO> ib_dto_list = new ArrayList<ItemboardDTO>();
	%>
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
		<!-- 메인 헤더(검색) -->
		<div class="main_header">
			<h1 id="title" class="main_header_list">
				<a href="/main/home"> 다이어터몰 </a>
			</h1>
			<div id="search" class="main_header_list">
				<input type="text" id="search_bar" size="1" placeholder="검색어를 입력해주세요."
					onfocus="this.placeholder=''" value="<%=search_type%>"
					onblur="this.placeholder='검색어를 입력해주세요.'"> <img id="search_img"
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			</div>
		</div>
		
		<!-- 카테고리 -->
		<div id="sec_header_catecory">
			<nav>
				<ul class="catecory">
					<li class="all_category">
						<a href="/category/all">
							<span class="hd_txt">전체 카테고리</span>
						</a>
					</li>
					<li>
						<a href="/main/sale">
							<span class="hd_txt">SALE</span>
						</a>
					</li>
					<li>
						<a href="/main/best"> 
							<span class="hd_txt">베스트</span>
						</a>
					</li>
					<li>
						<a href="/main/new">
							<span class="hd_txt">신상품</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- 헤더 끝 -->

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
							&& !category_type.equals("basic_food")
							&& !category_type.equals("etc_food"))){
				%>
				<div class="hidden_write">
					<input type="button" id="write_btn_sub" value="글쓰기"
					onclick="location.href='/category/insert?category_type=<%=category_type%>'">
				</div>
				<%
					}
				%>
			</c:if>
			<!-- 제목 -->
			<div class="con_title">
				<c:if test="${category_type == 'all'}">전체 카테고리</c:if>
				<c:if test="${category_type == 'basic_food'}">간편 요리</c:if>
				<c:if test="${category_type == 'basic_food_chicken'}">닭가슴살</c:if>
				<c:if test="${category_type == 'basic_food_box'}">도시락</c:if>
				<c:if test="${category_type == 'basic_food_salad'}">샐러드</c:if>
				<c:if test="${category_type == 'basic_food_sub'}">구독 식품</c:if>
				<c:if test="${category_type == 'etc_food'}">보조 식품</c:if>
				<c:if test="${category_type == 'etc_food_snack'}">간식</c:if>
				<c:if test="${category_type == 'etc_food_penut'}">견과류</c:if>
				<c:if test="${category_type == 'etc_food_pill'}">영양제</c:if>
			</div>
			<!-- 정렬 기준 -->
			<div class="con_standard">
				<c:set var="standard" value="<%=standard%>" />
				<div <c:if test="${standard == 'new'}">style="color:black;"</c:if>
				<c:if test="${standard != 'new'}">style="color:lightgray;"</c:if>
				onClick="location.href='/category/all?standard=new&page_NowBno=1&category_type=<%=category_type%>&search_type=<%=search_type%>'">신상품순</div>
				<div <c:if test="${standard == 'price_down'}">style="color:black;"</c:if>
				<c:if test="${standard != 'price_down'}">style="color:lightgray;"</c:if>
				onClick="location.href='/category/all?standard=price_down&page_NowBno=1&category_type=<%=category_type%>&search_type=<%=search_type%>'">낮은 가격순</div>
				<div <c:if test="${standard == 'price_up'}">style="color:black;"</c:if>
				<c:if test="${standard != 'price_up'}">style="color:lightgray;"</c:if>
				onClick="location.href='/category/all?standard=price_up&page_NowBno=1&category_type=<%=category_type%>&search_type=<%=search_type%>'">높은 가격순</div>
			</div>
			<!-- 내용 3개씩 -->
			<div class="content">

				<!-- 사진, 제목, 할인가격, 가격, 신상품/인기 표시 -->
				<%
					List<Integer> etc_star_list = new ArrayList<Integer>();
					List<Integer> review_sum_list = new ArrayList<Integer>();
					int etc_star = 0;
					int review_sum = 0;
					String etc_star_s = "";
					if (request.getAttribute("ib_dto_list") != null){
						ib_dto_list = (ArrayList<ItemboardDTO>)request.getAttribute("ib_dto_list");
						review_sum_list = (ArrayList<Integer>)request.getAttribute("review_sum_list");
						etc_star_list = (ArrayList<Integer>)request.getAttribute("etc_star_list");
						for (int i=0; i<ib_dto_list.size(); i++){
							ItemboardDTO ib_dto = new ItemboardDTO();
							ib_dto = ib_dto_list.get(i);
							review_sum = review_sum_list.get(i);
							etc_star = etc_star_list.get(i);
							if(etc_star==5){
								etc_star_s ="★★★★★";
							} else if (etc_star==4){
								etc_star_s ="★★★★☆";
							} else if (etc_star==3){
								etc_star_s ="★★★☆☆";
							} else if (etc_star==2){
								etc_star_s ="★★☆☆☆";
							} else if (etc_star==1){
								etc_star_s ="★☆☆☆☆";
							} else if (etc_star==0){
								etc_star_s ="☆☆☆☆☆";
							}
				%>
				<div class="con_content"
				onClick="location.href='/category/detail?item_bno=<%=ib_dto.getItem_bno()%>&page_NowBno=1'">
					<!-- 상품 사진 -->
					<div class="items_img">
						<img src="/category/load-image?fileName=<%=ib_dto.getItem_title_img()%>">
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
								int sale_price = ib_dto.getOrigin_price() - (int)(ib_dto.getOrigin_price()*(ib_dto.getSale_percent()*0.01));
							%>
							<span class="percent"><%=ib_dto.getSale_percent()%>%</span> 
							 <span class="percent_price">
							 	<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto.getOrigin_price()%>" />
							 </span>
						</div>
						<div class="sale_price">
							<span class="origin_price">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sale_price%>" />
							</span> <span
								class="origin_price_text">원</span>
						</div>
					</div>
					<%
						} else {
					%>
					<!-- 원가 - 할인 안할때 -->
					<div class="items_price">
						<span class="origin_price">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto.getOrigin_price()%>" />
						</span> <span
							class="origin_price_text">원</span>
					</div>
					<%
						}
					%>
					<!-- 별점 -->
					<div class="items_etc_star"><span style="color:red; font-size:13px; font-weight:bold;"><%=etc_star_s%></span> <span style="font-size:13px; font-weight:bold;"><%=review_sum%></span></div>
					<!-- 할인여부, 인기 표시 -->
					<%
						// 여부 확인
						if (ib_dto.getLike_num()>=3 || ib_dto.getSale_yn().equals("Y")){
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
							if (ib_dto.getLike_num()>=3){
						%>
						<span class="items_best">인기</span>
						<%
							}
						%>
					</div>
					<%
						}
							
					%>
				</div>
			
					<%
						}
						} else {
						// 객체가 없을시
					%>
						<span>등록된 상품이 없습니다.</span>
					<%
						}
					%>

		</div>
		
		<!-- 페이징 시작 -->
		<div class="e_paging">
			<%
				PagingViewDTO pv_dto = new PagingViewDTO();
				pv_dto = (PagingViewDTO)request.getAttribute("pv_dto");
				// 클릭 가능 여부
				if (pv_dto.isPage_prev()){
			%>
			<div onclick="location.href='/category/all?page_NowBno=<%=pv_dto.getPage_StartBno()-5%>&standard=<%=pv_dto.getStandard()%>'"
			 class="e_paging_btnleft" id="e_paging_btnleft_yes">&lt;</div>
			<%
				} else {
			%>
			<div onclick="alert('첫 페이지 입니다.');"
			 class="e_paging_btnleft" id="e_paging_btnleft_no">&lt;</div>
			<%
				}
			%>
			<div class="e_paging_num">
			<%
				// 첫 번호, 마지막 번호
				int page_StartBno = pv_dto.getPage_StartBno();
				int page_EndBno = pv_dto.getPage_EndBno();
				// 현재 번호
				for (int i=page_StartBno; i <= page_EndBno; i++) {
					if(i==page_NowBno){									
			%>
				<a id="page_NowBno"><%=i%></a>
			<%
					} else {
			%>
				<a href="/category/all?page_NowBno=<%=i%>
				&standard=<%=pv_dto.getStandard()%>"
				class="page_Bno" id="page_Bno<%=i%>"><%=i%></a>
			<%
					}
				}
			%>
			</div>
			<%
				// 클릭 가능 여부
				if (pv_dto.isPage_next()){
			%>
			<div onclick="location.href='/category/all?page_NowBno=<%=pv_dto.getPage_EndBno()+1%>&standard=<%=pv_dto.getStandard()%>'"
			class="e_paging_btnright" id="e_paging_btnright_yes">&gt;</div>
			<%
				} else {
			%>
			<div onclick="alert('마지막 페이지 입니다.');"
			 class="e_paging_btnright" id="e_paging_btnright_no">&gt;</div>
			<%
				}
			%>
		</div>
		<!-- 페이징 끝 -->
		
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