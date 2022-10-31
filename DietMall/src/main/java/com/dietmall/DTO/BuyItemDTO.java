package com.dietmall.DTO;

public class BuyItemDTO {

	private int buy_bno;
	private int buy_item_order;
	private int userno;
	private int item_bno;
	private int item_num;
	private String buy_yn;
	
	public int getBuy_bno() {
		return buy_bno;
	}
	public void setBuy_bno(int buy_bno) {
		this.buy_bno = buy_bno;
	}
	public int getBuy_item_order() {
		return buy_item_order;
	}
	public void setBuy_item_order(int buy_item_order) {
		this.buy_item_order = buy_item_order;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getItem_bno() {
		return item_bno;
	}
	public void setItem_bno(int item_bno) {
		this.item_bno = item_bno;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getBuy_yn() {
		return buy_yn;
	}
	public void setBuy_yn(String buy_yn) {
		this.buy_yn = buy_yn;
	}
	
	@Override
	public String toString() {
		return "BuyItemDTO [buy_bno=" + buy_bno + ", buy_item_order=" + buy_item_order + ", userno=" + userno
				+ ", item_bno=" + item_bno + ", item_num=" + item_num + ", buy_yn=" + buy_yn + "]";
	}
	
}
