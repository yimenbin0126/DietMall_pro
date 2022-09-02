<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 메인 헤더(검색) -->
<div class="main_header">
	<h1 id="name" class="main_header_list">
		<a href="main.html"> 다이어터몰 </a>
	</h1>
	<div id="search" class="main_header_list">
		<input type="text" id="search_bar" size="1" placeholder="검색어를 입력해주세요."
			onfocus="this.placeholder=''"
			onblur="this.placeholder='검색어를 입력해주세요.'"> <img
			src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
	</div>
</div>



<!-- 카테고리 -->
<div id="sec_header_catecory">
	<nav>
		<ul class="catecory">
			<li class="all_category"><a href="home.html"> <span
					class="hd_txt">전체 카테고리</span>
			</a></li>
			<li><a href="sale.html"> <span class="hd_txt">SALE</span>
			</a></li>
			<li><a href="best.html"> <span class="hd_txt">베스트</span>
			</a></li>
			<li><a href="newitem.html"> <span class="hd_txt">신상품</span>
			</a></li>
			<li><a href="event.html"> <span class="hd_txt">이벤트</span>
			</a></li>
		</ul>
	</nav>
</div>
