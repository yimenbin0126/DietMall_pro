<br>

# <b>개인 프로젝트</b>
- <b>개발 목적</b> : 다이어트 쇼핑몰 웹 애플리케이션 구현
- <b>기술 스택</b> : Spring Framework, Java, JSP, Ajax, Javascript, 외부라이브러리(jQuery), DBMS(Oracle), CSS
- <b>개발 기간</b> : 2022.10.27 ~ 2022.11.14 (디자인 미완성)
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
<img width="400" src="https://user-images.githubusercontent.com/93369732/201511810-5ed535aa-0a06-430a-8bfb-1219506fcd9b.png">
<br>
<br>

### 전체 카데고리
- 상품/리뷰/QnA 게시판, 페이징, 검색
- 그 외 (찜하기, 신상품순/가격순 나열)

##### 페이징, 검색

<img width="700" src="https://user-images.githubusercontent.com/93369732/201512686-254d2bdb-0b86-4fd4-9c13-bd1c6caf6add.gif">

##### 상세보기

<img width="700" src="https://user-images.githubusercontent.com/93369732/201515115-a63750e0-e413-4147-bec8-616965f05c1b.gif">

<br>
<br>

### 장바구니
- 장바구니 담기/결제
<br>
<img width="700" src="https://user-images.githubusercontent.com/93369732/201519130-fbda9ac2-da44-4d54-9202-0a31a5be41ee.gif">
<br>
<br>

### 로그인
- 로그인/로그아웃
- 회원가입, 아이디/비밀번호 찾기 페이지로 이동 가능
<br>
<img width="700" src="https://user-images.githubusercontent.com/93369732/201515892-49622c15-5eba-412f-9fa6-e86ef04a7a53.gif">
<br>
<br>

### 회원가입
- 회원 가입 할 수 있는 페이지

- 유효성 검사

  - 에러 표시 : 통과 안될시 빨간줄의 에러, 회원가입 버튼 클릭 시 에러 메시지.
  - 검사 : 아이디/이메일 중복 체크

<img width="700" src="https://user-images.githubusercontent.com/93369732/201515829-f5d414db-a5a6-4567-bc4a-5c87b5e09f14.gif">

<br>
<br>

### 아이디/비밀번호 찾기
- 인증코드 메일 발송

<img width="700" src="https://user-images.githubusercontent.com/93369732/201516961-a54dd567-14fe-487c-97a8-a51ee472aa68.gif">
<br>

<br>
<br>

## <b>ERD</b>
- 회원정보 : 회원의 기본적인 정보가 담김. 회원 번호로 테이블 구분.
- 상품 게시판

  - <b>상품 게시판</b> : 상품의 기본적인 정보. 상품번호로 구분.
  
  - <b>그외 상세 설명</b> : 그 외 상품 설명. 상품 번호로 구분.
  
  - <b>리뷰, QnA</b> : 리뷰, QnA 게시판 작성. 상품번호와 회원번호를 참고로 하여 고유 게시판 번호로 구분.
  
  - <b>찜</b> : 상품의 찜 등록. 상품번호와 회원번호로 구분.
  
  - <b>결제</b> : 상품의 장바구니, 결제 기능에 활용. 결제번호를 고유번호로 회원번호, 상품번호를 참고하여 구분. 
<br>
<img src="https://user-images.githubusercontent.com/93369732/201514583-b98243e0-792a-4e44-bc2f-7a15a624e93f.png">

<br>
<br>

