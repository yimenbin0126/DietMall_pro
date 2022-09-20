package com.dietmall.DTO;

public class MailDTO {
	private String toAddress;
	private String title;
	private String message;
	
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "MailDTO [toAddress=" + toAddress + ", title=" + title + ", message=" + message + "]";
	}
}
