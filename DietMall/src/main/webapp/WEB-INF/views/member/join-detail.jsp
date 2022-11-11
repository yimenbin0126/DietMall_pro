<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="/resources/css/member/join-detail.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/member/join-detail.js"></script>
</head>

<body>		
    <header>
        <!-- 뒤로 가기 -->
        <div id="goto_main">
            <input type="button" onClick="location.href='/member/login'" value="< 뒤로 가기">
        </div>

        <!-- 제목 -->
        <div id="join_logo">
            <h1>회원가입</h1>
        </div>
    </header>

    <section>
            <form action="/member/join-detail" method="post" id="content">
                <h4>아이디</h4>
                <div id="id_confirm" class="errorindex">*영문 소문자와 숫자를 혼합해 5~20자리로 만들어주세요</div>
                <input type="text" name="userId" id="id" placeholder="아이디를 입력해 주세요." onfocus="this.placeholder=''"
                    onblur="this.placeholder='아이디를 입력해 주세요.'">

				<!-- 아이디 중복 확인 -->
				<input type="hidden" name="idChk_result" value="N" id="idChk_result">
				<button type="button" id="idchk" >아이디 중복확인</button>
				<div id="idchk_true">*사용 가능한 아이디입니다.</div>
				<div id="idchk_false">*이미 사용중인 아이디입니다.</div>
				
                <h4>비밀번호</h4>
                <div id="psw_confirm" class="errorindex">*영문 대소문자, 숫자, 특수문자(!@#*)를 하나 이상씩 사용하여 7~20자리로 만들어주세요</div>
                <input type="password" name="userPass" id="password" placeholder="비밀번호를 입력해 주세요." onfocus="this.placeholder=''"
                    onblur="this.placeholder='비밀번호를 입력해 주세요.'" >

                <h4>비밀번호 확인</h4>
                <div id="psw_confirm_more" class="errorindex">*비밀번호가 맞지 않습니다.</div>
                <input type="password" id="password_more" placeholder="비밀번호를 한번 더 입력해 주세요."
                    onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 한번 더 입력해 주세요.'" >

				<h4>이름</h4>
                <div id="name_confirm" class="errorindex">*이름을 입력해주세요.</div>
                <input type="text" name="userName" id="name" placeholder="이름을 입력해 주세요."
                    onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력해 주세요.'" >
				
                <!-- 생년월일 시작 -->
                <h4>생년월일</h4>
                <div id="bir_confirm" class="errorindex">*생년월일을 제대로 입력해주세요.</div>
                <div id="bir">
                	
                	<!-- 값 전달 -->
                	<input type="hidden" name="userBirth" id="bir_value">
                	
                    <!-- 연도 -->
                    <div id="bir_yy">
                        <input type="text" class="int" maxlength="4" placeholder="ex.1999년(4자)"
                            onfocus="this.placeholder=''" onblur="this.placeholder='ex.1999년(4자)'" >
                    </div>
                    <!-- 월 -->
                    <div id="bir_mm">
                        <select>
                            <option>월</option>

                        </select>
                    </div>

                    <!-- 일 -->
                    <div id="bir_dd">
                        <select>
                        </select>
                    </div>

                </div>
                <!-- 생년월일 끝 -->

                <!-- 성별 -->
                <h4>성별</h4>
                <div id="gender_confirm" class="errorindex">*성별을 선택해주세요.</div>
                <div id="gender">
                    <select name="userGender">
                        <option>선택</option>
                        <option>여자</option>
                        <option>남자</option>
                    </select>
                </div>

                <!-- 이메일 -->
                <h4>이메일</h4>
                <div id="email_confirm" class="errorindex">*이메일 형식이 올바르지 않습니다.</div>
                <div id="email">
                    <input type="test" name="userEmail" id="email_input" placeholder="ex) dietmall@naver.com"
                        onfocus="this.placeholder=''" onblur='this.placeholder="ex) dietmall@naver.com"' >
					<button type="button" id="emailchk">중복 확인</button>
                </div>
                <input type="hidden" name="email_result" value="N" id="email_result">
				<div id="email_true">*사용 가능한 이메일입니다.</div>
				<div id="email_false">*이미 사용중인 이메일입니다.</div>

                <!-- 휴대전화 -->
                <h4>휴대전화</h4>
                <div id="phone_confirm" class="errorindex">*올바른 전화번호 형식이 아닙니다.</div>
                <div id="phone">
                    <input type="text" name="userTel" id="tel" placeholder="ex) 01012345678, -를 빼고 입력해주세요."
                        onfocus="this.placeholder=''" onblur="this.placeholder='ex) 01012345678, -를 빼고 입력해주세요.'">
                </div>

                <!-- 가입하기 -->
                <div id="sub">
                    <input type="submit" value="가입하기" id="userjoin">
                </div>

            </form>
    </section>

</body>

</html>