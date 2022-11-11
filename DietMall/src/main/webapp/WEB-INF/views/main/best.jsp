<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.dietmall.DTO.ItemboardDTO, com.dietmall.DTO.ItemContentBoardDTO, com.dietmall.DTO.ItemEtcBoardDTO"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/main/best.css" rel="stylesheet">
    <link href="/resources/css/nav/header.css" rel="stylesheet">
    <link href="/resources/css/nav/footer.css" rel="stylesheet">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
    <section>

        <div id="section_header">
            <div id="sale_logo">
                <h1>BEST 상품</h1>
            </div>
        </div>
        <h2 id="top3_logo">TOP3</h2>

        <div id="section_header_content">

			<%
				// 값 존재유무 확인
				List<ItemboardDTO> ib_dto_best_list = new ArrayList<ItemboardDTO>();
				if(((ArrayList<ItemboardDTO>)request.getAttribute("ib_dto_best_list")).size() != 0){
					// 존재함
					ib_dto_best_list = (ArrayList<ItemboardDTO>)request.getAttribute("ib_dto_best_list");
					for (int i=0; i<3; i++){
						ItemboardDTO ib_dto_best = new ItemboardDTO();
						ib_dto_best = ib_dto_best_list.get(i);
				
			%>
	                <div class="best_items_content"
	                onClick="location.href='/category/detail?item_bno=<%=ib_dto_best.getItem_bno()%>&page_NowBno=1'">
	                    <!-- 상품 사진 -->
						<div class="items_img">
							<img src="/main/load-image?fileName=<%=ib_dto_best.getItem_title_img()%>">
						</div>
						<!-- 상품 제목 -->
						<div class="items_title"><%=ib_dto_best.getItem_name()%></div>
						<%
							// 세일 여부
							if (ib_dto_best.getSale_yn().equals("Y")) {
						%>
						<!-- 상품 할인율, 원가, 할인가격 -->
						<div class="items_price_sale">
							<div class="sale_percent">
								<%
									int sale_price = ib_dto_best.getOrigin_price() - (int)(ib_dto_best.getOrigin_price()*(ib_dto_best.getSale_percent()*0.01));
								%>
								<span class="percent"><%=ib_dto_best.getSale_percent()%>%</span> <span class="percent_price">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto_best.getOrigin_price()%>" />
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
								<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto_best.getOrigin_price()%>" />
							</span> <span
								class="origin_price_text">원</span>
						</div>
						<%
							}
						%>
	                </div>
			<%
					}
				} else {
					// 존재하지 않음
			%>
				<div>상품이 존재하지 않습니다.</div>
			<%
				}
			%>
        </div>

        <div id="section_mid_content">
			<div class="best_item_list">
			<%
				// 값 존재유무 확인
				if(((ArrayList<ItemboardDTO>)request.getAttribute("ib_dto_best_list")).size() != 0){
					// 존재함
					ib_dto_best_list = (ArrayList<ItemboardDTO>)request.getAttribute("ib_dto_best_list");
					for (int i=0; i<ib_dto_best_list.size(); i++){
						ItemboardDTO ib_dto_best = new ItemboardDTO();
						ib_dto_best = ib_dto_best_list.get(i);
				
			%>
	                <div class="best_items_content"
	                onClick="location.href='/category/detail?item_bno=<%=ib_dto_best.getItem_bno()%>&page_NowBno=1'">
	                    <!-- 상품 사진 -->
						<div class="items_img">
							<img src="/main/load-image?fileName=<%=ib_dto_best.getItem_title_img()%>">
						</div>
						<!-- 상품 제목 -->
						<div class="items_title"><%=ib_dto_best.getItem_name()%></div>
						<%
							// 세일 여부
							if (ib_dto_best.getSale_yn().equals("Y")) {
						%>
						<!-- 상품 할인율, 원가, 할인가격 -->
						<div class="items_price_sale">
							<div class="sale_percent">
								<%
									int sale_price = ib_dto_best.getOrigin_price() - (int)(ib_dto_best.getOrigin_price()*(ib_dto_best.getSale_percent()*0.01));
								%>
								<span class="percent"><%=ib_dto_best.getSale_percent()%>%</span> <span class="percent_price">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto_best.getOrigin_price()%>" />
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
								<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=ib_dto_best.getOrigin_price()%>" />
							</span> <span
								class="origin_price_text">원</span>
						</div>
						<%
							}
						%>
	                </div>
			<%
					}
				} else {
					// 존재하지 않음
			%>
				<div>상품이 존재하지 않습니다.</div>
			<%
				}
			%>
			</div>
        </div>

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