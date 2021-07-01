package com.web.shop.user;

public class LoginDTO {
	
	private String userid;
	private String password;
	private boolean useCookie;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDTO{" + "usdrid='" +userid + '\'' +", password='" +password + '\'' + ", useCookie="
				+ useCookie + '}';
	}
	
	

}
