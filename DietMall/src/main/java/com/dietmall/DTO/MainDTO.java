package com.dietmall.DTO;

public class MainDTO {

	private String sale_yn;
	private String item_type;
	private int start;
	private int end;
	
	public String getSale_yn() {
		return sale_yn;
	}
	public void setSale_yn(String sale_yn) {
		this.sale_yn = sale_yn;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "MainDTO [sale_yn=" + sale_yn + ", item_type=" + item_type + ", start=" + start + ", end=" + end + "]";
	}
}
