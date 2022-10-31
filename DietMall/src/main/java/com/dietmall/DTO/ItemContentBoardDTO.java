package com.dietmall.DTO;

public class ItemContentBoardDTO {

	private int item_bno;
	private String delivery_content;
	private String free_type;
	private String item_sum;
	private String item_keep;
	private String food_type;
	private String made_by;
	private String nutition;
	private String call_num;
	private String delivery_guide;
	private String exchange_con;
	
	public int getItem_bno() {
		return item_bno;
	}
	public void setItem_bno(int item_bno) {
		this.item_bno = item_bno;
	}
	public String getDelivery_content() {
		return delivery_content;
	}
	public void setDelivery_content(String delivery_content) {
		this.delivery_content = delivery_content;
	}
	public String getFree_type() {
		return free_type;
	}
	public void setFree_type(String free_type) {
		this.free_type = free_type;
	}
	public String getItem_sum() {
		return item_sum;
	}
	public void setItem_sum(String item_sum) {
		this.item_sum = item_sum;
	}
	public String getItem_keep() {
		return item_keep;
	}
	public void setItem_keep(String item_keep) {
		this.item_keep = item_keep;
	}
	public String getFood_type() {
		return food_type;
	}
	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}
	public String getMade_by() {
		return made_by;
	}
	public void setMade_by(String made_by) {
		this.made_by = made_by;
	}
	public String getNutition() {
		return nutition;
	}
	public void setNutition(String nutition) {
		this.nutition = nutition;
	}
	public String getCall_num() {
		return call_num;
	}
	public void setCall_num(String call_num) {
		this.call_num = call_num;
	}
	public String getDelivery_guide() {
		return delivery_guide;
	}
	public void setDelivery_guide(String delivery_guide) {
		this.delivery_guide = delivery_guide;
	}
	public String getExchange_con() {
		return exchange_con;
	}
	public void setExchange_con(String exchange_con) {
		this.exchange_con = exchange_con;
	}
	
	@Override
	public String toString() {
		return "ItemContentBoardDTO [item_bno=" + item_bno + ", delivery_content=" + delivery_content + ", free_type="
				+ free_type + ", item_sum=" + item_sum + ", item_keep=" + item_keep + ", food_type=" + food_type
				+ ", made_by=" + made_by + ", nutition=" + nutition + ", call_num=" + call_num + ", delivery_guide="
				+ delivery_guide + ", exchange_con=" + exchange_con + "]";
	}
}
