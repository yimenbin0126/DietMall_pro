$(function () {
	sum();
	click();
	cart();
	like();
	qna();
	review();
});

// 상품 유동가격
function sum () {
	// 상품 가격
	var final_items_price = document.querySelector('.h_pay_items_price .i_price_all_content .final_items_price');
	var add_btn_num = document.querySelector('.h_pay_items_add .add_btn_num');
	var add_btn_minus = document.querySelector('.h_pay_items_add .add_btn_minus');
	var add_btn_plus = document.querySelector('.h_pay_items_add .add_btn_plus');
	var origin_price = 0;
	var final_price = 0;
	// 세일 유무
	if (document.querySelector('.items_price_sale')){
		// 세일 함
		origin_price = document.querySelector('.items_price_sale .sale_price .o_price').value;
	} else if (document.querySelector('.items_price')){
		// 세일 안함
		origin_price = document.querySelector('.items_price .o_price').value;
	}
	// 상품 수량 추가, 감소
	add_btn_minus.addEventListener('click', ()=>{
		if(parseInt(add_btn_num.innerText)<=1){
			alert('상품의 최소 갯수입니다.');
			add_btn_num.innerText = 1;
		} else {
			add_btn_num.innerText = parseInt(add_btn_num.innerText)-1;
			final_price = parseInt(origin_price) * parseInt(add_btn_num.innerText);
			document.querySelector('.h_pay_items_price .final_price').value = final_price;
			final_items_price.innerText = final_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
	});
	add_btn_plus.addEventListener('click', ()=>{
		if(parseInt(add_btn_num.innerText)>=10){
			alert('상품의 최대 갯수입니다.');
			add_btn_num.innerText = 10;
		} else {
			add_btn_num.innerText = parseInt(add_btn_num.innerText)+1;
			final_price = parseInt(origin_price) * parseInt(add_btn_num.innerText);
			document.querySelector('.h_pay_items_price .final_price').value = final_price;
			final_items_price.innerText = final_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
	});
}

function click () {
	// 고정 카데고리
	document.querySelector('.p_category_items_btn').addEventListener('click', ()=>{
		document.querySelector('.p_category_items_btn').style.color = "white";
		document.querySelector('.p_category_review_btn').style.color = "black";
		document.querySelector('.p_category_QnA_btn').style.color = "black";
		document.querySelector('.p_category_replace_btn').style.color = "black";
		document.querySelector('.p_category_items_btn').style.backgroundColor = "gray";
		document.querySelector('.p_category_review_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_QnA_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_replace_btn').style.backgroundColor = "rgb(230,230,230)";
	});
	document.querySelector('.p_category_review_btn').addEventListener('click', ()=>{
		document.querySelector('.p_category_items_btn').style.color = "black";
		document.querySelector('.p_category_review_btn').style.color = "white";
		document.querySelector('.p_category_QnA_btn').style.color = "black";
		document.querySelector('.p_category_replace_btn').style.color = "black";
		document.querySelector('.p_category_items_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_review_btn').style.backgroundColor = "gray";
		document.querySelector('.p_category_QnA_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_replace_btn').style.backgroundColor = "rgb(230,230,230)";
	});
	document.querySelector('.p_category_QnA_btn').addEventListener('click', ()=>{
		document.querySelector('.p_category_items_btn').style.color = "black";
		document.querySelector('.p_category_review_btn').style.color = "black";
		document.querySelector('.p_category_QnA_btn').style.color = "white";
		document.querySelector('.p_category_replace_btn').style.color = "black";
		document.querySelector('.p_category_items_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_review_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_QnA_btn').style.backgroundColor = "gray";
		document.querySelector('.p_category_replace_btn').style.backgroundColor = "rgb(230,230,230)";
	});
	document.querySelector('.p_category_replace_btn').addEventListener('click', ()=>{
		document.querySelector('.p_category_items_btn').style.color = "black";
		document.querySelector('.p_category_review_btn').style.color = "black";
		document.querySelector('.p_category_QnA_btn').style.color = "black";
		document.querySelector('.p_category_replace_btn').style.color = "white";
		document.querySelector('.p_category_items_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_review_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_QnA_btn').style.backgroundColor = "rgb(230,230,230)";
		document.querySelector('.p_category_replace_btn').style.backgroundColor = "gray";
	});
	// 글 버튼
	var item_bno = document.querySelector('#item_bno').value;
	// 글 수정
	if(document.querySelector('.pp_update_btn')){
		document.querySelector('.pp_update_btn').addEventListener('click',(e)=>{
			var link = "/category/detail-update?item_bno="+item_bno;
			location.href = link;
		});
	}
	// 글 삭제
	if(document.querySelector('.pp_delete_btn')){
		document.querySelector('.pp_delete_btn').addEventListener('click',()=>{
			$.ajax({
	            url: "/category/detail-delete",
	            type: "POST",
	            dataType:'text',
	            data: {
	            	item_bno : item_bno
	            },
	            success: function(data){
		            alert('게시물이 삭제되었습니다.');
		            location.href="/category/all";
	            }
	        }) 
		});
	}
}

// 장바구니 담기
function cart () {
	document.querySelector('.h_pay_cart').addEventListener('click',()=>{
		var item_bno = document.querySelector('#item_bno').value;
		var item_num = document.querySelector('.h_pay_items_add .add_btn_num').innerText;
		$.ajax({
            url: "/category/cart",
            type: "POST",
            dataType:'text',
            data: {
            	"item_bno" : item_bno,
            	"item_num" : item_num
            },
            success: function(data){
            	if(data=="O"){
	            	alert('상품이 장바구니에 담겼습니다.');
            	} else if (data=="nologin"){
            		alert('로그인 후 장바구니에 담을 수 있습니다.');
            	} else {
	            	alert('이미 장바구니에 담긴 상품입니다.\n장바구니를 확인해주세요.');
            	}
            }
        }); 
	});
}

// 찜하기
function like() {
	if (document.querySelector('#h_pay_wish_y')){
		document.querySelector('#h_pay_wish_y').addEventListener('click',()=>{
		var like_yn_ = "N"; 
		// 감소
		if (document.querySelector('.h_pay_wish .wish_text').innerText=="♥"){
			like_yn_ = "Y";
		} else if (document.querySelector('.h_pay_wish .wish_text').innerText=="♡") {
			// 증가
			like_yn_ = "N";
		}
			$.ajax({
	            url: "/category/detail-update-like",
	            type: "POST",
	            data: {
	            	item_bno : document.querySelector('#item_bno').value,
	            	like_yn : like_yn_
	            },
	            success: function(data){
	            	if(data=="O"){
	            		var wish_num = document.querySelector('.h_pay_wish .wish_num');
	            		if (document.querySelector('.h_pay_wish .wish_text').innerText=="♥"){
	            			// 감소
		            		document.querySelector('.h_pay_wish .wish_text').innerText = "♡"
		            		wish_num.innerText = parseInt(wish_num.innerText) - 1;
	            		} else if (document.querySelector('.h_pay_wish .wish_text').innerText=="♡") {
	            			// 증가
	            			document.querySelector('.h_pay_wish .wish_text').innerText = "♥"
		            		wish_num.innerText = parseInt(wish_num.innerText) + 1;
	            		}
	            	} 
	            }
	        });
		});
	}
}

// QnA
function qna () {
}

// 리뷰
function review () {
	// 작성하기 폼 만들기
	if (document.querySelector('#r_w_c_btn_y input')){
		document.querySelector('#r_w_c_btn_y input').addEventListener('click',()=>{
			var html_ = "";
			if(!document.querySelector('.review_w_c_write')){
				html_ = '<form name="form_review_insert" id="form_review_insert" enctype="multipart/form-data">';
				html_ += '<div class="review_w_c_write">';
				html_ += '<h3>리뷰 작성하기</h3>';
				html_ += '<div class="r_w_c_select">';
				html_ += '<input type="hidden" class="r_w_c_item_bno" name="item_bno" value="';
				html_ += $('#item_bno').val()+'"';
				html_ += '<input type="hidden" class="select_choice_val" name="etc_star">';
				html_ += '<select class="star_choice">';
				html_ += '<option value="5" selected>★★★★★</option>';
				html_ += '<option value="4">★★★★☆</option>';
				html_ += '<option value="3">★★★☆☆</option>';
				html_ += '<option value="2">★★☆☆☆</option>';
				html_ += '<option value="1">★☆☆☆☆</option>';
				html_ += '</select>';
				html_ += '</div>';
				html_ += '<div class="r_w_c_write_content">';
				html_ += '<div class="c_w_content_textarea">';
				html_ += '<textarea id="w_c_textarea" name="etc_content" wrap="hard" ';
				html_ += 'placeholder="리뷰를 작성해 주세요." onfocus="'+"this.placeholder=''"+'"';
				html_ += 'onblur="this.placeholder='+"'리뷰를 작성해 주세요.'"+'">'+"</textarea>";
				html_ += '</div>';
				html_ += '<div class="c_w_content_btn">';
				html_ += '<button type="button">작성하기</button>';
				html_ += '</div>';
				html_ += '</div>';
				html_ += '<div class="r_w_c_write_file">';
				html_ += '<input type="file" id="r_w_c_w_file_input" name="img_name">';
				html_ += '</div>';
				html_ += '</div>';
				html_ += '</form>';
				// 뒤에 요소 추가
				$("#r_w_c_btn_y").after(html_);
			} else {
				alert('아직 작성하지 않은 글이 존재합니다.');
			}
		});
	
	}
	
	// 리뷰 작성시
	if(document.querySelector('.review_w_c_write')){
		document.querySelector('.c_w_content_btn button').addEventListener('click',()=>{
			// 별점
			document.querySelector('.select_choice_val').value = $('.star_choice option:selected').val();			
			var formData = new FormData(form_review_insert);
			$.ajax({
	            url: "/category/review-insert",
	            type: "POST",
	            cache: false,
	            dataType:'json',
	            contentType: false,
          		processData: false,
	            data: formData,
	            success: function(data){
	            	var review_list;
	            	var _html = '';
	            	// 기존 삭제
	            	if (data.length >= 1) {
		            	$('.f_review_content').innerText = "";
	            	} else {
	            		_html += '<div>존재하는 게시물이 없습니다.</div>';
			            $('.f_review_content').append(_html);
	            	}
	            	for(var i=0; i<data.length; i++){
		            	review_list = data.review_dto[i];
		            	// 리뷰
		            	if (review_list.board_type == "review"){
			            	// 리뷰 내용 업데이트
			            	_html += '<div class="r_content">';
			            	_html += '<div class="r_content_top">';
			            	_html += '<div class="c_top_star">';
			            	_html += '<span>';
			            	_html += '<c:set var="_etc_star" value="'+review_list.etc_star+'" />';
			            	_html += '<c:if test="${_etc_star == 5}">★★★★★</c:if>';
			            	_html += '<c:if test="${_etc_star == 4}">★★★★☆</c:if>';
			            	_html += '<c:if test="${_etc_star == 3}">★★★☆☆</c:if>';
			            	_html += '<c:if test="${_etc_star == 2}">★★☆☆☆</c:if>';
			            	_html += '<c:if test="${_etc_star == 1}">★☆☆☆☆</c:if>';
			            	_html += '</span>';
			            	_html += ' <span>'+review_list.etc_star+'</span>';
			            	_html += '</div>';
			            	_html += '<div class="c_top_date">';
			            	_html += '<span>'+review_list.userid+'</span> <span>'+review_list.create_time+'</span>';
			            	_html += '</div>';
			            	_html += '</div>';
			            	_html += '<div class="r_content_middle">';
			            	_html += '<div class="c_middle_image">';
			            	_html += '<img src="/resources/image/category/food.png">';
			            	_html += '</div>';
			            	_html += '<div class="c_middle_detail">';
			            	_html += review_list.etc_content;
			            	_html += '</div>';
			            	_html += '</div>';
			            	_html += '<div class="r_content_btn">';
			            	// 로그인한 값 확인
			            	if (document.querySelector('#m_dto_userid').value != ""){
				            	_html += '<div class="r_content_btn">';
			            		if (document.querySelector('#m_dto_userid').value == "admin"){
					            	_html += '<div class="r_c_btn_reply">';
					            	_html += '답글';
					            	_html += '</div>';
			            		}
			            		if (document.querySelector('#m_dto_userid').value == review_list.userid){
					            	_html += '<div class="r_c_btn_update">';
					            	_html += '수정';
					            	_html += '</div>';
					            	_html += '<div class="r_c_btn_delete">';
					            	_html += '삭제';
					            	_html += '</div>';
			            		}
				            	_html += '</div>';
			            	}
			            	_html += '</div>';
			            	_html += '';
			            	// 새로운 내용 추가
			            	$('.f_review_content').append(_html);
		            	} else if (review_list.board_type == "review_reply"){
		            		// 리뷰 내용 변경
			            	_html += '<div class="c_answer">';
			            	_html += '<div class="answer_review">';
			            	_html += '<div class="answer_writer">';
			            	_html += '<div>'+review_list.userid+'</div>';
			            	_html += '<div>'+review_list.create_time+'</div>';
			            	_html += '</div>';
			            	_html += '<div class="answer_content">';
			            	_html += review_list.etc_content;
			            	_html += '</div>';
			            	_html += '</div>';
			            	// 로그인한 값 확인
			            	if (document.querySelector('#m_dto_userid').value != ""
			            	&& document.querySelector('#m_dto_userid').value == review_list.userid){
				            	_html += '<div class="answer_btn">';
				            	_html += '<div class="a_btn_update">';
				            	_html += '수정';
				            	_html += '</div>';
				            	_html += '<div class="a_btn_delete">';
				            	_html += '삭제';
				            	_html += '</div>';
				            	_html += '</div>';
			            	}
			            	_html += '</div>';
		            		// 새로운 내용 추가
			            	$('.f_review_content').append(_html);
		            	} 
	            	}
	            }
	        }); 
		});
	}
	
	// 리뷰 수정
	if (!$('.r_content_btn .r_c_btn_update')) {
		var inner_html = "";
		var inner_html_after = "";
		document.querySelector('.r_content_btn .r_c_btn_update').addEventListener('click',(e)=>{
			// 기존값 저장
			inner_html = e.target.parentElement.parentElement.innerHTML;
			var etc_content = e.target.parentElement.parentElement.children[1].children[1].value;
			var img_name = e.target.parentElement.parentElement.children[1].children[2].value;
			// 그 이후
			inner_html_after = '<form name="form_review_update" id="form_review_update" enctype="multipart/form-data">';
			inner_html_after += '<div class="r_content_update">';
			inner_html_after += '<div class="r_c_update_file">';
			inner_html_after += '<input type="file" class="r_c_u_file_input" value="'+img_name+'">';
			inner_html_after += '</div>';
			inner_html_after += '<div class="r_c_update_textarea">';
			inner_html_after += '<textarea wrap="hard"';
			inner_html_after += 'placeholder="리뷰를 작성해 주세요." onfocus="'+"this.placeholder=''"+'"';
			inner_html_after += 'onblur="this.placeholder='+"'리뷰를 작성해 주세요.'"+'">'+etc_content+"</textarea>";
			inner_html_after += '</div>';
			inner_html_after += '<div class="r_c_update_btn">';
			inner_html_after += '<div class="r_c_u_btn_complet">수정완료</div>';
			inner_html_after += '<div class="r_c_u_btn_none">수정취소</div>';
			inner_html_after += '</div>';
			inner_html_after += '</div>';
			inner_html_after += '</form>';
			// 초기화			
			e.target.parentElement.parentElement.innerHTML = "";
			e.target.parentElement.parentElement.innerHTML = inner_html_after;
		});
	}
	
	// 리뷰 수정시
	if(document.querySelector('.r_c_update_btn .r_c_u_btn_complet')){
		document.querySelector('.r_c_update_btn .r_c_u_btn_complet').addEventListener('click',()=>{
			// 별점
			document.querySelector('.select_choice_val').value = $('.star_choice option:selected').val();			
			var formData = new FormData(form_review_insert);
			$.ajax({
	            url: "/category/review-insert",
	            type: "POST",
	            cache: false,
	            dataType:'json',
	            contentType: false,
          		processData: false,
	            data: formData,
	            success: function(data){
	            	var review_list;
	            	var _html = '';
	            	// 기존 삭제
	            	if (data.length >= 1) {
		            	$('.f_review_content').innerText = "";
	            	} else {
	            		_html += '<div>존재하는 게시물이 없습니다.</div>';
			            $('.f_review_content').append(_html);
	            	}
	            	for(var i=0; i<data.length; i++){
		            	review_list = data.review_dto[i];
		            	// 리뷰
		            	if (review_list.board_type == "review"){
			            	// 리뷰 내용 업데이트
			            	_html += '<div class="r_content">';
			            	_html += '<div class="r_content_top">';
			            	_html += '<div class="c_top_star">';
			            	_html += '<span>';
			            	_html += '<c:set var="_etc_star" value="'+review_list.etc_star+'" />';
			            	_html += '<c:if test="${_etc_star == 5}">★★★★★</c:if>';
			            	_html += '<c:if test="${_etc_star == 4}">★★★★☆</c:if>';
			            	_html += '<c:if test="${_etc_star == 3}">★★★☆☆</c:if>';
			            	_html += '<c:if test="${_etc_star == 2}">★★☆☆☆</c:if>';
			            	_html += '<c:if test="${_etc_star == 1}">★☆☆☆☆</c:if>';
			            	_html += '</span>';
			            	_html += ' <span>'+review_list.etc_star+'</span>';
			            	_html += '</div>';
			            	_html += '<div class="c_top_date">';
			            	_html += '<span>'+review_list.userid+'</span> <span>'+review_list.create_time+'</span>';
			            	_html += '</div>';
			            	_html += '</div>';
			            	_html += '<div class="r_content_middle">';
			            	_html += '<div class="c_middle_image">';
			            	_html += '<img src="/resources/image/category/food.png">';
			            	_html += '</div>';
			            	_html += '<div class="c_middle_detail">';
			            	_html += review_list.etc_content;
			            	_html += '</div>';
			            	_html += '</div>';
			            	_html += '<div class="r_content_btn">';
			            	// 로그인한 값 확인
			            	if (document.querySelector('#m_dto_userid').value != ""){
				            	_html += '<div class="r_content_btn">';
			            		if (document.querySelector('#m_dto_userid').value == "admin"){
					            	_html += '<div class="r_c_btn_reply">';
					            	_html += '답글';
					            	_html += '</div>';
			            		}
			            		if (document.querySelector('#m_dto_userid').value == review_list.userid){
					            	_html += '<div class="r_c_btn_update">';
					            	_html += '수정';
					            	_html += '</div>';
					            	_html += '<div class="r_c_btn_delete">';
					            	_html += '삭제';
					            	_html += '</div>';
			            		}
				            	_html += '</div>';
			            	}
			            	_html += '</div>';
			            	_html += '';
			            	// 새로운 내용 추가
			            	$('.f_review_content').append(_html);
		            	} else if (review_list.board_type == "review_reply"){
		            		// 리뷰 내용 변경
			            	_html += '<div class="c_answer">';
			            	_html += '<div class="answer_review">';
			            	_html += '<div class="answer_writer">';
			            	_html += '<div>'+review_list.userid+'</div>';
			            	_html += '<div>'+review_list.create_time+'</div>';
			            	_html += '</div>';
			            	_html += '<div class="answer_content">';
			            	_html += review_list.etc_content;
			            	_html += '</div>';
			            	_html += '</div>';
			            	// 로그인한 값 확인
			            	if (document.querySelector('#m_dto_userid').value != ""
			            	&& document.querySelector('#m_dto_userid').value == review_list.userid){
				            	_html += '<div class="answer_btn">';
				            	_html += '<div class="a_btn_update">';
				            	_html += '수정';
				            	_html += '</div>';
				            	_html += '<div class="a_btn_delete">';
				            	_html += '삭제';
				            	_html += '</div>';
				            	_html += '</div>';
			            	}
			            	_html += '</div>';
		            		// 새로운 내용 추가
			            	$('.f_review_content').append(_html);
		            	} 
	            	}
	            }
	        }); 
		});
	}
	
	// 리뷰 삭제
	
	// 페이징
}





