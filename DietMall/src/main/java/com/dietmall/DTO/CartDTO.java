package com.dietmall.DTO;

public class CartDTO {

	// 상품번호
	private int buy_bno;
	// 상품사진
	private String item_title_img;
	// 상품이름
	private String item_name;
	// 상품갯수
	private int item_num;
	// 배송비
	private int delivery_fee;
	// 최종가
	private int buy_sum;
	// 멤버번호
	private int userno;
	// 세일 여부
	private String sale_yn;
	// 상품 원가
	private int origin_price;
	
	public int getBuy_bno() {
		return buy_bno;
	}
	public void setBuy_bno(int buy_bno) {
		this.buy_bno = buy_bno;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public int getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public int getBuy_sum() {
		return buy_sum;
	}
	public void setBuy_sum(int buy_sum) {
		this.buy_sum = buy_sum;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getItem_title_img() {
		return item_title_img;
	}
	public void setItem_title_img(String item_title_img) {
		this.item_title_img = item_title_img;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getSale_yn() {
		return sale_yn;
	}
	public void setSale_yn(String sale_yn) {
		this.sale_yn = sale_yn;
	}
	public int getOrigin_price() {
		return origin_price;
	}
	public void setOrigin_price(int origin_price) {
		this.origin_price = origin_price;
	}
	
	@Override
	public String toString() {
		return "CartDTO [buy_bno=" + buy_bno + ", item_title_img=" + item_title_img + ", item_name=" + item_name
				+ ", item_num=" + item_num + ", delivery_fee=" + delivery_fee + ", buy_sum=" + buy_sum + ", userno="
				+ userno + ", sale_yn=" + sale_yn + ", origin_price=" + origin_price + "]";
	}
	
}
