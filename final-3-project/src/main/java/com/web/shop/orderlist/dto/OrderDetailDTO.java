package com.web.shop.orderlist.dto;

public class OrderDetailDTO {
	
	private String oid;
	private String pid;
	
	// 상품별 정보(상품명, 가격, 수량, 배송?주문? 상태) -> product_t, order_detail(수량), order_t(주문상태)
	private String productname;
	private int total_price;
	private int item_qty;
	private String orderstat;
	
	// 배송조회 -> 보류
	
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
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	
}
