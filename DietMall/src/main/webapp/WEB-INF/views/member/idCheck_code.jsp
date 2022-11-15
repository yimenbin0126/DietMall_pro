<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link href="/resources/css/member/idCheck_code.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/member/idCheck_code.js" ></script>
</head>
<body>
	<header>
		
		<!-- 로고(메인 홈페이지로) -->
		<div id="main_logo">
			<a href="/main/home">다이어터몰</a>
		</div>
		<hr>
	</header>

	<section>

		<!-- 인증코드 입력 메시지 -->
		<div class="input_page">
			<form class="title" name="inputform">
				<input type="hidden" name="confirmcode" value="${code}" id="confirmcode">
				<h1 style="margin-bottom: 5px;">
				인증코드를 입력해주세요.
				</h1>
				<p style="font-size: 13px; margin-bottom:10px;">
					이메일로 전송한 인증코드를 확인해주세요.<br>
					만약 인증코드가 보이지 않는다면,<br>
					스팸 메일함에 메일이 전송되어 있지 않은지 확인해주시거나<br>
					아래 인증코드 재전송 버튼을 클릭하여 재발급 받으세요.
				</p>
				<div class="input_type" style="margin-bottom: 5px;">
					<input type="text" name="code" id="input_code">
					<button type="button" id="re_btn" class="btn" style="margin-top: 15px;">인증코드 재발송</button>
				</div>
				<button type="button" id="sub_btn" class="btn">입력완료</button>

				<!-- 인증코드 재발송에 보내고 받을 데이터들 (이름, 아이디, 이메일) -->
				<input type="hidden" name="useremail" id="userEmail" value="${vo.getUseremail()}">
				<input type="hidden" name="username" id="userName" value="${vo.getUsername()}">
			</form>
		</div>
		
		<!-- 인증 완료시 -->
		<div class="complet_page">
			<h1>회원님의 아이디는</h1>
			<h1>${vo.getUserid()}입니다.</h1>
			<input type="button" style="margin-top: 15px;" id="btn_log" value="로그인하기" class="btn">
			<input type="button" style="margin-top: 5px;" id="btn_idpw" value="아이디/비밀번호 찾기" class="btn">
		</div>

	</section>

</body>

</html>