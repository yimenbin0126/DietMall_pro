package com.dietmall.DTO;

public class ItemEtcBoardDTO {

	private int etc_board_bno;
	private int userno;
	private String userid;
	private int item_bno;
	private int origin_bno;
	private String etc_title;
	private String etc_content;
	private String create_time;
	private String etc_reply_type;
	private int etc_star;
	private String board_type;
	private String img_name;
	
	public int getEtc_board_bno() {
		return etc_board_bno;
	}
	public void setEtc_board_bno(int etc_board_bno) {
		this.etc_board_bno = etc_board_bno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getItem_bno() {
		return item_bno;
	}
	public void setItem_bno(int item_bno) {
		this.item_bno = item_bno;
	}
	public int getOrigin_bno() {
		return origin_bno;
	}
	public void setOrigin_bno(int origin_bno) {
		this.origin_bno = origin_bno;
	}
	public String getEtc_title() {
		return etc_title;
	}
	public void setEtc_title(String etc_title) {
		this.etc_title = etc_title;
	}
	public String getEtc_content() {
		return etc_content;
	}
	public void setEtc_content(String etc_content) {
		this.etc_content = etc_content;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getEtc_reply_type() {
		return etc_reply_type;
	}
	public void setEtc_reply_type(String etc_reply_type) {
		this.etc_reply_type = etc_reply_type;
	}
	public int getEtc_star() {
		return etc_star;
	}
	public void setEtc_star(int etc_star) {
		this.etc_star = etc_star;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	
	@Override
	public String toString() {
		return "ItemEtcBoardDTO [etc_board_bno=" + etc_board_bno + ", userno=" + userno + ", userid=" + userid
				+ ", item_bno=" + item_bno + ", origin_bno=" + origin_bno + ", etc_title=" + etc_title
				+ ", etc_content=" + etc_content + ", create_time=" + create_time + ", etc_reply_type=" + etc_reply_type
				+ ", etc_star=" + etc_star + ", board_type=" + board_type + ", img_name=" + img_name + "]";
	}
}
