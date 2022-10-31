package com.dietmall.DTO;

public class ItemboardDTO {

	private int item_bno;
	private String item_name;
	private String item_type;
	private int origin_price;
	private String sale_yn;
	private int sale_percent;
	private String category_type;
	private int like_num;
	private String item_title_img;
	private String item_content_img;
	
	public int getItem_bno() {
		return item_bno;
	}
	public void setItem_bno(int item_bno) {
		this.item_bno = item_bno;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getOrigin_price() {
		return origin_price;
	}
	public void setOrigin_price(int origin_price) {
		this.origin_price = origin_price;
	}
	
	public String getSale_yn() {
		return sale_yn;
	}
	public void setSale_yn(String sale_yn) {
		this.sale_yn = sale_yn;
	}
	public int getSale_percent() {
		return sale_percent;
	}
	public void setSale_percent(int sale_percent) {
		this.sale_percent = sale_percent;
	}
	public String getCategory_type() {
		return category_type;
	}
	public void setCategory_type(String category_type) {
		this.category_type = category_type;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public String getItem_title_img() {
		return item_title_img;
	}
	public void setItem_title_img(String item_title_img) {
		this.item_title_img = item_title_img;
	}
	public String getItem_content_img() {
		return item_content_img;
	}
	public void setItem_content_img(String item_content_img) {
		this.item_content_img = item_content_img;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	
	@Override
	public String toString() {
		return "ItemboardDTO [item_bno=" + item_bno + ", item_name=" + item_name + ", origin_price=" + origin_price
				+ ", sale_yn=" + sale_yn + ", sale_percent=" + sale_percent + ", category_type=" + category_type
				+ ", like_num=" + like_num + ", item_title_img=" + item_title_img + ", item_content_img="
				+ item_content_img + ", item_type=" + item_type + "]";
	}
}
