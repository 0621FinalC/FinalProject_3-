package com.web.shop.user.dto;

import java.util.Date;

public class UserDTO {
	private String userid;
	private String username;
	private String password;
	private char gender;
	private String email;
	private String phone;
	private String address;
	private Date registerdate;
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public char getGender() {
		return gender;
	}
	
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public Date getRegisterdate() {
		return registerdate;
	}
	
	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}
	
	@Override
	public String toString() {
		return "AccountDTO [userid=" + userid + ", username=" + username
				+ ", email=" + email + "]";
	}
}