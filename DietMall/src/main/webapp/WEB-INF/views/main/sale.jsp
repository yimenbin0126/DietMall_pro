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
    <link href="/resources/css/main/sale.css" rel="stylesheet">
</head>

<body>
   	<!-- 헤더 -->
	<header>
		<%@include file="../nav/header.jsp"%>
	</header>


    <!-- 본문 -->
    <section>

        <div id="section_header">
            <div id="sale_logo">
                <h1>지금 세일중!!</h1>
            </div>
        </div>



        <div class="rank_top3_sale_content">
            <div id="rank3_image_1">
                <h2 id="top3_logo">TOP3</h2>
                <img src="../img/food_image.jpg" alt="rank3_sale_image1">
                <p class="sale_top3_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                <span class="sale_top3_discount">30%</span>
                <span class="sale_top3_price">15,900</span>
                <span class="sale_top3_before_price">20,000</span>
            </div>

            <div id="rank3_image_2">
                <img src="../img/food_image.jpg" alt="rank3_sale_image2">
                <p class="sale_top3_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                <span class="sale_top3_discount">30%</span>
                <span class="sale_top3_price">20,000</span>
                <span class="sale_top3_before_price">25,000</span>
            </div>

            <div id="rank3_image_3">
                <img src="../img/food_image.jpg" alt="rank3_sale_image3">
                <p class="sale_top3_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                <span class="sale_top3_discount">30%</span>
                <span class="sale_top3_price">30,000</span>
                <span class="sale_top3_before_price">35,000</span>
            </div>
        </div>



        <div class="saleitems_content">
            <div id="saleitems_content_header">
                <div id="saleitems_num">
                    <strong>4개의 상품</strong>
                </div>
                <div id="saleitems_condition">
                    <ul>
                        <li>
                            <a>리뷰많은순</a>
                        </li>
                        <li>
                            <a>낮은가격순</a>
                        </li>
                        <li>
                            <a>높은가격순</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="saleitems_images">
                <div id="saleitems_image_1">
                    <img src="../img/food_image.jpg" alt="sale_image1">
                    <p class="saleitems_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                    <span class="saleitems_discount">30%</span>
                    <span class="saleitems_price">15,900</span>
                    <span class="saleitems_before_price">20,000</span>
                </div>
    
                <div id="saleitems_image_2">
                    <img src="../img/food_image.jpg" alt="sale_image2">
                    <p class="saleitems_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                    <span class="saleitems_discount">30%</span>
                    <span class="saleitems_price">20,000</span>
                    <span class="saleitems_before_price">25,000</span>
                </div>
    
                <div id="saleitems_image_3">
                    <img src="../img/food_image.jpg" alt="sale_image3">
                    <p class="saleitems_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                    <span class="saleitems_discount">30%</span>
                    <span class="saleitems_price">30,000</span>
                    <span class="saleitems_before_price">35,000</span>
                </div>
    
                <div id="saleitems_image_4">
                    <img src="../img/food_image.jpg" alt="sale_image4">
                    <p class="saleitems_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                    <span class="saleitems_discount">30%</span>
                    <span class="saleitems_price">20,000</span>
                    <span class="saleitems_before_price">25,000</span>
                </div>
    
                <div id="saleitems_image_5">
                    <img src="../img/food_image.jpg" alt="sale_image5">
                    <p class="saleitems_content">[SALE]요즘 제철이라는 토마토 인기 다이어트 건강식품 어쩌구저쩌구</p>
                    <span class="saleitems_discount">30%</span>
                    <span class="saleitems_price">20,000</span>
                    <span class="saleitems_before_price">25,000</span>
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