package com.web.shop.user.service;

import com.web.shop.user.dto.UserDTO;

public interface UserService {
	public void login(UserDTO dto) throws Exception;
}
