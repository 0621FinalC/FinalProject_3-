package com.web.shop.orderlist.dto;

public class DeliveryDetailDTO {
	
	// 배송조회 -> 보류
	
	// 주문정보 (주문번호, 주문자명, 보내는 분?, 결제일시) -> order_t, user_t(주문자명)
	private String oid;
	private String username;
	private String sender;
	
	// 배송 정보 (받는 분, 핸드폰, 배송방법?, 주소, 받으실 장소?, 공동현관 출입 방법?) -> db만들기
	private String rec_name;
	private String rec_phone;
	private String rec_address;
	private int shipping_fee;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRec_name() {
		return rec_name;
	}
	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}
	public String getRec_phone() {
		return rec_phone;
	}
	public void setRec_phone(String rec_phone) {
		this.rec_phone = rec_phone;
	}
	public String getRec_address() {
		return rec_address;
	}
	public void setRec_address(String rec_address) {
		this.rec_address = rec_address;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public int getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(int shipping_fee) {
		this.shipping_fee = shipping_fee;
	}
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	
}
