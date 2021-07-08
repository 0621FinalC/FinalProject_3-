package com.web.shop.user.service;

import com.web.shop.user.dto.UserDTO;

public interface UserService {
	//로그인
	public void login(UserDTO dto) throws Exception;
	public boolean checkUserid(String userid) throws Exception;
	//회원가입
	public boolean join(UserDTO dto) throws Exception;
}
