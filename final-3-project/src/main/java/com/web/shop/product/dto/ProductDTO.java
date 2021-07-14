package com.web.shop.product.dto;

public class ProductDTO {
	private int pid; // 상품번호
	private String productname; // 상품이름
	private int price; // 상품가격
	private String explanation; // 상품 상세정보
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [pid=" + pid + ", productname=" + productname + ", price=" + price + ", explanation="
				+ explanation + "]";
	}
}