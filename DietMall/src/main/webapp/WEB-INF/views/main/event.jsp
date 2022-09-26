<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다이어터몰</title>
    <link href="/resources/css/main/event.css" rel="stylesheet">
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
				<li><a href="mypage.html">마이페이지</a></li>
				<li><a href="contact.html">고객센터</a></li>
			</ul>
		</form>
		<%@include file="../nav/header.jsp"%>
	</header>
	<!-- 헤더 끝 -->

    <!-- 섹션 -->
    <section>

        <!-- 이벤트 헤더 -->
        <div id="event_header">
            <div id="event_logo">
                <h1>이벤트</h1>
            </div>
    
            <div id="event_select_time">
                <select>
                    <option value="now_event">진행중 이벤트</option>
                    <option value="past_event">종료된 이벤트</option>
                </select>
            </div>
        </div>

        <!-- 이벤트 본문 -->
        <div id="event_list">
            
            <div id="event_list_explan1" class="event_list_ex">
                <div id="event_list_img_explan1" class="event_list_img">
                    <img src="../img/food_image.jpg" alt="출석이벤트">
                </div>
                
                <div id="event_list_text_explan1" class="event_list_text">
                    <h3>출석 이벤트</h3>
                    <div id="p_list">
                        <p>출석이벤트 참여해서 100p 벌자!</p>
                    </div>
                        <h4>2022.06.30 10:00 ~ 2022.07.30 10:00</h4>
                </div>
            </div>

            <div id="event_list_explan2" class="event_list_ex">
                <div id="event_list_img_explan2" class="event_list_img">
                    <img src="../img/food_image.jpg" alt="출석이벤트">
                </div>
                <div id="event_list_text_explan2" class="event_list_text">
                    <h3>신규 가입 이벤트</h3>
                    <div id="p_list">
                        <p>신규 가입해서 공짜로 받자!</p>
                        <p>띄어쓰기</p>
                    </div>
                    <h4>2022.06.30 10:00 ~ 2022.07.30 10:00</h4>
                </div>
            </div>

        </div>
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