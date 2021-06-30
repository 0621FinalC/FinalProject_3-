package com.web.shop.order.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class OrderDTO {
	private String tid;
	private String oid;
	private String productname;
	private int qty;
	private int totalprice;
	private String userid;
	private String address;
	private String phone;
	private String orderstat;
	private Date orderdate;
	private String ordermemo;
	private String paymentmethod;
	private Date approved_at;
	
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
	public void setApproved_at(String approved_at) {
		this.approved_at = Date.valueOf(approved_at);
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrderstat() {
		return orderstat;
	}
	public void setOrderstat(String orderstat) {
		this.orderstat = orderstat;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrdermemo() {
		return ordermemo;
	}
	public void setOrdermemo(String ordermemo) {
		this.ordermemo = ordermemo;
	}
	public String getPaymentmethod() {
		return paymentmethod;
	}
	public void setPaymentmethod(String paymentmethod) {
		this.paymentmethod = paymentmethod;
	}
	
}
