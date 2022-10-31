<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다이어터몰</title>
<link href="/resources/css/main/home.css" rel="stylesheet">
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
			</ul>
		</form>
		<%@include file="../nav/header.jsp"%>
	</header>
	<!-- 헤더 끝 -->

	<!-- 섹션 -->
	<section>

		<!-- 본문 -->
		<div id="main_page">
			<div id="hd_slide">
				<img src="../img/food_image.jpg" alt="메인 이미지 슬라이드">
			</div>

			<div id="best_item">
				<h1>베스트 상품</h1>
			</div>

			<div id="advert_one">
				<img src="../img/food_image.jpg" alt="광고1">
			</div>

			<div id="sale_item">
				<h1>세일 상품</h1>
			</div>

			<div id="advert_two">
				<img src="../img/food_image.jpg" alt="광고2">
			</div>

			<div id="new_item">
				<h1>신상품</h1>
			</div>

		</div>

	</section>



	<!-- 푸터 -->
	<footer>
		<div>
			2022. 다이어터몰<br> Tel. 041-4242-4242
		</div>
	</footer>
</body>

</html>