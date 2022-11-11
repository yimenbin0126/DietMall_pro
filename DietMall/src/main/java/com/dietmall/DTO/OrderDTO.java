package com.dietmall.DTO;

public class OrderDTO {
	
	// 상품 정보
	// 상품이름
	private String item_name;
	// 상품수량
	private int item_num;
	// 최종가격
	private int item_price;
	
	// 배송지 정보
	// 우편번호
	private String delivery_post;
	// 우편번호2
	private String delivery_address;
	// 우편번호3
	private String delivery_address_detail;
	
	// 결제수단
	// 결제타입
	private String pay_card;
	// 결제일시
	private String pay_date;
	
	// 결제금액
	// 총금액
	private int money_all;
	// 배송비
	private int money_delivery;
	// 할인금액
	private int money_sale;
	// 총 결제금액
	private int money_result;
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public String getDelivery_post() {
		return delivery_post;
	}
	public void setDelivery_post(String delivery_post) {
		this.delivery_post = delivery_post;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
	public String getDelivery_address_detail() {
		return delivery_address_detail;
	}
	public void setDelivery_address_detail(String delivery_address_detail) {
		this.delivery_address_detail = delivery_address_detail;
	}
	public String getPay_card() {
		return pay_card;
	}
	public void setPay_card(String pay_card) {
		this.pay_card = pay_card;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getMoney_all() {
		return money_all;
	}
	public void setMoney_all(int money_all) {
		this.money_all = money_all;
	}
	public int getMoney_delivery() {
		return money_delivery;
	}
	public void setMoney_delivery(int money_delivery) {
		this.money_delivery = money_delivery;
	}
	public int getMoney_sale() {
		return money_sale;
	}
	public void setMoney_sale(int money_sale) {
		this.money_sale = money_sale;
	}
	public int getMoney_result() {
		return money_result;
	}
	public void setMoney_result(int money_result) {
		this.money_result = money_result;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [item_name=" + item_name + ", item_num=" + item_num + ", item_price=" + item_price
				+ ", delivery_post=" + delivery_post + ", delivery_address=" + delivery_address
				+ ", delivery_address_detail=" + delivery_address_detail + ", pay_card=" + pay_card + ", pay_date="
				+ pay_date + ", money_all=" + money_all + ", money_delivery=" + money_delivery + ", money_sale="
				+ money_sale + ", money_result=" + money_result + "]";
	}
	
}
