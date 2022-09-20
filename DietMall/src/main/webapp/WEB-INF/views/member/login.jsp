<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="/resources/css/member/login.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(function () {
			$()
		};
	</script>
</head>
<body>
    <header>
        <!-- 버튼(메인 홈페이지로) -->
        <div id="goto_main">
            <input type="button" onClick="location.href='/main/home'" value="< 메인 홈페이지로">
        </div>
        <!-- 로고(메인 홈페이지로) -->
        <div id="main_logo">
            <a href="main.html">다이어터몰</a>
        </div>
        <hr>
    </header>

    <section class="join_list">
    	<form name='loginform' method="post" class="login" action="/member/login">
			
			<!-- 로그인 입력 -->
            <div id="login_logo">
                <h1>로그인</h1>
            </div>

            <div id="login_header">
                <div id="log">
                    <input type="text" name="userId" placeholder="아이디" onfocus="this.placeholder=''"
                        onblur="this.placeholder='아이디'">
                </div>

                <div id="pass">
                    <input type="password" name="userPass" placeholder="비밀번호" onfocus="this.placeholder=''"
                        onblur="this.placeholder='비밀번호'">
                </div>
            </div>

            <div id="login_footer">

				<!-- 자동 로그인/아이디, 비밀번호 찾기 -->
                <div id="log_ing_button">
                    <div id="log_ing">
                        <label id="log_auto"><input type="checkbox" name="remember-me" value="log_ing_auto">자동
                            로그인</label>
                        <label id="log_check"><a href="idpsCheck" id="log_check">아이디/비밀번호 찾기</a></label>
                    </div>

                    <div id="log_button">
                        <input type="submit" value="로그인">
                    </div>
                    
                    <c:if test="${msg == false}">
						<script>
							alert("아이디 혹은 비밀번호가 틀립니다.");
						</script>
					</c:if>
                </div>
                
                <!-- 회원가입 -->
                <div id="log_to_link">
                    
                    <div id="to_join">
                        <a href="join">이 곳은 처음이신가요? 회원가입하기</a>
                    </div>
                 </div>
            </div>
            
    	</form>

    </section>

    <footer>
        <!-- 기타 설명 -->
    </footer>

</body>

</html>