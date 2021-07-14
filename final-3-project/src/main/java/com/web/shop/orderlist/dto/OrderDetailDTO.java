package com.web.shop.orderlist.dto;

public class OrderDetailDTO {
	
	private String pid;
	private String productname;
	private int total_price;
	private int item_qty;
	private String orderstat;
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getItem_qty() {
		return item_qty;
	}
	public void setItem_qty(int item_qty) {
		this.item_qty = item_qty;
	}
	public String getOrderstat() {
		return orderstat;
	}
	public void setOrderstat(String orderstat) {
		this.orderstat = orderstat;
	}
		
}