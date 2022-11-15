<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link href="/resources/css/member/idpsCheck.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/member/idpsCheck.js"></script>
</head>
<body>
	<header>
		<!-- 버튼(로그인 홈페이지로) -->
		<div id="goto_login">
			<input type="button" onClick="location.href='/member/login'"
				value="< 로그인 홈페이지로">
		</div>
		<!-- 로고(메인 홈페이지로) -->
		<div id="main_logo">
			<a href="/main/home">다이어터몰</a>
		</div>
		<hr>
	</header>

	<section class="idpsCheck_list">

		<!-- 로고 -->
		<div class="logo">
			<div id="findid_logo">아이디 찾기</div>
			<div id="findpass_logo">비밀번호 찾기</div>
		</div>

		<!-- 아이디 찾기 -->
		<div class="findid_div">
			<form name='idCheckform' class="idCheck">
				<!-- 구분 input -->
				<input type="hidden" name="idpw_find" value="id" id="input_findid">
				<div class="explain">
					<h4>회원가입 시 사용했던 실명과 이메일을 입력해 주시면</h4>
					<h4>해당 이메일에 아이디 정보를 보내드립니다.</h4>
				</div>
				<div id="id_header">
					<div id="id_name">
						<h4 class="title">이름</h4>
						<input type="text" name="username" id="input_id_name" placeholder="실명을 입력해주세요."
							onfocus="this.placeholder=''" 
							onblur="this.placeholder='실명을 입력해주세요.'">
					</div>

					<div id="id_email">
						<h4 class="title">이메일</h4>
						<input type="text" name="useremail" id="input_id_email" placeholder="ex. dietmall@gmail.com"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='ex. dietmall@gmail.com'">
					</div>
				</div>

				<!-- 제출 -->
				<div class="sub_btn">
					<input type="submit" id="idCheck_sub_btn" value="이메일로 아이디 전송">
				</div>

			</form>
		</div>


		<!-- 비밀번호 찾기 -->
		<div class="findpass_div">
			<form name='psCheckform' class="psCheck">
				<!-- 구분 input -->
				<input type="hidden" name="idpw_find" value="pass" id="input_findpass">
				<div class="explain">
					<h4>아이디를 입력해 주시면</h4>
					<h4>아이디에 해당되는 이메일에 비밀번호를 보내드립니다.</h4>
				</div>
				<div id="pass_header">
					<h4 class="title">아이디</h4>
					<input type="text" name="userid" id="input_pass_id" placeholder="아이디를 입력해주세요."
						onfocus="this.placeholder=''"
						onblur="this.placeholder='아이디를 입력해주세요.'">
				</div>

				<!-- 제출 -->
				<div class="sub_btn">
					<input type="submit" id="psCheck_sub_btn" value="이메일로 비밀번호 전송">
				</div>

			</form>
		</div>

	</section>

	<footer>
	</footer>

</body>

</html>