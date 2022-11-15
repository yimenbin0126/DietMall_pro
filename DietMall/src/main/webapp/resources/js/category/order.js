$(function () {
    sum();
    pay();
    order();
});

// 가격 총합	
function sum() {
	var sum_result = 0;
	// 총 상품 금액
	var item_m = document.querySelector('.d_c_item .money');
	item_m.innerText = 0;
	var i_m = 0;
	let length_item_m = $('.buy_sum_val').length;
    if (length_item_m >= 1) {
    	$(".buy_sum_val").each(function() {
    		sum_result = parseInt(sum_result) + parseInt($(this).val());
        	i_m = parseInt($(this).val())+ parseInt(i_m);
    		document.querySelector('#d_c_item_money').value = i_m;
        	item_m.innerText = i_m.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");;
		});
	}
	// 총 배송비
	var delivery_m = document.querySelector('.d_c_delivery .money');
	delivery_m.innerText = 0;
	var d_m = 0;
	let length_delivery_m = $('.delivery_fee_val').length;
    if (length_delivery_m >= 1) {
    	$(".delivery_fee_val").each(function() {
    		sum_result = parseInt(sum_result) + parseInt($(this).val());
    		d_m = parseInt($(this).val())+ parseInt(d_m);
    		document.querySelector('#d_c_delivery_money').value = d_m;
        	delivery_m.innerText = d_m.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		});
	}
	// 총 할인 금액
	var sale_m = document.querySelector('.d_c_sale .money');
	sale_m.innerText = 0;
	var s_m = 0;
	let length_sale_m = $('.sale_sum_val').length;
    if (length_sale_m >= 1) {
    	$(".sale_sum_val").each(function() {
    		sum_result = parseInt(sum_result) - parseInt($(this).val());
    		s_m = parseInt($(this).val())+ parseInt(s_m);
    		document.querySelector('#d_c_sale_money').value = s_m;
        	sale_m.innerText = s_m.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		});
	}
	// 총 결제 금액
	var sum_m = document.querySelector('.d_c_sum .money');
	document.querySelector('#d_c_sum_money').value = sum_result;
	sum_m.innerText = sum_result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

// 결제 수단
function pay() {
	// 카드 결제
	document.querySelector('.p_w_c_card').addEventListener('click', (event)=>{
		document.querySelector('.p_w_c_card').style.backgroundColor = "gray";
		document.querySelector('.p_w_c_card').style.color = "white";
		document.querySelector('.p_w_c_live').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_live').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_deposit').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_deposit').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_kakao').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_kakao').style.color = "rgb(100,100,100)";
		document.querySelector('#pay_way_choice').value="카드 결제";
		alert('카드 결제를 선택하셨습니다.');
	});
	
	// 실시간 계좌이체
	document.querySelector('.p_w_c_live').addEventListener('click', (event)=>{
		document.querySelector('.p_w_c_card').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_card').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_live').style.backgroundColor = "gray";
		document.querySelector('.p_w_c_live').style.color = "white";
		document.querySelector('.p_w_c_deposit').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_deposit').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_kakao').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_kakao').style.color = "rgb(100,100,100)";
		document.querySelector('#pay_way_choice').value="실시간 계좌이체";
		alert('실시간 계좌이체를 선택하셨습니다.');
	});
	
	// 무통장 입금
	document.querySelector('.p_w_c_deposit').addEventListener('click', (event)=>{
		document.querySelector('.p_w_c_card').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_card').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_live').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_live').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_deposit').style.backgroundColor = "gray";
		document.querySelector('.p_w_c_deposit').style.color = "white";
		document.querySelector('.p_w_c_kakao').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_kakao').style.color = "rgb(100,100,100)";
		document.querySelector('#pay_way_choice').value="무통장 입금";
		alert('무통장 입금를 선택하셨습니다.');
	});
	
	// 카카오 페이
	document.querySelector('.p_w_c_kakao').addEventListener('click', (event)=>{
		document.querySelector('.p_w_c_card').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_card').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_live').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_live').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_deposit').style.backgroundColor = "rgb(240,240,240)";
		document.querySelector('.p_w_c_deposit').style.color = "rgb(100,100,100)";
		document.querySelector('.p_w_c_kakao').style.backgroundColor = "gray";
		document.querySelector('.p_w_c_kakao').style.color = "white";
		document.querySelector('#pay_way_choice').value="카카오 페이";
		alert('카카오 페이를 선택하셨습니다.');
	});
}

// 주문
function order() {
	document.querySelector('.r_content_buy input').addEventListener('click', (event)=>{
		event.preventDefault();
		// 결제 번호 담기
		let order_list = new Array();
		
		// 결제번호, 상품이름, 상품수량, 최종가격
		var item_;
		var buy_bno;
		var data_name;
		var data_num;
		var data_sum;
		$(".buy_bno_ul").each(function() {
			buy_bno = $(this).children().eq(0).val();
			data_name = $(this).children().eq(2).children().val();
			data_num = $(this).children().eq(2).val();
			data_sum = $(this).children().eq(6).val();
			item_ = {
				buy_bno : buy_bno,
				item_name : data_name,
				item_num : data_num,
				item_price : data_sum
			}
			order_list.push(item_);
		});
		
		var order_ = {
			"delivery_post": $('#input_o_d_address_first').val(),
	    	"delivery_address": $('#input_o_d_address_mid').val(),
	    	"delivery_address_detail": $('#input_o_d_address_last').val(),
	    	"pay_card": $('#pay_way_choice').val(),
	    	"money_all": $('#d_c_item_money').val(),
	    	"money_delivery": $('#d_c_delivery_money').val(),
	    	"money_sale": $('#d_c_sale_money').val(),
	    	"money_result": $('#d_c_sum_money').val()
		}
		
		order_list.push(order_);
		console.log(JSON.stringify({
		    	order_list : order_list
		    }));
		
		$.ajax({
		    url: '/category/order-list',
		    type: 'post',
		    contentType: 'application/json',
		    data: JSON.stringify(
		    	order_list
		    ),
		    success: function(data){
		    	if(data=="O"){
			    	location.href="/category/orderComplet";
		    	}
		    }
		});
	});
}


