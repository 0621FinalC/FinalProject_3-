package com.web.shop.user.service;

import com.web.shop.user.dto.UserDTO;

public interface UserService {
	public void login(UserDTO dto) throws Exception;
	public boolean checkUserid(String userid) throws Exception;
	public boolean join(UserDTO dto) throws Exception;
	public UserDTO readUser(String userid) throws Exception;
}