package com.dietmall.DTO;

public class LikeYNtableDTO {

	private int item_bno;
	private int userno;
	private String like_yn;
	
	public int getItem_bno() {
		return item_bno;
	}
	public void setItem_bno(int item_bno) {
		this.item_bno = item_bno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getLike_yn() {
		return like_yn;
	}
	public void setLike_yn(String like_yn) {
		this.like_yn = like_yn;
	}
	
	@Override
	public String toString() {
		return "LikeYNtableDTO [item_bno=" + item_bno + ", userno=" + userno + ", like_yn=" + like_yn + "]";
	}

}
