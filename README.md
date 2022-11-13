<br>

# <b>개인 프로젝트</b>
- <b>개발 목적</b> : 다이어트 쇼핑몰 웹 애플리케이션 구현
- <b>기술 스택</b> : Spring Framework, Java, JSP, Ajax, Javascript, 외부라이브러리(jQuery), DBMS(Oracle), CSS
- <b>개발 환경</b> : Eclipse, JDK 11.0.15, Apache Tomcat 9.0, Maven
- <b>개발 기간</b> : 2022.10.27 ~ 2022.11.14
<br>

## <b>구현 기능</b>
- 로그인, 아이디/비밀번호 찾기, 회원가입
- 쇼핑몰 메인, 상품/리뷰/QnA 게시판, 페이징, 검색
- 그 외 (장바구니, 결제, 찜하기)
<br>

## <b>구현 화면</b>

### 쇼핑몰 메인
- 베스트, 세일, 신상품순 나열
<br>
<img width="700" src="https://user-images.githubusercontent.com/93369732/201511810-5ed535aa-0a06-430a-8bfb-1219506fcd9b.png">
<br>
<br>

### 전체 카데고리
- 상품/리뷰/QnA 게시판, 페이징, 검색
- 그 외 (찜하기, 신상품순/가격순 나열)

##### 페이징, 검색

<img width="700" src="https://user-images.githubusercontent.com/93369732/201512686-254d2bdb-0b86-4fd4-9c13-bd1c6caf6add.gif">

##### 상세보기

<img width="700" src="https://user-images.githubusercontent.com/93369732/201514742-17e144e5-5f5d-4f7f-8fa1-13147fce3089.png">

<br>
<br>

### 로그인
- 로그인/로그아웃
- 회원가입, 아이디/비밀번호 찾기 페이지로 이동 가능
<br>
<img width="700" src="https://user-images.githubusercontent.com/93369732/199641704-1218fb62-2541-4e0b-b319-3572dfa97bff.gif">
<br>
<br>

### 회원가입
- 회원 가입 할 수 있는 페이지 - 필수 값만으로 가입 가능

  - 필수 값 : 아이디, 비밀번호, 닉네임, 이메일, 전화번호, 본인의 키
  - 필수가 아닌 값 : 이름, 생년월일, 성별, 프로필사진(기본 프로필)
- 유효성 검사

  - 에러 표시 : 통과 안될시 빨간줄의 에러, 회원가입 버튼 클릭 시 에러 메시지.
  - 검사 : 서버/클라이언트 동시에 유효성 검사, 아이디/닉네임 중복 체크

##### 아이디, 닉네임 중복 확인. 프로필 이미지 추가

<img width="700" src="https://user-images.githubusercontent.com/93369732/199642238-25ce0a7e-b599-4723-805e-60f9855b5230.gif">

<br>
<br>

### 아이디/비밀번호 찾기
- 메일의 인증코드 확인 후 비밀번호 변경

<img width="700" src="https://user-images.githubusercontent.com/93369732/199642026-0a4862b5-2b0b-4e48-bf63-58e3588d6d05.gif">
<br>

<br>
<br>

## <b>ERD</b>
- 회원정보 : 회원의 기본적인 정보가 담김. 회원 번호로 테이블 구분.
- 고객센터 게시판

  - <b>대표 게시물</b> : 게시물의 기본적인 정보. 게시물 번호, 회원번호(글쓴이)로 테이블 구분.
  
  - <b>조회수</b> : 게시물의 조회수 체크. 회원이나 비회원당 1씩 증가. 게시물 번호, 회원번호로 구분.
  
  - <b>좋아요, 싫어요</b> : 게시물의 좋아요/싫어요 체크. (자신의 게시물이 아닐 경우 1 증가) 게시물 번호, 회원번호로 구분.
  
  - <b>댓글</b> : 게시물의 댓글(원글 번호)/대댓글(고유 번호로 우선순위 체크), 대댓글 원글 닉네임. 게시물번호, 회원번호로 구분.
  
  - <b>첨부파일</b> : 파일의 정보. 게시물 번호로 구분. 총 5개의 파일 첨부 가능(첨부 수 제한)
<br>
<img src="https://user-images.githubusercontent.com/93369732/201514583-b98243e0-792a-4e44-bc2f-7a15a624e93f.png">

<br>
<br>

