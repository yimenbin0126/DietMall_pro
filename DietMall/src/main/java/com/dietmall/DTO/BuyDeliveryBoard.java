package com.dietmall.DTO;

public class BuyDeliveryBoard {

	// 회원번호
	private int userno;
	// 우편번호
	private String delivery_post;
	// 기본 주소
	private String delivery_address;
	// 나머지 주소
	private String delivery_address_detail;
	// 결제수단
	private String pay_card;
	// 총 상품 금액
	private int money_all;
	// 총 배송비
	private int money_delivery;
	// 총 할인 금액
	private int money_sale;
	// 총 결제 금액
	private int money_result;
	// 결제일
	private String pay_date;
	
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
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
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	
	@Override
	public String toString() {
		return "BuyDeliveryBoard [userno=" + userno + ", delivery_post=" + delivery_post + ", delivery_address="
				+ delivery_address + ", delivery_address_detail=" + delivery_address_detail + ", pay_card=" + pay_card
				+ ", money_all=" + money_all + ", money_delivery=" + money_delivery + ", money_sale=" + money_sale
				+ ", money_result=" + money_result + ", pay_date=" + pay_date + "]";
	}
}
