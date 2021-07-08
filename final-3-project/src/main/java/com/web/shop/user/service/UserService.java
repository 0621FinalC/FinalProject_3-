package com.web.shop.user.service;

import com.web.shop.user.dto.UserDTO;

public interface UserService {
	//로그인
	public void login(UserDTO dto) throws Exception;
	
	//회원가입
	public void join(UserDTO dto) throws Exception;
}
