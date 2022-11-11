$(function () {
    sum();
    check();
    order();
});

// 가격 총합	
function sum() {
	var sum_result = 0;
	// 총 상품 금액
	var item_m = document.querySelector('.c_r_p_item .money');
	item_m.innerText = 0;
	var i_m = 0;
	let length_item_m = $('.buy_sum_val').length;
    if (length_item_m >= 1) {
    	$(".buy_sum_val").each(function() {
    		sum_result = parseInt(sum_result) + parseInt($(this).val());
        	i_m = parseInt($(this).val())+ parseInt(i_m);
        	item_m.innerText = i_m.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");;
		});
	}
	// 총 배송비
	var delivery_m = document.querySelector('.c_r_p_delivery .money');
	delivery_m.innerText = 0;
	var d_m = 0;
	let length_delivery_m = $('.delivery_fee_val').length;
    if (length_delivery_m >= 1) {
    	$(".delivery_fee_val").each(function() {
    		sum_result = parseInt(sum_result) + parseInt($(this).val());
    		d_m = parseInt($(this).val())+ parseInt(d_m);
        	delivery_m.innerText = d_m.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		});
	}
	// 총 할인 금액
	var sale_m = document.querySelector('.c_r_p_sale .money');
	sale_m.innerText = 0;
	var s_m = 0;
	let length_sale_m = $('.sale_sum_val').length;
    if (length_sale_m >= 1) {
    	$(".sale_sum_val").each(function() {
    		sum_result = parseInt(sum_result) - parseInt($(this).val());
    		s_m = parseInt($(this).val())+ parseInt(s_m);
        	sale_m.innerText = s_m.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		});
	}
	// 총 결제 금액
	var sum_m = document.querySelector('.c_r_p_sum .money');
	sum_m.innerText = sum_result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

// 체크값
function check() {
	// 전체 선택
	document.querySelector('.c_header_choice_all input').addEventListener('click', ()=>{
		// 전체 선택으로 바꾸기
		var c_list = document.querySelectorAll('.check_del');
		for(var i=0; i<c_list.length; i++){
			c_list[i].checked = document.querySelector('.c_header_choice_all input').checked;
		};
	});
	
	// 삭제
	document.querySelector('.c_header_del').addEventListener('click', (event)=>{
		// 선택한 파일 있으면 담기
		let array_del = new Array();
		let length_del = $('input[name=check_del]:checked').length;
	    if (length_del >= 1) {
	    	$("input:checkbox[name=check_del]:checked").each(function() {
            	array_del.push($(this).val());
			});
			var con_del = confirm('정말 상품을 장바구니에서 제거하시겠습니까?');
			if (con_del == true) {
					// 글쓰기 유형 선택
				$.ajax({
				    url: '/category/cart-delete',
				    type: 'POST',
				    dataType:'text',
				    contentType: 'application/json',
				    data: JSON.stringify(array_del),
				    success: function(result){
				    	console.log(result);
				    	if (result=="X"){
				    		event.preventDefault();
	        				alert('삭제할 장바구니를 선택해 주세요.');
				    	} else {
					    	location.href="/category/cart"
				    	}
				    }
				});
			} else {
				event.preventDefault();
			}
        } else {
        	// 없으면 담으라고 명령하기
        	event.preventDefault();
        	alert('삭제할 장바구니를 선택해 주세요.');
        }
	});
}

// 주문
function order() {
	document.querySelector('.r_content_buy input').addEventListener('click', (event)=>{
		if(!document.querySelector('.cart_blank')){
			event.preventDefault();
			location.href="/category/order"
		} else {
        	alert('장바구니가 비어있습니다.');
		}
	});
}


