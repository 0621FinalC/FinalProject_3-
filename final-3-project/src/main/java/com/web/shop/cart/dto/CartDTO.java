package com.web.shop.cart.dto;

public class CartDTO {
	private int cid; 
	private String userid;
	private int pid;
	private int cartqty; // 카드 수량
	
	private String username;
    private String productname;
    private int price; // 상품 가격
    private int totalprice; // 총액
    
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getCartqty() {
		return cartqty;
	}
	public void setCartqty(int cartqty) {
		this.cartqty = cartqty;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cid=" + cid + ", userid=" + userid + ", pid=" + pid + ", cartqty=" + cartqty + ", username="
				+ username + ", productname=" + productname + ", price=" + price + ", totalprice=" + totalprice + "]";
	} 
}
