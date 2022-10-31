<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link href="/resources/css/member/join.css" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/resources/js/member/join.js"></script>

</head>
<body>
	<header>
		<!-- 로그인 홈페이지로 -->
		<div id="goto_login">
			<input type="button" onClick="location.href='/member/login'" value="< 로그인 하기">
		</div>
		<!-- 로고(메인 홈페이지로) -->
		<div id="main_logo">
			<a href="main.html">다이어터몰</a>
		</div>
		<hr>
	</header>

	<section class="join_list">
		<!-- 회원가입 -->
		<div id="join_title">
			<h1>회원가입</h1>
		</div>

		<!-- 회원가입 버튼 -->
		<div class="join_button">

			<div id="join_kakao">
				<p>간편한 회원가입을 원한다면?</p>
				<a href="javascript:kakaoLogin();">
					<img src="..\resources\image\member\login\kakao_login.png">
				</a>
			</div>
			<!-- 카카오 회원가입 -->
			<form name="kakaoJoinForm" id="kakaoJoinForm" method="post"
				action="/member/join-detail-kakao-set">
				<input type="hidden" name="id" id="kakaoId" />
				<input type="hidden" name="email" id="kakaoEmail" />
				<input type="hidden" name="gender" id="kakaoGender" />
				<input type="hidden" name="flag" id="kakaologin" />
			</form>


			<div id="join_dietmall">
				<p>다이어터몰 회원으로 다양한 혜택을 받아보세요!</p>
				<input type="button" value="다이어터몰 공식 회원가입"
					onClick="location.href='join-detail'">
				<img src="">이미지들어갈곳
			</div>

		</div>

	</section>

	<footer>
		
	</footer>
</body>
</html>