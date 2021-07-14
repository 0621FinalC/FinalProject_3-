package com.web.shop.order.dto;

public class ShopDTO {
	private String cid;
	private String app_admin_key;
	
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCid() {
		return cid;
	}
	public void setApp_admin_key(String app_admin_key) {
		this.app_admin_key = app_admin_key;
	}
	public String getApp_admin_key() {
		return app_admin_key;
	}
	
}